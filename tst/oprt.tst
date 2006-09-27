#############################################################################
##
#W  oprt.tst                GAP-4 library                    ALexander Hulpke
##
#H  @(#)$Id: oprt.tst,v 4.2.2.5 2006/09/16 19:04:23 jjm Exp $
##
#Y  Copyright 1997,    Lehrstuhl D fuer Mathematik,   RWTH Aachen,    Germany
##
##  To be listed in testall.g
##

gap> START_TEST("$Id: oprt.tst,v 4.2.2.5 2006/09/16 19:04:23 jjm Exp $");
gap> c5:=CyclicGroup(IsPermGroup,5);;
gap> d:=Combinations([1..5],2);;
gap> eo:=ExternalOrbit(c5,d,[1,2],OnSets);
[ 1, 2 ]^G
gap> IsTransitive(eo);
true
gap> Transitivity(eo);
1
gap> IsPrimitive(eo);
true
gap> Blocks(eo);
[ [ [ 1, 2 ], [ 1, 5 ], [ 2, 3 ], [ 3, 4 ], [ 4, 5 ] ] ]
gap> es:=ExternalSet(c5,d,OnSets);;
gap> ess:=ExternalSubset(c5,es,[[1,2]],OnSets);;
gap> IsTransitive(es);
false
gap> IsTransitive(ess);
true
gap> IsPrimitive(ess);
true
gap> Blocks(ess);
[ [ [ 1, 2 ], [ 1, 5 ], [ 2, 3 ], [ 3, 4 ], [ 4, 5 ] ] ]
gap> G:=AbelianGroup(IsPermGroup,[12,12]);;
gap> eo:=ExternalOrbit(G,[1..24],1,OnPoints);;
gap> IsTransitive(eo);
true
gap> Blocks(eo);
[ [ 1, 5, 9 ], [ 2, 6, 10 ], [ 3, 7, 11 ], [ 4, 8, 12 ] ]
gap> RepresentativesMinimalBlocks(eo);
[ [ 1, 5, 9 ], [ 1, 7 ] ]
gap> MaximalBlocks(eo);
[ [ 1, 3, 5, 7, 9, 11 ], [ 2, 4, 6, 8, 10, 12 ] ]
gap> eo:=ExternalOrbit(G,[1..12],1,OnPoints);
1^G
gap> IsTransitive(eo); 
true
gap> Blocks(eo);
[ [ 1, 5, 9 ], [ 2, 6, 10 ], [ 3, 7, 11 ], [ 4, 8, 12 ] ]
gap> STOP_TEST( "oprt.tst", 19600000 );


#############################################################################
##
#E


