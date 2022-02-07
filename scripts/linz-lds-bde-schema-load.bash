#!/usr/bin/env bash

set -o errexit -o noclobber -o nounset -o pipefail
shopt -s failglob inherit_errexit

DB_NAME=
export SKIP_INDEXES=no
export EXTENSION_MODE=on
export PSQL=psql
export SCRIPTSDIR=/usr/share/linz-lds-bde-schema/sql/

ADD_REVISIONS=no
READ_ONLY=no
SQLSCRIPTS="$(echo "@@SQLSCRIPTS@@" | tr ' ' '\n' | LANG=C sort | tr '\n' ' ')"

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
        ADD_REVISIONS=yes
        shift
        continue
    elif test "$1" = "--readonly"
    then
        READ_ONLY=yes
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
        DB_NAME="$1"
        shift
    fi
done

if test -z "$DB_NAME"
then
    usage >&2
    exit 1
fi

export PGDATABASE="$DB_NAME"

# Find table_version-loader
TABLEVERSION_LOADER=table_version-loader
which "$TABLEVERSION_LOADER" > /dev/null || {
    echo "$0 depends on $TABLEVERSION_LOADER, which cannot be found in current PATH." >&2
    echo "Is table_version 1.4.0+ installed ?" >&2
    exit 1
}

# Check if table_version-loader supports stdout
${TABLEVERSION_LOADER} -  2>&1 | grep -q "database.*does not exist" &&
    TABLEVERSION_SUPPORTS_STDOUT=no ||
    TABLEVERSION_SUPPORTS_STDOUT=yes

if test "$PGDATABASE" = "-" -a "$TABLEVERSION_SUPPORTS_STDOUT" != yes
then
    echo "ERROR: table_version-loader does not support stdout mode, cannot proceed." >&2
    echo "HINT: install tableversion 1.6.0 or higher to fix this." >&2
    exit 1
fi

# Find dbpatch-loader
DBPATCH_LOADER=dbpatch-loader
which "$DBPATCH_LOADER" > /dev/null || {
    echo "$0 depends on $DBPATCH_LOADER, which cannot be found in current PATH." >&2
    echo "Is dbpatch 1.6.0+ installed ?" >&2
    exit 1
}

# Check if dbpatch-loader supports stdout
"${DBPATCH_LOADER}" - testing 2>&1 | grep -q "database.*does not exist" &&
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
    EXTOPT=("--no-extension")
fi

# Load tableversion

echo "Loading tableversion schema in database $PGDATABASE" >&2

if test "$TABLEVERSION_SUPPORTS_STDOUT" != yes
then
    echo "WARNING: table_version-loader does not support stdout mode, working in non-transactional mode" >&2
    echo "HINT: install tableversion 1.6.0 or higher to fix this." >&2
    "${TABLEVERSION_LOADER}" "${EXTOPT[@]}" "${PGDATABASE}" > /dev/null || {
        echo "${TABLEVERSION_LOADER} exited with an error" >&2
        exit 1
    }
fi

if test "$DBPATCH_SUPPORTS_STDOUT" != yes
then
    echo "WARNING: dbpatch-loader does not support stdout mode, working in non-transactional mode" >&2
    echo "HINT: install dbpatch 1.4.0 or higher to fix this." >&2
    "${DBPATCH_LOADER}" "${EXTOPT[@]}" "${PGDATABASE}" _patches > /dev/null || {
        echo "${DBPATCH_LOADER} exited with an error" >&2
        exit 1
    }
fi


{
    echo -n "Loading LDS DBE schema in database $DB_NAME (extension mode "
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
    "${TABLEVERSION_LOADER}" "${EXTOPT[@]}" -
fi

if test "$DBPATCH_SUPPORTS_STDOUT" = yes
then
    "${DBPATCH_LOADER}" "${EXTOPT[@]}" - _patches
fi

cat << EOF
SET client_min_messages TO WARNING;
CREATE EXTENSION IF NOT EXISTS unaccent SCHEMA public;
EOF

for file in $SQLSCRIPTS
do
    if test "$(dirname "$file")" = 'sql/versioning'
    then
        continue
    fi
    echo "Loading $file" >&2
    file="${SCRIPTSDIR}/${file//sql\//}"
    sed 's/^BEGIN;//;s/^COMMIT;//' "${file}"
done

if test "${ADD_REVISIONS}" = "yes"
then
    for file in $SQLSCRIPTS
    do
        if test "$(dirname "$file")" = 'sql/versioning'
        then
            echo "Loading (versioning) $file" >&2
            file="${SCRIPTSDIR}/${file//sql\//}"
            sed 's/^BEGIN;//;s/^COMMIT;//' "${file}"
        fi
    done
fi

if test "${READ_ONLY}" = "yes"
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
