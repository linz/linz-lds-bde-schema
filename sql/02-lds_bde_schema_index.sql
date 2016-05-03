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
-- BDE indexes required for LDS BDE processing
--------------------------------------------------------------------------------
SET client_min_messages TO WARNING;
SET search_path = bde, public;


DO $SCHEMA$
BEGIN

IF NOT EXISTS (SELECT * FROM pg_namespace where LOWER(nspname) = 'bde') THEN
    RAISE EXCEPTION 'BDE schema is not installed';
END IF;

-- Check if indexes have been installed already
IF EXISTS (
    SELECT *
    FROM   pg_class c
    JOIN   pg_namespace n ON n.oid = c.relnamespace
    WHERE  c.relname = 'fk_adj_adm'
    AND    n.nspname = 'bde'
    AND    c.relkind = 'i'
) THEN
    RETURN;
END IF;

CREATE INDEX fk_adj_adm ON crs_adjustment_run USING btree (adm_id);
CREATE INDEX fk_adj_wrk ON crs_adjustment_run USING btree (wrk_id);
CREATE INDEX fk_afp_par ON crs_affected_parcl USING btree (par_id);
CREATE INDEX fk_afp_sur ON crs_affected_parcl USING btree (sur_wrk_id);
CREATE INDEX fk_app_par ON crs_appellation USING btree (par_id);
CREATE INDEX fk_coo_cor ON crs_coordinate USING btree (cor_id);
CREATE INDEX fk_coo_cos ON crs_coordinate USING btree (cos_id);
CREATE INDEX fk_coo_nod ON crs_coordinate USING btree (nod_id);
CREATE INDEX fk_cos_cot ON crs_coordinate_sys USING btree (cot_id);
CREATE INDEX fk_cos_dtm ON crs_coordinate_sys USING btree (dtm_id);
CREATE INDEX fk_tle_ess ON crs_estate_share USING btree (ett_id);
CREATE INDEX fk_lgd_ttl ON crs_legal_desc USING btree (ttl_title_no);
CREATE INDEX fk_rap_par ON crs_legal_desc_prl USING btree (par_id);
CREATE INDEX fk_rap_rar ON crs_legal_desc_prl USING btree (lgd_id);
CREATE INDEX fk_mrk_nod ON crs_mark USING btree (nod_id);
CREATE INDEX fk_mkn_mrk ON crs_mark_name USING btree (mrk_id);
CREATE INDEX idx_mkn_type_code ON crs_mark_name USING btree (type) WHERE UPPER(type) = 'CODE';
CREATE INDEX idx_mkn_type ON crs_mark_name USING btree ("type");
CREATE INDEX fk_mps_mrk ON crs_mrk_phys_state USING btree (mrk_id);
CREATE INDEX fk_mps_wrk ON crs_mrk_phys_state USING btree (wrk_id);
CREATE INDEX fk_nod_cos ON crs_node USING btree (cos_id_official);
CREATE INDEX fk_nod_sit ON crs_node USING btree (sit_id);
CREATE INDEX idx_now_purpose ON crs_node_works USING btree (purpose);
CREATE INDEX fk_oba_obn2 ON crs_obs_accuracy USING btree (obn_id1);
CREATE INDEX fk_obn_cos ON crs_observation USING btree (cos_id);
CREATE INDEX fk_obn_obt ON crs_observation USING btree (obt_type, obt_sub_type);
CREATE INDEX fk_obn_stp1 ON crs_observation USING btree (stp_id_local);
CREATE INDEX fk_obn_vct ON crs_observation USING btree (vct_id);
CREATE INDEX fk_orj_coo_output ON crs_ordinate_adj USING btree (coo_id_output);
CREATE INDEX idx_orj_adj_coo ON crs_ordinate_adj USING btree (adj_id, coo_id_output);
CREATE INDEX idx_par_nonsurvey_def ON crs_parcel USING btree (nonsurvey_def);
CREATE INDEX fk_pab_lin ON crs_parcel_bndry USING btree (lin_id);
CREATE INDEX fk_pab_pri ON crs_parcel_bndry USING btree (pri_id);
CREATE INDEX fk_pdi_obn ON crs_parcel_dimen USING btree (obn_id);
CREATE INDEX fk_pdi_par ON crs_parcel_dimen USING btree (par_id);
CREATE INDEX fk_pri_par ON crs_parcel_ring USING btree (par_id);
CREATE INDEX fk_ess_prp ON crs_proprietor USING btree (ets_id);
CREATE INDEX fk_rns_rcl ON crs_road_name_asc USING btree (rcl_id);
CREATE INDEX fk_rns_rna ON crs_road_name_asc USING btree (rna_id);
CREATE INDEX fk_stp_wrk ON crs_setup USING btree (wrk_id);
CREATE INDEX fk_sap_par ON crs_stat_act_parcl USING btree (par_id);
CREATE INDEX fk_sad_rna ON crs_street_address USING btree (rna_id);
CREATE INDEX fk_wrk_id ON crs_sur_plan_ref USING btree (wrk_id);
CREATE INDEX fk_sco_scg ON crs_sys_code USING btree (scg_code);
CREATE INDEX fk_ttl_psd ON crs_title USING btree (protect_start);
CREATE INDEX fk_ttl_ped ON crs_title USING btree (protect_end);
CREATE INDEX fk_ett_lgd ON crs_title_estate USING btree (lgd_id);
CREATE INDEX fk_ttl_ett ON crs_title_estate USING btree (ttl_title_no);
CREATE INDEX fk_tmt_ttm ON crs_title_mem_text USING btree (ttm_id);
CREATE INDEX fk_wrk_cos ON crs_work USING btree (cos_id);
CREATE UNIQUE INDEX ak_ctpa_ttlpar ON cbe_title_parcel_association USING btree (ttl_title_no, par_id);
CREATE UNIQUE INDEX ak_ctpa_ttlpar1 ON cbe_title_parcel_association USING btree (par_id, ttl_title_no, status);

END;
$SCHEMA$;
