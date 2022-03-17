# Minimal script to install the SQL creation scripts ready for postinst script.

VERSION=1.14.0
REVISION=$(shell test -d .git && which git > /dev/null && git describe --always)

SED = sed
TEST_DB=linz-lds-bde-schema-test-db
LDS_TABLES=45
BDE_EXT_TABLES=47

IMAGES=$(shell find doc/models -name '*.png')

datadir=${DESTDIR}/usr/share/linz-lds-bde-schema
bindir=${DESTDIR}/usr/bin

#
# Uncoment these line to support testing via pg_regress
#

SQLSCRIPTS = \
  sql/01-lds_layer_tables.sql \
  sql/02-lds_bde_schema_index.sql \
  sql/05-bde_ext_schema.sql \
  sql/90-patches.sql \
  sql/versioning/01-version_tables.sql \
  $(END)

SQLSCRIPTS_built = \
    sql/04-lds_layer_functions.sql \
    sql/06-bde_ext_functions.sql \
    sql/07-lds_version.sql \
    sql/95-lds_comments.sql \
    $(END)

SCRIPTS_built = \
    scripts/linz-lds-bde-schema-load \
    scripts/linz-lds-bde-schema-publish \
    $(END)


EXTRA_CLEAN = \
    $(SCRIPTS_built) \
    $(SQLSCRIPTS_built) \
    $(DOCS_built) \
    $(END)

DOCS_built = \
    doc/lds-full-landonline-data-dictionary-and-models.pdf \
    doc/lds-full-landonline-data-dictionary-and-models-rtd.md \
    doc/property-and-ownership-simplified-tables-data-dictionary.pdf \
    doc/property-and-ownership-simplified-tables-data-dictionary-rtd.md \
    $(END)

.dummy:


all: $(SQLSCRIPTS) $(SQLSCRIPTS_built) $(SCRIPTS_built)

%.sql: %.sql.in
	$(SED) -e 's/@@VERSION@@/$(VERSION)/;s|@@REVISION@@|$(REVISION)|' $< > $@

scripts/linz-lds-bde-schema-load: scripts/linz-lds-bde-schema-load.bash Makefile
	$(SED) -e 's|@@SQLSCRIPTS@@|$(SQLSCRIPTS)$(SQLSCRIPTS_built)|' \
	       -e 's|@@VERSION@@|$(VERSION)|g' \
           -e 's|@@REVISION@@|$(REVISION)|g' \
           $< > $@
	chmod +x $@

scripts/linz-lds-bde-schema-publish: scripts/linz-lds-bde-schema-publish.bash Makefile
	$(SED) -e 's|@@SQLSCRIPTS@@|$(SQLSCRIPTS)$(SQLSCRIPTS_built)|' \
	       -e 's|@@VERSION@@|$(VERSION)|g' \
           -e 's|@@REVISION@@|$(REVISION)|g' \
           $< > $@
	chmod +x $@

sql/95-lds_comments.sql: doc/tools/comment_extraction.py \
		      doc/lds-full-landonline-data-dictionary-and-models.md \
		      doc/property-and-ownership-simplified-tables-data-dictionary.md
	rm -f sql/95-lds_comments.sql
	python3 $< doc/lds-full-landonline-data-dictionary-and-models.md > $@
	python3 $< doc/property-and-ownership-simplified-tables-data-dictionary.md >> $@

install: $(SQLSCRIPTS) $(SCRIPTS_built)
	mkdir -p ${datadir}/sql
	cp sql/*.sql ${datadir}/sql
	mkdir -p ${datadir}/sql/versioning
	cp sql/versioning/*.sql ${datadir}/sql/versioning
	mkdir -p ${bindir}
	cp $(SCRIPTS_built) ${bindir}

uninstall:
	rm -rf ${datadir}

check test: $(SQLSCRIPTS) check-docs check-generic check-noextension

check-generic:
	export PGDATABASE=regress_linz_lds_bde_schema && \
	dropdb --if-exists $$PGDATABASE && \
	createdb $$PGDATABASE && \
	linz-bde-schema-load $$SCHEMA_LOAD_OPTS $$PGDATABASE && \
	linz-bde-uploader-schema-load $$SCHEMA_LOAD_OPTS $$PGDATABASE && \
	pg_prove test/

check-noextension:
	SCHEMA_LOAD_OPTS="--noextension" make check-generic

clean:
	rm -f regression.diffs
	rm -f regression.out
	rm -rf results
	rm -f $(EXTRA_CLEAN)

check-publisher:

	export PGDATABASE=$(TEST_DB); \
	V=`linz-lds-bde-schema-publish --version` && \
	echo $$V && test `echo "$$V" | awk '{print $$1}'` = "$(VERSION)"

	test/test-publication.bash

loader-version-test:

	export PGDATABASE=$(TEST_DB); \
	V=`linz-lds-bde-schema-load --version` && \
	echo $$V && test `echo "$$V" | awk '{print $$1}'` = "$(VERSION)"

prepared-db-simple-test:

	export PGDATABASE=$(TEST_DB); \
	V=`psql -XtAc 'select lds.lds_version()'` && \
	echo $$V && test "$$V" = "$(VERSION)"


prepared-db-revision-test:

	@export PGDATABASE=$(TEST_DB); \
	V=`psql -XtAc "select count(*) from \
        table_version.versioned_tables where schema_name = 'lds'"` && \
	test "$$V" = "$(LDS_TABLES)" || { \
        echo "Versioned tables in LDS schema are $$V, expected $(LDS_TABLES)" >&2; \
        false; \
    }

	@export PGDATABASE=$(TEST_DB); \
	V=`psql -XtAc "select count(*) from \
        table_version.versioned_tables where schema_name = 'bde_ext'"` && \
	test "$$V" = "$(BDE_EXT_TABLES)" || { \
        echo "Versioned tables in BDE_EXT schema are $$V, expected $(BDE_EXT_TABLES)" >&2; \
        false; \
    }

load-schema:

	if test "${SCHEMA_LOAD_USE_STDOUT}" = 1; then \
	    linz-lds-bde-schema-load $(SCHEMA_LOAD_OPTS) - | \
            psql --set ON_ERROR_STOP=1 -Xo /dev/null $(TEST_DB); \
    else \
        linz-lds-bde-schema-load $(SCHEMA_LOAD_OPTS) $(TEST_DB); \
    fi

installcheck-stdout:
	$(MAKE) installcheck SCHEMA_LOAD_USE_STDOUT=1

installcheck:

	$(MAKE) loader-version-test

	dropdb --if-exists $(TEST_DB)

    #
    # Default install
    #
	createdb $(TEST_DB)
	linz-bde-schema-load $(TEST_DB)
    # Load schema
	$(MAKE) load-schema
	$(MAKE) prepared-db-simple-test
    # Load schema again (upgrade)
	linz-lds-bde-schema-load $(TEST_DB)
	$(MAKE) prepared-db-simple-test
	$(MAKE) prepared-db-revision-test LDS_TABLES=0 BDE_EXT_TABLES=0
    # Drop DB
	dropdb $(TEST_DB)

    #
    # Default revisioned install
    #
	createdb $(TEST_DB)
	linz-bde-schema-load $(TEST_DB)
    # Load schema
	$(MAKE) load-schema SCHEMA_LOAD_OPTS="--revision"
	#linz-lds-bde-schema-load --revision $(TEST_DB)
	$(MAKE) prepared-db-simple-test
	$(MAKE) prepared-db-revision-test
    # Drop DB
	dropdb $(TEST_DB)

    #
    # Extension-less install
    #
	createdb $(TEST_DB)
	linz-bde-schema-load --noextension $(TEST_DB)
    # Load schema
	$(MAKE) load-schema SCHEMA_LOAD_OPTS="--noextension"
	$(MAKE) prepared-db-simple-test
    # Load schema again (upgrade)
	linz-lds-bde-schema-load --noextension $(TEST_DB)
	$(MAKE) prepared-db-simple-test
	$(MAKE) prepared-db-revision-test LDS_TABLES=0 BDE_EXT_TABLES=0
	dropdb $(TEST_DB)

    #
    # Extension-less revisioned install
    #
	createdb $(TEST_DB)
	linz-bde-schema-load --noextension $(TEST_DB)
    # Load schema
	$(MAKE) load-schema SCHEMA_LOAD_OPTS="--noextension --revision"
	$(MAKE) prepared-db-simple-test
	$(MAKE) prepared-db-revision-test
	dropdb $(TEST_DB)

docs: $(DOCS_built)

check-docs: doc/tools/markdown_validation.py
	python3 $< doc/lds-full-landonline-data-dictionary-and-models.md
	python3 $< doc/property-and-ownership-simplified-tables-data-dictionary.md

install-docs: $(DOCS_built)
	mkdir -p ${datadir}/docs
	cp $(DOCS_built) ${datadir}/docs

doc/lds-full-landonline-data-dictionary-and-models.pdf: \
    doc/tools/markdown-to-pdf-conversion.bash \
    doc/lds-full-landonline-data-dictionary-and-models.md \
    $(IMAGES)
	bash $< doc/lds-full-landonline-data-dictionary-and-models.md $@

doc/property-and-ownership-simplified-tables-data-dictionary.pdf: \
    doc/tools/markdown-to-pdf-conversion.bash \
    doc/property-and-ownership-simplified-tables-data-dictionary.md \
    $(IMAGES)
	bash $< doc/property-and-ownership-simplified-tables-data-dictionary.md $@

doc/lds-full-landonline-data-dictionary-and-models-rtd.md: \
    doc/tools/markdown-to-commonmark-conversion.bash \
    doc/lds-full-landonline-data-dictionary-and-models.md
	bash $< doc/lds-full-landonline-data-dictionary-and-models.md $@

doc/property-and-ownership-simplified-tables-data-dictionary-rtd.md: \
    doc/tools/markdown-to-commonmark-conversion.bash \
    doc/property-and-ownership-simplified-tables-data-dictionary.md
	bash $< doc/property-and-ownership-simplified-tables-data-dictionary.md $@
