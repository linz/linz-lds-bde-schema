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

-- Utility function to implement CREATE INDEX IF NOT EXISTS for
-- PostgreSQL versions lower than 9.5 (where the syntax was introduced)
--
CREATE FUNCTION pg_temp.createGistIndexIfNotExists(p_name name, p_schema name, p_table name, p_column name)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
    IF NOT EXISTS ( SELECT c.oid
                FROM pg_class c, pg_namespace n
                WHERE c.relname = p_name
                  AND c.relkind = 'i'
                  AND c.relnamespace = n.oid
                  AND n.nspname = p_schema )
    THEN
        EXECUTE format('CREATE INDEX %1I ON %2I.%3I USING gist (%4I)', p_name, p_schema, p_table, p_column);
    END IF;
END;
$$;

CREATE SCHEMA IF NOT EXISTS lds;
ALTER SCHEMA lds OWNER TO bde_dba;

COMMENT ON SCHEMA lds IS 'Schema for LDS simplified Landonline layers';

--------------------------------------------------------------------------------
-- LDS table geodetic_marks
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.geodetic_marks (
    id INTEGER PRIMARY KEY,
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
    ellipsoidal_height NUMERIC(22,12) NULL,
    shape geometry(point, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_geo_shape', 'lds',
                                          'geodetic_marks', 'shape');

ALTER TABLE lds.geodetic_marks OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table geodetic_network_marks
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.geodetic_network_marks (
    id SERIAL PRIMARY KEY,
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
    ellipsoidal_height NUMERIC(22,12) NULL,
    shape geometry(point, 4167),
    UNIQUE (nod_id, control_network)
);


PERFORM pg_temp.createGistIndexIfNotExists('shx_geo_net_shape', 'lds',
                                   'geodetic_network_marks', 'shape');

ALTER TABLE lds.geodetic_network_marks OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table geodetic_vertical_marks
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.geodetic_vertical_marks(
    id SERIAL PRIMARY KEY,
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
    coordinate_system VARCHAR(100) NOT NULL,
    shape geometry(point, 4167),
    UNIQUE (nod_id, coordinate_system)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_geo_vert_shape', 'lds',
                                          'geodetic_vertical_marks', 'shape');

ALTER TABLE lds.geodetic_vertical_marks OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table geodetic_antarctic_marks
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.geodetic_antarctic_marks (
    id INTEGER PRIMARY KEY,
    geodetic_code CHAR(4) NOT NULL,
    current_mark_name VARCHAR(100),
    description VARCHAR(2048),
    mark_type VARCHAR(2048),
    beacon_type VARCHAR(2048),
    mark_condition VARCHAR(2048),
    "order" INTEGER NOT NULL,
    latitude NUMERIC(22,12) NOT NULL,
    longitude NUMERIC(22,12) NOT NULL,
    ellipsoidal_height NUMERIC(22,12) NULL,
    shape geometry(point, 4764)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_geo_ant_shape', 'lds', 'geodetic_antarctic_marks', 'shape');

ALTER TABLE lds.geodetic_antarctic_marks OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table geodetic_antarctic_vertical_marks
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.geodetic_antarctic_vertical_marks(
    id SERIAL PRIMARY KEY,
    nod_id INTEGER NOT NULL,
    geodetic_code CHAR(4) NOT NULL,
    current_mark_name VARCHAR(100),
    description VARCHAR(2048),
    mark_type VARCHAR(2048),
    beacon_type VARCHAR(2048),
    mark_condition VARCHAR(2048),
    "order" CHAR(2) NOT NULL,
    normal_orthometric_height NUMERIC(22, 12),
    coordinate_system VARCHAR(100) NOT NULL,
    shape geometry(point, 4764),
    UNIQUE (nod_id, coordinate_system)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_geo_ant_vert_shape', 'lds', 'geodetic_antarctic_vertical_marks', 'shape');

ALTER TABLE lds.geodetic_antarctic_vertical_marks OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table survey_protected_marks
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.survey_protected_marks (
    id INTEGER PRIMARY KEY,
    geodetic_code CHAR(4),
    current_mark_name VARCHAR(100),
    description VARCHAR(2048),
    mark_type VARCHAR(2048),
    mark_condition VARCHAR(2048),
    "order" INTEGER NOT NULL,
    last_survey VARCHAR(50),
    last_survey_date DATE,
    shape geometry(point, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_spm_shape', 'lds', 'survey_protected_marks', 'shape');

ALTER TABLE lds.survey_protected_marks OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table all_parcels
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.all_parcels (
    id INTEGER PRIMARY KEY,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    status VARCHAR(25) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0),
    shape geometry(geometry, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_all_par_shape', 'lds', 'all_parcels', 'shape');

ALTER TABLE lds.all_parcels OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table all_linear_parcels
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.all_linear_parcels (
    id INTEGER PRIMARY KEY,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    status VARCHAR(25) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0),
    shape geometry(GEOMETRY, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_all_line_par_shape', 'lds', 'all_linear_parcels', 'shape');

ALTER TABLE lds.all_linear_parcels OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table primary_parcels
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.primary_parcels (
    id INTEGER PRIMARY KEY,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0) NOT NULL,
    shape geometry(GEOMETRY, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_all_prim_par_shape', 'lds', 'primary_parcels', 'shape');

ALTER TABLE lds.primary_parcels OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table land_parcels
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.land_parcels (
    id INTEGER PRIMARY KEY,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0) NOT NULL,
    shape geometry(GEOMETRY, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_lnd_par_shape', 'lds', 'land_parcels', 'shape');

ALTER TABLE lds.land_parcels OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table hydro_parcels
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.hydro_parcels (
    id INTEGER PRIMARY KEY,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0) NOT NULL,
    shape geometry(GEOMETRY, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_hyd_par_shape', 'lds', 'hydro_parcels', 'shape');

ALTER TABLE lds.hydro_parcels OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table road_parcels
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.road_parcels (
    id INTEGER PRIMARY KEY,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0) NOT NULL,
    shape geometry(GEOMETRY, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_road_par_shape', 'lds', 'road_parcels', 'shape');

ALTER TABLE lds.road_parcels OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table non_primary_parcels
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.non_primary_parcels (
    id INTEGER PRIMARY KEY,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0) NOT NULL,
    shape geometry(GEOMETRY, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_non_prim_par_shape', 'lds', 'non_primary_parcels', 'shape');

ALTER TABLE lds.non_primary_parcels OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table non_primary_linear_parcels
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.non_primary_linear_parcels (
    id INTEGER PRIMARY KEY,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0),
    shape geometry(GEOMETRY, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_non_pril_par_shape', 'lds', 'non_primary_linear_parcels', 'shape');

ALTER TABLE lds.non_primary_linear_parcels OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table strata_parcels
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.strata_parcels (
    id INTEGER PRIMARY KEY,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0) NOT NULL,
    shape geometry(GEOMETRY, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_str_par_shape', 'lds', 'strata_parcels', 'shape');

ALTER TABLE lds.strata_parcels OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table all_parcels_pend
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.all_parcels_pend (
    id INTEGER PRIMARY KEY,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    status VARCHAR(25) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0),
    shape geometry(GEOMETRY, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_all_par_pend_shape', 'lds', 'all_parcels_pend', 'shape');

ALTER TABLE lds.all_parcels_pend OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table titles
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.titles (
    id INTEGER PRIMARY KEY,
    title_no VARCHAR(20) NOT NULL,
    status VARCHAR(4) NOT NULL,
    type VARCHAR(100) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    issue_date TIMESTAMP NOT NULL,
    guarantee_status VARCHAR(100) NOT NULL,
    estate_description VARCHAR(4096),
    number_owners INT8 NOT NULL,
    spatial_extents_shared BOOLEAN,
    shape geometry(MULTIPOLYGON, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_title_shape', 'lds', 'titles', 'shape');

ALTER TABLE lds.titles OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table titles_plus
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.titles_plus (
    id INTEGER PRIMARY KEY,
    title_no VARCHAR(20) NOT NULL,
    status VARCHAR(4) NOT NULL,
    type VARCHAR(100) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    issue_date TIMESTAMP NOT NULL,
    guarantee_status VARCHAR(100) NOT NULL,
    estate_description VARCHAR(4096),
    owners TEXT,
    spatial_extents_shared BOOLEAN,
    shape geometry(MULTIPOLYGON, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_title_plus_shape', 'lds', 'titles_plus', 'shape');

ALTER TABLE lds.titles_plus OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table title_owners
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.title_owners (
    id SERIAL PRIMARY KEY,
    owner VARCHAR(250) NOT NULL,
    title_no VARCHAR(20) NOT NULL,
    title_status VARCHAR(4) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    part_ownership BOOLEAN NOT NULL,
    shape geometry(MULTIPOLYGON, 4167),
    UNIQUE (owner, title_no)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_owners_shape', 'lds', 'title_owners', 'shape');

ALTER TABLE lds.title_owners OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table road_centre_line
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.road_centre_line (
    id INTEGER PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
    locality VARCHAR(100),
    territorial_authority VARCHAR(255),
    name_utf8 VARCHAR(100),
    locality_utf8 VARCHAR(100),
    shape geometry(MULTILINESTRING, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_rcl_shape', 'lds', 'road_centre_line', 'shape');

ALTER TABLE lds.road_centre_line OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table road_centre_line_subsection
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.road_centre_line_subsection (
    id INTEGER PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
    other_names VARCHAR(255),
    locality VARCHAR(100),
    territorial_authority VARCHAR(255),
    parcel_derived BOOLEAN NOT NULL,
    name_utf8 VARCHAR(100),
    other_names_utf8 VARCHAR(255),
    locality_utf8 VARCHAR(100),
    shape geometry(LINESTRING, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_rcls_shape', 'lds', 'road_centre_line_subsection', 'shape');

ALTER TABLE lds.road_centre_line_subsection OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table railway_centre_line
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.railway_centre_line (
    id INTEGER PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
    name_utf8 VARCHAR(100),
    shape geometry(MULTILINESTRING, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_rlwy_cl_shape', 'lds', 'railway_centre_line', 'shape');

ALTER TABLE lds.railway_centre_line OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table street_address (Historic)
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.street_address (
    id INTEGER PRIMARY KEY,
    rna_id INTEGER NOT NULL,
    address VARCHAR(126) NOT NULL,
    house_number VARCHAR(25) NOT NULL,
    road_name VARCHAR(100) NOT NULL,
    locality VARCHAR(30),
    territorial_authority VARCHAR(255),
    shape geometry(POINT, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_sad_shape', 'lds', 'street_address', 'shape');

ALTER TABLE lds.street_address OWNER TO bde_dba;


--------------------------------------------------------------------------------
-- LDS table street_address2 (new version)
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.street_address2 (
    id integer PRIMARY KEY,
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
    locality_utf8 VARCHAR(100),
    shape geometry(POINT, 4167)
);

ALTER TABLE lds.street_address2 OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table mesh_blocks
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.mesh_blocks (
    id INTEGER PRIMARY KEY,
    code VARCHAR(7) NOT NULL,
    shape geometry(GEOMETRY, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_mesh_blocks_shape', 'lds', 'mesh_blocks', 'shape');

ALTER TABLE lds.mesh_blocks OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table land_districts
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.land_districts (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    shape geometry(GEOMETRY, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_land_districts_shape', 'lds', 'land_districts', 'shape');

ALTER TABLE lds.land_districts OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table survey_plans
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.survey_plans (
    id INTEGER PRIMARY KEY,
    survey_reference VARCHAR(50) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    description VARCHAR(2048),
    status VARCHAR(2048) NOT NULL,
    survey_date DATE,
    purpose VARCHAR(2048) NOT NULL,
    type VARCHAR(100) NOT NULL,
    datum VARCHAR(10),
    shape geometry(MULTIPOINT, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_sur_shape', 'lds', 'survey_plans', 'shape');

ALTER TABLE lds.survey_plans OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table cadastral_adjustments
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.cadastral_adjustments (
    id INTEGER PRIMARY KEY,
    date_adjusted TIMESTAMP NOT NULL,
    survey_reference VARCHAR(50),
    adjusted_nodes INTEGER NOT NULL,
    shape geometry(GEOMETRY, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_cad_adj_shape', 'lds', 'cadastral_adjustments', 'shape');

ALTER TABLE lds.cadastral_adjustments OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table spi_adjustments
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.spi_adjustments (
    id INTEGER PRIMARY KEY,
    date_adjusted TIMESTAMP NOT NULL,
    survey_reference VARCHAR(50),
    adjusted_nodes INTEGER NOT NULL,
    shape geometry(GEOMETRY, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_spi_adj_shape', 'lds', 'spi_adjustments', 'shape');

ALTER TABLE lds.spi_adjustments OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table waca_adjustments
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.waca_adjustments (
    id INTEGER PRIMARY KEY,
    date_adjusted TIMESTAMP NOT NULL,
    survey_reference VARCHAR(50),
    adjusted_nodes INTEGER NOT NULL,
    shape geometry(GEOMETRY, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_waca_adj_shape', 'lds', 'waca_adjustments', 'shape');

ALTER TABLE lds.waca_adjustments OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table survey_observations
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.survey_observations (
    id integer PRIMARY KEY,
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
    survey_reference VARCHAR(50),
    shape geometry(LINESTRING, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_sur_obs_shape', 'lds', 'survey_observations', 'shape');

ALTER TABLE lds.survey_observations OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table survey_arc_observations
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.survey_arc_observations (
    id INTEGER PRIMARY KEY,
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
    arc_radius_label VARCHAR(10),
    shape geometry(LINESTRING, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_sur_arc_obs_shape', 'lds', 'survey_arc_observations', 'shape');

ALTER TABLE lds.survey_arc_observations OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table parcel_vectors
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.parcel_vectors (
    id INTEGER PRIMARY KEY,
    type VARCHAR(6) NOT NULL,
    bearing NUMERIC(22,12),
    distance NUMERIC(22,12),
    bearing_label VARCHAR(10),
    distance_label VARCHAR(10),
    shape geometry(LINESTRING, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_par_vct_shape', 'lds', 'parcel_vectors', 'shape');

ALTER TABLE lds.parcel_vectors OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table survey_network_marks
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.survey_network_marks (
    id INTEGER PRIMARY KEY,
    geodetic_code CHAR(4),
    current_mark_name VARCHAR(100),
    description VARCHAR(2048),
    mark_type VARCHAR(2048),
    mark_condition VARCHAR(2048),
    "order" INTEGER NOT NULL,
    nominal_accuracy NUMERIC(4,2),
    last_survey VARCHAR(50),
    shape geometry(POINT, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_csnm_shape', 'lds', 'survey_network_marks', 'shape');

ALTER TABLE lds.survey_network_marks OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table survey_bdy_marks
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.survey_bdy_marks (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    "order" INTEGER NOT NULL,
    nominal_accuracy NUMERIC(4,2),
    date_last_adjusted TIMESTAMP,
    shape geometry(POINT, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_cad_bdy_mrk_shape', 'lds', 'survey_bdy_marks', 'shape');

ALTER TABLE lds.survey_bdy_marks OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table survey_non_bdy_marks
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.survey_non_bdy_marks (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    "order" INTEGER NOT NULL,
    nominal_accuracy NUMERIC(4,2),
    date_last_adjusted TIMESTAMP,
    shape geometry(POINT, 4167)
);

PERFORM pg_temp.createGistIndexIfNotExists('shx_cad_nbdy_mrk_shape', 'lds', 'survey_non_bdy_marks', 'shape');

ALTER TABLE lds.survey_non_bdy_marks OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table parcel_stat_actions
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.parcel_stat_actions (
    id INTEGER PRIMARY KEY,
    par_id INTEGER NOT NULL,
    status VARCHAR(10) NOT NULL,
    action VARCHAR(20) NOT NULL,
    statutory_action VARCHAR(1024)
);


ALTER TABLE lds.parcel_stat_actions OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table affected_parcel_surveys
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.affected_parcel_surveys (
    id INTEGER PRIMARY KEY,
    par_id INTEGER NOT NULL,
    sur_wrk_id INTEGER NOT NULL,
    action VARCHAR(12)
);


ALTER TABLE lds.affected_parcel_surveys OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table title_parcel_associations
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.title_parcel_associations (
    id INTEGER PRIMARY KEY,
    title_no VARCHAR(20) NOT NULL,
    par_id INTEGER NOT NULL,
    source VARCHAR(8) NOT NULL
);


ALTER TABLE lds.title_parcel_associations OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table title_estates
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.title_estates (
    id INTEGER PRIMARY KEY,
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


ALTER TABLE lds.title_estates OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table titles_aspatial
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.titles_aspatial (
    id INTEGER PRIMARY KEY,
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


ALTER TABLE lds.titles_aspatial OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table title_owners_aspatial
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.title_owners_aspatial (
    id INTEGER PRIMARY KEY,
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


ALTER TABLE lds.title_owners_aspatial OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table title_memorials
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.title_memorials
(
    id integer PRIMARY KEY,
    title_no VARCHAR(20) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    memorial_text VARCHAR(18000),
    "current" BOOLEAN NOT NULL,
    instrument_number VARCHAR(30),
    instrument_lodged_datetime TIMESTAMP,
    instrument_type VARCHAR(100),
    encumbrancees VARCHAR(4096)
);


ALTER TABLE lds.title_memorials OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- LDS table title_memorial_additional_text
--------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS lds.title_memorial_additional_text
(
    id integer PRIMARY KEY,
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


ALTER TABLE lds.title_memorial_additional_text OWNER TO bde_dba;

--------------------------------------------------------------------------------
-- Fix up permissions on schema
--------------------------------------------------------------------------------

GRANT ALL ON SCHEMA lds TO bde_dba;
GRANT USAGE ON SCHEMA lds TO bde_admin;
GRANT USAGE ON SCHEMA lds TO bde_user;

REVOKE ALL
    ON ALL TABLES IN SCHEMA lds
    FROM public;

GRANT ALL
    ON ALL TABLES IN SCHEMA lds
    TO bde_dba;

GRANT SELECT, UPDATE, INSERT, DELETE
    ON ALL TABLES IN SCHEMA lds
    TO bde_admin;

GRANT SELECT
    ON ALL TABLES IN SCHEMA lds
    TO bde_user;

--------------------------------------------------------------------------------
-- Cleanup
--------------------------------------------------------------------------------

DROP FUNCTION pg_temp.createGistIndexIfNotExists(name, name, name, name);

END;
$SCHEMA$;
