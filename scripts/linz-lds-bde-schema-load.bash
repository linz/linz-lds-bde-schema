#!/usr/bin/env bash

set -o errexit -o noclobber -o nounset -o pipefail
shopt -s failglob inherit_errexit

db_name=
export SKIP_INDEXES=no
export EXTENSION_MODE=on
export PSQL=psql
export SCRIPTSDIR=/usr/share/linz-lds-bde-schema/sql/

add_revisions=no
read_only=no
sqlscripts="$(echo "@@sqlscripts@@" | tr ' ' '\n' | LANG=C sort | tr '\n' ' ')"

if test -n "${LDSBDESCHEMA_SQLDIR}"
then
    SCRIPTSDIR="${LDSBDESCHEMA_SQLDIR}"
fi

if test ! -f "${SCRIPTSDIR}/01-lds_layer_tables.sql"
then
    cat >&2 <<EOF
Cannot find 01-lds_layer_tables.sql in ${SCRIPTSDIR}
Please set LDSBDESCHEMA_SQLDIR environment variable
EOF
    exit 1
fi

usage() {
    cat <<EOF
Usage: $0 [options] { <database> | - }
       $0 { --version | --help }
Options:
    --revision      enable versioning on tables
    --noextension   avoid using extension version of dbpatch and tableversion
    --readonly      revoke write permission on schema from all bde roles
EOF
}

while test -n "$1"
do
    if test "$1" = "--noindexes"
    then
        SKIP_INDEXES=yes
        shift
        continue
    elif test "$1" = "--revision"
    then
        add_revisions=yes
        shift
        continue
    elif test "$1" = "--readonly"
    then
        read_only=yes
        shift
        continue
    elif test "$1" = "--help"
    then
        usage && exit
    elif test "$1" = "--version"
    then
        echo "@@VERSION@@ @@REVISION@@"
        exit 0
    elif test "$1" = "--noextension"
    then
        EXTENSION_MODE=off
        shift
        continue
    else
        db_name="$1"
        shift
    fi
done

if test -z "$db_name"
then
    usage >&2
    exit 1
fi

export PGDATABASE="$db_name"

# Find table_version-loader
which table_version-loader > /dev/null || {
    echo "$0 depends on table_version-loader, which cannot be found in current PATH." >&2
    echo "Is table_version 1.4.0+ installed ?" >&2
    exit 1
}

# Check if table_version-loader supports stdout
table_version-loader -  2>&1 | grep -q "database.*does not exist" &&
    TABLEVERSION_SUPPORTS_STDOUT=no ||
    TABLEVERSION_SUPPORTS_STDOUT=yes

if test "$PGDATABASE" = "-" -a "$TABLEVERSION_SUPPORTS_STDOUT" != yes
then
    echo "ERROR: table_version-loader does not support stdout mode, cannot proceed." >&2
    echo "HINT: install tableversion 1.6.0 or higher to fix this." >&2
    exit 1
fi

# Find dbpatch-loader
which dbpatch-loader > /dev/null || {
    echo "$0 depends on dbpatch-loader, which cannot be found in current PATH." >&2
    echo "Is dbpatch 1.6.0+ installed ?" >&2
    exit 1
}

# Check if dbpatch-loader supports stdout
dbpatch-loader - testing 2>&1 | grep -q "database.*does not exist" &&
    DBPATCH_SUPPORTS_STDOUT=no ||
    DBPATCH_SUPPORTS_STDOUT=yes

if test "$PGDATABASE" = "-" -a "$DBPATCH_SUPPORTS_STDOUT" != yes
then
    echo "ERROR: dbpatch-loader does not support stdout mode, cannot proceed." >&2
    echo "HINT: install dbpatch 1.4.0 or higher to fix this." >&2
    exit 1
fi

if test "${EXTENSION_MODE}" = "off"
then
    extopt=("--no-extension")
fi

# Load tableversion

echo "Loading tableversion schema in database $PGDATABASE" >&2

if test "$TABLEVERSION_SUPPORTS_STDOUT" != yes
then
    echo "WARNING: table_version-loader does not support stdout mode, working in non-transactional mode" >&2
    echo "HINT: install tableversion 1.6.0 or higher to fix this." >&2
    table_version-loader "${extopt[@]}" "${PGDATABASE}" > /dev/null || {
        echo "table_version-loader exited with an error" >&2
        exit 1
    }
fi

if test "$DBPATCH_SUPPORTS_STDOUT" != yes
then
    echo "WARNING: dbpatch-loader does not support stdout mode, working in non-transactional mode" >&2
    echo "HINT: install dbpatch 1.4.0 or higher to fix this." >&2
    dbpatch-loader "${extopt[@]}" "${PGDATABASE}" _patches > /dev/null || {
        echo "dbpatch-loader exited with an error" >&2
        exit 1
    }
fi


{
    echo -n "Loading LDS DBE schema in database $db_name (extension mode "
    if test "${EXTENSION_MODE}" = "off"
    then
        echo -n "off"
    else
        echo -n "on"
    fi
    echo ")"
} >&2

(

if test "$TABLEVERSION_SUPPORTS_STDOUT" = yes
then
    table_version-loader "${extopt[@]}" -
fi

if test "$DBPATCH_SUPPORTS_STDOUT" = yes
then
    dbpatch-loader "${extopt[@]}" - _patches
fi

cat << EOF
SET client_min_messages TO WARNING;
CREATE EXTENSION IF NOT EXISTS unaccent SCHEMA public;
EOF

for file in $sqlscripts
do
    if test "$(dirname "$file")" = 'sql/versioning'
    then
        continue
    fi
    echo "Loading $file" >&2
    file="${SCRIPTSDIR}/${file//sql\//}"
    sed 's/^BEGIN;//;s/^COMMIT;//' "${file}"
done

if test "${add_revisions}" = "yes"
then
    for file in $sqlscripts
    do
        if test "$(dirname "$file")" = 'sql/versioning'
        then
            echo "Loading (versioning) $file" >&2
            file="${SCRIPTSDIR}/${file//sql\//}"
            sed 's/^BEGIN;//;s/^COMMIT;//' "${file}"
        fi
    done
fi

if test "${read_only}" = "yes"
then
    cat <<EOF
REVOKE UPDATE, INSERT, DELETE, TRUNCATE
    ON ALL TABLES IN SCHEMA bde_ext
    FROM bde_dba, bde_admin, bde_user;
REVOKE UPDATE, INSERT, DELETE, TRUNCATE
    ON ALL TABLES IN SCHEMA lds
    FROM bde_dba, bde_admin, bde_user;
EOF
fi

) |
grep -v "^\(BEGIN\|COMMIT\);" |
( echo "BEGIN;"; cat; echo "COMMIT;"; ) |
if test "$PGDATABASE" = "-"
then
    cat
else
    $PSQL -XtA --set ON_ERROR_STOP=1 -o /dev/null
fi
