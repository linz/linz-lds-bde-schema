# Change Log

All notable changes for the LINZ LDS BDE schema are documented in
this file.

## 1.8.0dev - 2019-MM-DD
### Enhanced
- Lost tables and permissions now recovered upon schema loading (#190)
### Added
- Switch --readonly to schema loader (#187)

## 1.7.0 - 2019-10-09
### Added
- linz-lds-bde-schema-publish script (#176)
- Build support for python3 (#181)

## 1.6.1 - 2019-08-14
### Fixed
- Survey Observation layer should not contain negative distances
  or bearings (#170)

## 1.6.0 - 2019-07-30
### Enhanced
- Reduce list of tables affecting simplified parcel layers (#165)
- Use a DO block to bless functions, avoiding empty-lines in psql output
- Deprecate `LDS_GetLandDistict` in favour of `LDS_GetLandDistrict` (#157)

## 1.5.0 - 2019-04-01
### Changed
- Use NOTICE for progress report, rather than INFO (#144)
- Do not mass-drop functions during upgades (#138)
### Enhanced
- Standard output support for schema loader (#139)
- Allow forcing simplified layers population (#154)
## Fixed
- Presence of lines in the cadastral adjustment polygon layer (#146)
- Support for legal description in SRS typed title records (#150)

## 1.4.0 - 2018-11-05
### Changed
- Change `tmp_titles` table to use `desc` field instead of `char_value`
  from `bde`.`crs_sys_code`. Affects all `lds.title*` tables. (#125)
### Enhanced
- Create no revision when versioning empty tables (#117)
- Use full table path for table used in `tmp_title_parcel_associations`
  table population (#129)

## 1.3.0 - 2018-07-04
### Added
- New --revision switch to schema loader, to enable versioning (#109)
### Changed
- Stop changing `search_path` in the session loading enabler
  scripts (#95)
- Make schema loader less noisy
- Make schema loader use a single transaction

## 1.2.1 - 2018-06-20
## Fixed
- Fix support for extension-less `table_version` usage (#102)

## 1.2.0 - 2018-04-09
### Added
- Table comments (#57)
### Changed
- Stop producing simplified electoral layers, dropping dependency
  on territorial admin boundary data (#4)
- Add `ttl_inst_cmplte` table in `bde_ext` schema (#74)
- Have loader install `unaccent` extension in public schema (#79)

## 1.1.0 - 2017-12-11
### Changed
- Remove pre-allocated titles from full Landonline title table (#15)
### Added
- New `linz-lds-bde-schema-load` script for easier install/upgrade
### Enhanced
- Review immutable/stable/volatile flag on all defined functions
- Embed revision info in all functions
- Allow using more functions without `bde` in `search_path`

## 1.0.2 - 2016-09-13
### Fixed
- Create survey tables and columns for pending parcels release
- Ensure LDS BDE indexes are created in an idempotent way

## 1.0.1 - 2016-05-16
### Fixed
- Fixed issue with old table differencing code

## [1.0.0] - 2016-05-05
### Added
- Initial release of LDS BDE schema (now separated from
  `linz_bde_uploader` project)
