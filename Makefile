# Minimal script to install the SQL creation scripts ready for postinst script.

VERSION=1.1.0dev
REVISION=$(shell test -d .git && which git > /dev/null && git describe --always)

SED = sed

datadir=${DESTDIR}/usr/share/linz-lds-bde-schema
bindir=${DESTDIR}/usr/bin

#
# Uncoment these line to support testing via pg_regress
#

PG_CONFIG    = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
PG_REGRESS := $(dir $(PGXS))../../src/test/regress/pg_regress

SQLSCRIPTS = \
  sql/01-lds_layer_tables.sql \
  sql/02-lds_bde_schema_index.sql \
  sql/04-lds_layer_functions.sql \
  sql/05-bde_ext_schema.sql \
  sql/06-bde_ext_functions.sql \
  sql/07-lds_version.sql \
  sql/99-patches.sql \
  sql/versioning/01-version_tables.sql
  $(END)

SCRIPTS = \
    scripts/linz-lds-bde-schema-load \
    $(END)

EXTRA_CLEAN = \
    sql/04-lds_layer_functions.sql \
    sql/06-bde_ext_functions.sql \
    sql/07-lds_version.sql \
    $(END)

.dummy:

all: $(SQLSCRIPTS)

%.sql: %.sql.in
	$(SED) -e 's/@@VERSION@@/$(VERSION)/;s/@@REVISION@@/$(REVISION)/' $< > $@

install: $(SQLSCRIPTS) $(SCRIPTS)
	mkdir -p ${datadir}/sql
	cp sql/*.sql ${datadir}/sql
	mkdir -p ${datadir}/sql/versioning
	cp sql/versioning/*.sql ${datadir}/sql/versioning
	mkdir -p ${bindir}
	cp $(SCRIPTS) ${bindir}

uninstall:
	rm -rf ${datadir}

check test: $(SQLSCRIPTS)
	${PG_REGRESS} \
   --inputdir=./ \
   --inputdir=test \
   --load-language=plpgsql \
	 --load-extension=postgis \
	 --load-extension=unaccent \
	 --load-extension=table_version \
   --dbname=regression base

clean:
	rm -f regression.diffs
	rm -f regression.out
	rm -rf results
	rm -f $(EXTRA_CLEAN)
