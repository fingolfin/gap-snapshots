# ToricVarieties, single 18
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("toricvarieties18.tst");

# /doc/_Chunks.xml:667-695
gap> P2 := ProjectiveSpace( 2 );
<A projective toric variety of dimension 2>
gap> CoxRing( P2 );
Q[x_1,x_2,x_3]
(weights: [ 1, 1, 1 ])
gap> DA := AmpleDivisor( P2 );
<A divisor of a toric variety with coordinates ( 1, 0, 0 )>
gap> IsPrincipal( DA );
false
gap> IsPrimedivisor( DA );
true
gap> IsAmple( DA );
true
gap> IsToricDivisor( DA );
true
gap> IsBasepointFree( DA );
true
gap> IntegerForWhichIsSureVeryAmple( DA );
1
gap> UnderlyingToricVariety( DA );
<A toric subvariety of dimension 1>
gap> DegreeOfDivisor( DA );
1
gap> Display( DA );
An ample basepoint free Cartier divisor of a toric variety.
gap> ViewObj( DA );
<An ample basepoint free Cartier prime divisor of a toric variety with coordinates ( 1, 0, 0 )>

#
gap> STOP_TEST("toricvarieties18.tst", 1);
