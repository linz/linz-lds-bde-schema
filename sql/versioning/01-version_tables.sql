--------------------------------------------------------------------------------
--
-- linz-lds-bde-schema
--
-- Copyright 2016 Crown copyright (c)
-- Land Information New Zealand and the New Zealand Government.
-- All rights reserved
--
-- This software is released under the terms of the new BSD license. See the
-- LICENSE file for more information.
--
--------------------------------------------------------------------------------
-- Creates system tables required for table versioning support
--------------------------------------------------------------------------------

SET client_min_messages TO WARNING;

DO $$
DECLARE
   v_schema    NAME;
   v_table     NAME;
   v_msg       TEXT;
   v_rev_table TEXT;
BEGIN

    IF NOT EXISTS (SELECT * FROM pg_extension WHERE extname = 'table_version') THEN
        RETURN;
    END IF;

    PERFORM table_version.ver_create_revision('Initial revisioning for BDE_EXT/LDS tables');

    FOR v_schema, v_table IN
        SELECT
            NSP.nspname,
            CLS.relname
        FROM
            pg_class CLS,
            pg_namespace NSP
        WHERE
            CLS.relnamespace = NSP.oid AND
            NSP.nspname IN ('lds', 'bde_ext') AND
            CLS.relkind = 'r' AND
            CLS.relname <> 'lds_export_config'
        ORDER BY
            1, 2
    LOOP
        IF table_version.ver_is_table_versioned(v_schema, v_table) THEN
            CONTINUE;
        END IF;

        v_msg := 'Versioning table ' ||  v_schema || '.' || v_table;
        RAISE NOTICE '%', v_msg;

        BEGIN
            PERFORM table_version.ver_enable_versioning(v_schema, v_table);
        EXCEPTION
            WHEN others THEN
                RAISE EXCEPTION 'Error versioning %.%. ERROR: %', v_schema, v_table, SQLERRM;
        END;

        SELECT table_version.ver_get_version_table_full(v_schema, v_table)
        INTO   v_rev_table;

        EXECUTE 'GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE ' || v_rev_table || ' TO bde_admin';
        EXECUTE 'GRANT SELECT ON TABLE ' || v_rev_table || ' TO bde_user';
    END LOOP;

    PERFORM table_version.ver_complete_revision();
END
$$;

