# LocalizeRingForHomalg, single 9
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("localizeringforhomalg09.tst");

# doc/../examples/ResidueClass.g:17-44
gap> LoadPackage( "Modules" );;
gap> W := LeftPresentation( wmat );
<A left module presented by 2 relations for 2 generators>
gap> Res := Resolution( 2 , W );
<A right acyclic complex containing 2 morphisms of left modules at degrees
[ 0 .. 2 ]>
gap> Display( Res );
-------------------------
at homology degree: 2
0
-------------------------
(an empty 0 x 2 matrix)

the map is currently represented by the above 0 x 2 matrix
------------v------------
at homology degree: 1
Q[x,y]^(1 x 2)
-------------------------
y^2,      x^2,
x*y^2-y^3,0

the map is currently represented by the above 2 x 2 matrix
------------v------------
at homology degree: 0
Q[x,y]^(1 x 2)
-------------------------

#
gap> STOP_TEST("localizeringforhomalg09.tst", 1);