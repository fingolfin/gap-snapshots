# ToricVarieties, single 7
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("toricvarieties07.tst");

# /doc/_Chunks.xml:265-282
gap> vars := "u,s,v,t,r";
"u,s,v,t,r"
gap> rays := [ [0,0,-1],[1,0,0],[0,1,0],[-1,-1,-17],[0,0,1] ];
[ [0,0,-1],[1,0,0],[0,1,0],[-1,-1,-17],[0,0,1] ]
gap> cones := [ [1,2,3], [1,2,4], [1,3,4], [2,3,5], [2,4,5], [3,4,5] ];
[ [1,2,3], [1,2,4], [1,3,4], [2,3,5], [2,4,5], [3,4,5] ]
gap> weights := [ [1,-17], [0,1], [0,1], [0,1], [1,0] ];
[ [1,-17], [0,1], [0,1], [0,1], [1,0] ]
gap> H3fold := ToricVariety( rays, cones, weights, vars );
<A toric variety of dimension 3>
gap> B1H3fold := BlowupOfToricVariety( H3fold, "u,s", "u1" );
<A toric variety of dimension 3>
gap> CoxRing( B1H3fold );
Q[t,u,r,v,u1,s]
(weights: [ ( 0, 1, 0 ), ( 1, -17, 1 ), ( 1, 0, 0 ), 
( 0, 1, 0 ), ( 0, 0, -1 ), ( 0, 1, 1 ) ])

#
gap> STOP_TEST("toricvarieties07.tst", 1);
