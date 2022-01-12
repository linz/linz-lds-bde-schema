-- WARNING: always update this file whenever test/base.pg is updated

-- Test revision tables existance and their composition {

-- Test table_version schema {

SELECT has_schema('table_version'::name);
-- table_version schema owner is currently not enforced
--SELECT schema_owner_is('table_version'::name, 'bde_dba'::name);
SELECT schema_privs_are('table_version'::name, 'bde_admin'::name, ARRAY['USAGE']);
SELECT schema_privs_are('table_version'::name, 'bde_user'::name, ARRAY['USAGE']);


-- { -- lds schema

SELECT has_table('table_version'::name, 'lds_affected_parcel_surveys_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_affected_parcel_surveys_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_affected_parcel_surveys_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_affected_parcel_surveys_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_affected_parcel_surveys_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'id',
  'par_id',
  'sur_wrk_id',
  'action'
  ]);

SELECT has_table('table_version'::name, 'lds_affected_parcel_surveys_pend_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_affected_parcel_surveys_pend_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_affected_parcel_surveys_pend_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_affected_parcel_surveys_pend_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_affected_parcel_surveys_pend_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'id',
  'par_id',
  'sur_wrk_id',
  'action'
  ]);

SELECT has_table('table_version'::name, 'lds_all_linear_parcels_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_all_linear_parcels_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_all_linear_parcels_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_all_linear_parcels_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_all_linear_parcels_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'calc_area',
  'survey_area',
  'titles',
  'statutory_actions',
  'land_district',
  'status',
  'topology_type',
  'parcel_intent',
  'affected_surveys',
  'appellation',
  'id',
  'shape'
  ]);

SELECT has_table('table_version'::name, 'lds_all_parcels_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_all_parcels_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_all_parcels_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_all_parcels_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_all_parcels_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'land_district',
  'status',
  'topology_type',
  'parcel_intent',
  'id',
  'appellation',
  'affected_surveys',
  'shape',
  'calc_area',
  'survey_area',
  'titles',
  'statutory_actions'
  ]);

SELECT has_table('table_version'::name, 'lds_all_parcels_pend_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_all_parcels_pend_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_all_parcels_pend_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_all_parcels_pend_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_all_parcels_pend_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'land_district',
  'survey_area',
  'calc_area',
  'shape',
  'parcel_intent',
  'topology_type',
  'status',
  'statutory_actions',
  'titles',
  'appellation',
  'affected_surveys',
  'id'
  ]);

SELECT has_table('table_version'::name, 'lds_cadastral_adjustments_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_cadastral_adjustments_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_cadastral_adjustments_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_cadastral_adjustments_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_cadastral_adjustments_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'survey_reference',
  'adjusted_nodes',
  'shape',
  'date_adjusted',
  'id'
  ]);

SELECT has_table('table_version'::name, 'lds_geodetic_antarctic_marks_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_geodetic_antarctic_marks_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_geodetic_antarctic_marks_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_geodetic_antarctic_marks_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_geodetic_antarctic_marks_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'current_mark_name',
  'id',
  'geodetic_code',
  'description',
  'mark_type',
  'beacon_type',
  'mark_condition',
  'order',
  'latitude',
  'longitude',
  'ellipsoidal_height',
  'shape'
  ]);

SELECT has_table('lds'::name,
'geodetic_antarctic_vertical_marks'::name);
SELECT columns_are('table_version'::name, 'lds_geodetic_antarctic_vertical_marks_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'order',
  'normal_orthometric_height',
  'coordinate_system',
  'shape',
  'mark_condition',
  'beacon_type',
  'mark_type',
  'description',
  'current_mark_name',
  'geodetic_code',
  'nod_id',
  'id'
  ]);

SELECT has_table('table_version'::name, 'lds_geodetic_marks_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_geodetic_marks_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_geodetic_marks_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_geodetic_marks_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_geodetic_marks_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'geodetic_code',
  'shape',
  'id',
  'ellipsoidal_height',
  'longitude',
  'latitude',
  'land_district',
  'order',
  'mark_condition',
  'beacon_type',
  'mark_type',
  'description',
  'current_mark_name'
  ]);

SELECT has_table('table_version'::name, 'lds_geodetic_network_marks_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_geodetic_network_marks_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_geodetic_network_marks_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_geodetic_network_marks_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_geodetic_network_marks_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'shape',
  'ellipsoidal_height',
  'longitude',
  'latitude',
  'land_district',
  'order',
  'mark_condition',
  'beacon_type',
  'mark_type',
  'description',
  'current_mark_name',
  'control_network',
  'geodetic_code',
  'nod_id',
  'id'
  ]);

SELECT has_table('table_version'::name, 'lds_geodetic_vertical_marks_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_geodetic_vertical_marks_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_geodetic_vertical_marks_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_geodetic_vertical_marks_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_geodetic_vertical_marks_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'shape',
  'coordinate_system',
  'normal_orthometric_height',
  'land_district',
  'order',
  'mark_condition',
  'beacon_type',
  'mark_type',
  'description',
  'current_mark_name',
  'geodetic_code',
  'nod_id',
  'id'
  ]);

SELECT has_table('table_version'::name, 'lds_hydro_parcels_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_hydro_parcels_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_hydro_parcels_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_hydro_parcels_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_hydro_parcels_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'titles',
  'id',
  'appellation',
  'affected_surveys',
  'parcel_intent',
  'topology_type',
  'statutory_actions',
  'land_district',
  'survey_area',
  'calc_area',
  'shape'
  ]);

SELECT has_table('table_version'::name, 'lds_land_districts_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_land_districts_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_land_districts_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_land_districts_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_land_districts_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'id',
  'shape',
  'name'
  ]);

SELECT has_table('table_version'::name, 'lds_land_parcels_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_land_parcels_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_land_parcels_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_land_parcels_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_land_parcels_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'topology_type',
  'calc_area',
  'survey_area',
  'titles',
  'id',
  'appellation',
  'affected_surveys',
  'parcel_intent',
  'land_district',
  'statutory_actions',
  'shape'
  ]);

SELECT has_table('table_version'::name, 'lds_mesh_blocks_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_mesh_blocks_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_mesh_blocks_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_mesh_blocks_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_mesh_blocks_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'shape',
  'code',
  'id'
  ]);

SELECT has_table('table_version'::name, 'lds_non_primary_linear_parcels_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_non_primary_linear_parcels_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_non_primary_linear_parcels_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_non_primary_linear_parcels_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_non_primary_linear_parcels_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'shape',
  'id',
  'appellation',
  'affected_surveys',
  'parcel_intent',
  'topology_type',
  'statutory_actions',
  'land_district',
  'titles',
  'survey_area',
  'calc_area'
  ]);

SELECT has_table('table_version'::name, 'lds_non_primary_parcels_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_non_primary_parcels_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_non_primary_parcels_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_non_primary_parcels_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_non_primary_parcels_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'shape',
  'id',
  'appellation',
  'affected_surveys',
  'parcel_intent',
  'topology_type',
  'statutory_actions',
  'land_district',
  'titles',
  'survey_area',
  'calc_area'
  ]);

SELECT has_table('table_version'::name, 'lds_parcel_stat_actions_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_parcel_stat_actions_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_parcel_stat_actions_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_parcel_stat_actions_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_parcel_stat_actions_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'statutory_action',
  'status',
  'par_id',
  'id',
  'action'
  ]);

SELECT has_table('table_version'::name, 'lds_parcel_vectors_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_parcel_vectors_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_parcel_vectors_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_parcel_vectors_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_parcel_vectors_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'shape',
  'id',
  'type',
  'bearing',
  'distance',
  'bearing_label',
  'distance_label'
  ]);

SELECT has_table('table_version'::name, 'lds_primary_parcels_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_primary_parcels_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_primary_parcels_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_primary_parcels_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_primary_parcels_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'survey_area',
  'shape',
  'calc_area',
  'parcel_intent',
  'titles',
  'land_district',
  'statutory_actions',
  'topology_type',
  'affected_surveys',
  'appellation',
  'id'
  ]);

SELECT has_table('table_version'::name, 'lds_railway_centre_line_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_railway_centre_line_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_railway_centre_line_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_railway_centre_line_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_railway_centre_line_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'shape',
  'name',
  'name_utf8',
  'id'
  ]);

SELECT has_table('table_version'::name, 'lds_road_centre_line_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_road_centre_line_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_road_centre_line_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_road_centre_line_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_road_centre_line_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'shape',
  'name',
  'locality_utf8',
  'name_utf8',
  'id',
  'locality',
  'territorial_authority'
  ]);

SELECT has_table('table_version'::name, 'lds_road_centre_line_subsection_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_road_centre_line_subsection_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_road_centre_line_subsection_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_road_centre_line_subsection_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_road_centre_line_subsection_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'shape',
  'other_names_utf8',
  'name_utf8',
  'parcel_derived',
  'territorial_authority',
  'locality',
  'other_names',
  'name',
  'id',
  'locality_utf8'
  ]);

SELECT has_table('table_version'::name, 'lds_road_parcels_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_road_parcels_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_road_parcels_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_road_parcels_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_road_parcels_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'calc_area',
  'id',
  'appellation',
  'affected_surveys',
  'parcel_intent',
  'topology_type',
  'statutory_actions',
  'land_district',
  'titles',
  'survey_area',
  'shape'
  ]);

SELECT has_table('table_version'::name, 'lds_spi_adjustments_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_spi_adjustments_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_spi_adjustments_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_spi_adjustments_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_spi_adjustments_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'shape',
  'id',
  'date_adjusted',
  'survey_reference',
  'adjusted_nodes'
  ]);

SELECT has_table('table_version'::name, 'lds_strata_parcels_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_strata_parcels_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_strata_parcels_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_strata_parcels_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_strata_parcels_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'titles',
  'land_district',
  'statutory_actions',
  'topology_type',
  'parcel_intent',
  'appellation',
  'affected_surveys',
  'id',
  'shape',
  'calc_area',
  'survey_area'
  ]);

SELECT has_table('table_version'::name, 'lds_street_address_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_street_address_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_street_address_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_street_address_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_street_address_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'road_name',
  'territorial_authority',
  'shape',
  'id',
  'rna_id',
  'address',
  'house_number',
  'locality'
  ]);

SELECT has_table('table_version'::name, 'lds_street_address2_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_street_address2_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_street_address2_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_street_address2_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_street_address2_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'house_number',
  'shape',
  'range_low',
  'id',
  'road_name_utf8',
  'territorial_authority',
  'locality',
  'address_utf8',
  'road_name',
  'range_high',
  'rna_id',
  'rcl_id',
  'address',
  'locality_utf8'
  ]);

SELECT has_table('table_version'::name, 'lds_survey_arc_observations_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_survey_arc_observations_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_survey_arc_observations_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_survey_arc_observations_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_survey_arc_observations_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'survey_reference',
  'id',
  'nod_id_start',
  'mark_name_start',
  'nod_id_end',
  'mark_name_end',
  'chord_bearing',
  'arc_length',
  'arc_radius',
  'arc_direction',
  'chord_bearing_accuracy',
  'arc_length_accuracy',
  'surveyed_type',
  'coordinate_system',
  'land_district',
  'ref_datetime',
  'chord_bearing_label',
  'arc_length_label',
  'arc_radius_label',
  'shape'
  ]);

SELECT has_table('table_version'::name, 'lds_survey_bdy_marks_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_survey_bdy_marks_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_survey_bdy_marks_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_survey_bdy_marks_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_survey_bdy_marks_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'shape',
  'id',
  'name',
  'order',
  'nominal_accuracy',
  'date_last_adjusted'
  ]);

SELECT has_table('table_version'::name, 'lds_survey_network_marks_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_survey_network_marks_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_survey_network_marks_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_survey_network_marks_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_survey_network_marks_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'id',
  'shape',
  'last_survey',
  'nominal_accuracy',
  'order',
  'mark_condition',
  'mark_type',
  'description',
  'current_mark_name',
  'geodetic_code'
  ]);

SELECT has_table('table_version'::name, 'lds_survey_non_bdy_marks_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_survey_non_bdy_marks_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_survey_non_bdy_marks_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_survey_non_bdy_marks_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_survey_non_bdy_marks_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'nominal_accuracy',
  'date_last_adjusted',
  'shape',
  'id',
  'name',
  'order'
  ]);

SELECT has_table('table_version'::name, 'lds_survey_observations_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_survey_observations_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_survey_observations_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_survey_observations_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_survey_observations_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'value',
  'value_accuracy',
  'value_label',
  'surveyed_type',
  'coordinate_system',
  'land_district',
  'ref_datetime',
  'survey_reference',
  'id',
  'shape',
  'nod_id_start',
  'mark_name_start',
  'nod_id_end',
  'mark_name_end',
  'obs_type'
  ]);

SELECT has_table('table_version'::name, 'lds_survey_plans_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_survey_plans_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_survey_plans_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_survey_plans_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_survey_plans_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'authorised_date',
  'id',
  'survey_reference',
  'land_district',
  'description',
  'status',
  'survey_date',
  'purpose',
  'type',
  'datum',
  'shape',
  'lodged_date'
  ]);

SELECT has_table('table_version'::name, 'lds_survey_protected_marks_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_survey_protected_marks_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_survey_protected_marks_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_survey_protected_marks_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_survey_protected_marks_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'mark_condition',
  'order',
  'description',
  'last_survey',
  'last_survey_date',
  'shape',
  'id',
  'current_mark_name',
  'geodetic_code',
  'mark_type'
  ]);

SELECT has_table('table_version'::name, 'lds_title_estates_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_title_estates_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_title_estates_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_title_estates_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_title_estates_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'id',
  'status',
  'area',
  'legal_description',
  'term',
  'timeshare_week_no',
  'purpose',
  'share',
  'type',
  'title_no',
  'land_district'
  ]);

SELECT has_table('table_version'::name, 'lds_title_memorial_additional_text_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_title_memorial_additional_text_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_title_memorial_additional_text_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_title_memorial_additional_text_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_title_memorial_additional_text_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'new_title_reference',
  'title_issued',
  'assessory_unit',
  'future_development_unit',
  'principal_unit',
  'statutory_restriction',
  'easement_type',
  'new_title_legal_description',
  'ttm_id',
  'id',
  'dominant_tenement_or_grantee',
  'easement_area',
  'servient_tenement'
  ]);

SELECT has_table('table_version'::name, 'lds_title_memorials_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_title_memorials_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_title_memorials_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_title_memorials_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_title_memorials_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'id',
  'title_no',
  'land_district',
  'memorial_text',
  'current',
  'instrument_number',
  'instrument_lodged_datetime',
  'instrument_type',
  'encumbrancees'
  ]);

SELECT has_table('table_version'::name, 'lds_title_owners_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_title_owners_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_title_owners_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_title_owners_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_title_owners_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'owner',
  'shape',
  'part_ownership',
  'land_district',
  'title_status',
  'title_no',
  'id'
  ]);

SELECT has_table('table_version'::name, 'lds_title_owners_aspatial_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_title_owners_aspatial_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_title_owners_aspatial_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_title_owners_aspatial_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_title_owners_aspatial_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'tte_id',
  'status',
  'land_district',
  'title_no',
  'id',
  'name_suffix',
  'corporate_name',
  'prime_other_names',
  'prime_surname',
  'owner_type',
  'estate_share'
  ]);

SELECT has_table('table_version'::name, 'lds_title_parcel_associations_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_title_parcel_associations_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_title_parcel_associations_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_title_parcel_associations_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_title_parcel_associations_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'id',
  'title_no',
  'par_id',
  'source'
  ]);

SELECT has_table('table_version'::name, 'lds_titles_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_titles_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_titles_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_titles_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_titles_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'title_no',
  'issue_date',
  'guarantee_status',
  'estate_description',
  'shape',
  'number_owners',
  'spatial_extents_shared',
  'type',
  'land_district',
  'id',
  'status'
  ]);

SELECT has_table('table_version'::name, 'lds_titles_aspatial_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_titles_aspatial_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_titles_aspatial_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_titles_aspatial_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_titles_aspatial_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'register_type',
  'status',
  'title_no',
  'id',
  'survey_reference',
  'maori_land',
  'number_owners',
  'title_no_head_srs',
  'title_no_srs',
  'provisional',
  'guarantee_status',
  'issue_date',
  'land_district',
  'type'
  ]);

SELECT has_table('table_version'::name, 'lds_titles_plus_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_titles_plus_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_titles_plus_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_titles_plus_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_titles_plus_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'owners',
  'guarantee_status',
  'type',
  'status',
  'title_no',
  'id',
  'spatial_extents_shared',
  'estate_description',
  'shape',
  'issue_date',
  'land_district'
  ]);

SELECT has_table('table_version'::name, 'lds_waca_adjustments_revision'::name);
SELECT table_owner_is('table_version'::name, 'lds_waca_adjustments_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'lds_waca_adjustments_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'lds_waca_adjustments_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'lds_waca_adjustments_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
  'date_adjusted',
  'adjusted_nodes',
  'shape',
  'survey_reference',
  'id'
  ]);

-- } -- lds schema

-- Test bde_ext schema {

SELECT has_table('table_version'::name, 'bde_ext_adjustment_run_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_adjustment_run_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_adjustment_run_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_adjustment_run_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_adjustment_run_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'adm_id',
    'cos_id',
    'status',
    'usr_id_exec',
    'adjust_datetime',
    'description',
    'sum_sqrd_residuals',
    'redundancy',
    'wrk_id',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_alias_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_alias_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_alias_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_alias_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_alias_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'prp_id',
    'surname',
    'other_names'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_coordinate_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_coordinate_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_coordinate_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_coordinate_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_coordinate_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'cos_id',
    'nod_id',
    'ort_type_1',
    'ort_type_2',
    'ort_type_3',
    'status',
    'sdc_status',
    'source',
    'value1',
    'value2',
    'value3',
    'wrk_id_created',
    'cor_id',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_enc_share_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_enc_share_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_enc_share_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_enc_share_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_enc_share_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'enc_id',
    'status',
    'act_tin_id_crt',
    'act_id_crt',
    'act_id_ext',
    'act_tin_id_ext',
    'system_crt',
    'system_ext'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_encumbrance_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_encumbrance_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_encumbrance_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_encumbrance_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_encumbrance_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'status',
    'act_tin_id_orig',
    'act_tin_id_crt',
    'act_id_crt',
    'act_id_orig',
    'term'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_encumbrancee_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_encumbrancee_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_encumbrancee_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_encumbrancee_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_encumbrancee_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'ens_id',
    'status',
    'name'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_estate_share_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_estate_share_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_estate_share_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_estate_share_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_estate_share_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'ett_id',
    'share',
    'status',
    'share_memorial',
    'act_tin_id_crt',
    'act_id_crt',
    'executorship',
    'original_flag',
    'system_crt'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_feature_name_poly_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_feature_name_poly_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_feature_name_poly_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_feature_name_poly_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_feature_name_poly_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'type',
    'name',
    'status',
    'other_details',
    'audit_id',
    'se_row_id',
    'shape'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_feature_name_pt_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_feature_name_pt_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_feature_name_pt_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_feature_name_pt_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_feature_name_pt_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'type',
    'name',
    'status',
    'other_details',
    'audit_id',
    'se_row_id',
    'shape'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_legal_desc_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_legal_desc_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_legal_desc_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_legal_desc_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_legal_desc_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'type',
    'status',
    'total_area',
    'ttl_title_no',
    'legal_desc_text',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_line_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_line_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_line_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_line_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_line_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'boundary',
    'type',
    'description',
    'nod_id_end',
    'nod_id_start',
    'arc_radius',
    'arc_direction',
    'arc_length',
    'pnx_id_created',
    'dcdb_feature',
    'id',
    'audit_id',
    'se_row_id',
    'shape'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_maintenance_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_maintenance_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_maintenance_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_maintenance_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_maintenance_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'mrk_id',
    'type',
    'status',
    'desc',
    'complete_date',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_mark_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_mark_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_mark_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_mark_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_mark_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'nod_id',
    'status',
    'type',
    'desc',
    'category',
    'country',
    'beacon_type',
    'protection_type',
    'maintenance_level',
    'mrk_id_dist',
    'disturbed',
    'disturbed_date',
    'mrk_id_repl',
    'wrk_id_created',
    'replaced',
    'replaced_date',
    'mark_annotation',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_mark_name_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_mark_name_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_mark_name_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_mark_name_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_mark_name_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'mrk_id',
    'type',
    'name',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_mark_phys_state_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_mark_phys_state_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_mark_phys_state_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_mark_phys_state_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_mark_phys_state_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'mrk_id',
    'wrk_id',
    'type',
    'condition',
    'existing_mark',
    'status',
    'ref_datetime',
    'pend_mark_status',
    'pend_replaced',
    'pend_disturbed',
    'mrk_id_pend_rep',
    'mrk_id_pend_dist',
    'pend_dist_date',
    'pend_repl_date',
    'pend_mark_name',
    'pend_mark_type',
    'pend_mark_ann',
    'description',
    'latest_condition',
    'latest_cond_date',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_node_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_node_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_node_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_node_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_node_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'cos_id_official',
    'type',
    'status',
    'order_group_off',
    'sit_id',
    'alt_id',
    'wrk_id_created',
    'audit_id',
    'se_row_id',
    'shape'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_node_prp_order_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_node_prp_order_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_node_prp_order_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_node_prp_order_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_node_prp_order_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'dtm_id',
    'nod_id',
    'cor_id',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_nominal_index_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_nominal_index_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_nominal_index_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_nominal_index_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_nominal_index_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'ttl_title_no',
    'status',
    'name_type',
    'corporate_name',
    'surname',
    'other_names',
    'prp_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_office_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_office_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_office_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_office_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_office_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'code',
    'name',
    'rcs_name',
    'cis_name',
    'alloc_source_table',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_parcel_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_parcel_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_parcel_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_parcel_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_parcel_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'ldt_loc_id',
    'img_id',
    'fen_id',
    'toc_code',
    'alt_id',
    'area',
    'nonsurvey_def',
    'appellation_date',
    'parcel_intent',
    'status',
    'total_area',
    'calculated_area',
    'audit_id',
    'se_row_id',
    'shape'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_parcel_dimen_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_parcel_dimen_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_parcel_dimen_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_parcel_dimen_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_parcel_dimen_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'obn_id',
    'par_id',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_parcel_label_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_parcel_label_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_parcel_label_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_parcel_label_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_parcel_label_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'par_id',
    'se_row_id',
    'audit_id',
    'shape'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_parcel_ls_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_parcel_ls_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_parcel_ls_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_parcel_ls_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_parcel_ls_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'ldt_loc_id',
    'img_id',
    'fen_id',
    'toc_code',
    'alt_id',
    'area',
    'nonsurvey_def',
    'appellation_date',
    'parcel_intent',
    'status',
    'total_area',
    'calculated_area',
    'audit_id',
    'se_row_id',
    'shape'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_parcel_ring_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_parcel_ring_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_parcel_ring_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_parcel_ring_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_parcel_ring_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'par_id',
    'pri_id_parent_ring',
    'is_ring',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_proprietor_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_proprietor_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_proprietor_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_proprietor_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_proprietor_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'ets_id',
    'status',
    'type',
    'corporate_name',
    'prime_surname',
    'prime_other_names',
    'name_suffix',
    'original_flag'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_stat_version_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_stat_version_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_stat_version_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_stat_version_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_stat_version_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'version',
    'area_class',
    'desc',
    'statute_action',
    'start_date',
    'end_date',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_statist_area_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_statist_area_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_statist_area_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_statist_area_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_statist_area_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'name',
    'name_abrev',
    'code',
    'status',
    'sav_version',
    'sav_area_class',
    'alt_id',
    'se_row_id',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_street_address_ext_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_street_address_ext_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_street_address_ext_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_street_address_ext_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_street_address_ext_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'house_number',
    'range_low',
    'range_high',
    'status',
    'unofficial_flag',
    'rcl_id',
    'rna_id',
    'alt_id',
    'id',
    'sufi',
    'audit_id',
    'se_row_id',
    'shape'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_survey_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_survey_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_survey_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_survey_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_survey_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'wrk_id',
    'ldt_loc_id',
    'dataset_series',
    'dataset_id',
    'type_of_dataset',
    'data_source',
    'lodge_order',
    'dataset_suffix',
    'surveyor_data_ref',
    'survey_class',
    'description',
    'usr_id_sol',
    'survey_date',
    'certified_date',
    'registered_date',
    'chf_sur_amnd_date',
    'dlr_amnd_date',
    'cadastral_surv_acc',
    'prior_wrk_id',
    'abey_prior_status',
    'fhr_id',
    'pnx_id_submitted',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_survey_plan_image_revision_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_survey_plan_image_revision_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_survey_plan_image_revision_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_survey_plan_image_revision_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_survey_plan_image_revision_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'sur_wrk_id',
    'survey_reference',
    'land_district',
    'plan_type',
    'pages',
    'last_updated'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_title_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_title_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_title_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_title_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_title_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'title_no',
    'ldt_loc_id',
    'register_type',
    'ste_id',
    'issue_date',
    'guarantee_status',
    'status',
    'type',
    'provisional',
    'sur_wrk_id',
    'ttl_title_no_srs',
    'ttl_title_no_head_srs',
    'maori_land',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_title_action_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_title_action_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_title_action_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_title_action_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_title_action_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'ttl_title_no',
    'act_tin_id',
    'act_id',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_title_doc_ref_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_title_doc_ref_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_title_doc_ref_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_title_doc_ref_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_title_doc_ref_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'type',
    'tin_id',
    'reference_no'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_title_estate_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_title_estate_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_title_estate_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_title_estate_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_title_estate_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'ttl_title_no',
    'type',
    'status',
    'lgd_id',
    'share',
    'timeshare_week_no',
    'purpose',
    'act_tin_id_crt',
    'act_id_crt',
    'original_flag',
    'term',
    'tin_id_orig'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_title_mem_text_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_title_mem_text_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_title_mem_text_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_title_mem_text_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_title_mem_text_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'ttm_id',
    'sequence_no',
    'curr_hist_flag',
    'std_text',
    'col_1_text',
    'col_2_text',
    'col_3_text',
    'col_4_text',
    'col_5_text',
    'col_6_text',
    'col_7_text',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_title_memorial_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_title_memorial_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_title_memorial_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_title_memorial_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_title_memorial_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'ttl_title_no',
    'mmt_code',
    'act_id_orig',
    'act_tin_id_orig',
    'act_id_crt',
    'act_tin_id_crt',
    'status',
    'user_changed',
    'text_type',
    'register_only_mem',
    'prev_further_reg',
    'curr_hist_flag',
    'default',
    'number_of_cols',
    'col_1_size',
    'col_2_size',
    'col_3_size',
    'col_4_size',
    'col_5_size',
    'col_6_size',
    'col_7_size',
    'act_id_ext',
    'act_tin_id_ext'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_title_parcel_association_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_title_parcel_association_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_title_parcel_association_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_title_parcel_association_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_title_parcel_association_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'ttl_title_no',
    'par_id',
    'source'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_transact_type_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_transact_type_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_transact_type_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_transact_type_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_transact_type_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'grp',
    'type',
    'description',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_ttl_enc_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_ttl_enc_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_ttl_enc_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_ttl_enc_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_ttl_enc_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'ttl_title_no',
    'enc_id',
    'status',
    'act_tin_id_crt',
    'act_id_crt'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_ttl_hierarchy_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_ttl_hierarchy_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_ttl_hierarchy_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_ttl_hierarchy_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_ttl_hierarchy_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'status',
    'ttl_title_no_prior',
    'ttl_title_no_flw',
    'tdr_id',
    'act_tin_id_crt',
    'act_id_crt'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_ttl_inst_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_ttl_inst_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_ttl_inst_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_ttl_inst_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_ttl_inst_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'inst_no',
    'trt_grp',
    'trt_type',
    'ldt_loc_id',
    'status',
    'lodged_datetime',
    'dlg_id',
    'priority_no',
    'tin_id_parent',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_ttl_inst_cmplte_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_ttl_inst_cmplte_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_ttl_inst_cmplte_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_ttl_inst_cmplte_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_ttl_inst_cmplte_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'dlg_id',
    'inst_no',
    'priority_no',
    'ldt_loc_id',
    'lodged_datetime',
    'status',
    'trt_grp',
    'trt_type',
    'audit_id',
    'tin_id_parent',
    'completion_date'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_ttl_inst_title_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_ttl_inst_title_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_ttl_inst_title_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_ttl_inst_title_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_ttl_inst_title_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'tin_id',
    'ttl_title_no',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_user_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_user_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_user_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_user_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_user_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'type',
    'status',
    'title',
    'given_names',
    'surname',
    'corporate_name',
    'audit_id'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_vector_ls_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_vector_ls_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_vector_ls_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_vector_ls_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_vector_ls_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'type',
    'nod_id_start',
    'nod_id_end',
    'length',
    'source',
    'id',
    'audit_id',
    'se_row_id',
    'shape'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_vector_pt_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_vector_pt_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_vector_pt_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_vector_pt_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_vector_pt_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'type',
    'nod_id_start',
    'nod_id_end',
    'length',
    'source',
    'id',
    'audit_id',
    'se_row_id',
    'shape'
  ]);

SELECT has_table('table_version'::name, 'bde_ext_work_revision'::name);
SELECT table_owner_is('table_version'::name, 'bde_ext_work_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('table_version'::name, 'bde_ext_work_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_ext_work_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('table_version'::name, 'bde_ext_work_revision'::name,
  ARRAY[
    '_revision_created',
    '_revision_expired',
    'id',
    'trt_grp',
    'trt_type',
    'status',
    'con_id',
    'pro_id',
    'usr_id_firm',
    'usr_id_principal',
    'cel_id',
    'project_name',
    'invoice',
    'external_work_id',
    'view_txn',
    'restricted',
    'lodged_date',
    'authorised_date',
    'usr_id_authorised',
    'validated_date',
    'usr_id_validated',
    'cos_id',
    'data_loaded',
    'run_auto_rules',
    'alt_id',
    'audit_id',
    'usr_id_prin_firm'
  ]);


-- } -- bde_ext schema

-- } -- tables existance and their composition
