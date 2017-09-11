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

SELECT has_function('lds'::name, 'lds_applyprimarykeyfrom'::name);
SELECT has_function('lds'::name, 'lds_applytabledifferences'::name);
SELECT has_function('lds'::name, 'lds_createsurveyplanstable'::name);
SELECT has_function('lds'::name, 'lds_createtempcopy'::name);
SELECT has_function('lds'::name, 'lds_createtitleexclusiontables'::name);
SELECT has_function('lds'::name, 'lds_deg_dms'::name);
SELECT has_function('lds'::name, 'lds_dropsurveyplanstable'::name);
SELECT has_function('lds'::name, 'lds_droptablecontrainstsandindexes'::name);
SELECT has_function('lds'::name, 'lds_droptitleexclusiontables'::name);
SELECT has_function('lds'::name, 'lds_getlanddistict'::name);
SELECT has_function('lds'::name, 'lds_getprotectedtext'::name);
SELECT has_function('lds'::name, 'lds_gettablecontrainstsandindexes'::name);
SELECT has_function('lds'::name, 'lds_gettable'::name);
SELECT has_function('lds'::name, 'lds_istablesufiunique'::name);
SELECT has_function('lds'::name, 'lds_maintainsimplifiedelectorallayers'::name);
SELECT has_function('lds'::name, 'lds_maintainsimplifiedgeodeticlayers'::name);
SELECT has_function('lds'::name, 'lds_maintainsimplifiedlayers'::name);
SELECT has_function('lds'::name, 'lds_maintainsimplifiedparcellayers'::name);
SELECT has_function('lds'::name, 'lds_maintainsimplifiedsurveylayers'::name);
SELECT has_function('lds'::name, 'lds_tablehasdata'::name);
SELECT has_function('lds'::name, 'lds_tablehasdata'::name);
SELECT has_function('lds'::name, 'lds_updatesimplifiedtable'::name);

-- }

-- Test indexes existance {

SELECT has_index('bde'::name, 'crs_adjustment_run'::name, 'fk_adj_adm'::name, ARRAY['adm_id']);
SELECT has_index('bde'::name, 'crs_adjustment_run'::name, 'fk_adj_wrk'::name, ARRAY['wrk_id']);
SELECT has_index('bde'::name, 'crs_affected_parcl'::name, 'fk_afp_par'::name, ARRAY['par_id']);
SELECT has_index('bde'::name, 'crs_affected_parcl'::name, 'fk_afp_sur'::name, ARRAY['sur_wrk_id']);
SELECT has_index('bde'::name, 'crs_appellation'::name, 'fk_app_par'::name, ARRAY['par_id']);
SELECT has_index('bde'::name, 'crs_coordinate'::name, 'fk_coo_cor'::name, ARRAY['cor_id']);
SELECT has_index('bde'::name, 'crs_coordinate'::name, 'fk_coo_cos'::name, ARRAY['cos_id']);
SELECT has_index('bde'::name, 'crs_coordinate'::name, 'fk_coo_nod'::name, ARRAY['nod_id']);
SELECT has_index('bde'::name, 'crs_coordinate_sys'::name, 'fk_cos_cot'::name, ARRAY['cot_id']);
SELECT has_index('bde'::name, 'crs_coordinate_sys'::name, 'fk_cos_dtm'::name, ARRAY['dtm_id']);
SELECT has_index('bde'::name, 'crs_estate_share'::name, 'fk_tle_ess'::name, ARRAY['ett_id']);
SELECT has_index('bde'::name, 'crs_legal_desc'::name, 'fk_lgd_ttl'::name, ARRAY['ttl_title_no']);
SELECT has_index('bde'::name, 'crs_legal_desc_prl'::name, 'fk_rap_par'::name, ARRAY['par_id']);
SELECT has_index('bde'::name, 'crs_legal_desc_prl'::name, 'fk_rap_rar'::name, ARRAY['lgd_id']);
SELECT has_index('bde'::name, 'crs_mark'::name, 'fk_mrk_nod'::name, ARRAY['nod_id']);
SELECT has_index('bde'::name, 'crs_mark_name'::name, 'fk_mkn_mrk'::name, ARRAY['mrk_id']);
SELECT has_index('bde'::name, 'crs_mark_name'::name, 'idx_mkn_type_code'::name, ARRAY['type']);
SELECT has_index('bde'::name, 'crs_mark_name'::name, 'idx_mkn_type'::name, ARRAY['type']);
SELECT has_index('bde'::name, 'crs_mrk_phys_state'::name, 'fk_mps_mrk'::name, ARRAY['mrk_id']);
SELECT has_index('bde'::name, 'crs_mrk_phys_state'::name, 'fk_mps_wrk'::name, ARRAY['wrk_id']);
SELECT has_index('bde'::name, 'crs_node'::name, 'fk_nod_cos'::name, ARRAY['cos_id_official']);
SELECT has_index('bde'::name, 'crs_node'::name, 'fk_nod_sit'::name, ARRAY['sit_id']);
SELECT has_index('bde'::name, 'crs_node_works'::name, 'idx_now_purpose'::name, ARRAY['purpose']);
SELECT has_index('bde'::name, 'crs_obs_accuracy'::name, 'fk_oba_obn2'::name, ARRAY['obn_id1']);
SELECT has_index('bde'::name, 'crs_observation'::name, 'fk_obn_cos'::name, ARRAY['cos_id']);
SELECT has_index('bde'::name, 'crs_observation'::name, 'fk_obn_obt'::name, ARRAY['obt_type, obt_sub_type']);
SELECT has_index('bde'::name, 'crs_observation'::name, 'fk_obn_stp1'::name, ARRAY['stp_id_local']);
SELECT has_index('bde'::name, 'crs_observation'::name, 'fk_obn_vct'::name, ARRAY['vct_id']);
SELECT has_index('bde'::name, 'crs_ordinate_adj'::name, 'fk_orj_coo_output'::name, ARRAY['coo_id_output']);
SELECT has_index('bde'::name, 'crs_ordinate_adj'::name, 'idx_orj_adj_coo'::name, ARRAY['adj_id, coo_id_output']);
SELECT has_index('bde'::name, 'crs_parcel_bndry'::name, 'fk_pab_lin'::name, ARRAY['lin_id']);
SELECT has_index('bde'::name, 'crs_parcel_bndry'::name, 'fk_pab_pri'::name, ARRAY['pri_id']);
SELECT has_index('bde'::name, 'crs_parcel_dimen'::name, 'fk_pdi_obn'::name, ARRAY['obn_id']);
SELECT has_index('bde'::name, 'crs_parcel_dimen'::name, 'fk_pdi_par'::name, ARRAY['par_id']);
SELECT has_index('bde'::name, 'crs_parcel'::name, 'idx_par_nonsurvey_def'::name, ARRAY['nonsurvey_def']);
SELECT has_index('bde'::name, 'crs_parcel_ring'::name, 'fk_pri_par'::name, ARRAY['par_id']);
SELECT has_index('bde'::name, 'crs_proprietor'::name, 'fk_ess_prp'::name, ARRAY['ets_id']);
SELECT has_index('bde'::name, 'crs_road_name_asc'::name, 'fk_rns_rcl'::name, ARRAY['rcl_id']);
SELECT has_index('bde'::name, 'crs_road_name_asc'::name, 'fk_rns_rna'::name, ARRAY['rna_id']);
SELECT has_index('bde'::name, 'crs_setup'::name, 'fk_stp_wrk'::name, ARRAY['wrk_id']);
SELECT has_index('bde'::name, 'crs_stat_act_parcl'::name, 'fk_sap_par'::name, ARRAY['par_id']);
SELECT has_index('bde'::name, 'crs_street_address'::name, 'fk_sad_rna'::name, ARRAY['rna_id']);
SELECT has_index('bde'::name, 'crs_sur_plan_ref'::name, 'fk_wrk_id'::name, ARRAY['wrk_id']);
SELECT has_index('bde'::name, 'crs_sys_code'::name, 'fk_sco_scg'::name, ARRAY['scg_code']);
SELECT has_index('bde'::name, 'crs_title_estate'::name, 'fk_ett_lgd'::name, ARRAY['lgd_id']);
SELECT has_index('bde'::name, 'crs_title_estate'::name, 'fk_ttl_ett'::name, ARRAY['ttl_title_no']);
SELECT has_index('bde'::name, 'crs_title_mem_text'::name, 'fk_tmt_ttm'::name, ARRAY['ttm_id']);
SELECT has_index('bde'::name, 'crs_title_mem_text'::name, 'tmt_col_1_text_idx'::name, ARRAY['col_1_text']);
SELECT has_index('bde'::name, 'crs_title'::name, 'fk_ttl_ped'::name, ARRAY['protect_end']);
SELECT has_index('bde'::name, 'crs_title'::name, 'fk_ttl_psd'::name, ARRAY['protect_start']);
SELECT has_index('bde'::name, 'crs_work'::name, 'fk_wrk_cos'::name, ARRAY['cos_id']);

-- }

-- Test versioning {

CREATE FUNCTION pg_temp.check_versioned(tab name, versioned bool)
RETURNS text AS $$
  SELECT
  CASE
    WHEN versioned THEN
      ok(table_version.ver_is_table_versioned('lds', tab),
        'Table ' || tab || ' should be versioned')
    ELSE
      ok(not table_version.ver_is_table_versioned('lds', tab),
        'Table ' || tab || ' should not be versioned')
  END;
$$ LANGUAGE sql;

CREATE TEMPORARY TABLE lds_tables (nam) AS VALUES
('affected_parcel_surveys'),
('affected_parcel_surveys_pend'),
('all_linear_parcels'),
('all_parcels'),
('all_parcels_pend'),
('cadastral_adjustments'),
('geodetic_antarctic_vertical_marks'),
('geodetic_antarctic_marks'),
('geodetic_marks'),
('geodetic_network_marks'),
('geodetic_vertical_marks'),
('hydro_parcels'),
('land_districts'),
('land_parcels'),
('mesh_blocks'),
('non_primary_linear_parcels'),
('non_primary_parcels'),
('parcel_stat_actions'),
('parcel_vectors'),
('primary_parcels'),
('railway_centre_line'),
('road_centre_line'),
('road_centre_line_subsection'),
('road_parcels'),
('spi_adjustments'),
('strata_parcels'),
('street_address'),
('street_address2'),
('survey_arc_observations'),
('survey_bdy_marks'),
('survey_network_marks'),
('survey_non_bdy_marks'),
('survey_observations'),
('survey_plans'),
('survey_protected_marks'),
('title_estates'),
('title_memorial_additional_text'),
('title_memorials'),
('title_owners'),
('title_owners_aspatial'),
('title_parcel_associations'),
('titles'),
('titles_aspatial'),
('titles_plus'),
('waca_adjustments')
;

-- Table X should not be versioned
SELECT pg_temp.check_versioned(nam, false) from pg_temp.lds_tables;

\i sql/versioning/01-version_tables.sql

-- Table X should be versioned
SELECT pg_temp.check_versioned(nam, true) from pg_temp.lds_tables;

-- }

SELECT * FROM finish();

ROLLBACK;

