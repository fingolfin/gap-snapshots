
gap>  G := DihedralPcpGroup(0);
Pcp-group with orders [ 2, 0 ]
gap>  pcp := Pcp(G);
Pcp [ g1, g2 ] with orders [ 2, 0 ]
gap>  pcp[1];
g1
gap>  Length(pcp);
2
gap>  RelativeOrdersOfPcp(pcp);
[ 2, 0 ]
gap>  DenominatorOfPcp(pcp);
[  ]
gap>  NumeratorOfPcp(pcp);
[ g1, g2 ]
gap>  GroupOfPcp(pcp);
Pcp-group with orders [ 2, 0 ]
gap> OneOfPcp(pcp);
identity


gap> G := ExamplesOfSomePcpGroups(5);
Pcp-group with orders [ 2, 0, 0, 0 ]
gap> D := DerivedSubgroup( G );
Pcp-group with orders [ 0, 0, 0 ]
gap>  GeneratorsOfGroup( G );
[ g1, g2, g3, g4 ]
gap>  GeneratorsOfGroup( D );
[ g2^-2, g3^-2, g4^2 ]

# an ordinary pcp for G / D
gap> pcp1 := Pcp( G, D );
Pcp [ g1, g2, g3, g4 ] with orders [ 2, 2, 2, 2 ]

# a pcp for G/D in independent generators
gap>  pcp2 := Pcp( G, D, "snf" );
Pcp [ g2, g3, g1 ] with orders [ 2, 2, 4 ]

gap>  g := Random( G );
g1*g2^-4*g3*g4^2

# compute the exponent vector of g in G/D with respect to pcp1
gap> ExponentsByPcp( pcp1, g );
[ 1, 0, 1, 0 ]

# compute the exponent vector of g in G/D with respect to pcp2
gap>  ExponentsByPcp( pcp2, g );
[ 0, 1, 1 ]


gap> G := DihedralPcpGroup(0);
Pcp-group with orders [ 2, 0 ]
gap>  U := Subgroup( G, [Pcp(G)[2]^1440]);
Pcp-group with orders [ 0 ]
gap>  F := G/U;
Pcp-group with orders [ 2, 1440 ]
gap> RefinedPcpGroup(F);
Pcp-group with orders [ 2, 2, 2, 2, 2, 2, 3, 3, 5 ]

gap> ser := [G, U, TrivialSubgroup(G)];
[ Pcp-group with orders [ 2, 0 ],
  Pcp-group with orders [ 0 ],
  Pcp-group with orders [  ] ]
gap>  PcpGroupBySeries(ser);
Pcp-group with orders [ 2, 1440, 0 ]

