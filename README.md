LINZ LDS BDE Schemas
=================================

Provides the schemas and functions to generate the layers and tables that are available on the LDS:

* Simplified Property Ownership and Boundaries (lds.*): https://data.linz.govt.nz/data/category/property-ownership-boundaries/
* Simplified Geodetic (lds.geodetic_*): https://data.linz.govt.nz/data/category/geodetic/
* Full Landonline Dataset (aka bde_ext): https://data.linz.govt.nz/data/category/full-landonline-dataset/

Installation
------------

    sudo make install
    
You can then execute the installed SQL file with something like:
    
    for file in /usr/share/linz-lds-bde-schema/*.sql
        do psql $DATABASE_NAME -f $file
    done

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