

# get the group and its matrix action
gap> G := UnitriangularPcpGroup(3,0);
Pcp-group with orders [ 0, 0, 0 ]
gap> mats := G!.mats;
[ [ [ 1, 1, 0 ], [ 0, 1, 0 ], [ 0, 0, 1 ] ],
  [ [ 1, 0, 0 ], [ 0, 1, 1 ], [ 0, 0, 1 ] ],
  [ [ 1, 0, 1 ], [ 0, 1, 0 ], [ 0, 0, 1 ] ] ]

# set up the cohomology record
gap> C := CRRecordByMats(G,mats);;

# compute the second cohomology group
gap> cc := TwoCohomologyCR(C);;

# the abelian invariants of H^2(G,M)
gap> cc.factor.rels;
[ 2, 0, 0 ]

# construct an extension which corresponds to a cocycle that has
# infinite image in H^2(G,M)
gap> c := cc.factor.prei[2];
[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, -1, 1 ]
gap> H := ExtensionCR( CR, c);
Pcp-group with orders [ 0, 0, 0, 0, 0, 0 ]

# check that the extension does not split - get the normal subgroup
gap> N := H!.module;
Pcp-group with orders [ 0, 0, 0 ]

# create the interal module
gap> C := CRRecordBySubgroup(H,N);;

# use the complements routine
gap> ComplementClassesCR(C);
[  ]

