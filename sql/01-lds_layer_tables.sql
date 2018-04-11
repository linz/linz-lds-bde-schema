--------------------------------------------------------------------------------
--
-- linz-lds-bde-schema - LINZ LDS BDE simplified schema
--
-- Copyright 2016 Crown copyright (c)
-- Land Information New Zealand and the New Zealand Government.
-- All rights reserved
--
-- This software is released under the terms of the new BSD license. See the
-- LICENSE file for more information.
--
--------------------------------------------------------------------------------
-- Creates LINZ Data Service (LDS) simplified Landonline layers tables
--------------------------------------------------------------------------------
DO $SCHEMA$
BEGIN

IF EXISTS (SELECT * FROM pg_namespace where LOWER(nspname) = 'lds') THEN
    RETURN;
END IF;

CREATE SCHEMA lds AUTHORIZATION bde_dba;

GRANT USAGE ON SCHEMA lds TO bde_admin;
GRANT USAGE ON SCHEMA lds TO bde_user;

COMMENT ON SCHEMA lds IS 'Schema for LDS simplified Landonline layers';

--------------------------------------------------------------------------------
-- LDS table geodetic_marks
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.geodetic_marks CASCADE;

CREATE TABLE lds.geodetic_marks (
    id INTEGER NOT NULL,
    geodetic_code CHAR(4) NOT NULL,
    current_mark_name VARCHAR(100),
    description VARCHAR(2048),
    mark_type VARCHAR(2048),
    beacon_type VARCHAR(2048),
    mark_condition VARCHAR(2048),
    "order" INTEGER NOT NULL,
    land_district VARCHAR(100),
    latitude NUMERIC(22,12) NOT NULL,
    longitude NUMERIC(22,12) NOT NULL,
    ellipsoidal_height NUMERIC(22,12) NULL
);
PERFORM AddGeometryColumn('lds', 'geodetic_marks', 'shape', 4167, 'POINT', 2);

ALTER TABLE lds.geodetic_marks ADD PRIMARY KEY (id);
CREATE INDEX shx_geo_shape ON lds.geodetic_marks USING gist (shape);

ALTER TABLE lds.geodetic_marks OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.geodetic_marks FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.geodetic_marks TO bde_admin;
GRANT SELECT ON TABLE lds.geodetic_marks TO bde_user;

--------------------------------------------------------------------------------
-- LDS table geodetic_network_marks
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.geodetic_network_marks CASCADE;

CREATE TABLE lds.geodetic_network_marks (
    id INTEGER NOT NULL,
    nod_id INTEGER NOT NULL,
    geodetic_code CHAR(4) NOT NULL,
    control_network VARCHAR(4) NOT NULL,
    current_mark_name VARCHAR(100),
    description VARCHAR(2048),
    mark_type VARCHAR(2048),
    beacon_type VARCHAR(2048),
    mark_condition VARCHAR(2048),
    "order" INTEGER NOT NULL,
    land_district VARCHAR(100),
    latitude NUMERIC(22,12) NOT NULL,
    longitude NUMERIC(22,12) NOT NULL,
    ellipsoidal_height NUMERIC(22,12) NULL
);
PERFORM AddGeometryColumn('lds', 'geodetic_network_marks', 'shape', 4167, 'POINT', 2);

CREATE SEQUENCE lds.geodetic_network_marks_id_seq;
ALTER TABLE lds.geodetic_network_marks_id_seq OWNER TO bde_dba;
ALTER TABLE lds.geodetic_network_marks ALTER COLUMN id SET DEFAULT nextval('lds.geodetic_network_marks_id_seq');

ALTER TABLE lds.geodetic_network_marks ADD PRIMARY KEY (id);
CREATE UNIQUE INDEX idx_geo_net_mrk_nod_net ON lds.geodetic_network_marks (nod_id, control_network);
CREATE INDEX shx_geo_net_shape ON lds.geodetic_network_marks USING gist (shape);

ALTER TABLE lds.geodetic_network_marks OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.geodetic_network_marks FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.geodetic_network_marks TO bde_admin;
GRANT SELECT ON TABLE lds.geodetic_network_marks TO bde_user;

--------------------------------------------------------------------------------
-- LDS table geodetic_vertical_marks
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.geodetic_vertical_marks CASCADE;

CREATE TABLE lds.geodetic_vertical_marks(
    id INTEGER NOT NULL,
    nod_id INTEGER NOT NULL,
    geodetic_code CHAR(4) NOT NULL,
    current_mark_name VARCHAR(100),
    description VARCHAR(2048),
    mark_type VARCHAR(2048),
    beacon_type VARCHAR(2048),
    mark_condition VARCHAR(2048),
    "order" CHAR(2) NOT NULL,
    land_district VARCHAR(100),
    normal_orthometric_height NUMERIC(22, 12),
    coordinate_system VARCHAR(100) NOT NULL
);
PERFORM AddGeometryColumn('lds', 'geodetic_vertical_marks', 'shape', 4167, 'POINT', 2);

ALTER TABLE lds.geodetic_vertical_marks ADD UNIQUE (nod_id, coordinate_system);

CREATE SEQUENCE lds.geodetic_vertical_marks_id_seq;
ALTER TABLE lds.geodetic_vertical_marks_id_seq OWNER TO bde_dba;
ALTER TABLE lds.geodetic_vertical_marks ALTER COLUMN id SET DEFAULT nextval('lds.geodetic_vertical_marks_id_seq');

ALTER TABLE lds.geodetic_vertical_marks ADD PRIMARY KEY (id);
CREATE INDEX shx_geo_vert_shape ON lds.geodetic_vertical_marks USING gist (shape);

ALTER TABLE lds.geodetic_vertical_marks OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.geodetic_vertical_marks FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.geodetic_vertical_marks TO bde_admin;
GRANT SELECT ON TABLE lds.geodetic_vertical_marks TO bde_user;

--------------------------------------------------------------------------------
-- LDS table geodetic_antarctic_marks
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.geodetic_antarctic_marks CASCADE;

CREATE TABLE lds.geodetic_antarctic_marks (
    id INTEGER NOT NULL,
    geodetic_code CHAR(4) NOT NULL,
    current_mark_name VARCHAR(100),
    description VARCHAR(2048),
    mark_type VARCHAR(2048),
    beacon_type VARCHAR(2048),
    mark_condition VARCHAR(2048),
    "order" INTEGER NOT NULL,
    latitude NUMERIC(22,12) NOT NULL,
    longitude NUMERIC(22,12) NOT NULL,
    ellipsoidal_height NUMERIC(22,12) NULL
);
PERFORM AddGeometryColumn('lds', 'geodetic_antarctic_marks', 'shape', 4764, 'POINT', 2);

ALTER TABLE lds.geodetic_antarctic_marks ADD PRIMARY KEY (id);
CREATE INDEX shx_geo_ant_shape ON lds.geodetic_antarctic_marks USING gist (shape);

ALTER TABLE lds.geodetic_antarctic_marks OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.geodetic_antarctic_marks FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.geodetic_antarctic_marks TO bde_admin;
GRANT SELECT ON TABLE lds.geodetic_antarctic_marks TO bde_user;

--------------------------------------------------------------------------------
-- LDS table geodetic_antarctic_vertical_marks
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.geodetic_antarctic_vertical_marks CASCADE;

CREATE TABLE lds.geodetic_antarctic_vertical_marks(
    id INTEGER NOT NULL,
    nod_id INTEGER NOT NULL,
    geodetic_code CHAR(4) NOT NULL,
    current_mark_name VARCHAR(100),
    description VARCHAR(2048),
    mark_type VARCHAR(2048),
    beacon_type VARCHAR(2048),
    mark_condition VARCHAR(2048),
    "order" CHAR(2) NOT NULL,
    normal_orthometric_height NUMERIC(22, 12),
    coordinate_system VARCHAR(100) NOT NULL
);
PERFORM AddGeometryColumn('lds', 'geodetic_antarctic_vertical_marks', 'shape', 4764, 'POINT', 2);

ALTER TABLE lds.geodetic_antarctic_vertical_marks ADD UNIQUE (nod_id, coordinate_system);

CREATE SEQUENCE lds.geodetic_antarctic_vertical_marks_id_seq;
ALTER TABLE lds.geodetic_antarctic_vertical_marks_id_seq OWNER TO bde_dba;
ALTER TABLE lds.geodetic_antarctic_vertical_marks ALTER COLUMN id SET DEFAULT nextval('lds.geodetic_antarctic_vertical_marks_id_seq');

ALTER TABLE lds.geodetic_antarctic_vertical_marks ADD PRIMARY KEY (id);
CREATE INDEX shx_geo_ant_vert_shape ON lds.geodetic_antarctic_vertical_marks USING gist (shape);

ALTER TABLE lds.geodetic_antarctic_vertical_marks OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.geodetic_antarctic_vertical_marks FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.geodetic_antarctic_vertical_marks TO bde_admin;
GRANT SELECT ON TABLE lds.geodetic_antarctic_vertical_marks TO bde_user;

--------------------------------------------------------------------------------
-- LDS table survey_protected_marks
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.survey_protected_marks CASCADE;

CREATE TABLE lds.survey_protected_marks (
    id INTEGER NOT NULL,
    geodetic_code CHAR(4),
    current_mark_name VARCHAR(100),
    description VARCHAR(2048),
    mark_type VARCHAR(2048),
    mark_condition VARCHAR(2048),
    "order" INTEGER NOT NULL,
    last_survey VARCHAR(50),
    last_survey_date DATE
);PERFORM AddGeometryColumn('lds', 'survey_protected_marks', 'shape', 4167, 'POINT', 2);

ALTER TABLE lds.survey_protected_marks ADD PRIMARY KEY (id);
CREATE INDEX shx_spm_shape ON lds.survey_protected_marks USING gist (shape);

ALTER TABLE lds.survey_protected_marks OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.survey_protected_marks FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.survey_protected_marks TO bde_admin;
GRANT SELECT ON TABLE lds.survey_protected_marks TO bde_user;

--------------------------------------------------------------------------------
-- LDS table all_parcels
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.all_parcels CASCADE;

CREATE TABLE lds.all_parcels (
    id INTEGER NOT NULL,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    status VARCHAR(25) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0)
);
PERFORM AddGeometryColumn('lds', 'all_parcels', 'shape', 4167, 'GEOMETRY', 2);

ALTER TABLE lds.all_parcels ADD PRIMARY KEY (id);
CREATE INDEX shx_all_par_shape ON lds.all_parcels USING gist (shape);

ALTER TABLE lds.all_parcels OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.all_parcels FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.all_parcels TO bde_admin;
GRANT SELECT ON TABLE lds.all_parcels TO bde_user;

--------------------------------------------------------------------------------
-- LDS table all_linear_parcels
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.all_linear_parcels CASCADE;

CREATE TABLE lds.all_linear_parcels (
    id INTEGER NOT NULL,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    status VARCHAR(25) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0)
);
PERFORM AddGeometryColumn('lds', 'all_linear_parcels', 'shape', 4167, 'GEOMETRY', 2);

ALTER TABLE lds.all_linear_parcels ADD PRIMARY KEY (id);
CREATE INDEX shx_all_line_par_shape ON lds.all_linear_parcels USING gist (shape);

ALTER TABLE lds.all_linear_parcels OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.all_linear_parcels FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.all_linear_parcels TO bde_admin;
GRANT SELECT ON TABLE lds.all_linear_parcels TO bde_user;

--------------------------------------------------------------------------------
-- LDS table primary_parcels
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.primary_parcels CASCADE;

CREATE TABLE lds.primary_parcels (
    id INTEGER NOT NULL,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0) NOT NULL
);
PERFORM AddGeometryColumn('lds', 'primary_parcels', 'shape', 4167, 'GEOMETRY', 2);

ALTER TABLE lds.primary_parcels ADD PRIMARY KEY (id);
CREATE INDEX shx_all_prim_par_shape ON lds.primary_parcels USING gist (shape);

ALTER TABLE lds.primary_parcels OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.primary_parcels FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.primary_parcels TO bde_admin;
GRANT SELECT ON TABLE lds.primary_parcels TO bde_user;

--------------------------------------------------------------------------------
-- LDS table land_parcels
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.land_parcels CASCADE;

CREATE TABLE lds.land_parcels (
    id INTEGER NOT NULL,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0) NOT NULL
);
PERFORM AddGeometryColumn('lds', 'land_parcels', 'shape', 4167, 'GEOMETRY', 2);

ALTER TABLE lds.land_parcels ADD PRIMARY KEY (id);
CREATE INDEX shx_lnd_par_shape ON lds.land_parcels USING gist (shape);

ALTER TABLE lds.land_parcels OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.land_parcels FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.land_parcels TO bde_admin;
GRANT SELECT ON TABLE lds.land_parcels TO bde_user;

--------------------------------------------------------------------------------
-- LDS table hydro_parcels
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.hydro_parcels CASCADE;

CREATE TABLE lds.hydro_parcels (
    id INTEGER NOT NULL,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0) NOT NULL
);
PERFORM AddGeometryColumn('lds', 'hydro_parcels', 'shape', 4167, 'GEOMETRY', 2);

ALTER TABLE lds.hydro_parcels ADD PRIMARY KEY (id);
CREATE INDEX shx_hyd_par_shape ON lds.hydro_parcels USING gist (shape);

ALTER TABLE lds.hydro_parcels OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.hydro_parcels FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.hydro_parcels TO bde_admin;
GRANT SELECT ON TABLE lds.hydro_parcels TO bde_user;

--------------------------------------------------------------------------------
-- LDS table road_parcels
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.road_parcels CASCADE;

CREATE TABLE lds.road_parcels (
    id INTEGER NOT NULL,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0) NOT NULL
);
PERFORM AddGeometryColumn('lds', 'road_parcels', 'shape', 4167, 'GEOMETRY', 2);

ALTER TABLE lds.road_parcels ADD PRIMARY KEY (id);
CREATE INDEX shx_road_par_shape ON lds.road_parcels USING gist (shape);

ALTER TABLE lds.road_parcels OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.road_parcels FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.road_parcels TO bde_admin;
GRANT SELECT ON TABLE lds.road_parcels TO bde_user;

--------------------------------------------------------------------------------
-- LDS table non_primary_parcels
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.non_primary_parcels CASCADE;

CREATE TABLE lds.non_primary_parcels (
    id INTEGER NOT NULL,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0) NOT NULL
);
PERFORM AddGeometryColumn('lds', 'non_primary_parcels', 'shape', 4167, 'GEOMETRY', 2);

ALTER TABLE lds.non_primary_parcels ADD PRIMARY KEY (id);
CREATE INDEX shx_non_prim_par_shape ON lds.non_primary_parcels USING gist (shape);

ALTER TABLE lds.non_primary_parcels OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.non_primary_parcels FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.non_primary_parcels TO bde_admin;
GRANT SELECT ON TABLE lds.non_primary_parcels TO bde_user;

--------------------------------------------------------------------------------
-- LDS table non_primary_linear_parcels
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.non_primary_linear_parcels CASCADE;

CREATE TABLE lds.non_primary_linear_parcels (
    id INTEGER NOT NULL,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0)
);
PERFORM AddGeometryColumn('lds', 'non_primary_linear_parcels', 'shape', 4167, 'GEOMETRY', 2);

ALTER TABLE lds.non_primary_linear_parcels ADD PRIMARY KEY (id);
CREATE INDEX shx_non_pril_par_shape ON lds.non_primary_linear_parcels USING gist (shape);

ALTER TABLE lds.non_primary_linear_parcels OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.non_primary_linear_parcels FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.non_primary_linear_parcels TO bde_admin;
GRANT SELECT ON TABLE lds.non_primary_linear_parcels TO bde_user;

--------------------------------------------------------------------------------
-- LDS table strata_parcels
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.strata_parcels CASCADE;

CREATE TABLE lds.strata_parcels (
    id INTEGER NOT NULL,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0) NOT NULL
);
PERFORM AddGeometryColumn('lds', 'strata_parcels', 'shape', 4167, 'GEOMETRY', 2);

ALTER TABLE lds.strata_parcels ADD PRIMARY KEY (id);
CREATE INDEX shx_str_par_shape ON lds.strata_parcels USING gist (shape);

ALTER TABLE lds.strata_parcels OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.strata_parcels FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.strata_parcels TO bde_admin;
GRANT SELECT ON TABLE lds.strata_parcels TO bde_user;

--------------------------------------------------------------------------------
-- LDS table all_parcels_pend
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.all_parcels_pend CASCADE;

CREATE TABLE lds.all_parcels_pend (
    id INTEGER NOT NULL,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    status VARCHAR(25) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0)
);
PERFORM AddGeometryColumn('lds', 'all_parcels_pend', 'shape', 4167, 'GEOMETRY', 2);

ALTER TABLE lds.all_parcels_pend ADD PRIMARY KEY (id);
CREATE INDEX shx_all_par_pend_shape ON lds.all_parcels_pend USING gist (shape);

ALTER TABLE lds.all_parcels_pend OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.all_parcels_pend FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.all_parcels_pend TO bde_admin;
GRANT SELECT ON TABLE lds.all_parcels_pend TO bde_user;
--------------------------------------------------------------------------------
-- LDS table titles
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.titles CASCADE;

CREATE TABLE lds.titles (
    id INTEGER NOT NULL,
    title_no VARCHAR(20) NOT NULL,
    status VARCHAR(4) NOT NULL,
    type VARCHAR(100) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    issue_date TIMESTAMP NOT NULL,
    guarantee_status VARCHAR(100) NOT NULL,
    estate_description VARCHAR(4096),
    number_owners INT8 NOT NULL,
    spatial_extents_shared BOOLEAN
);
PERFORM AddGeometryColumn('lds', 'titles', 'shape', 4167, 'MULTIPOLYGON', 2);

ALTER TABLE lds.titles ADD PRIMARY KEY (id);
CREATE INDEX shx_title_shape ON lds.titles USING gist (shape);

ALTER TABLE lds.titles OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.titles FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.titles TO bde_admin;
GRANT SELECT ON TABLE lds.titles TO bde_user;

--------------------------------------------------------------------------------
-- LDS table titles_plus
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.titles_plus CASCADE;

CREATE TABLE lds.titles_plus (
    id INTEGER NOT NULL,
    title_no VARCHAR(20) NOT NULL,
    status VARCHAR(4) NOT NULL,
    type VARCHAR(100) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    issue_date TIMESTAMP NOT NULL,
    guarantee_status VARCHAR(100) NOT NULL,
    estate_description VARCHAR(4096),
    owners TEXT,
    spatial_extents_shared BOOLEAN
);
PERFORM AddGeometryColumn('lds', 'titles_plus', 'shape', 4167, 'MULTIPOLYGON', 2);

ALTER TABLE lds.titles_plus ADD PRIMARY KEY (id);
CREATE INDEX shx_title_plus_shape ON lds.titles_plus USING gist (shape);

ALTER TABLE lds.titles_plus OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.titles_plus FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.titles_plus TO bde_admin;
GRANT SELECT ON TABLE lds.titles_plus TO bde_user;

--------------------------------------------------------------------------------
-- LDS table title_owners
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.title_owners CASCADE;

CREATE TABLE lds.title_owners (
    id INTEGER NOT NULL,
    owner VARCHAR(250) NOT NULL,
    title_no VARCHAR(20) NOT NULL,
    title_status VARCHAR(4) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    part_ownership BOOLEAN NOT NULL
);
PERFORM AddGeometryColumn('lds', 'title_owners', 'shape', 4167, 'MULTIPOLYGON', 2);

ALTER TABLE lds.title_owners ADD UNIQUE (owner, title_no);

CREATE SEQUENCE lds.title_owners_id_seq;
ALTER TABLE lds.title_owners_id_seq OWNER TO bde_dba;
ALTER TABLE lds.title_owners ALTER COLUMN id SET DEFAULT nextval('lds.title_owners_id_seq');

ALTER TABLE lds.title_owners ADD PRIMARY KEY (id);
CREATE INDEX shx_owners_shape ON lds.title_owners USING gist (shape);

ALTER TABLE lds.title_owners OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.title_owners FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.title_owners TO bde_admin;
GRANT SELECT ON TABLE lds.title_owners TO bde_user;

--------------------------------------------------------------------------------
-- LDS table road_centre_line
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.road_centre_line CASCADE;

CREATE TABLE lds.road_centre_line (
    id INTEGER NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    locality VARCHAR(100),
    territorial_authority VARCHAR(255),
    name_utf8 VARCHAR(100),
    locality_utf8 VARCHAR(100)
);
PERFORM AddGeometryColumn('lds', 'road_centre_line', 'shape', 4167, 'MULTILINESTRING', 2);

ALTER TABLE lds.road_centre_line ADD PRIMARY KEY (id);
CREATE INDEX shx_rcl_shape ON lds.road_centre_line USING gist (shape);

ALTER TABLE lds.road_centre_line OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.road_centre_line FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.road_centre_line TO bde_admin;
GRANT SELECT ON TABLE lds.road_centre_line TO bde_user;

--------------------------------------------------------------------------------
-- LDS table road_centre_line_subsection
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.road_centre_line_subsection CASCADE;

CREATE TABLE lds.road_centre_line_subsection (
    id INTEGER NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    other_names VARCHAR(255),
    locality VARCHAR(100),
    territorial_authority VARCHAR(255),
    parcel_derived BOOLEAN NOT NULL,
    name_utf8 VARCHAR(100),
    other_names_utf8 VARCHAR(255),
    locality_utf8 VARCHAR(100)
);

PERFORM AddGeometryColumn('lds', 'road_centre_line_subsection', 'shape', 4167, 'LINESTRING', 2);

ALTER TABLE lds.road_centre_line_subsection ADD PRIMARY KEY (id);
CREATE INDEX shx_rcls_shape ON lds.road_centre_line_subsection USING gist (shape);

ALTER TABLE lds.road_centre_line_subsection OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.road_centre_line_subsection FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.road_centre_line_subsection TO bde_admin;
GRANT SELECT ON TABLE lds.road_centre_line_subsection TO bde_user;

--------------------------------------------------------------------------------
-- LDS table railway_centre_line
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.railway_centre_line CASCADE;

CREATE TABLE lds.railway_centre_line (
    id INTEGER NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    name_utf8 VARCHAR(100)
);
PERFORM AddGeometryColumn('lds', 'railway_centre_line', 'shape', 4167, 'MULTILINESTRING', 2);

ALTER TABLE lds.railway_centre_line ADD PRIMARY KEY (id);
CREATE INDEX shx_rlwy_cl_shape ON lds.railway_centre_line USING gist (shape);

ALTER TABLE lds.railway_centre_line OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.railway_centre_line FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.railway_centre_line TO bde_admin;
GRANT SELECT ON TABLE lds.railway_centre_line TO bde_user;

--------------------------------------------------------------------------------
-- LDS table street_address (Historic)
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.street_address CASCADE;

CREATE TABLE lds.street_address (
    id INTEGER NOT NULL,
    rna_id INTEGER NOT NULL,
    address VARCHAR(126) NOT NULL,
    house_number VARCHAR(25) NOT NULL,
    road_name VARCHAR(100) NOT NULL,
    locality VARCHAR(30),
    territorial_authority VARCHAR(255)
);
PERFORM AddGeometryColumn('lds', 'street_address', 'shape', 4167, 'POINT', 2);

ALTER TABLE lds.street_address ADD PRIMARY KEY (id);
CREATE INDEX shx_sad_shape ON lds.street_address USING gist (shape);

ALTER TABLE lds.street_address OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.street_address FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.street_address TO bde_admin;
GRANT SELECT ON TABLE lds.street_address TO bde_user;

DROP TABLE IF EXISTS lds.street_address2 CASCADE;

--------------------------------------------------------------------------------
-- LDS table street_address2 (new version)
--------------------------------------------------------------------------------

CREATE TABLE lds.street_address2 (
    id integer NOT NULL,
    rna_id integer NOT NULL,
    rcl_id integer NOT NULL,
    address VARCHAR(126) NOT NULL,
    house_number VARCHAR(25) NOT NULL,
    range_low integer NOT NULL,
    range_high integer,
    road_name VARCHAR(100) NOT NULL,
    locality VARCHAR(100),
    territorial_authority VARCHAR(255),
    road_name_utf8 VARCHAR(100),
    address_utf8 VARCHAR(126),
    locality_utf8 VARCHAR(100)
);

PERFORM AddGeometryColumn('lds', 'street_address2', 'shape', 4167, 'POINT', 2);

ALTER TABLE lds.street_address2 ADD PRIMARY KEY (id);

ALTER TABLE lds.street_address2 OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.street_address2 FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.street_address2 TO bde_admin;
GRANT SELECT ON TABLE lds.street_address2 TO bde_user;

--------------------------------------------------------------------------------
-- LDS table mesh_blocks
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.mesh_blocks CASCADE;

CREATE TABLE lds.mesh_blocks (
    id INTEGER NOT NULL,
    code VARCHAR(7) NOT NULL
);
PERFORM AddGeometryColumn('lds', 'mesh_blocks', 'shape', 4167, 'GEOMETRY', 2);

ALTER TABLE lds.mesh_blocks ADD PRIMARY KEY (id);
CREATE INDEX shx_mesh_blocks_shape ON lds.mesh_blocks USING gist (shape);

ALTER TABLE lds.mesh_blocks OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.mesh_blocks FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.mesh_blocks TO bde_admin;
GRANT SELECT ON TABLE lds.mesh_blocks TO bde_user;

--------------------------------------------------------------------------------
-- LDS table land_districts
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.land_districts CASCADE;

CREATE TABLE lds.land_districts (
    id INTEGER NOT NULL,
    name VARCHAR(100) NOT NULL
);
PERFORM AddGeometryColumn('lds', 'land_districts', 'shape', 4167, 'GEOMETRY', 2);

ALTER TABLE lds.land_districts ADD PRIMARY KEY (id);
CREATE INDEX shx_land_districts_shape ON lds.land_districts USING gist (shape);

ALTER TABLE lds.land_districts OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.land_districts FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.land_districts TO bde_admin;
GRANT SELECT ON TABLE lds.land_districts TO bde_user;

--------------------------------------------------------------------------------
-- LDS table survey_plans
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.survey_plans CASCADE;

CREATE TABLE lds.survey_plans (
    id INTEGER NOT NULL,
    survey_reference VARCHAR(50) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    description VARCHAR(2048),
    status VARCHAR(2048) NOT NULL,
    survey_date DATE,
    purpose VARCHAR(2048) NOT NULL,
    type VARCHAR(100) NOT NULL,
    datum VARCHAR(10)
);
PERFORM AddGeometryColumn('lds', 'survey_plans', 'shape', 4167, 'MULTIPOINT', 2);

ALTER TABLE lds.survey_plans ADD PRIMARY KEY (id);
CREATE INDEX shx_sur_shape ON lds.survey_plans USING gist (shape);

ALTER TABLE lds.survey_plans OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.survey_plans FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.survey_plans TO bde_admin;
GRANT SELECT ON TABLE lds.survey_plans TO bde_user;

--------------------------------------------------------------------------------
-- LDS table cadastral_adjustments
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.cadastral_adjustments CASCADE;

DROP TABLE IF EXISTS lds.cadastral_adjustments CASCADE;
CREATE TABLE lds.cadastral_adjustments (
    id INTEGER NOT NULL,
    date_adjusted TIMESTAMP NOT NULL,
    survey_reference VARCHAR(50),
    adjusted_nodes INTEGER NOT NULL
);
PERFORM AddGeometryColumn('lds', 'cadastral_adjustments', 'shape', 4167, 'GEOMETRY', 2);

ALTER TABLE lds.cadastral_adjustments ADD PRIMARY KEY (id);
CREATE INDEX shx_cad_adj_shape ON lds.cadastral_adjustments USING gist (shape);

ALTER TABLE lds.cadastral_adjustments OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.cadastral_adjustments FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.cadastral_adjustments TO bde_admin;
GRANT SELECT ON TABLE lds.cadastral_adjustments TO bde_user;

--------------------------------------------------------------------------------
-- LDS table spi_adjustments
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.spi_adjustments CASCADE;

CREATE TABLE lds.spi_adjustments (
    id INTEGER NOT NULL,
    date_adjusted TIMESTAMP NOT NULL,
    survey_reference VARCHAR(50),
    adjusted_nodes INTEGER NOT NULL
);
PERFORM AddGeometryColumn('lds', 'spi_adjustments', 'shape', 4167, 'GEOMETRY', 2);

ALTER TABLE lds.spi_adjustments ADD PRIMARY KEY (id);
CREATE INDEX shx_spi_adj_shape ON lds.spi_adjustments USING gist (shape);

ALTER TABLE lds.spi_adjustments OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.spi_adjustments FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.spi_adjustments TO bde_admin;
GRANT SELECT ON TABLE lds.spi_adjustments TO bde_user;

--------------------------------------------------------------------------------
-- LDS table waca_adjustments
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.waca_adjustments CASCADE;

CREATE TABLE lds.waca_adjustments (
    id INTEGER NOT NULL,
    date_adjusted TIMESTAMP NOT NULL,
    survey_reference VARCHAR(50),
    adjusted_nodes INTEGER NOT NULL
);
PERFORM AddGeometryColumn('lds', 'waca_adjustments', 'shape', 4167, 'GEOMETRY', 2);

ALTER TABLE lds.waca_adjustments ADD PRIMARY KEY (id);
CREATE INDEX shx_waca_adj_shape ON lds.waca_adjustments USING gist (shape);

ALTER TABLE lds.waca_adjustments OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.waca_adjustments FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.waca_adjustments TO bde_admin;
GRANT SELECT ON TABLE lds.waca_adjustments TO bde_user;

--------------------------------------------------------------------------------
-- LDS table survey_observations
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.survey_observations CASCADE;

CREATE TABLE lds.survey_observations (
    id integer NOT NULL,
    nod_id_start integer NOT NULL,
    mark_name_start VARCHAR(100),
    nod_id_end integer NOT NULL,
    mark_name_end VARCHAR(100),
    obs_type character varying(18) NOT NULL,
    value numeric(22,12) NOT NULL,
    value_accuracy numeric(22,12),
    value_label VARCHAR(10) NOT NULL,
    surveyed_type VARCHAR(10),
    coordinate_system VARCHAR(42) NOT NULL,
    land_district VARCHAR(14) NOT NULL,
    ref_datetime timestamp without time zone NOT NULL,
    survey_reference VARCHAR(50)
);
PERFORM AddGeometryColumn('lds', 'survey_observations', 'shape', 4167, 'LINESTRING', 2);

ALTER TABLE lds.survey_observations ADD PRIMARY KEY (id);
CREATE INDEX shx_sur_obs_shape ON lds.survey_observations USING gist (shape);

ALTER TABLE lds.survey_observations OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.survey_observations FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.survey_observations TO bde_admin;
GRANT SELECT ON TABLE lds.survey_observations TO bde_user;

--------------------------------------------------------------------------------
-- LDS table survey_arc_observations
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.survey_arc_observations CASCADE;

CREATE TABLE lds.survey_arc_observations (
    id INTEGER NOT NULL,
    nod_id_start integer NOT NULL,
    mark_name_start VARCHAR(100),
    nod_id_end integer NOT NULL,
    mark_name_end VARCHAR(100),
    chord_bearing NUMERIC(22,12) NOT NULL,
    arc_length NUMERIC(22,12),
    arc_radius NUMERIC(22,12),
    arc_direction VARCHAR(4),
    chord_bearing_accuracy NUMERIC(22,12),
    arc_length_accuracy NUMERIC(22,12),
    surveyed_type VARCHAR(10),
    coordinate_system VARCHAR(42) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    ref_datetime TIMESTAMP NOT NULL,
    survey_reference VARCHAR(50),
    chord_bearing_label VARCHAR(10) NOT NULL,
    arc_length_label VARCHAR(10),
    arc_radius_label VARCHAR(10)
);

PERFORM AddGeometryColumn('lds', 'survey_arc_observations', 'shape', 4167, 'LINESTRING', 2);

ALTER TABLE lds.survey_arc_observations ADD PRIMARY KEY (id);
CREATE INDEX shx_sur_arc_obs_shape ON lds.survey_arc_observations USING gist (shape);

ALTER TABLE lds.survey_arc_observations OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.survey_arc_observations FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.survey_arc_observations TO bde_admin;
GRANT SELECT ON TABLE lds.survey_arc_observations TO bde_user;

--------------------------------------------------------------------------------
-- LDS table parcel_vectors
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.parcel_vectors CASCADE;

DROP TABLE IF EXISTS lds.parcel_vectors CASCADE;
CREATE TABLE lds.parcel_vectors (
    id INTEGER NOT NULL,
    type VARCHAR(6) NOT NULL,
    bearing NUMERIC(22,12),
    distance NUMERIC(22,12),
    bearing_label VARCHAR(10),
    distance_label VARCHAR(10)
);
PERFORM AddGeometryColumn('lds', 'parcel_vectors', 'shape', 4167, 'LINESTRING', 2);

ALTER TABLE lds.parcel_vectors ADD PRIMARY KEY (id);
CREATE INDEX shx_par_vct_shape ON lds.parcel_vectors USING gist (shape);

ALTER TABLE lds.parcel_vectors OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.parcel_vectors FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.parcel_vectors TO bde_admin;
GRANT SELECT ON TABLE lds.parcel_vectors TO bde_user;

--------------------------------------------------------------------------------
-- LDS table survey_network_marks
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.survey_network_marks CASCADE;

DROP TABLE IF EXISTS lds.survey_network_marks CASCADE;
CREATE TABLE lds.survey_network_marks (
    id INTEGER NOT NULL,
    geodetic_code CHAR(4),
    current_mark_name VARCHAR(100),
    description VARCHAR(2048),
    mark_type VARCHAR(2048),
    mark_condition VARCHAR(2048),
    "order" INTEGER NOT NULL,
    nominal_accuracy NUMERIC(4,2),
    last_survey VARCHAR(50)
);
PERFORM AddGeometryColumn('lds', 'survey_network_marks', 'shape', 4167, 'POINT', 2);

ALTER TABLE lds.survey_network_marks ADD PRIMARY KEY (id);
CREATE INDEX shx_csnm_shape ON lds.survey_network_marks USING gist (shape);

ALTER TABLE lds.survey_network_marks OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.survey_network_marks FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.survey_network_marks TO bde_admin;
GRANT SELECT ON TABLE lds.survey_network_marks TO bde_user;

--------------------------------------------------------------------------------
-- LDS table survey_bdy_marks
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.survey_bdy_marks CASCADE;

DROP TABLE IF EXISTS lds.survey_bdy_marks CASCADE;
CREATE TABLE lds.survey_bdy_marks (
    id INTEGER NOT NULL,
    name VARCHAR(100),
    "order" INTEGER NOT NULL,
    nominal_accuracy NUMERIC(4,2),
    date_last_adjusted TIMESTAMP
);
PERFORM AddGeometryColumn('lds', 'survey_bdy_marks', 'shape', 4167, 'POINT', 2);

ALTER TABLE lds.survey_bdy_marks ADD PRIMARY KEY (id);
CREATE INDEX shx_cad_bdy_mrk_shape ON lds.survey_bdy_marks USING gist (shape);

ALTER TABLE lds.survey_bdy_marks OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.survey_bdy_marks FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.survey_bdy_marks TO bde_admin;
GRANT SELECT ON TABLE lds.survey_bdy_marks TO bde_user;

--------------------------------------------------------------------------------
-- LDS table survey_non_bdy_marks
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.survey_non_bdy_marks CASCADE;

DROP TABLE IF EXISTS lds.survey_non_bdy_marks CASCADE;
CREATE TABLE lds.survey_non_bdy_marks (
    id INTEGER NOT NULL,
    name VARCHAR(100),
    "order" INTEGER NOT NULL,
    nominal_accuracy NUMERIC(4,2),
    date_last_adjusted TIMESTAMP
);
PERFORM AddGeometryColumn('lds', 'survey_non_bdy_marks', 'shape', 4167, 'POINT', 2);

ALTER TABLE lds.survey_non_bdy_marks ADD PRIMARY KEY (id);
CREATE INDEX shx_cad_nbdy_mrk_shape ON lds.survey_non_bdy_marks USING gist (shape);

ALTER TABLE lds.survey_non_bdy_marks OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.survey_non_bdy_marks FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.survey_non_bdy_marks TO bde_admin;
GRANT SELECT ON TABLE lds.survey_non_bdy_marks TO bde_user;

--------------------------------------------------------------------------------
-- LDS table parcel_stat_actions
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.parcel_stat_actions CASCADE;

CREATE TABLE lds.parcel_stat_actions (
    id INTEGER NOT NULL,
    par_id INTEGER NOT NULL,
    status VARCHAR(10) NOT NULL,
    action VARCHAR(20) NOT NULL,
    statutory_action VARCHAR(1024)
);

ALTER TABLE lds.parcel_stat_actions ADD PRIMARY KEY (id);

ALTER TABLE lds.parcel_stat_actions OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.parcel_stat_actions FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.parcel_stat_actions TO bde_admin;
GRANT SELECT ON TABLE lds.parcel_stat_actions TO bde_user;

--------------------------------------------------------------------------------
-- LDS table affected_parcel_surveys
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.affected_parcel_surveys CASCADE;

CREATE TABLE lds.affected_parcel_surveys (
    id INTEGER NOT NULL,
    par_id INTEGER NOT NULL,
    sur_wrk_id INTEGER NOT NULL,
    action VARCHAR(12)
);

ALTER TABLE lds.affected_parcel_surveys ADD PRIMARY KEY (id);

ALTER TABLE lds.affected_parcel_surveys OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.affected_parcel_surveys FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.affected_parcel_surveys TO bde_admin;
GRANT SELECT ON TABLE lds.affected_parcel_surveys TO bde_user;

--------------------------------------------------------------------------------
-- LDS table title_parcel_associations
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.title_parcel_associations CASCADE;

CREATE TABLE lds.title_parcel_associations (
    id INTEGER NOT NULL,
    title_no VARCHAR(20) NOT NULL,
    par_id INTEGER NOT NULL,
    source VARCHAR(8) NOT NULL
);

ALTER TABLE lds.title_parcel_associations ADD PRIMARY KEY (id);

ALTER TABLE lds.title_parcel_associations OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.title_parcel_associations FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.title_parcel_associations TO bde_admin;
GRANT SELECT ON TABLE lds.title_parcel_associations TO bde_user;

--------------------------------------------------------------------------------
-- LDS table title_estates
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.title_estates CASCADE;

CREATE TABLE lds.title_estates (
    id INTEGER NOT NULL,
    title_no VARCHAR(20) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    status VARCHAR(25) NOT NULL,
    type VARCHAR(255),
    share VARCHAR(100) NOT NULL,
    purpose VARCHAR(255),
    timeshare_week_no VARCHAR(20),
    term VARCHAR(255),
    legal_description VARCHAR(2048),
    area BIGINT
);

ALTER TABLE lds.title_estates ADD PRIMARY KEY (id);

ALTER TABLE lds.title_estates OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.title_estates FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.title_estates TO bde_admin;
GRANT SELECT ON TABLE lds.title_estates TO bde_user;

--------------------------------------------------------------------------------
-- LDS table titles_aspatial
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.titles_aspatial CASCADE;

CREATE TABLE lds.titles_aspatial (
    id INTEGER NOT NULL,
    title_no VARCHAR(20) NOT NULL,
    status VARCHAR(50) NOT NULL,
    register_type VARCHAR(50) NOT NULL,
    type VARCHAR(100) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    issue_date TIMESTAMP NOT NULL,
    guarantee_status VARCHAR(100) NOT NULL,
    provisional CHAR(1) NOT NULL,
    title_no_srs VARCHAR(20),
    title_no_head_srs VARCHAR(20),
    survey_reference VARCHAR(50),
    maori_land CHAR(1),
    number_owners INT8 NOT NULL
);

ALTER TABLE lds.titles_aspatial ADD PRIMARY KEY (id);

ALTER TABLE lds.titles_aspatial OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.titles_aspatial FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.titles_aspatial TO bde_admin;
GRANT SELECT ON TABLE lds.titles_aspatial TO bde_user;

--------------------------------------------------------------------------------
-- LDS table title_owners_aspatial
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.title_owners_aspatial CASCADE;

CREATE TABLE lds.title_owners_aspatial (
    id INTEGER NOT NULL,
    tte_id INTEGER NOT NULL,
    title_no VARCHAR(20) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    status VARCHAR(25) NOT NULL,
    estate_share VARCHAR(100) NOT NULL,
    owner_type VARCHAR(10) NOT NULL,
    prime_surname VARCHAR(100),
    prime_other_names VARCHAR(100),
    corporate_name VARCHAR(250),
    name_suffix VARCHAR(6)
);

ALTER TABLE lds.title_owners_aspatial ADD PRIMARY KEY (id);

ALTER TABLE lds.title_owners_aspatial OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.title_owners_aspatial FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.title_owners_aspatial TO bde_admin;
GRANT SELECT ON TABLE lds.title_owners_aspatial TO bde_user;

--------------------------------------------------------------------------------
-- LDS table title_memorials
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.title_memorials CASCADE;

CREATE TABLE lds.title_memorials
(
    id integer NOT NULL,
    title_no VARCHAR(20) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    memorial_text VARCHAR(18000),
    "current" BOOLEAN NOT NULL,
    instrument_number VARCHAR(30),
    instrument_lodged_datetime TIMESTAMP,
    instrument_type VARCHAR(100),
    encumbrancees VARCHAR(4096)
);

ALTER TABLE lds.title_memorials ADD PRIMARY KEY (id);

ALTER TABLE lds.title_memorials OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.title_memorials FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.title_memorials TO bde_admin;
GRANT SELECT ON TABLE lds.title_memorials TO bde_user;

--------------------------------------------------------------------------------
-- LDS table title_memorial_additional_text
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS lds.title_memorial_additional_text CASCADE;

CREATE TABLE lds.title_memorial_additional_text
(
    id integer NOT NULL,
    ttm_id integer NOT NULL,
    new_title_legal_description character varying(2048),
    new_title_reference character varying(2048),
    easement_type character varying(2048),
    servient_tenement character varying(2048),
    easement_area character varying(2048),
    dominant_tenement_or_grantee character varying(2048),
    statutory_restriction character varying(2048),
    principal_unit character varying(2048),
    future_development_unit character varying(2048),
    assessory_unit character varying(2048),
    title_issued character varying(2048)
);

ALTER TABLE lds.title_memorial_additional_text ADD PRIMARY KEY (id);

ALTER TABLE lds.title_memorial_additional_text OWNER TO bde_dba;

REVOKE ALL ON TABLE lds.title_memorial_additional_text FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.title_memorial_additional_text TO bde_admin;
GRANT SELECT ON TABLE lds.title_memorial_additional_text TO bde_user;

END;
$SCHEMA$;
