# Change Log

All notable changes for the LINZ LDS BDE schema are documented in
this file.

## 1.1.0dev - 2017-09-DD
### Added
- Review immutable/stable/volatile flag on all defined functions
- Embed revision info in all functions
- New `linz-lds-bde-schema-load` script for easier install/upgrade
- Allow using more functions without `bde` in `search_path`
### Changed
- Remove pre-allocated titles from full Landonline title table (#15)

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
