
gap> G := ExamplesOfSomePcpGroups(5);
Pcp-group with orders [ 2, 0, 0, 0 ]
gap> Igs(G);
[ g1, g2, g3, g4 ]

gap> PcpSeries(G);
[ Pcp-group with orders [ 2, 0, 0, 0 ],
  Pcp-group with orders [ 0, 0, 0 ],
  Pcp-group with orders [ 0, 0 ],
  Pcp-group with orders [ 0 ],
  Pcp-group with orders [  ] ]

gap> List( PcpSeries(G), Igs );
[ [ g1, g2, g3, g4 ], [ g2, g3, g4 ], [ g3, g4 ], [ g4 ], [  ] ]


gap> G := ExamplesOfSomePcpGroups(5);
Pcp-group with orders [ 2, 0, 0, 0 ]

gap> PcpsBySeries( DerivedSeriesOfGroup(G));
[ Pcp [ g1, g2, g3, g4 ] with orders [ 2, 2, 2, 2 ],
  Pcp [ g2^-2, g3^-2, g4^2 ] with orders [ 0, 0, 4 ],
  Pcp [ g4^8 ] with orders [ 0 ] ]
gap> PcpsBySeries( RefinedDerivedSeries(G));
[ Pcp [ g1, g2, g3 ] with orders [ 2, 2, 2 ],
  Pcp [ g4 ] with orders [ 2 ],
  Pcp [ g2^2, g3^2 ] with orders [ 0, 0 ],
  Pcp [ g4^2 ] with orders [ 2 ],
  Pcp [ g4^4 ] with orders [ 2 ],
  Pcp [ g4^8 ] with orders [ 0 ] ]

gap> PcpsBySeries( DerivedSeriesOfGroup(G), "snf" );
[ Pcp [ g2, g3, g1 ] with orders [ 2, 2, 4 ],
  Pcp [ g4^2, g3^-2, g2^2*g4^2 ] with orders [ 4, 0, 0 ],
  Pcp [ g4^8 ] with orders [ 0 ] ]
gap> G.1^4 in DerivedSubgroup( G );
true
gap> G.1^2 = G.4;
true

gap>  PcpsOfEfaSeries( G );
[ Pcp [ g1 ] with orders [ 2 ],
  Pcp [ g2 ] with orders [ 0 ],
  Pcp [ g3 ] with orders [ 0 ],
  Pcp [ g4 ] with orders [ 0 ] ]


gap> G := DihedralPcpGroup( 0 );
Pcp-group with orders [ 2, 0 ]
gap> mats := [ [[-1,0],[0,1]], [[1,1],[0,1]] ];;
gap> pcp := Pcp(G);
Pcp [ g1, g2 ] with orders [ 2, 0 ]
gap> PcpOrbitStabilizer( [0,1], pcp, mats, OnRight );
rec( orbit := [ [ 0, 1 ] ],
     stab := [ g1, g2 ],
     word := [ [ [ 1, 1 ] ], [ [ 2, 1 ] ] ] )


# get a pcp group and a free abelian normal subgroup
gap> G := ExamplesOfSomePcpGroups(8);
Pcp-group with orders [ 0, 0, 0, 0, 0 ]
gap> efa := EfaSeries(G);
[ Pcp-group with orders [ 0, 0, 0, 0, 0 ],
  Pcp-group with orders [ 0, 0, 0, 0 ],
  Pcp-group with orders [ 0, 0, 0 ],
  Pcp-group with orders [  ] ]
gap> N := efa[3];
Pcp-group with orders [ 0, 0, 0 ]
gap> IsFreeAbelian(N);
true

# create conjugation action on N
gap> mats := LinearActionOnPcp(Igs(G), Pcp(N));
[ [ [ 1, 0, 0 ], [ 0, 1, 0 ], [ 0, 0, 1 ] ],
  [ [ 0, 0, 1 ], [ 1, -1, 1 ], [ 0, 1, 0 ] ],
  [ [ 1, 0, 0 ], [ 0, 1, 0 ], [ 0, 0, 1 ] ],
  [ [ 1, 0, 0 ], [ 0, 1, 0 ], [ 0, 0, 1 ] ],
  [ [ 1, 0, 0 ], [ 0, 1, 0 ], [ 0, 0, 1 ] ] ]

# take an arbitrary vector and compute its stabilizer
gap> StabilizerIntegralAction(G,mats, [2,3,4]);
Pcp-group with orders [ 0, 0, 0, 0 ]
gap> Igs(last);
[ g1, g3, g4, g5 ]

# check orbits with some other vectors
gap> OrbitIntegralAction(G,mats, [2,3,4],[3,1,5]);
rec( stab := Pcp-group with orders [ 0, 0, 0, 0 ], prei := g2 )

gap> OrbitIntegralAction(G,mats, [2,3,4], [4,6,8]);
false

# compute the orbit of a subgroup of Z^3 under the action of G
gap> NormalizerIntegralAction(G, mats, [[1,0,0],[0,1,0]]);
Pcp-group with orders [ 0, 0, 0, 0, 0 ]
gap> Igs(last);
[ g1, g2^2, g3, g4, g5 ]


gap> G := ExamplesOfSomePcpGroups(15);
Pcp-group with orders [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 4, 0 ]
gap> TorsionSubgroup(G);
Pcp-group with orders [ 5, 2 ]
gap> NormalTorsionSubgroup(G);
Pcp-group with orders [ 5, 2 ]
gap> IsTorsionFree(G);
false
gap> FiniteSubgroupClasses(G);
[ Pcp-group with orders [ 5, 2 ]^G,
  Pcp-group with orders [ 2 ]^G,
  Pcp-group with orders [ 5 ]^G,
  Pcp-group with orders [  ]^G ]

gap> G := DihedralPcpGroup( 0 );
Pcp-group with orders [ 2, 0 ]
gap> TorsionSubgroup(G);
fail
gap> NormalTorsionSubgroup(G);
Pcp-group with orders [  ]
gap> IsTorsionFree(G);
false
gap> FiniteSubgroupClasses(G);
[ Pcp-group with orders [ 2 ]^G,
  Pcp-group with orders [ 2 ]^G,
  Pcp-group with orders [  ]^G ]


gap> G := ExamplesOfSomePcpGroups(2);
Pcp-group with orders [ 0, 0, 0, 0, 0, 0 ]

gap> MaximalSubgroupClassesByIndex( G, 61 );;
gap> max := List( last, Representative );;
gap> List( max, x -> Index( G, x ) );
[ 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61,
  61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61,
  61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61,
  61, 61, 61, 61, 61, 61, 226981 ]

gap> LowIndexSubgroupClasses( G, 61 );;
gap> low := List( last, Representative );;
gap> List( low, x -> Index( G, x ) );
[ 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61,
  61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61,
  61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61,
  61, 61, 61, 61, 61, 61 ]


gap> G := ExamplesOfSomePcpGroups(14);
Pcp-group with orders [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 4, 0, 5, 5, 4, 0, 6,
  5, 5, 4, 0, 10, 6 ]
gap> IsNilpotent(G);
true

gap> PcpsBySeries( LowerCentralSeriesOfGroup(G));
[ Pcp [ g1, g2 ] with orders [ 0, 0 ],
  Pcp [ g3 ] with orders [ 0 ],
  Pcp [ g4 ] with orders [ 0 ],
  Pcp [ g5 ] with orders [ 0 ],
  Pcp [ g6, g7 ] with orders [ 0, 0 ],
  Pcp [ g8 ] with orders [ 0 ],
  Pcp [ g9, g10 ] with orders [ 0, 0 ],
  Pcp [ g11, g12, g13 ] with orders [ 5, 4, 0 ],
  Pcp [ g14, g15, g16, g17, g18 ] with orders [ 5, 5, 4, 0, 6 ],
  Pcp [ g19, g20, g21, g22, g23, g24 ] with orders [ 5, 5, 4, 0, 10, 6 ] ]

gap> PcpsBySeries( UpperCentralSeriesOfGroup(G));
[ Pcp [ g1, g2 ] with orders [ 0, 0 ],
  Pcp [ g3 ] with orders [ 0 ],
  Pcp [ g4 ] with orders [ 0 ],
  Pcp [ g5 ] with orders [ 0 ],
  Pcp [ g6, g7 ] with orders [ 0, 0 ],
  Pcp [ g8 ] with orders [ 0 ],
  Pcp [ g9, g10 ] with orders [ 0, 0 ],
  Pcp [ g11, g12, g13 ] with orders [ 5, 4, 0 ],
  Pcp [ g14, g15, g16, g17, g18 ] with orders [ 5, 5, 4, 0, 6 ],
  Pcp [ g19, g20, g21, g22, g23, g24 ] with orders [ 5, 5, 4, 0, 10, 6 ] ]

gap> MinimalGeneratingSet(G);
[ g1, g2 ]


gap> G := DihedralPcpGroup(0);
Pcp-group with orders [ 2, 0 ]
gap> mats := [[[-1, 0],[0,1]], [[1,1],[0,1]]];
[ [ [ -1, 0 ], [ 0, 1 ] ], [ [ 1, 1 ], [ 0, 1 ] ] ]
gap> pcp := Pcp(G);
Pcp [ g1, g2 ] with orders [ 2, 0 ]

gap> RandomPcpOrbitStabilizer( [1,0], pcp, mats, OnRight ).stab;
#I  Orbit longer than limit: exiting.
[  ]

gap> g := Igs(G)[1];
g1
gap> RandomCentralizerPcpGroup( G, g );
#I  Stabilizer not increasing: exiting.
Pcp-group with orders [ 2 ]
gap> Igs(last);
[ g1 ]


gap> G := DihedralPcpGroup( 0 );
Pcp-group with orders [ 2, 0 ]
gap> Centre( G );
Pcp-group with orders [  ]
gap> H := SchurExtension( G );
Pcp-group with orders [ 2, 0, 0, 0 ]
gap> Centre( H );
Pcp-group with orders [ 0, 0 ]
gap> H/Centre(H);
Pcp-group with orders [ 2, 0 ]
gap> Subgroup( H, [H.1,H.2] ) = H;
true


gap> gl23 := Range( IsomorphismPcpGroup( GL(2,3) ) );
Pcp-group with orders [ 2, 3, 2, 2, 2 ]
gap> SchurExtensionEpimorphism( gl23 );
[ g1, g2, g3, g4, g5, g6, g7, g8, g9, g10 ] -> [ g1, g2, g3, g4, g5,
id, id, id, id, id ]
gap> Kernel( last );
Pcp-group with orders [ 0, 0, 0, 0, 0 ]
gap> SchurMultiplicator( gl23 );
[  ]
gap> Intersection( Kernel(epi), DerivedSubgroup( Source(epi) ) );
[  ]


gap> G := DihedralPcpGroup(0);
Pcp-group with orders [ 2, 0 ]
gap> epi := SchurExtensionEpimorphism( G );
[ g1, g2, g3, g4 ] -> [ g1, g2, id, id ]
gap> PreImagesRepresentative( epi, G.1 );
g1
gap> PreImagesRepresentative( epi, G.2 );
g2
gap> Comm( last, last2 );
g2^-2*g4


gap> G := AbelianPcpGroup( 3,[] );
Pcp-group with orders [ 0, 0, 0 ]
gap> ext := SchurCovering( G );
Pcp-group with orders [ 0, 0, 0, 0, 0, 0 ]
gap> Centre( ext );
Pcp-group with orders [ 0, 0, 0 ]
gap> IsSubgroup( DerivedSubgroup( ext ), last );
true


gap> G := DihedralPcpGroup( 0 );
Pcp-group with orders [ 2, 0 ]
gap> DirectProduct( G, AbelianPcpGroup( 2, [] ) );
Pcp-group with orders [ 0, 0, 2, 0 ]
gap> AbelianInvariantsMultiplier( last );
[ 0, 2, 2, 2, 2 ]


gap> G := ExamplesOfSomePcpGroups( 3 );
Pcp-group with orders [ 0, 0 ]
gap> G := DirectProduct( G,G );
Pcp-group with orders [ 0, 0, 0, 0 ]
gap> SchurMultiplicator( G );
[ [ 0, 1 ], [ 2, 3 ] ]
gap> epi := NonAbelianExteriorSquareEpimorphism( G );
[ g2^-2*g5, g4^-2*g10, g6, g7, g8, g9 ] -> [ g2^-2, g4^-2, id, id, id, id ]
gap> Kernel( epi );
Pcp-group with orders [ 0, 2, 2, 2 ]
gap> Collected( AbelianInvariants( last ) );
[ [ 0, 1 ], [ 2, 3 ] ]


gap> G := DihedralPcpGroup(0);
Pcp-group with orders [ 2, 0 ]
gap> GwG := NonAbelianExteriorSquare( G );
Pcp-group with orders [ 0 ]
gap> lambda := GwG!.crossedPairing;
function( g, h ) ... end
gap> lambda( G.1, G.2 );
g2^2*g4^-1


gap> G := DihedralPcpGroup(0);
Pcp-group with orders [ 2, 0 ]
gap> G := DirectProduct(G,G);
Pcp-group with orders [ 2, 0, 2, 0 ]
gap> alpha := NonAbelianTensorSquareEpimorphism( G );
[ g9*g25^-1, g10*g26^-1, g11*g27, g12*g28, g13*g29, g14*g30, g15, g16,
g17,
  g18, g19, g20, g21, g22, g23, g24 ] -> [ g2^-2*g6, g4^-2*g12, g8,
  g9, g10,
  g11, id, id, id, id, id, id, id, id, id, id ]
gap> gamma := Range( alpha )!.epimorphism;
[ g2^-2*g6, g4^-2*g12, g8, g9, g10, g11 ] -> [ g2^-2, g4^-2, id, id,
id, id ]
gap> JG := Kernel( alpha * gamma );
Pcp-group with orders [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ]
gap> Image( alpha, JG );
Pcp-group with orders [ 2, 2, 2, 2 ]
gap> SchurMultiplicator( G );
[ [ 2, 4 ] ]

\>NonAbelianTensorSquare( <G> ) A

computes  for a  polycyclic group  <G> the  non-abelian  tensor square
$G\otimes G$.

\beginexample
gap> G := AlternatingGroup( IsPcGroup, 4 );
<pc group of size 12 with 3 generators>
gap> PcGroupToPcpGroup( G );
Pcp-group with orders [ 3, 2, 2 ]
gap> NonAbelianTensorSquare( last );
Pcp-group with orders [ 2, 2, 2, 3 ]
gap> PcpGroupToPcGroup( last );
<pc group of size 24 with 4 generators>
gap> DirectFactorsOfGroup( last );
[ Group([ f1, f2, f3 ]), Group([ f4 ]) ]
gap> List( last, Size );
[ 8, 3 ]
gap> IdGroup( last2[1] );
[ 8, 4 ]       # the quaternion group of Order 8

gap> G := DihedralPcpGroup( 0 );
Pcp-group with orders [ 2, 0 ]
gap> ten := NonAbelianTensorSquare( G );
Pcp-group with orders [ 0, 2, 2, 2 ]
gap> IsAbelian( ten );
true

