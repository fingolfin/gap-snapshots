# MatricesForHomalg, single 5
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("matricesforhomalg05.tst");

# doc/../gap/HomalgMatrix.gi:3155-3168
gap> ZZ := HomalgRingOfIntegers( );
Z
gap> id := HomalgInitialIdentityMatrix( 3, ZZ );
<An initial identity 3 x 3 matrix over an internal ring>
gap> HasIsOne( id );
false
gap> IsOne( id );
true
gap> id;
<A 3 x 3 mutable matrix over an internal ring>
gap> HasIsOne( id );
false

#
gap> STOP_TEST("matricesforhomalg05.tst", 1);
