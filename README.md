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
    
Then you need to install the [linz-bde-schema](https://github.com/linz/linz-bde-schema)
project.

You can then execute the installed SQL files with something like:

```shell
for file in /usr/share/linz-lds-bde-schema/sql/*.sql
    do psql $DB_NAME -f $file -v ON_ERROR_STOP=1
done
```

If you would like to revision the tables then install the table_version extension
and then run the versioning SQL script:

```shell
psql $DB_NAME -c "CREATE EXTENSION table_version"
psql $DB_NAME -f /usr/share/linz-lds-bde-schema/sql/versioning/01-version_tables.sql
```

Testing
-------

Testing is done using pg_regress and PgTap. To run the tests run the following command:

	make test

Building Debian packaging
--------------------------

Build the debian packages using the following command:

    dpkg-buildpackage -us -uc


Dependencies
------------

Requires [linz-bde-schema](https://github.com/linz/linz-bde-schema) and
[linz-postgresql-functions](https://github.com/linz/linz-postgresql-functions) packages 

License
---------------------
This project is under 3-clause BSD License, except where otherwise specified.
See the LICENSE file for more details.