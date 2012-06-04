##############################################################################
##
#W  ggraph.g                    GAP4 package `Gpd'               Chris Wensley
#W                                                                & Emma Moore
##  version 1.07, 10/06/2011   
##
#Y  Copyright (C) 2011, Emma Moore and Chris Wensley,  
#Y  School of Computer Science, Bangor University, U.K. 

SetInfoLevel( InfoGpd, 2 );

Print( "\n===============================================================\n");
Print( "<<<< testing examples in the Gpd manual (version 10/06/11) >>>>\n" );
Print( "<<<<      functions for Graphs of Groups and Groupoids     >>>>\n" );
Print( "===============================================================\n\n");

## now arcs in the order  [ wt, tail, head ]

## define the graph D1
V1 := [5,6];
f1 := FreeGroup("y");
y := GeneratorsOfGroup(f1)[1];
A1 := [ [y,5,6], [y^-1,6,5]];
D1 := FpWeightedDigraph( V1, A1 );
Print( D1!.vertices, "\n", D1!.arcs, "\n" );
# Display( D1 );
inv1 := InvolutoryArcs( D1 );
Print( inv1, "\n\n" );

## define the graph D3
f3 := FreeGroup(3,"z");
Print( f3, "\n" );
gf3 := GeneratorsOfGroup(f3);
Print( gf3, "\n" );
z1:=gf3[1];; z2:=gf3[2];; z3:=gf3[3];;
V3 := [7,8,9];
Print( V3, "\n" );
A3 := [[z1,7,8],[z2,8,9],[z3,9,7],[z1^-1,8,7],[z2^-1,9,8],[z3^-1,7,9]];
Print( A3, "\n" );
D3 := FpWeightedDigraph( V3, A3 );
Print( D3, "\n" );
inv3 := InvolutoryArcs( D3 );
Print( inv3, "\n\n" );

## group fa and subgroup 3fa
fa := FreeGroup( "a" );;
a := GeneratorsOfGroup( fa )[1];;
SetName( fa, "fa" );
hy := Subgroup( fa, [a^3] );;
SetName( hy, "hy" );

## group fb and subgroup 2fb
fb := FreeGroup( "b" );;
b := GeneratorsOfGroup( fb )[1];;
SetName( fb, "fb" );
hybar := Subgroup( fb, [b^2] );;
SetName( hybar, "hybar" );
## Isomorphisms between subgroups 
homy := GroupHomomorphismByImagesNC( hy, hybar, [a^3], [b^2] );;
homybar := GroupHomomorphismByImagesNC( hybar, hy, [b^2], [a^3] );; 

## defining graph of groups 
G1 := GraphOfGroups( D1, [fa,fb], [hy,hybar], [homy,homybar] );
Print( "Graph of Groups, G1 :- \n" );
Print( "    vertices: ", D1!.vertices, "\n" );
Print( "       edges: ", D1!.arcs, "\n" );
Print( "      groups: ", GroupsOfGraphOfGroups( G1 ), "\n" );
Print( "   subgroups: ", SubgroupsOfGraphOfGroups( G1 ), "\n" );
Print( "isomorphisms: ", IsomorphismsOfGraphOfGroups( G1 ), "\n\n" );

Print( "IsGraphOfFpGroups(G1)? ", IsGraphOfFpGroups(G1), "\n" );
Print( "G1 has isomorphisms:\n", IsomorphismsOfGraphOfGroups(G1), "\n" );

RTG1 := RightTransversalsOfGraphOfGroups( G1 );
Print( "right transversals = \n", RTG1, "\n" );
LTG1 := LeftTransversalsOfGraphOfGroups( G1 );
Print( "left transversals = \n", LTG1, "\n\n" );

L1:=[ a^7, 1, b^-6, 2, a^-11, 1, b^9, 2, a^7 ];;
gw1 := GraphOfGroupsWord( G1, 5, L1 );
Print( gw1, "\n");
Print( IsGraphOfGroupsWord( gw1 ), "\n" );
Print( [ GGTail( gw1 ), GGHead( gw1 ) ], "\n" );
Print( GraphOfGroupsOfWord( gw1 ), "\n" );
Print( WordOfGraphOfGroupsWord( gw1 ), "\n\n" );

nw1 := ReducedGraphOfGroupsWord( gw1 );
Print( nw1, "\n\n");

##############################################################################

Print( "\n===============================================================\n" );
Print( "<<<<           functions for FPAs and HNNs                 >>>>\n" );
Print( "===============================================================\n\n" );

f1 := FreeGroup( 2, "a" );
Print( f1, "\n" );
rel1 := [f1.1^3, f1.2^2, (f1.1*f1.2)^2];
Print( rel1, "\n" );
s3 := f1/rel1;
Print( s3, "\n" );
gs3 := GeneratorsOfGroup(s3);
Print( gs3, "\n" );
SetName(s3,"s3");
a1:=gs3[1];  a2:=gs3[2];
Print( a1, "\n", a2, "\n" );
H1 := Subgroup(s3,[a1]);
Print( H1, "\n" );
f2 := FreeGroup( 2, "b" );
Print( f2, "\n" );
rel2 := [f2.1^3, f2.2^3, (f2.1*f2.2)^2];
Print( rel2, "\n" );
a4 := f2/rel2;
Print( a4, "\n" );
ga4 := GeneratorsOfGroup(a4);
Print( ga4, "\n" );
SetName(a4,"a4");
b1 := ga4[1];  b2:=ga4[2];
Print( b1, "\n", b2, "\n" );
H2 := Subgroup(a4,[b1]);
Print( H2, "\n" );
iso := GroupHomomorphismByImages(H1,H2,[a1],[b1]);
Print( iso, "\n" );
inv := InverseGeneralMapping(iso);
Print( inv, "\n" );
fpa := FreeProductWithAmalgamation( s3, a4, iso );
Print( fpa, "\n" );
Print( RelatorsOfFpGroup( fpa ), "\n" );
gg1 := GraphOfGroupsRewritingSystem( fpa );
Print( gg1, "\n" );
Print( LeftTransversalsOfGraphOfGroups( gg1 ), "\n" );
gfpa := GeneratorsOfGroup( fpa );
Print( gfpa, "\n" );
w2 := (gfpa[1]*gfpa[2]*gfpa[3]^gfpa[4])^3;
Print( w2, "\n" );
n2 := NormalFormGGRWS( fpa, w2 );
Print( n2, "\n\n" );

############### now for HNN #################

H3 := Subgroup(a4,[b2]);
Print( H3, "\n" );
i23 := GroupHomomorphismByImages( H2, H3, [b1], [b2] );
Print( i23, "\n" );
hnn := HnnExtension( a4, i23 );
Print( hnn, "\n" );
phnn := PresentationFpGroup( hnn );;
TzPrint( phnn );
gg2 := GraphOfGroupsRewritingSystem( hnn );
Print( gg2, "\n" );
Print( LeftTransversalsOfGraphOfGroups( gg2 ), "\n" );
gh := GeneratorsOfGroup( hnn );;
w3 := (gh[1]^gh[2])*gh[3]^-1*(gh[1]*gh[3]*gh[2]^2)^2*gh[3]*gh[2];
Print( w3, "\n" );
n3 := NormalFormGGRWS( hnn, w3 );
Print( n3, "\n\n");


