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
-- Provide unit testing for LINZ BDE SCHEMA using pgTAP
--------------------------------------------------------------------------------
\set ECHO none
\set QUIET true
\set VERBOSITY verbose
\pset format unaligned
\pset tuples_only true

SET client_min_messages TO WARNING;

BEGIN;

CREATE EXTENSION pgtap;

--SELECT plan(1);
SELECT * FROM no_plan();

--SELECT * FROM finish();

ROLLBACK;

