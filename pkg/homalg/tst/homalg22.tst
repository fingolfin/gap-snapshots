# homalg, single 22
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("homalg22.tst");

# doc/../gap/HomalgFunctor.gi:6379-6390
gap> ZZ := HomalgRingOfIntegers( );
Z
gap> ZZ * 1;
<The free right module of rank 1 on a free generator>
gap> InsertObjectInMultiFunctor( Functor_Hom_for_fp_modules, 2, ZZ * 1, "Hom_ZZ" );
<The functor Hom_ZZ for f.p. modules and their maps over computable rings>
gap> Functor_Hom_ZZ_for_fp_modules;	## got automatically defined
<The functor Hom_ZZ for f.p. modules and their maps over computable rings>
gap> Hom_ZZ;		## got automatically defined
<Operation "Hom_ZZ">

#
gap> STOP_TEST("homalg22.tst", 1);