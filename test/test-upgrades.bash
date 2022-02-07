#!/usr/bin/env bash

set -o errexit -o noclobber -o nounset -o pipefail
shopt -s failglob inherit_errexit

upgradeable_versions="
    1.5.0
    1.6.0
    1.6.1
    1.7.0
    1.8.0
    1.9.0
"

test_database=linz-lds-bde-schema-test-db

git fetch --unshallow --tags # to get all commits/tags

tmpdir=/tmp/linz-lds-bde-schema-test-$$
mkdir -p "${tmpdir}"

export PGDATABASE="${test_database}"

for ver in ${upgradeable_versions}
do
    owd="$PWD"

    dropdb --if-exists "${test_database}"
    createdb "${test_database}"

    psql -XtA <<EOF
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE SCHEMA IF NOT EXISTS _patches;
CREATE EXTENSION IF NOT EXISTS dbpatch SCHEMA _patches;
EOF

    cd "${tmpdir}"
    test -d linz-lds-bde-schema || {
        git clone --quiet --reference "$owd" \
            https://github.com/linz/linz-lds-bde-schema
    }
    cd linz-lds-bde-schema
    git checkout "${ver}"
    sudo env "PATH=$PATH" make install DESTDIR="$PWD/inst"

    # Install the just-installed linz-lds-bde-schema first !
    linz-bde-schema-load --revision "${test_database}"
    linz-bde-uploader-schema-load "${test_database}"
    for file in inst/usr/share/linz-lds-bde-schema/sql/*.sql
    do
        echo "Loading $file from linz-lds-bde-schema ${ver}"
        psql -o /dev/null -XtA -f "$file" "${test_database}" --set ON_ERROR_STOP=1
    done

    cd "${owd}"

# Turn DB to read-only mode, as it would be done
# by linz-bde-schema-load --readonly
    cat <<EOF | psql -Xat ${test_database}
REVOKE UPDATE, INSERT, DELETE, TRUNCATE
    ON ALL TABLES IN SCHEMA bde_ext
    FROM bde_dba, bde_admin, bde_user;
REVOKE UPDATE, INSERT, DELETE, TRUNCATE
    ON ALL TABLES IN SCHEMA lds
    FROM bde_dba, bde_admin, bde_user;
EOF
    pg_prove test/

done
