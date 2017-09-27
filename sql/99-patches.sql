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
-- Patches to apply to LDS system. Please note that the order of patches listed
-- in this file should be done sequentially i.e Newest patches go at the bottom
-- of the file.
--------------------------------------------------------------------------------

SET search_path = lds, bde, public;

DO $PATCHES$
BEGIN

IF NOT EXISTS (
    SELECT *
    FROM   pg_extension EXT,
           pg_namespace NSP
    WHERE  EXT.extname = 'dbpatch'
    AND    NSP.oid = EXT.extnamespace
    AND    NSP.nspname = '_patches'
) THEN
	RAISE EXCEPTION 'dbpatch extension is not installed correctly';
END IF;

-- Patches start from here

-------------------------------------------------------------------------------
-- 1.0.2 Pending parcels release
-------------------------------------------------------------------------------

PERFORM _patches.apply_patch(
    'BDE - 1.0.2: Create survey tables and columns for pending parcels release',
    '
DO $$
BEGIN
SET search_path = lds, bde, public;
--------------------------------------------------------------------------------
-- LDS table affected_parcel_surveys_pend
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS affected_parcel_surveys_pend CASCADE;
CREATE TABLE affected_parcel_surveys_pend (
    id INTEGER NOT NULL,
    par_id INTEGER NOT NULL,
    sur_wrk_id INTEGER NOT NULL,
    action VARCHAR(12)
);
ALTER TABLE affected_parcel_surveys_pend ADD PRIMARY KEY (id);
ALTER TABLE affected_parcel_surveys_pend OWNER TO bde_dba;
REVOKE ALL ON TABLE affected_parcel_surveys_pend FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE affected_parcel_surveys_pend TO bde_admin;
GRANT SELECT ON TABLE affected_parcel_surveys_pend TO bde_user;
-- only enable versioning if we already have versioned tables
IF table_version.ver_is_table_versioned(''lds'', ''survey_plans'') THEN
    PERFORM table_version.ver_enable_versioning(''lds'', ''affected_parcel_surveys_pend'');
END IF;
--------------------------------------------------------------------------------
-- Add lodged_date column to LDS table survey_plans
--------------------------------------------------------------------------------
IF table_version.ver_is_table_versioned(''lds'', ''survey_plans'') THEN
    PERFORM table_version.ver_versioned_table_add_column(''lds'', ''survey_plans'', ''lodged_date'', ''timestamp without time zone'');
    PERFORM table_version.ver_versioned_table_add_column(''lds'', ''survey_plans'', ''authorised_date'', ''timestamp without time zone'');
ELSE
    ALTER TABLE lds.survey_plans ADD COLUMN lodged_date timestamp without time zone;
    ALTER TABLE lds.survey_plans ADD COLUMN authorised_date timestamp without time zone;
END IF;
END;
$$
'
);

END;
$PATCHES$;

