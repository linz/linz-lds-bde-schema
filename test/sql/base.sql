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

-- TODO: check lds tables and columns, functions, indexes etc.

SELECT * FROM finish();

ROLLBACK;

