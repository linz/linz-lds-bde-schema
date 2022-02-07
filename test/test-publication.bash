#!/usr/bin/env bash

set -o errexit -o noclobber -o nounset -o pipefail
shopt -s failglob inherit_errexit

export PGDATABASE=linz-lds-bde-schema-test-db

dropdb --if-exists "${PGDATABASE}"
createdb "${PGDATABASE}"

linz-bde-schema-load "$PGDATABASE"
linz-lds-bde-schema-load "$PGDATABASE"
bde_ext_tables="$(psql -qXtAc "select count(*) from pg_class c, pg_namespace n WHERE c.relnamespace = n.oid and n.nspname = 'bde_ext' and c.relkind = 'r'")"
lds_tables="$(psql -qXtAc "select count(*) from pg_class c, pg_namespace n WHERE c.relnamespace = n.oid and n.nspname = 'lds' and c.relkind = 'r'")"

compareTableCount() {
    exp="$bde_ext_tables"
    obt="$(psql -qXtAc "select count(*) from pg_catalog.pg_publication_tables WHERE pubname = 'all_bde_ext'")"
    test "$exp" = "$obt" || {
        echo "Expected $exp published bde_ext tables in all_bde_ext, got $obt:" >&2
        list="$(psql -qXtAc "select tablename from pg_catalog.pg_publication_tables WHERE pubname = 'all_bde_ext'")"
        echo "$list" >&2
        exit 1
    }

    exp=$lds_tables
    obt="$(psql -qXtAc "select count(*) from pg_catalog.pg_publication_tables WHERE pubname = 'all_lds'")"
    test "$exp" = "$obt" || {
        echo "Expected $exp published lds tablesin all_lds, got $obt:" >&2
        list="$(psql -qXtAc "select tablename from pg_catalog.pg_publication_tables WHERE pubname = 'all_lds'")"
        echo "$list" >&2
        exit 1
    }
}

linz-lds-bde-schema-publish "$PGDATABASE"
compareTableCount
echo "PASS: publication first run"

linz-lds-bde-schema-publish "$PGDATABASE"
compareTableCount
echo "PASS: publication second run"

linz-lds-bde-schema-publish - | psql -qXtA "$PGDATABASE"
compareTableCount
echo "PASS: publication third run via stdout"

dropdb "$PGDATABASE"

