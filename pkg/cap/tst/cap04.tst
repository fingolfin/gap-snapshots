# CAP, single 4
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("cap04.tst");

# doc/_Chapter_Examples_and_Tests.xml:61-71
gap> V1 := TensorUnit( vec );;
gap> V3 := DirectSum( V1, V1, V1 );;
gap> pi1 := ProjectionInFactorOfDirectSum( [ V1, V1 ], 1 );;
gap> pi2 := ProjectionInFactorOfDirectSum( [ V3, V1 ], 1 );;
gap> value1 := ApplyFunctor( F, pi1, pi2 );;
gap> input := Product( pi1, Opposite( pi2 ) );;
gap> value2 := ApplyFunctor( F, input );;
gap> IsCongruentForMorphisms( value1, value2 );
true

#
gap> STOP_TEST("cap04.tst", 1);
