# LinearAlgebraForCAP, single 2
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("linearalgebraforcap02.tst");

# doc/_Chapter_Examples_and_Tests.xml:264-287
gap> Q := HomalgFieldOfRationals();;
gap> a := VectorSpaceObject( 3, Q );;
gap> b := VectorSpaceObject( 4, Q );;
gap> homalg_matrix := HomalgMatrix( [ [ 1, 0, 0, 0 ],
>                                   [ 0, 1, 0, -1 ],
>                                   [ -1, 0, 2, 1 ] ], 3, 4, Q );;
gap> alpha := VectorSpaceMorphism( a, homalg_matrix, b );;
gap> Display( SomeReductionBySplitEpiSummand( alpha ) );
(an empty 0 x 1 matrix)

A morphism in Category of matrices over Q
gap> Display( SomeReductionBySplitEpiSummand_MorphismFromInputRange( alpha ) );
[ [     0 ],
  [     1 ],
  [  -1/2 ],
  [     1 ] ]

A morphism in Category of matrices over Q
gap> Display( SomeReductionBySplitEpiSummand_MorphismToInputRange( alpha ) );
[ [  0,  1,  0,  0 ] ]

A morphism in Category of matrices over Q

#
gap> STOP_TEST("linearalgebraforcap02.tst", 1);
