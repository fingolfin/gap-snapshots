all: doc test

doc: doc/manual.six

doc/manual.six: makedoc.g \
		PackageInfo.g \
		doc/Doc.autodoc \
		gap/*.gd gap/*.gi examples/*.g examples/examplesmanual/*.g
	        gap makedoc.g

docclean:
	(cd doc ; ./clean)

test:	doc
	gap maketest.g

test-with-coverage:	doc
	OUTPUT=$$(/usr/bin/time --quiet --format="%U %S\n%e" --output=performance.out gap --banner --quitonbreak --cover stats maketest.g 2>&1); \
	echo "$$OUTPUT"; \
	! echo "$$OUTPUT" | sed "s/\r//" | grep -v "Running list" | grep -v "^#I  " | grep "" > /dev/null
	echo 'LoadPackage("profiling"); OutputJsonCoverage("stats", "coverage.json");' | gap

ci-test:	test-with-coverage

.PHONY: all doc docclean test
