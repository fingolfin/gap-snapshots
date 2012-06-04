
gap>  ftl := FromTheLeftCollector( 2 );;
gap>  SetRelativeOrder( ftl, 1, 2 );
gap>  SetConjugate( ftl, 2, 1, [2,-1] );
gap>  UpdatePolycyclicCollector( ftl );
gap>  G:= PcpGroupByCollectorNC( ftl );
Pcp-group with orders [ 2, 0 ]
gap> Subgroup( G, GeneratorsOfGroup(G){[2]} );
Pcp-group with orders [ 0 ]

