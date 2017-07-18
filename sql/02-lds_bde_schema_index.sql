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
SET search_path = bde, public;


DO $SCHEMA$
BEGIN

IF NOT EXISTS (SELECT * FROM pg_namespace where LOWER(nspname) = 'bde') THEN
    RAISE EXCEPTION 'BDE schema is not installed';
END IF;

DROP TABLE IF EXISTS tmp_bde_index;
CREATE TEMP TABLE tmp_bde_index AS
SELECT relname FROM pg_class c JOIN pg_namespace n ON n.oid=c.relnamespace
WHERE n.nspname='bde' and c.relkind='i';

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_adj_adm') THEN
    RAISE NOTICE 'Building fk_adj_adm';
    CREATE INDEX fk_adj_adm ON crs_adjustment_run USING btree (adm_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_adj_wrk') THEN
    RAISE NOTICE 'Building fk_adj_wrk';
    CREATE INDEX fk_adj_wrk ON crs_adjustment_run USING btree (wrk_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_afp_par') THEN
    RAISE NOTICE 'Building fk_afp_par';
    CREATE INDEX fk_afp_par ON crs_affected_parcl USING btree (par_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_afp_sur') THEN
    RAISE NOTICE 'Building fk_afp_sur';
    CREATE INDEX fk_afp_sur ON crs_affected_parcl USING btree (sur_wrk_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_app_par') THEN
    RAISE NOTICE 'Building fk_app_par';
    CREATE INDEX fk_app_par ON crs_appellation USING btree (par_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_coo_cor') THEN
    RAISE NOTICE 'Building fk_coo_cor';
    CREATE INDEX fk_coo_cor ON crs_coordinate USING btree (cor_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_coo_cos') THEN
    RAISE NOTICE 'Building fk_coo_cos';
    CREATE INDEX fk_coo_cos ON crs_coordinate USING btree (cos_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_coo_nod') THEN
    RAISE NOTICE 'Building fk_coo_nod';
    CREATE INDEX fk_coo_nod ON crs_coordinate USING btree (nod_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_cos_cot') THEN
    RAISE NOTICE 'Building fk_cos_cot';
    CREATE INDEX fk_cos_cot ON crs_coordinate_sys USING btree (cot_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_cos_dtm') THEN
    RAISE NOTICE 'Building fk_cos_dtm';
    CREATE INDEX fk_cos_dtm ON crs_coordinate_sys USING btree (dtm_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_tle_ess') THEN
    RAISE NOTICE 'Building fk_tle_ess';
    CREATE INDEX fk_tle_ess ON crs_estate_share USING btree (ett_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_lgd_ttl') THEN
    RAISE NOTICE 'Building fk_lgd_ttl';
    CREATE INDEX fk_lgd_ttl ON crs_legal_desc USING btree (ttl_title_no);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_rap_par') THEN
    RAISE NOTICE 'Building fk_rap_par';
    CREATE INDEX fk_rap_par ON crs_legal_desc_prl USING btree (par_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_rap_rar') THEN
    RAISE NOTICE 'Building fk_rap_rar';
    CREATE INDEX fk_rap_rar ON crs_legal_desc_prl USING btree (lgd_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_mrk_nod') THEN
    RAISE NOTICE 'Building fk_mrk_nod';
    CREATE INDEX fk_mrk_nod ON crs_mark USING btree (nod_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_mkn_mrk') THEN
    RAISE NOTICE 'Building fk_mkn_mrk';
    CREATE INDEX fk_mkn_mrk ON crs_mark_name USING btree (mrk_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='idx_mkn_type_code') THEN
    RAISE NOTICE 'Building idx_mkn_type_code';
    CREATE INDEX idx_mkn_type_code ON crs_mark_name USING btree (type) WHERE "type" = 'CODE';
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='idx_mkn_type') THEN
    RAISE NOTICE 'Building idx_mkn_type';
    CREATE INDEX idx_mkn_type ON crs_mark_name USING btree ("type");
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_mps_mrk') THEN
    RAISE NOTICE 'Building fk_mps_mrk';
    CREATE INDEX fk_mps_mrk ON crs_mrk_phys_state USING btree (mrk_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_mps_wrk') THEN
    RAISE NOTICE 'Building fk_mps_wrk';
    CREATE INDEX fk_mps_wrk ON crs_mrk_phys_state USING btree (wrk_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_nod_cos') THEN
    RAISE NOTICE 'Building fk_nod_cos';
    CREATE INDEX fk_nod_cos ON crs_node USING btree (cos_id_official);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_nod_sit') THEN
    RAISE NOTICE 'Building fk_nod_sit';
    CREATE INDEX fk_nod_sit ON crs_node USING btree (sit_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='idx_now_purpose') THEN
    RAISE NOTICE 'Building idx_now_purpose';
    CREATE INDEX idx_now_purpose ON crs_node_works USING btree (purpose);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_oba_obn2') THEN
    RAISE NOTICE 'Building fk_oba_obn2';
    CREATE INDEX fk_oba_obn2 ON crs_obs_accuracy USING btree (obn_id1);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_obn_cos') THEN
    RAISE NOTICE 'Building fk_obn_cos';
    CREATE INDEX fk_obn_cos ON crs_observation USING btree (cos_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_obn_obt') THEN
    RAISE NOTICE 'Building fk_obn_obt';
    CREATE INDEX fk_obn_obt ON crs_observation USING btree (obt_type, obt_sub_type);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_obn_stp1') THEN
    RAISE NOTICE 'Building fk_obn_stp1';
    CREATE INDEX fk_obn_stp1 ON crs_observation USING btree (stp_id_local);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_obn_vct') THEN
    RAISE NOTICE 'Building fk_obn_vct';
    CREATE INDEX fk_obn_vct ON crs_observation USING btree (vct_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_orj_coo_output') THEN
    RAISE NOTICE 'Building fk_orj_coo_output';
    CREATE INDEX fk_orj_coo_output ON crs_ordinate_adj USING btree (coo_id_output);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='idx_orj_adj_coo') THEN
    RAISE NOTICE 'Building idx_orj_adj_coo';
    CREATE INDEX idx_orj_adj_coo ON crs_ordinate_adj USING btree (adj_id, coo_id_output);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='idx_par_nonsurvey_def') THEN
    RAISE NOTICE 'Building idx_par_nonsurvey_def';
    CREATE INDEX idx_par_nonsurvey_def ON crs_parcel USING btree (nonsurvey_def);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_pab_lin') THEN
    RAISE NOTICE 'Building fk_pab_lin';
    CREATE INDEX fk_pab_lin ON crs_parcel_bndry USING btree (lin_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_pab_pri') THEN
    RAISE NOTICE 'Building fk_pab_pri';
    CREATE INDEX fk_pab_pri ON crs_parcel_bndry USING btree (pri_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_pdi_obn') THEN
    RAISE NOTICE 'Building fk_pdi_obn';
    CREATE INDEX fk_pdi_obn ON crs_parcel_dimen USING btree (obn_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_pdi_par') THEN
    RAISE NOTICE 'Building fk_pdi_par';
    CREATE INDEX fk_pdi_par ON crs_parcel_dimen USING btree (par_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_pri_par') THEN
    RAISE NOTICE 'Building fk_pri_par';
    CREATE INDEX fk_pri_par ON crs_parcel_ring USING btree (par_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_ess_prp') THEN
    RAISE NOTICE 'Building fk_ess_prp';
    CREATE INDEX fk_ess_prp ON crs_proprietor USING btree (ets_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_rns_rcl') THEN
    RAISE NOTICE 'Building fk_rns_rcl';
    CREATE INDEX fk_rns_rcl ON crs_road_name_asc USING btree (rcl_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_rns_rna') THEN
    RAISE NOTICE 'Building fk_rns_rna';
    CREATE INDEX fk_rns_rna ON crs_road_name_asc USING btree (rna_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_stp_wrk') THEN
    RAISE NOTICE 'Building fk_stp_wrk';
    CREATE INDEX fk_stp_wrk ON crs_setup USING btree (wrk_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_sap_par') THEN
    RAISE NOTICE 'Building fk_sap_par';
    CREATE INDEX fk_sap_par ON crs_stat_act_parcl USING btree (par_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_sad_rna') THEN
    RAISE NOTICE 'Building fk_sad_rna';
    CREATE INDEX fk_sad_rna ON crs_street_address USING btree (rna_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_wrk_id') THEN
    RAISE NOTICE 'Building fk_wrk_id';
    CREATE INDEX fk_wrk_id ON crs_sur_plan_ref USING btree (wrk_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_sco_scg') THEN
    RAISE NOTICE 'Building fk_sco_scg';
    CREATE INDEX fk_sco_scg ON crs_sys_code USING btree (scg_code);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_ttl_psd') THEN
    RAISE NOTICE 'Building fk_ttl_psd';
    CREATE INDEX fk_ttl_psd ON crs_title USING btree (protect_start);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_ttl_ped') THEN
    RAISE NOTICE 'Building fk_ttl_ped';
    CREATE INDEX fk_ttl_ped ON crs_title USING btree (protect_end);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_ett_lgd') THEN
    RAISE NOTICE 'Building fk_ett_lgd';
    CREATE INDEX fk_ett_lgd ON crs_title_estate USING btree (lgd_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_ttl_ett') THEN
    RAISE NOTICE 'Building fk_ttl_ett';
    CREATE INDEX fk_ttl_ett ON crs_title_estate USING btree (ttl_title_no);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_tmt_ttm') THEN
    RAISE NOTICE 'Building fk_tmt_ttm';
    CREATE INDEX fk_tmt_ttm ON crs_title_mem_text USING btree (ttm_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='tmt_col_1_text_idx') THEN
    RAISE NOTICE 'Building tmt_col_1_text_idx';
    CREATE INDEX tmt_col_1_text_idx ON crs_title_mem_text (col_1_text);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_wrk_cos') THEN
    RAISE NOTICE 'Building fk_wrk_cos';
    CREATE INDEX fk_wrk_cos ON crs_work USING btree (cos_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='ak_ctpa_ttlpar') THEN
    RAISE NOTICE 'Building ak_ctpa_ttlpar';
    CREATE UNIQUE INDEX ak_ctpa_ttlpar ON cbe_title_parcel_association USING btree (ttl_title_no, par_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='ak_ctpa_ttlpar1') THEN
    RAISE NOTICE 'Building ak_ctpa_ttlpar1';
    CREATE UNIQUE INDEX ak_ctpa_ttlpar1 ON cbe_title_parcel_association USING btree (par_id, ttl_title_no, status);
END IF;

END;
$SCHEMA$;
