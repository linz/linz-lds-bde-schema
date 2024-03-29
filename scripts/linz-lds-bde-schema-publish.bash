#!/usr/bin/env bash

set -o errexit -o noclobber -o nounset -o pipefail
shopt -s failglob inherit_errexit

db_name=
export PSQL=psql

if test "$1" = "--version"
then
    echo "@@VERSION@@ @@REVISION@@"
    exit 0
fi

while test -n "${1-}"
do
    db_name="$1"
    shift
done

if test -z "$db_name"
then
    echo "Usage: $0 { <database> | - }" >&2
    echo "       $0 --version" >&2
    exit 1
fi

export PGDATABASE="$db_name"

{
cat << EOF
DO \$PUBLICATION\$
DECLARE
    v_table NAME;
    v_schema NAME;
BEGIN

    FOR v_schema IN VALUES('lds'),('bde_ext') LOOP
        IF NOT EXISTS ( SELECT 1 FROM pg_catalog.pg_namespace
                        WHERE nspname = v_schema )
        THEN
            RAISE EXCEPTION
                'Schema % does not exist, '
                'run linz-lds-bde-schema-load ?',
                v_schema;
        END IF;
        IF NOT EXISTS ( SELECT 1 FROM pg_catalog.pg_publication
                        WHERE pubname = 'all_' || v_schema )
        THEN
            EXECUTE format('CREATE PUBLICATION all_%s', v_schema);
        END IF;
        EXECUTE format('ALTER PUBLICATION all_%s OWNER TO bde_dba', v_schema);

        FOR v_table IN select c.relname
            FROM pg_class c, pg_namespace n
            WHERE n.nspname = v_schema
            AND c.relnamespace = n.oid
            AND c.relkind = 'r'
            AND c.relname NOT IN (
                SELECT tablename
                FROM pg_catalog.pg_publication_tables
                WHERE pubname = 'all_' || v_schema
                  AND schemaname = v_schema
            )
        LOOP
            EXECUTE format('ALTER PUBLICATION all_%s ADD TABLE %I.%I',
                           v_schema, v_schema, v_table);
        END LOOP;

        RAISE INFO 'Publication "all_%" ready', v_schema;

    END LOOP;

END;
\$PUBLICATION\$;

EOF
} |
grep -v "^\(BEGIN\|COMMIT\);" |
( echo "BEGIN;"; cat; echo "COMMIT;"; ) |
if test "$PGDATABASE" = "-"
then
    cat
else
    $PSQL -XtA --set ON_ERROR_STOP=1 -o /dev/null
fi
