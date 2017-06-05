\set ECHO none
--------------------------------------------------------------------------------
--
-- Copyright 2016 Crown copyright (c)
-- Land Information New Zealand and the New Zealand Government.
-- All rights reserved
--
-- This software is released under the terms of the new BSD license. See the 
-- LICENSE file for more information.
--
--------------------------------------------------------------------------------
-- Provide unit testing for LINZ LDS BDE SCHEMA using pgTAP
--------------------------------------------------------------------------------
\set QUIET true
\set VERBOSITY terse
\pset format unaligned
\pset tuples_only true

SET client_min_messages TO WARNING;

CREATE SCHEMA _patches;
CREATE EXTENSION dbpatch SCHEMA _patches;

\i /usr/share/linz-bde-schema/sql/01-bde_roles.sql
\i /usr/share/linz-bde-schema/sql/02-bde_schema.sql
\i /usr/share/linz-bde-schema/sql/03-bde_functions.sql
\i /usr/share/linz-bde-schema/sql/04-bde_schema_index.sql
\i /usr/share/linz-bde-schema/sql/05-bde_version.sql
\i /usr/share/linz-bde-schema/sql/99-patches.sql

\i sql/01-lds_layer_tables.sql
\i sql/02-lds_bde_schema_index.sql
\i sql/03-lds_version.sql
\i sql/04-lds_layer_functions.sql
\i sql/05-bde_ext_schema.sql
\i sql/06-bde_ext_functions.sql
\i sql/99-patches.sql

BEGIN;

CREATE EXTENSION pgtap;

SELECT * FROM no_plan();

SELECT has_schema('lds'::name);

-- Test tables existance and their composition {

SELECT has_table('lds'::name, 'affected_parcel_surveys'::name);
SELECT columns_are('lds'::name, 'affected_parcel_surveys'::name, 
  ARRAY[
  'id',
  'par_id',
  'sur_wrk_id',
  'action'
  ]);

SELECT has_table('lds'::name, 'affected_parcel_surveys_pend'::name);
SELECT columns_are('lds'::name, 'affected_parcel_surveys_pend'::name, 
  ARRAY[
  'id',
  'par_id',
  'sur_wrk_id',
  'action'
  ]);

SELECT has_table('lds'::name, 'all_linear_parcels'::name);
SELECT columns_are('lds'::name, 'all_linear_parcels'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'all_parcels'::name);
SELECT columns_are('lds'::name, 'all_parcels'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'all_parcels_pend'::name);
SELECT columns_are('lds'::name, 'all_parcels_pend'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'cadastral_adjustments'::name);
SELECT columns_are('lds'::name, 'cadastral_adjustments'::name, 
  ARRAY[
  'survey_reference',
  'adjusted_nodes',
  'shape',
  'date_adjusted',
  'id'
  ]);

SELECT has_table('lds'::name, 'geodetic_antarctic_marks'::name);
SELECT columns_are('lds'::name, 'geodetic_antarctic_marks'::name, 
  ARRAY[
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
SELECT columns_are('lds'::name, 'geodetic_antarctic_vertical_marks'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'geodetic_marks'::name);
SELECT columns_are('lds'::name, 'geodetic_marks'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'geodetic_network_marks'::name);
SELECT columns_are('lds'::name, 'geodetic_network_marks'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'geodetic_vertical_marks'::name);
SELECT columns_are('lds'::name, 'geodetic_vertical_marks'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'hydro_parcels'::name);
SELECT columns_are('lds'::name, 'hydro_parcels'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'land_districts'::name);
SELECT columns_are('lds'::name, 'land_districts'::name, 
  ARRAY[
  'id',
  'shape',
  'name'
  ]);

SELECT has_table('lds'::name, 'land_parcels'::name);
SELECT columns_are('lds'::name, 'land_parcels'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'mesh_blocks'::name);
SELECT columns_are('lds'::name, 'mesh_blocks'::name, 
  ARRAY[
  'shape',
  'code',
  'id'
  ]);

SELECT has_table('lds'::name, 'non_primary_linear_parcels'::name);
SELECT columns_are('lds'::name, 'non_primary_linear_parcels'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'non_primary_parcels'::name);
SELECT columns_are('lds'::name, 'non_primary_parcels'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'parcel_stat_actions'::name);
SELECT columns_are('lds'::name, 'parcel_stat_actions'::name, 
  ARRAY[
  'statutory_action',
  'status',
  'par_id',
  'id',
  'action'
  ]);

SELECT has_table('lds'::name, 'parcel_vectors'::name);
SELECT columns_are('lds'::name, 'parcel_vectors'::name, 
  ARRAY[
  'shape',
  'id',
  'type',
  'bearing',
  'distance',
  'bearing_label',
  'distance_label'
  ]);

SELECT has_table('lds'::name, 'primary_parcels'::name);
SELECT columns_are('lds'::name, 'primary_parcels'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'railway_centre_line'::name);
SELECT columns_are('lds'::name, 'railway_centre_line'::name, 
  ARRAY[
  'shape',
  'name',
  'name_utf8',
  'id'
  ]);

SELECT has_table('lds'::name, 'road_centre_line'::name);
SELECT columns_are('lds'::name, 'road_centre_line'::name, 
  ARRAY[
  'shape',
  'name',
  'locality_utf8',
  'name_utf8',
  'id',
  'locality',
  'territorial_authority'
  ]);

SELECT has_table('lds'::name, 'road_centre_line_subsection'::name);
SELECT columns_are('lds'::name, 'road_centre_line_subsection'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'road_parcels'::name);
SELECT columns_are('lds'::name, 'road_parcels'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'spi_adjustments'::name);
SELECT columns_are('lds'::name, 'spi_adjustments'::name, 
  ARRAY[
  'shape',
  'id',
  'date_adjusted',
  'survey_reference',
  'adjusted_nodes'
  ]);

SELECT has_table('lds'::name, 'strata_parcels'::name);
SELECT columns_are('lds'::name, 'strata_parcels'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'street_address'::name);
SELECT columns_are('lds'::name, 'street_address'::name, 
  ARRAY[
  'road_name',
  'territorial_authority',
  'shape',
  'id',
  'rna_id',
  'address',
  'house_number',
  'locality'
  ]);

SELECT has_table('lds'::name, 'street_address2'::name);
SELECT columns_are('lds'::name, 'street_address2'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'survey_arc_observations'::name);
SELECT columns_are('lds'::name, 'survey_arc_observations'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'survey_bdy_marks'::name);
SELECT columns_are('lds'::name, 'survey_bdy_marks'::name, 
  ARRAY[
  'shape',
  'id',
  'name',
  'order',
  'nominal_accuracy',
  'date_last_adjusted'
  ]);

SELECT has_table('lds'::name, 'survey_network_marks'::name);
SELECT columns_are('lds'::name, 'survey_network_marks'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'survey_non_bdy_marks'::name);
SELECT columns_are('lds'::name, 'survey_non_bdy_marks'::name, 
  ARRAY[
  'nominal_accuracy',
  'date_last_adjusted',
  'shape',
  'id',
  'name',
  'order'
  ]);

SELECT has_table('lds'::name, 'survey_observations'::name);
SELECT columns_are('lds'::name, 'survey_observations'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'survey_plans'::name);
SELECT columns_are('lds'::name, 'survey_plans'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'survey_protected_marks'::name);
SELECT columns_are('lds'::name, 'survey_protected_marks'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'title_estates'::name);
SELECT columns_are('lds'::name, 'title_estates'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'title_memorial_additional_text'::name);
SELECT columns_are('lds'::name, 'title_memorial_additional_text'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'title_memorials'::name);
SELECT columns_are('lds'::name, 'title_memorials'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'title_owners'::name);
SELECT columns_are('lds'::name, 'title_owners'::name, 
  ARRAY[
  'owner',
  'shape',
  'part_ownership',
  'land_district',
  'title_status',
  'title_no',
  'id'
  ]);

SELECT has_table('lds'::name, 'title_owners_aspatial'::name);
SELECT columns_are('lds'::name, 'title_owners_aspatial'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'title_parcel_associations'::name);
SELECT columns_are('lds'::name, 'title_parcel_associations'::name, 
  ARRAY[
  'id',
  'title_no',
  'par_id',
  'source'
  ]);

SELECT has_table('lds'::name, 'titles'::name);
SELECT columns_are('lds'::name, 'titles'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'titles_aspatial'::name);
SELECT columns_are('lds'::name, 'titles_aspatial'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'titles_plus'::name);
SELECT columns_are('lds'::name, 'titles_plus'::name, 
  ARRAY[
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

SELECT has_table('lds'::name, 'waca_adjustments'::name);
SELECT columns_are('lds'::name, 'waca_adjustments'::name, 
  ARRAY[
  'date_adjusted',
  'adjusted_nodes',
  'shape',
  'survey_reference',
  'id'
  ]);

-- }

-- Test functions existance {

SELECT has_function('lds'::name, 'lds_deg_dms'::name);
SELECT has_function('lds'::name, 'lds_maintainsimplifiedlayers'::name);
SELECT has_function('lds'::name, 'lds_gettable'::name);
SELECT has_function('lds'::name, 'lds_updatesimplifiedtable'::name);
SELECT has_function('lds'::name, 'lds_tablehasdata'::name);
SELECT has_function('lds'::name, 'lds_tablehasdata'::name);
SELECT has_function('lds'::name, 'lds_createtempcopy'::name);
SELECT has_function('lds'::name, 'lds_applyprimarykeyfrom'::name);
SELECT has_function('lds'::name, 'lds_gettablecontrainstsandindexes'::name);
SELECT has_function('lds'::name, 'lds_droptablecontrainstsandindexes'::name);
SELECT has_function('lds'::name, 'lds_applytabledifferences'::name);
SELECT has_function('lds'::name, 'lds_getprotectedtext'::name);
SELECT has_function('lds'::name, 'lds_getlanddistict'::name);
SELECT has_function('lds'::name, 'lds_createsurveyplanstable'::name);
SELECT has_function('lds'::name, 'lds_dropsurveyplanstable'::name);
SELECT has_function('lds'::name, 'lds_istablesufiunique'::name);
SELECT has_function('lds'::name, 'lds_createtitleexclusiontables'::name);
SELECT has_function('lds'::name, 'lds_droptitleexclusiontables'::name);
SELECT has_function('lds'::name, 'lds_maintainsimplifiedgeodeticlayers'::name);
SELECT has_function('lds'::name, 'lds_maintainsimplifiedparcellayers'::name);
SELECT has_function('lds'::name, 'lds_maintainsimplifiedelectorallayers'::name);
SELECT has_function('lds'::name, 'lds_maintainsimplifiedsurveylayers'::name);

-- }

-- TODO: check lds indexes


SELECT * FROM finish();

ROLLBACK;

