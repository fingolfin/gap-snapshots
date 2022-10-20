# MatricesForHomalg, single 4
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("matricesforhomalg04.tst");

# doc/../gap/HomalgMatrix.gi:3002-3016
gap> n := HomalgInitialMatrix( 2, 3, ZZ );
<An initial 2 x 3 matrix over an internal ring>
gap> n[ 1, 1 ] := "1";;
gap> n[ 2, 3 ] := "1";;
gap> MakeImmutable( n );
<A 2 x 3 matrix over an internal ring>
gap> Display( n );
[ [  1,  0,  0 ],
  [  0,  0,  1 ] ]
gap> IsZero( n );
false
gap> n;
<A non-zero 2 x 3 matrix over an internal ring>

#
gap> STOP_TEST("matricesforhomalg04.tst", 1);
