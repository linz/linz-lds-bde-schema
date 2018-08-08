# Change Log

All notable changes for the LINZ LDS BDE schema are documented in
this file.

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
