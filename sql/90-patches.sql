--------------------------------------------------------------------------------
--
-- linz-lds-bde-schema
--
-- Copyright 2016-2018 Crown copyright (c)
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

DO $PATCHES$
BEGIN

IF NOT EXISTS (
    SELECT *
    FROM   pg_class CLS,
           pg_namespace NSP
    WHERE  CLS.relname = 'applied_patches'
    AND    NSP.oid = CLS.relnamespace
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
    $PATCH$
DO $$
BEGIN
--------------------------------------------------------------------------------
-- LDS table affected_parcel_surveys_pend
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.affected_parcel_surveys_pend CASCADE;
CREATE TABLE lds.affected_parcel_surveys_pend (
    id INTEGER NOT NULL,
    par_id INTEGER NOT NULL,
    sur_wrk_id INTEGER NOT NULL,
    action VARCHAR(12)
);
ALTER TABLE lds.affected_parcel_surveys_pend ADD PRIMARY KEY (id);
ALTER TABLE lds.affected_parcel_surveys_pend OWNER TO bde_dba;
REVOKE ALL ON TABLE lds.affected_parcel_surveys_pend FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.affected_parcel_surveys_pend TO bde_admin;
GRANT SELECT ON TABLE lds.affected_parcel_surveys_pend TO bde_user;
-- only enable versioning if we already have versioned tables
IF table_version.ver_is_table_versioned('lds', 'survey_plans') THEN
    PERFORM table_version.ver_enable_versioning('lds', 'affected_parcel_surveys_pend');
END IF;
--------------------------------------------------------------------------------
-- Add lodged_date column to LDS table survey_plans
--------------------------------------------------------------------------------
IF table_version.ver_is_table_versioned('lds', 'survey_plans') THEN
    PERFORM table_version.ver_versioned_table_add_column('lds', 'survey_plans', 'lodged_date', 'timestamp without time zone');
    PERFORM table_version.ver_versioned_table_add_column('lds', 'survey_plans', 'authorised_date', 'timestamp without time zone');
ELSE
    ALTER TABLE lds.survey_plans ADD COLUMN lodged_date timestamp without time zone;
    ALTER TABLE lds.survey_plans ADD COLUMN authorised_date timestamp without time zone;
END IF;
END;
$$
$PATCH$
);

-------------------------------------------------------------------------------
-- 1.2.0 Add completion-date equipped Title Instrument table
-------------------------------------------------------------------------------
PERFORM _patches.apply_patch(
    'lds_bde - 1.2.0: Create completion-date equipped Title Instrument table',
$PATCH$
DO $$
BEGIN
SET search_path = bde_ext, lds, bde, public;
-- =============================================================================
-- T T L   I N S T   C M P L T E
-- =============================================================================
DROP TABLE IF EXISTS ttl_inst_cmplte CASCADE;
CREATE TABLE ttl_inst_cmplte
(
  id INTEGER NOT NULL, -- REFERENCES bde_ext.ttl_inst(id)
  dlg_id INTEGER,
  inst_no VARCHAR(30) NOT NULL,
  priority_no INTEGER,
  ldt_loc_id INTEGER NOT NULL,
  lodged_datetime TIMESTAMP NOT NULL,
  status VARCHAR(4) NOT NULL,
  trt_grp VARCHAR(4) NOT NULL,
  trt_type VARCHAR(4) NOT NULL,
  audit_id INTEGER NOT NULL,
  tin_id_parent INTEGER,
  completion_date DATE,
  CONSTRAINT pkey_ttl_inst_cmplte PRIMARY KEY (id)
);

ALTER TABLE ttl_inst_cmplte OWNER TO bde_dba;
REVOKE ALL ON TABLE ttl_inst_cmplte FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE ttl_inst_cmplte TO bde_admin;
GRANT SELECT ON TABLE ttl_inst_cmplte TO bde_user;
-- only enable versioning if we already have versioned tables
IF table_version.ver_is_table_versioned('lds', 'survey_plans') THEN
    PERFORM table_version.ver_enable_versioning('bde_ext', 'ttl_inst_cmplte');
END IF;
END;
$$
$PATCH$
);

-------------------------------------------------------------------------------
-- 1.8.1 Set proper ownership of serial column sequences
-------------------------------------------------------------------------------
PERFORM _patches.apply_patch(
    'lds - 1.8.1: Set proper ownership of serial column sequences',
$PATCH$
DO $$
BEGIN
    ALTER SEQUENCE lds.geodetic_network_marks_id_seq OWNED BY lds.geodetic_network_marks.id;
    ALTER SEQUENCE lds.geodetic_vertical_marks_id_seq OWNED BY lds.geodetic_vertical_marks.id;
    ALTER SEQUENCE lds.geodetic_antarctic_vertical_marks_id_seq OWNED BY lds.geodetic_antarctic_vertical_marks.id;
    ALTER SEQUENCE lds.title_owners_id_seq OWNED BY lds.title_owners.id;
END;
$$
$PATCH$
);

END;
$PATCHES$;

