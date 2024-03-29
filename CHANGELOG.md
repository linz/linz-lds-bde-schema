# Change Log

All notable changes for the LINZ LDS BDE schema are documented in this file.

## 1.15.2 - 2022-05-03

### Fixed

-   Release for Ubuntu Focal

## 1.15.1 (_broken_) - 2022-05-02

### Fixed

-   Force pushing changes to origin remote

## 1.15.0 - 2022-03-18

### Added

-   Support for Ubuntu 20.04/LTS and Python3

### Enhanced

-   Quality improvements

## 1.14.0 - 2022-01-13

### Fixed

-   Minor schema changes

## 1.13.0 - 2021-02-18

### Enhanced

-   Extended masking of title memorials

## 1.12.0 - 2021-01-05

### Added

-   Update of LDS Full Landonline Data Dictionary 2.6

### Fixed

-   Use proper FK in crs_ttl_inst_protect query
-   check crs_ttl_inst_protect table when launching FBDE maintenance

## 1.11.3 - 2020-09-15

### Fixed

-   Have changes in `crs_ttl_inst_protect` trigger FBDE maintenance (#244)

### Enhanced

-   Update schema documentation (#229)

## 1.11.2 - 2020-08-25

### Fixed

-   Foreign key use in encumbrancee name filtering (#240)

## 1.11.1 - 2020-07-21

### Enhanced

-   Encoded dependency on linz-bde-schema-1.11+

## 1.11.0 - 2020-07-14

### Added

-   LOL-3.22b: add support for filtering encumbrancee name

## 1.10.0 - 2020-05-05

### Enhanced

-   Do not hide errors from tableversion/dbpatch loaders (#209)
-   Do not require `pg_config` from schema loader (#216)
-   Only ALTER table on upgrade if really needed (#218)

## 1.9.0 - 2020-02-11

### Enhanced

-   Avoid TRUNCATE on empty tables (#206)

## 1.8.2 - 2020-02-04

### Fixed

-   Catch even more WACA adjustments (#174)

## 1.8.1 - 2020-01-29

### Fixed

-   Restore serial sequence ownership on upgrade (#196)
-   Catch more WACA adjustments (#174)

## 1.8.0 - 2019-11-13

### Changed

-   Schema loader does NOT load bde-uploader schema anymore (#192)
-   Serial field sequences now owned by their respective columns

### Enhanced

-   Lost tables and permissions now recovered upon schema loading (#190)

### Added

-   Switch --readonly to schema loader (#187)

## 1.7.0 - 2019-10-09

### Added

-   linz-lds-bde-schema-publish script (#176)
-   Build support for python3 (#181)

## 1.6.1 - 2019-08-14

### Fixed

-   Survey Observation layer should not contain negative distances or bearings (#170)

## 1.6.0 - 2019-07-30

### Enhanced

-   Reduce list of tables affecting simplified parcel layers (#165)
-   Use a DO block to bless functions, avoiding empty-lines in psql output
-   Deprecate `LDS_GetLandDistict` in favour of `LDS_GetLandDistrict` (#157)

## 1.5.0 - 2019-04-01

### Changed

-   Use NOTICE for progress report, rather than INFO (#144)
-   Do not mass-drop functions during upgades (#138)

### Enhanced

-   Standard output support for schema loader (#139)
-   Allow forcing simplified layers population (#154)

## Fixed

-   Presence of lines in the cadastral adjustment polygon layer (#146)
-   Support for legal description in SRS typed title records (#150)

## 1.4.0 - 2018-11-05

### Changed

-   Change `tmp_titles` table to use `desc` field instead of `char_value` from `bde`.`crs_sys_code`.
    Affects all `lds.title*` tables. (#125)

### Enhanced

-   Create no revision when versioning empty tables (#117)
-   Use full table path for table used in `tmp_title_parcel_associations` table population (#129)

## 1.3.0 - 2018-07-04

### Added

-   New --revision switch to schema loader, to enable versioning (#109)

### Changed

-   Stop changing `search_path` in the session loading enabler scripts (#95)
-   Make schema loader less noisy
-   Make schema loader use a single transaction

## 1.2.1 - 2018-06-20

## Fixed

-   Fix support for extension-less `table_version` usage (#102)

## 1.2.0 - 2018-04-09

### Added

-   Table comments (#57)

### Changed

-   Stop producing simplified electoral layers, dropping dependency on territorial admin boundary
    data (#4)
-   Add `ttl_inst_cmplte` table in `bde_ext` schema (#74)
-   Have loader install `unaccent` extension in public schema (#79)

## 1.1.0 - 2017-12-11

### Changed

-   Remove pre-allocated titles from full Landonline title table (#15)

### Added

-   New `linz-lds-bde-schema-load` script for easier install/upgrade

### Enhanced

-   Review immutable/stable/volatile flag on all defined functions
-   Embed revision info in all functions
-   Allow using more functions without `bde` in `search_path`

## 1.0.2 - 2016-09-13

### Fixed

-   Create survey tables and columns for pending parcels release
-   Ensure LDS BDE indexes are created in an idempotent way

## 1.0.1 - 2016-05-16

### Fixed

-   Fixed issue with old table differencing code

## [1.0.0] - 2016-05-05

### Added

-   Initial release of LDS BDE schema (now separated from `linz_bde_uploader` project)
