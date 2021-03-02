# ToricVarieties, single 13
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST( "toricvarieties13.tst");

# doc/_Chunks.xml:480-533
gap> H7 := Fan( [[0,1],[1,0],[0,-1],[-1,7]],[[1,2],[2,3],[3,4],[4,1]] );
<A fan in |R^2>
gap> H7 := ToricVariety( H7 );
<A toric variety of dimension 2>
gap> P := TorusInvariantPrimeDivisors( H7 );
[ <A prime divisor of a toric variety with coordinates ( 1, 0, 0, 0 )>,
  <A prime divisor of a toric variety with coordinates ( 0, 1, 0, 0 )>,
  <A prime divisor of a toric variety with coordinates ( 0, 0, 1, 0 )>,
  <A prime divisor of a toric variety with coordinates ( 0, 0, 0, 1 )> ]
gap> D := P[1]+P[2];
<A divisor of a toric variety with coordinates ( 1, 1, 0, 0 )>
gap> IsBasepointFree(D);
true
gap> IsAmple(D);
true
gap> CoordinateRingOfTorus(H7,"x");
Q[x1,x1_,x2,x2_]/( x1*x1_-1, x2*x2_-1 )
gap> Polytope(D);
<A polytope in |R^2>
gap> CharactersForClosedEmbedding(D);
[ |[ 1 ]|, |[ x2 ]|, |[ x1 ]|, |[ x1*x2 ]|, |[ x1^2*x2 ]|, 
  |[ x1^3*x2 ]|, |[ x1^4*x2 ]|, |[ x1^5*x2 ]|, 
  |[ x1^6*x2 ]|, |[ x1^7*x2 ]|, |[ x1^8*x2 ]| ]
gap> CoxRingOfTargetOfDivisorMorphism(D);
Q[x_1,x_2,x_3,x_4,x_5,x_6,x_7,x_8,x_9,x_10,x_11]
(weights: [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ])
gap> RingMorphismOfDivisor(D);
<A "homomorphism" of rings>
gap> Display(RingMorphismOfDivisor(D));
Q[x_1,x_2,x_3,x_4]
(weights: [ ( 0, 1 ), ( 1, 0 ), ( 1, -7 ), ( 0, 1 ) ])
  ^
  |
[ x_1*x_2, x_1^8*x_3, x_2*x_4, x_1^7*x_3*x_4, x_1^6*x_3*x_4^2, 
  x_1^5*x_3*x_4^3, x_1^4*x_3*x_4^4, x_1^3*x_3*x_4^5, x_1^2*x_3*x_4^6, 
  x_1*x_3*x_4^7, x_3*x_4^8 ]
  |
  |
Q[x_1,x_2,x_3,x_4,x_5,x_6,x_7,x_8,x_9,x_10,x_11]
(weights: [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ])
gap> ByASmallerPresentation(ClassGroup(H7));
<A free left module of rank 2 on free generators>
gap> MonomsOfCoxRingOfDegree(D);
[ x_1*x_2, x_1^8*x_3, x_2*x_4, x_1^7*x_3*x_4, x_1^6*x_3*x_4^2, 
  x_1^5*x_3*x_4^3, x_1^4*x_3*x_4^4, x_1^3*x_3*x_4^5, x_1^2*x_3*x_4^6, 
  x_1*x_3*x_4^7, x_3*x_4^8 ]
gap> D2:=D-2*P[2];
<A divisor of a toric variety with coordinates ( 1, -1, 0, 0 )>
gap> IsBasepointFree(D2);
false
gap> IsAmple(D2);
false

#
gap> STOP_TEST("toricvarieties13.tst", 1 );