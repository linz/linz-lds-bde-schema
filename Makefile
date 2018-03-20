# Minimal script to install the SQL creation scripts ready for postinst script.

VERSION=1.2.0dev
REVISION=$(shell test -d .git && which git > /dev/null && git describe --always)

SED = sed

datadir=${DESTDIR}/usr/share/linz-lds-bde-schema
bindir=${DESTDIR}/usr/bin

#
# Uncoment these line to support testing via pg_regress
#

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

SQLSCRIPTS_built = \
    sql/04-lds_layer_functions.sql \
    sql/06-bde_ext_functions.sql \
    sql/07-lds_version.sql \
    $(END)

SCRIPTS_built = \
    scripts/linz-lds-bde-schema-load \

EXTRA_CLEAN = \
    $(SQLSCRIPTS_built) \
    $(END)

.dummy:

all: $(SQLSCRIPTS) $(SCRIPTS_built)

%.sql: %.sql.in
	$(SED) -e 's/@@VERSION@@/$(VERSION)/;s|@@REVISION@@|$(REVISION)|' $< > $@

scripts/linz-lds-bde-schema-load: scripts/linz-lds-bde-schema-load.in Makefile
	$(SED) -e 's|@@SQLSCRIPTS@@|$(SQLSCRIPTS) $(SQLSCRIPTS_built)|' \
	       -e 's|@@VERSION@@|$(VERSION)|g' \
           -e 's|@@REVISION@@|$(REVISION)|g' \
           $< > $@
	chmod +x $@

install: $(SQLSCRIPTS) $(SQLSCRIPTS_built) $(SCRIPTS_built)
	mkdir -p ${datadir}/sql
	cp sql/*.sql ${datadir}/sql
	mkdir -p ${datadir}/sql/versioning
	cp sql/versioning/*.sql ${datadir}/sql/versioning
	mkdir -p ${bindir}
	cp $(SCRIPTS_built) ${bindir}

uninstall:
	rm -rf ${datadir}

check test: $(SQLSCRIPTS) $(SQLSCRIPTS_built)
	export PGDATABASE=regress_linz_lds_bde_schema; \
	dropdb --if-exists $$PGDATABASE; \
	createdb $$PGDATABASE; \
	pg_prove test/

clean:
	rm -f regression.diffs
	rm -f regression.out
	rm -rf results
	rm -f $(EXTRA_CLEAN)

installcheck:

	dropdb --if-exists linz-lds-bde-schema-test-db

	createdb linz-lds-bde-schema-test-db
	linz-bde-schema-load linz-lds-bde-schema-test-db
	linz-lds-bde-schema-load linz-lds-bde-schema-test-db
	export PGDATABASE=linz-lds-bde-schema-test-db; \
	V=`psql -XtAc 'select lds.lds_version()'` && \
	echo $$V && test "$$V" = "$(VERSION)" && \
	V=`linz-lds-bde-schema-load --version` && \
	echo $$V && test `echo "$$V" | awk '{print $$1}'` = "$(VERSION)"
	dropdb linz-lds-bde-schema-test-db

	createdb linz-lds-bde-schema-test-db
	linz-bde-schema-load --noextension linz-lds-bde-schema-test-db
	linz-lds-bde-schema-load --noextension linz-lds-bde-schema-test-db
	export PGDATABASE=linz-lds-bde-schema-test-db; \
	V=`psql -XtAc 'select lds.lds_version()'` && \
	echo $$V && test "$$V" = "$(VERSION)" && \
	V=`linz-lds-bde-schema-load --version` && \
	echo $$V && test `echo "$$V" | awk '{print $$1}'` = "$(VERSION)"
	dropdb linz-lds-bde-schema-test-db
