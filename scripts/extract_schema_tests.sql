BEGIN;
CREATE FUNCTION extract_schema_test(nsp regnamespace)
RETURNS SETOF text
LANGUAGE 'plpgsql' AS
$FUNCBODY$
DECLARE
    rec RECORD;
    rec2 RECORD;
    sql TEXT;
BEGIN
    sql := format(E'SELECT has_schema(%L::name);\n', nsp);
    RETURN NEXT sql;

    FOR rec IN
        select oid, relname from pg_class
        WHERE relnamespace = nsp
          AND relkind = 'r'
        ORDER BY relname
    LOOP
        sql := format($S$SELECT has_table(%L::name, %L::name);
SELECT columns_are('%s'::name, '%s'::name,
  ARRAY[
%s
  ]);
$S$,
        nsp,
        rec.relname,
        nsp,
        rec.relname,
        (
            SELECT array_to_string(array_agg('    ' || quote_literal(attname)), E',\n')
            FROM pg_attribute WHERE attrelid = rec.oid
            AND attnum >= 0
        )
);
        RETURN NEXT sql;
    END LOOP;
END;
$FUNCBODY$;

SELECT extract_schema_test('lds');
SELECT extract_schema_test('bde_ext');

ROLLBACK;

