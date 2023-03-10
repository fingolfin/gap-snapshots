# MatricesForHomalg, single 1
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("matricesforhomalg01.tst");

# doc/../gap/ResidueClassRing.gi:541-558
gap> ZZ := HomalgRingOfIntegers( );
Z
gap> Display( ZZ );
<An internal ring>
gap> Z256 := ZZ / 2^8;
Z/( 256 )
gap> Display( Z256 );
<A residue class ring>
gap> Z2 := Z256 / 6;
Z/( 256, 6 )
gap> BasisOfRows( MatrixOfRelations( Z2 ) );
<An unevaluated non-zero 1 x 1 matrix over an internal ring>
gap> Z2;
Z/( 2 )
gap> Display( Z2 );
<A residue class ring>

#
gap> STOP_TEST("matricesforhomalg01.tst", 1);
