[![Build Status](https://secure.travis-ci.org/linz/linz-lds-bde-schema.svg)](http://travis-ci.org/linz/linz-lds-bde-schema)

LINZ LDS BDE Schemas
=================================

Provides the schemas and functions to generate the layers and tables that are available on the LDS:

* Simplified Property Ownership and Boundaries (lds.*): https://data.linz.govt.nz/data/category/property-ownership-boundaries/
* Simplified Geodetic (lds.geodetic_*): https://data.linz.govt.nz/data/category/geodetic/
* Full Landonline Dataset (aka bde_ext): https://data.linz.govt.nz/data/category/full-landonline-dataset/

Installation
------------

First install the project into the OS data share directory:

    sudo make install

Then in each target database you need to install the
[linz-bde-schema](https://github.com/linz/linz-bde-schema)
project;

Then you can load the schema into a target database

```shell
linz-lds-bde-schema-load $DB_NAME
```

If you would like to revision the table, add `--revision`
to the `linz-bde-schema-load` invocation:

```shell
linz-lds-bde-schema-load --revision $DB_NAME
```

Upgrade
-------

You can upgrade the schema in an existing database by following
the install procedure. The `linz-lds-bde-schema-load` script is able
to both install or upgrade databases.

Testing
-------

Testing is done using `pg_regress` and [PgTap](http://pgtap.org/).
To run the tests run the following command:

    make check

Building Debian packaging
--------------------------

Build the debian packages using the following command:

    dpkg-buildpackage -us -uc


Dependencies
------------

Requires [linz-bde-schema](https://github.com/linz/linz-bde-schema),
[table_version](https://github.com/linz/postgresql-tableversion),
[linz-postgresql-functions](https://github.com/linz/linz-postgresql-functions)
and [linz_bde_uploader](https://github.com/linz/linz_bde_uploader) packages

License
---------------------
This project is under 3-clause BSD License, except where otherwise specified.
See the LICENSE file for more details.
