# MatricesForHomalg, single 2
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("matricesforhomalg02.tst");

# doc/../gap/HomalgRing.gd:969-981
gap> ZZ := HomalgRingOfIntegers( );;
gap> R := ZZ / 2^8;
Z/( 256 )
gap> r := (1/3*One(R)+1/5)+3/7;
|[ 157 ]|
gap> 1 / r;	## = r^-1;
|[ 181 ]|
gap> s := (1/3*One(R)+2/5)+3/7;
|[ 106 ]|
gap> s^(-1);
fail

#
gap> STOP_TEST("matricesforhomalg02.tst", 1);