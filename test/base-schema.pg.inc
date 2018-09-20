-- Test tables existance and their composition {

-- Test lds schema {

SELECT has_schema('lds'::name);
SELECT schema_owner_is('lds'::name, 'bde_dba'::name);
SELECT schema_privs_are('lds'::name, 'bde_admin'::name, ARRAY['USAGE']);
SELECT schema_privs_are('lds'::name, 'bde_user'::name, ARRAY['USAGE']);

SELECT has_table('lds'::name, 'affected_parcel_surveys'::name);
SELECT table_owner_is('lds'::name, 'affected_parcel_surveys'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'affected_parcel_surveys'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'affected_parcel_surveys'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('lds'::name, 'affected_parcel_surveys'::name,
  ARRAY[
  'id',
  'par_id',
  'sur_wrk_id',
  'action'
  ]);

SELECT has_table('lds'::name, 'affected_parcel_surveys_pend'::name);
SELECT table_owner_is('lds'::name, 'affected_parcel_surveys_pend'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'affected_parcel_surveys_pend'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'affected_parcel_surveys_pend'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('lds'::name, 'affected_parcel_surveys_pend'::name,
  ARRAY[
  'id',
  'par_id',
  'sur_wrk_id',
  'action'
  ]);

SELECT has_table('lds'::name, 'all_linear_parcels'::name);
SELECT table_owner_is('lds'::name, 'all_linear_parcels'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'all_linear_parcels'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'all_linear_parcels'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'all_parcels'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'all_parcels'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'all_parcels'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'all_parcels_pend'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'all_parcels_pend'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'all_parcels_pend'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'cadastral_adjustments'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'cadastral_adjustments'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'cadastral_adjustments'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('lds'::name, 'cadastral_adjustments'::name,
  ARRAY[
  'survey_reference',
  'adjusted_nodes',
  'shape',
  'date_adjusted',
  'id'
  ]);

SELECT has_table('lds'::name, 'geodetic_antarctic_marks'::name);
SELECT table_owner_is('lds'::name, 'geodetic_antarctic_marks'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'geodetic_antarctic_marks'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'geodetic_antarctic_marks'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'geodetic_marks'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'geodetic_marks'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'geodetic_marks'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'geodetic_network_marks'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'geodetic_network_marks'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'geodetic_network_marks'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'geodetic_vertical_marks'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'geodetic_vertical_marks'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'geodetic_vertical_marks'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'hydro_parcels'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'hydro_parcels'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'hydro_parcels'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'land_districts'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'land_districts'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'land_districts'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('lds'::name, 'land_districts'::name,
  ARRAY[
  'id',
  'shape',
  'name'
  ]);

SELECT has_table('lds'::name, 'land_parcels'::name);
SELECT table_owner_is('lds'::name, 'land_parcels'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'land_parcels'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'land_parcels'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'mesh_blocks'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'mesh_blocks'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'mesh_blocks'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('lds'::name, 'mesh_blocks'::name,
  ARRAY[
  'shape',
  'code',
  'id'
  ]);

SELECT has_table('lds'::name, 'non_primary_linear_parcels'::name);
SELECT table_owner_is('lds'::name, 'non_primary_linear_parcels'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'non_primary_linear_parcels'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'non_primary_linear_parcels'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'non_primary_parcels'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'non_primary_parcels'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'non_primary_parcels'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'parcel_stat_actions'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'parcel_stat_actions'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'parcel_stat_actions'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('lds'::name, 'parcel_stat_actions'::name,
  ARRAY[
  'statutory_action',
  'status',
  'par_id',
  'id',
  'action'
  ]);

SELECT has_table('lds'::name, 'parcel_vectors'::name);
SELECT table_owner_is('lds'::name, 'parcel_vectors'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'parcel_vectors'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'parcel_vectors'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'primary_parcels'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'primary_parcels'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'primary_parcels'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'railway_centre_line'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'railway_centre_line'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'railway_centre_line'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('lds'::name, 'railway_centre_line'::name,
  ARRAY[
  'shape',
  'name',
  'name_utf8',
  'id'
  ]);

SELECT has_table('lds'::name, 'road_centre_line'::name);
SELECT table_owner_is('lds'::name, 'road_centre_line'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'road_centre_line'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'road_centre_line'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'road_centre_line_subsection'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'road_centre_line_subsection'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'road_centre_line_subsection'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'road_parcels'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'road_parcels'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'road_parcels'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'spi_adjustments'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'spi_adjustments'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'spi_adjustments'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('lds'::name, 'spi_adjustments'::name,
  ARRAY[
  'shape',
  'id',
  'date_adjusted',
  'survey_reference',
  'adjusted_nodes'
  ]);

SELECT has_table('lds'::name, 'strata_parcels'::name);
SELECT table_owner_is('lds'::name, 'strata_parcels'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'strata_parcels'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'strata_parcels'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'street_address'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'street_address'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'street_address'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'street_address2'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'street_address2'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'street_address2'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'survey_arc_observations'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'survey_arc_observations'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'survey_arc_observations'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'survey_bdy_marks'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'survey_bdy_marks'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'survey_bdy_marks'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'survey_network_marks'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'survey_network_marks'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'survey_network_marks'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'survey_non_bdy_marks'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'survey_non_bdy_marks'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'survey_non_bdy_marks'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'survey_observations'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'survey_observations'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'survey_observations'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'survey_plans'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'survey_plans'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'survey_plans'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'survey_protected_marks'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'survey_protected_marks'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'survey_protected_marks'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'title_estates'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'title_estates'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'title_estates'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'title_memorial_additional_text'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'title_memorial_additional_text'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'title_memorial_additional_text'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'title_memorials'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'title_memorials'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'title_memorials'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'title_owners'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'title_owners'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'title_owners'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'title_owners_aspatial'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'title_owners_aspatial'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'title_owners_aspatial'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'title_parcel_associations'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'title_parcel_associations'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'title_parcel_associations'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('lds'::name, 'title_parcel_associations'::name,
  ARRAY[
  'id',
  'title_no',
  'par_id',
  'source'
  ]);

SELECT has_table('lds'::name, 'titles'::name);
SELECT table_owner_is('lds'::name, 'titles'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'titles'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'titles'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'titles_aspatial'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'titles_aspatial'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'titles_aspatial'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'titles_plus'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'titles_plus'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'titles_plus'::name, 'bde_user'::name, ARRAY['SELECT']);
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
SELECT table_owner_is('lds'::name, 'waca_adjustments'::name, 'bde_dba'::name);
SELECT table_privs_are('lds'::name, 'waca_adjustments'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('lds'::name, 'waca_adjustments'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('lds'::name, 'waca_adjustments'::name,
  ARRAY[
  'date_adjusted',
  'adjusted_nodes',
  'shape',
  'survey_reference',
  'id'
  ]);

-- } -- lds schema

-- Test bde_ext schema {

SELECT has_schema('bde_ext'::name);
SELECT schema_owner_is('bde_ext'::name, 'bde_dba'::name);
SELECT schema_privs_are('bde_ext'::name, 'bde_admin'::name, ARRAY['USAGE']);
SELECT schema_privs_are('bde_ext'::name, 'bde_user'::name, ARRAY['USAGE']);

SELECT has_table('bde_ext'::name, 'adjustment_run'::name);
SELECT table_owner_is('bde_ext'::name, 'adjustment_run'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'adjustment_run'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'adjustment_run'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'adjustment_run'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'alias'::name);
SELECT table_owner_is('bde_ext'::name, 'alias'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'alias'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'alias'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'alias'::name,
  ARRAY[
    'id',
    'prp_id',
    'surname',
    'other_names'
  ]);

SELECT has_table('bde_ext'::name, 'coordinate'::name);
SELECT table_owner_is('bde_ext'::name, 'coordinate'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'coordinate'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'coordinate'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'coordinate'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'enc_share'::name);
SELECT table_owner_is('bde_ext'::name, 'enc_share'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'enc_share'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'enc_share'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'enc_share'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'encumbrance'::name);
SELECT table_owner_is('bde_ext'::name, 'encumbrance'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'encumbrance'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'encumbrance'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'encumbrance'::name,
  ARRAY[
    'id',
    'status',
    'act_tin_id_orig',
    'act_tin_id_crt',
    'act_id_crt',
    'act_id_orig',
    'term'
  ]);

SELECT has_table('bde_ext'::name, 'encumbrancee'::name);
SELECT table_owner_is('bde_ext'::name, 'encumbrancee'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'encumbrancee'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'encumbrancee'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'encumbrancee'::name,
  ARRAY[
    'id',
    'ens_id',
    'status',
    'name'
  ]);

SELECT has_table('bde_ext'::name, 'estate_share'::name);
SELECT table_owner_is('bde_ext'::name, 'estate_share'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'estate_share'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'estate_share'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'estate_share'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'feature_name_poly'::name);
SELECT table_owner_is('bde_ext'::name, 'feature_name_poly'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'feature_name_poly'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'feature_name_poly'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'feature_name_poly'::name,
  ARRAY[
    'id',
    'type',
    'name',
    'status',
    'other_details',
    'audit_id',
    'se_row_id',
    'shape'
  ]);

SELECT has_table('bde_ext'::name, 'feature_name_pt'::name);
SELECT table_owner_is('bde_ext'::name, 'feature_name_pt'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'feature_name_pt'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'feature_name_pt'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'feature_name_pt'::name,
  ARRAY[
    'id',
    'type',
    'name',
    'status',
    'other_details',
    'audit_id',
    'se_row_id',
    'shape'
  ]);

SELECT has_table('bde_ext'::name, 'legal_desc'::name);
SELECT table_owner_is('bde_ext'::name, 'legal_desc'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'legal_desc'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'legal_desc'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'legal_desc'::name,
  ARRAY[
    'id',
    'type',
    'status',
    'total_area',
    'ttl_title_no',
    'legal_desc_text',
    'audit_id'
  ]);

SELECT has_table('bde_ext'::name, 'line'::name);
SELECT table_owner_is('bde_ext'::name, 'line'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'line'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'line'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'line'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'maintenance'::name);
SELECT table_owner_is('bde_ext'::name, 'maintenance'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'maintenance'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'maintenance'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'maintenance'::name,
  ARRAY[
    'mrk_id',
    'type',
    'status',
    'desc',
    'complete_date',
    'audit_id'
  ]);

SELECT has_table('bde_ext'::name, 'mark'::name);
SELECT table_owner_is('bde_ext'::name, 'mark'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'mark'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'mark'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'mark'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'mark_name'::name);
SELECT table_owner_is('bde_ext'::name, 'mark_name'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'mark_name'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'mark_name'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'mark_name'::name,
  ARRAY[
    'mrk_id',
    'type',
    'name',
    'audit_id'
  ]);

SELECT has_table('bde_ext'::name, 'mark_phys_state'::name);
SELECT table_owner_is('bde_ext'::name, 'mark_phys_state'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'mark_phys_state'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'mark_phys_state'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'mark_phys_state'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'node'::name);
SELECT table_owner_is('bde_ext'::name, 'node'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'node'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'node'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'node'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'node_prp_order'::name);
SELECT table_owner_is('bde_ext'::name, 'node_prp_order'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'node_prp_order'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'node_prp_order'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'node_prp_order'::name,
  ARRAY[
    'dtm_id',
    'nod_id',
    'cor_id',
    'audit_id'
  ]);

SELECT has_table('bde_ext'::name, 'nominal_index'::name);
SELECT table_owner_is('bde_ext'::name, 'nominal_index'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'nominal_index'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'nominal_index'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'nominal_index'::name,
  ARRAY[
    'id',
    'ttl_title_no',
    'status',
    'name_type',
    'corporate_name',
    'surname',
    'other_names',
    'prp_id'
  ]);

SELECT has_table('bde_ext'::name, 'office'::name);
SELECT table_owner_is('bde_ext'::name, 'office'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'office'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'office'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'office'::name,
  ARRAY[
    'code',
    'name',
    'rcs_name',
    'cis_name',
    'alloc_source_table',
    'audit_id'
  ]);

SELECT has_table('bde_ext'::name, 'parcel'::name);
SELECT table_owner_is('bde_ext'::name, 'parcel'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'parcel'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'parcel'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'parcel'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'parcel_dimen'::name);
SELECT table_owner_is('bde_ext'::name, 'parcel_dimen'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'parcel_dimen'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'parcel_dimen'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'parcel_dimen'::name,
  ARRAY[
    'obn_id',
    'par_id',
    'audit_id'
  ]);

SELECT has_table('bde_ext'::name, 'parcel_label'::name);
SELECT table_owner_is('bde_ext'::name, 'parcel_label'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'parcel_label'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'parcel_label'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'parcel_label'::name,
  ARRAY[
    'id',
    'par_id',
    'se_row_id',
    'audit_id',
    'shape'
  ]);

SELECT has_table('bde_ext'::name, 'parcel_ls'::name);
SELECT table_owner_is('bde_ext'::name, 'parcel_ls'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'parcel_ls'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'parcel_ls'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'parcel_ls'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'parcel_ring'::name);
SELECT table_owner_is('bde_ext'::name, 'parcel_ring'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'parcel_ring'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'parcel_ring'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'parcel_ring'::name,
  ARRAY[
    'id',
    'par_id',
    'pri_id_parent_ring',
    'is_ring',
    'audit_id'
  ]);

SELECT has_table('bde_ext'::name, 'proprietor'::name);
SELECT table_owner_is('bde_ext'::name, 'proprietor'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'proprietor'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'proprietor'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'proprietor'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'stat_version'::name);
SELECT table_owner_is('bde_ext'::name, 'stat_version'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'stat_version'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'stat_version'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'stat_version'::name,
  ARRAY[
    'version',
    'area_class',
    'desc',
    'statute_action',
    'start_date',
    'end_date',
    'audit_id'
  ]);

SELECT has_table('bde_ext'::name, 'statist_area'::name);
SELECT table_owner_is('bde_ext'::name, 'statist_area'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'statist_area'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'statist_area'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'statist_area'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'street_address_ext'::name);
SELECT table_owner_is('bde_ext'::name, 'street_address_ext'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'street_address_ext'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'street_address_ext'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'street_address_ext'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'survey'::name);
SELECT table_owner_is('bde_ext'::name, 'survey'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'survey'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'survey'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'survey'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'survey_plan_image_revision'::name);
SELECT table_owner_is('bde_ext'::name, 'survey_plan_image_revision'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'survey_plan_image_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'survey_plan_image_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'survey_plan_image_revision'::name,
  ARRAY[
    'id',
    'sur_wrk_id',
    'survey_reference',
    'land_district',
    'plan_type',
    'pages',
    'last_updated'
  ]);

SELECT has_table('bde_ext'::name, 'title'::name);
SELECT table_owner_is('bde_ext'::name, 'title'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'title'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'title'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'title'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'title_action'::name);
SELECT table_owner_is('bde_ext'::name, 'title_action'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'title_action'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'title_action'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'title_action'::name,
  ARRAY[
    'ttl_title_no',
    'act_tin_id',
    'act_id',
    'audit_id'
  ]);

SELECT has_table('bde_ext'::name, 'title_doc_ref'::name);
SELECT table_owner_is('bde_ext'::name, 'title_doc_ref'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'title_doc_ref'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'title_doc_ref'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'title_doc_ref'::name,
  ARRAY[
    'id',
    'type',
    'tin_id',
    'reference_no'
  ]);

SELECT has_table('bde_ext'::name, 'title_estate'::name);
SELECT table_owner_is('bde_ext'::name, 'title_estate'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'title_estate'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'title_estate'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'title_estate'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'title_mem_text'::name);
SELECT table_owner_is('bde_ext'::name, 'title_mem_text'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'title_mem_text'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'title_mem_text'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'title_mem_text'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'title_memorial'::name);
SELECT table_owner_is('bde_ext'::name, 'title_memorial'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'title_memorial'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'title_memorial'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'title_memorial'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'title_parcel_association'::name);
SELECT table_owner_is('bde_ext'::name, 'title_parcel_association'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'title_parcel_association'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'title_parcel_association'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'title_parcel_association'::name,
  ARRAY[
    'id',
    'ttl_title_no',
    'par_id',
    'source'
  ]);

SELECT has_table('bde_ext'::name, 'transact_type'::name);
SELECT table_owner_is('bde_ext'::name, 'transact_type'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'transact_type'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'transact_type'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'transact_type'::name,
  ARRAY[
    'grp',
    'type',
    'description',
    'audit_id'
  ]);

SELECT has_table('bde_ext'::name, 'ttl_enc'::name);
SELECT table_owner_is('bde_ext'::name, 'ttl_enc'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'ttl_enc'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'ttl_enc'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'ttl_enc'::name,
  ARRAY[
    'id',
    'ttl_title_no',
    'enc_id',
    'status',
    'act_tin_id_crt',
    'act_id_crt'
  ]);

SELECT has_table('bde_ext'::name, 'ttl_hierarchy'::name);
SELECT table_owner_is('bde_ext'::name, 'ttl_hierarchy'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'ttl_hierarchy'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'ttl_hierarchy'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'ttl_hierarchy'::name,
  ARRAY[
    'id',
    'status',
    'ttl_title_no_prior',
    'ttl_title_no_flw',
    'tdr_id',
    'act_tin_id_crt',
    'act_id_crt'
  ]);

SELECT has_table('bde_ext'::name, 'ttl_inst'::name);
SELECT table_owner_is('bde_ext'::name, 'ttl_inst'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'ttl_inst'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'ttl_inst'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'ttl_inst'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'ttl_inst_cmplte'::name);
SELECT table_owner_is('bde_ext'::name, 'ttl_inst_cmplte'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'ttl_inst_cmplte'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'ttl_inst_cmplte'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'ttl_inst_cmplte'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'ttl_inst_title'::name);
SELECT table_owner_is('bde_ext'::name, 'ttl_inst_title'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'ttl_inst_title'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'ttl_inst_title'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'ttl_inst_title'::name,
  ARRAY[
    'tin_id',
    'ttl_title_no',
    'audit_id'
  ]);

SELECT has_table('bde_ext'::name, 'user'::name);
SELECT table_owner_is('bde_ext'::name, 'user'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'user'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'user'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'user'::name,
  ARRAY[
    'id',
    'type',
    'status',
    'title',
    'given_names',
    'surname',
    'corporate_name',
    'audit_id'
  ]);

SELECT has_table('bde_ext'::name, 'vector_ls'::name);
SELECT table_owner_is('bde_ext'::name, 'vector_ls'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'vector_ls'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'vector_ls'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'vector_ls'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'vector_pt'::name);
SELECT table_owner_is('bde_ext'::name, 'vector_pt'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'vector_pt'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'vector_pt'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'vector_pt'::name,
  ARRAY[
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

SELECT has_table('bde_ext'::name, 'work'::name);
SELECT table_owner_is('bde_ext'::name, 'work'::name, 'bde_dba'::name);
SELECT table_privs_are('bde_ext'::name, 'work'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('bde_ext'::name, 'work'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT columns_are('bde_ext'::name, 'work'::name,
  ARRAY[
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

-- Test functions existance {

SELECT has_function('bde_ext', 'lds_maintainallfbdelayers', ARRAY['integer']);
SELECT function_owner_is('bde_ext', 'lds_maintainallfbdelayers', ARRAY['integer'], 'bde_dba'::name);
SELECT has_function('bde_ext', 'lds_maintainfbdelayers', ARRAY['integer']);
SELECT function_owner_is('bde_ext', 'lds_maintainfbdelayers', ARRAY['integer'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_applyprimarykeyfrom', ARRAY['regclass', 'regclass']);
SELECT function_owner_is('lds', 'lds_applyprimarykeyfrom', ARRAY['regclass', 'regclass'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_applytabledifferences', ARRAY['integer', 'regclass', 'regclass', 'name']);
SELECT function_owner_is('lds', 'lds_applytabledifferences', ARRAY['integer', 'regclass', 'regclass', 'name'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_createsurveyplanstable', ARRAY['integer']);
SELECT function_owner_is('lds', 'lds_createsurveyplanstable', ARRAY['integer'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_createtempcopy', ARRAY['regclass']);
SELECT function_owner_is('lds', 'lds_createtempcopy', ARRAY['regclass'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_createtitleexclusiontables', ARRAY['integer']);
SELECT function_owner_is('lds', 'lds_createtitleexclusiontables', ARRAY['integer'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_deg_dms', ARRAY['double precision', 'integer', 'character']);
SELECT function_owner_is('lds', 'lds_deg_dms', ARRAY['double precision', 'integer', 'character'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_dropsurveyplanstable', ARRAY['integer']);
SELECT function_owner_is('lds', 'lds_dropsurveyplanstable', ARRAY['integer'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_droptablecontrainstsandindexes', ARRAY['regclass']);
SELECT function_owner_is('lds', 'lds_droptablecontrainstsandindexes', ARRAY['regclass'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_droptitleexclusiontables', ARRAY['integer']);
SELECT function_owner_is('lds', 'lds_droptitleexclusiontables', ARRAY['integer'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_getlanddistict', ARRAY['geometry']);
SELECT function_owner_is('lds', 'lds_getlanddistict', ARRAY['geometry'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_getprotectedtext', ARRAY['character varying']);
SELECT function_owner_is('lds', 'lds_getprotectedtext', ARRAY['character varying'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_gettable', ARRAY['name', 'name']);
SELECT function_owner_is('lds', 'lds_gettable', ARRAY['name', 'name'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_gettablecontrainstsandindexes', ARRAY['regclass']);
SELECT function_owner_is('lds', 'lds_gettablecontrainstsandindexes', ARRAY['regclass'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_istablesufiunique', ARRAY['integer', 'regclass']);
SELECT function_owner_is('lds', 'lds_istablesufiunique', ARRAY['integer', 'regclass'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_maintainsimplifiedgeodeticlayers', ARRAY['integer']);
SELECT function_owner_is('lds', 'lds_maintainsimplifiedgeodeticlayers', ARRAY['integer'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_maintainsimplifiedlayers', ARRAY['integer']);
SELECT function_owner_is('lds', 'lds_maintainsimplifiedlayers', ARRAY['integer'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_maintainsimplifiedparcellayers', ARRAY['integer']);
SELECT function_owner_is('lds', 'lds_maintainsimplifiedparcellayers', ARRAY['integer'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_maintainsimplifiedsurveylayers', ARRAY['integer']);
SELECT function_owner_is('lds', 'lds_maintainsimplifiedsurveylayers', ARRAY['integer'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_tablehasdata', ARRAY['name', 'name']);
SELECT function_owner_is('lds', 'lds_tablehasdata', ARRAY['name', 'name'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_tablehasdata', ARRAY['regclass']);
SELECT function_owner_is('lds', 'lds_tablehasdata', ARRAY['regclass'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_updatesimplifiedtable', ARRAY['integer', 'regclass', 'text', 'text']);
SELECT function_owner_is('lds', 'lds_updatesimplifiedtable', ARRAY['integer', 'regclass', 'text', 'text'], 'bde_dba'::name);
SELECT has_function('lds', 'lds_version', ARRAY['']);
SELECT function_owner_is('lds', 'lds_version', ARRAY[''], 'bde_dba'::name);

-- }

-- Test indexes existance {

SELECT has_index('bde'::name, 'crs_adjustment_run'::name, 'fk_adj_adm'::name, ARRAY['adm_id']);
SELECT index_owner_is('bde'::name, 'crs_adjustment_run'::name, 'fk_adj_adm'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_adjustment_run'::name, 'fk_adj_wrk'::name, ARRAY['wrk_id']);
SELECT index_owner_is('bde'::name, 'crs_adjustment_run'::name, 'fk_adj_wrk'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_affected_parcl'::name, 'fk_afp_par'::name, ARRAY['par_id']);
SELECT index_owner_is('bde'::name, 'crs_affected_parcl'::name, 'fk_afp_par'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_affected_parcl'::name, 'fk_afp_sur'::name, ARRAY['sur_wrk_id']);
SELECT index_owner_is('bde'::name, 'crs_affected_parcl'::name, 'fk_afp_sur'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_appellation'::name, 'fk_app_par'::name, ARRAY['par_id']);
SELECT index_owner_is('bde'::name, 'crs_appellation'::name, 'fk_app_par'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_coordinate'::name, 'fk_coo_cor'::name, ARRAY['cor_id']);
SELECT index_owner_is('bde'::name, 'crs_coordinate'::name, 'fk_coo_cor'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_coordinate'::name, 'fk_coo_cos'::name, ARRAY['cos_id']);
SELECT index_owner_is('bde'::name, 'crs_coordinate'::name, 'fk_coo_cos'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_coordinate'::name, 'fk_coo_nod'::name, ARRAY['nod_id']);
SELECT index_owner_is('bde'::name, 'crs_coordinate'::name, 'fk_coo_nod'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_coordinate_sys'::name, 'fk_cos_cot'::name, ARRAY['cot_id']);
SELECT index_owner_is('bde'::name, 'crs_coordinate_sys'::name, 'fk_cos_cot'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_coordinate_sys'::name, 'fk_cos_dtm'::name, ARRAY['dtm_id']);
SELECT index_owner_is('bde'::name, 'crs_coordinate_sys'::name, 'fk_cos_dtm'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_estate_share'::name, 'fk_tle_ess'::name, ARRAY['ett_id']);
SELECT index_owner_is('bde'::name, 'crs_estate_share'::name, 'fk_tle_ess'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_legal_desc'::name, 'fk_lgd_ttl'::name, ARRAY['ttl_title_no']);
SELECT index_owner_is('bde'::name, 'crs_legal_desc'::name, 'fk_lgd_ttl'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_legal_desc_prl'::name, 'fk_rap_par'::name, ARRAY['par_id']);
SELECT index_owner_is('bde'::name, 'crs_legal_desc_prl'::name, 'fk_rap_par'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_legal_desc_prl'::name, 'fk_rap_rar'::name, ARRAY['lgd_id']);
SELECT index_owner_is('bde'::name, 'crs_legal_desc_prl'::name, 'fk_rap_rar'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_mark'::name, 'fk_mrk_nod'::name, ARRAY['nod_id']);
SELECT index_owner_is('bde'::name, 'crs_mark'::name, 'fk_mrk_nod'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_mark_name'::name, 'fk_mkn_mrk'::name, ARRAY['mrk_id']);
SELECT index_owner_is('bde'::name, 'crs_mark_name'::name, 'fk_mkn_mrk'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_mark_name'::name, 'idx_mkn_type_code'::name, ARRAY['type']);
SELECT index_owner_is('bde'::name, 'crs_mark_name'::name, 'idx_mkn_type_code'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_mark_name'::name, 'idx_mkn_type'::name, ARRAY['type']);
SELECT index_owner_is('bde'::name, 'crs_mark_name'::name, 'idx_mkn_type'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_mrk_phys_state'::name, 'fk_mps_mrk'::name, ARRAY['mrk_id']);
SELECT index_owner_is('bde'::name, 'crs_mrk_phys_state'::name, 'fk_mps_mrk'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_mrk_phys_state'::name, 'fk_mps_wrk'::name, ARRAY['wrk_id']);
SELECT index_owner_is('bde'::name, 'crs_mrk_phys_state'::name, 'fk_mps_wrk'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_node'::name, 'fk_nod_cos'::name, ARRAY['cos_id_official']);
SELECT index_owner_is('bde'::name, 'crs_node'::name, 'fk_nod_cos'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_node'::name, 'fk_nod_sit'::name, ARRAY['sit_id']);
SELECT index_owner_is('bde'::name, 'crs_node'::name, 'fk_nod_sit'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_node_works'::name, 'idx_now_purpose'::name, ARRAY['purpose']);
SELECT index_owner_is('bde'::name, 'crs_node_works'::name, 'idx_now_purpose'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_obs_accuracy'::name, 'fk_oba_obn2'::name, ARRAY['obn_id1']);
SELECT index_owner_is('bde'::name, 'crs_obs_accuracy'::name, 'fk_oba_obn2'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_observation'::name, 'fk_obn_cos'::name, ARRAY['cos_id']);
SELECT index_owner_is('bde'::name, 'crs_observation'::name, 'fk_obn_cos'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_observation'::name, 'fk_obn_obt'::name, ARRAY['obt_type, obt_sub_type']);
SELECT index_owner_is('bde'::name, 'crs_observation'::name, 'fk_obn_obt'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_observation'::name, 'fk_obn_stp1'::name, ARRAY['stp_id_local']);
SELECT index_owner_is('bde'::name, 'crs_observation'::name, 'fk_obn_stp1'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_observation'::name, 'fk_obn_vct'::name, ARRAY['vct_id']);
SELECT index_owner_is('bde'::name, 'crs_observation'::name, 'fk_obn_vct'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_ordinate_adj'::name, 'fk_orj_coo_output'::name, ARRAY['coo_id_output']);
SELECT index_owner_is('bde'::name, 'crs_ordinate_adj'::name, 'fk_orj_coo_output'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_ordinate_adj'::name, 'idx_orj_adj_coo'::name, ARRAY['adj_id, coo_id_output']);
SELECT index_owner_is('bde'::name, 'crs_ordinate_adj'::name, 'idx_orj_adj_coo'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_parcel_bndry'::name, 'fk_pab_lin'::name, ARRAY['lin_id']);
SELECT index_owner_is('bde'::name, 'crs_parcel_bndry'::name, 'fk_pab_lin'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_parcel_bndry'::name, 'fk_pab_pri'::name, ARRAY['pri_id']);
SELECT index_owner_is('bde'::name, 'crs_parcel_bndry'::name, 'fk_pab_pri'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_parcel_dimen'::name, 'fk_pdi_obn'::name, ARRAY['obn_id']);
SELECT index_owner_is('bde'::name, 'crs_parcel_dimen'::name, 'fk_pdi_obn'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_parcel_dimen'::name, 'fk_pdi_par'::name, ARRAY['par_id']);
SELECT index_owner_is('bde'::name, 'crs_parcel_dimen'::name, 'fk_pdi_par'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_parcel'::name, 'idx_par_nonsurvey_def'::name, ARRAY['nonsurvey_def']);
SELECT index_owner_is('bde'::name, 'crs_parcel'::name, 'idx_par_nonsurvey_def'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_parcel_ring'::name, 'fk_pri_par'::name, ARRAY['par_id']);
SELECT index_owner_is('bde'::name, 'crs_parcel_ring'::name, 'fk_pri_par'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_proprietor'::name, 'fk_ess_prp'::name, ARRAY['ets_id']);
SELECT index_owner_is('bde'::name, 'crs_proprietor'::name, 'fk_ess_prp'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_road_name_asc'::name, 'fk_rns_rcl'::name, ARRAY['rcl_id']);
SELECT index_owner_is('bde'::name, 'crs_road_name_asc'::name, 'fk_rns_rcl'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_road_name_asc'::name, 'fk_rns_rna'::name, ARRAY['rna_id']);
SELECT index_owner_is('bde'::name, 'crs_road_name_asc'::name, 'fk_rns_rna'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_setup'::name, 'fk_stp_wrk'::name, ARRAY['wrk_id']);
SELECT index_owner_is('bde'::name, 'crs_setup'::name, 'fk_stp_wrk'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_stat_act_parcl'::name, 'fk_sap_par'::name, ARRAY['par_id']);
SELECT index_owner_is('bde'::name, 'crs_stat_act_parcl'::name, 'fk_sap_par'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_street_address'::name, 'fk_sad_rna'::name, ARRAY['rna_id']);
SELECT index_owner_is('bde'::name, 'crs_street_address'::name, 'fk_sad_rna'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_sur_plan_ref'::name, 'fk_wrk_id'::name, ARRAY['wrk_id']);
SELECT index_owner_is('bde'::name, 'crs_sur_plan_ref'::name, 'fk_wrk_id'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_sys_code'::name, 'fk_sco_scg'::name, ARRAY['scg_code']);
SELECT index_owner_is('bde'::name, 'crs_sys_code'::name, 'fk_sco_scg'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_title_estate'::name, 'fk_ett_lgd'::name, ARRAY['lgd_id']);
SELECT index_owner_is('bde'::name, 'crs_title_estate'::name, 'fk_ett_lgd'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_title_estate'::name, 'fk_ttl_ett'::name, ARRAY['ttl_title_no']);
SELECT index_owner_is('bde'::name, 'crs_title_estate'::name, 'fk_ttl_ett'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_title_mem_text'::name, 'fk_tmt_ttm'::name, ARRAY['ttm_id']);
SELECT index_owner_is('bde'::name, 'crs_title_mem_text'::name, 'fk_tmt_ttm'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_title_mem_text'::name, 'tmt_col_1_text_idx'::name, ARRAY['col_1_text']);
SELECT index_owner_is('bde'::name, 'crs_title_mem_text'::name, 'tmt_col_1_text_idx'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_title'::name, 'fk_ttl_ped'::name, ARRAY['protect_end']);
SELECT index_owner_is('bde'::name, 'crs_title'::name, 'fk_ttl_ped'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_title'::name, 'fk_ttl_psd'::name, ARRAY['protect_start']);
SELECT index_owner_is('bde'::name, 'crs_title'::name, 'fk_ttl_psd'::name, 'bde_dba'::name);
SELECT has_index('bde'::name, 'crs_work'::name, 'fk_wrk_cos'::name, ARRAY['cos_id']);
SELECT index_owner_is('bde'::name, 'crs_work'::name, 'fk_wrk_cos'::name, 'bde_dba'::name);

-- }

