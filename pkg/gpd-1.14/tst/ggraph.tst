##############################################################################
##
#W  ggraph.tst                    Gpd Package                    Chris Wensley
#W                                                                & Emma Moore
##  version 1.14, 18/04/2012   
##
#Y  Copyright (C) 2012, Emma Moore and Chris Wensley,  
#Y  School of Computer Science, Bangor University, U.K. 
##  
gap> START_TEST( "Testing examples in Chapter 5 of the Gpd manual" );
gap> gpd_infolevel_saved := InfoLevel( InfoGpd );; 
gap> SetInfoLevel( InfoGpd, 0 );; 

###  Section 6.1  Digraphs

## SubSection 6.1.1
## define the graph D1
gap> V1 := [5,6];;
gap> f1 := FreeGroup("y");;
gap> y := f1.1;;
gap> A1 := [ [y,5,6], [y^-1,6,5]];;
gap> D1 := FpWeightedDigraph( V1, A1 );
weighted digraph with vertices: [ 5, 6 ]
and arcs: [ [ y, 5, 6 ], [ y^-1, 6, 5 ] ]

gap> inv1 := InvolutoryArcs( D1 );
[ 2, 1 ]

## define the graph D3
gap> f3 := FreeGroup(3,"z");;
gap> z1:=f3.1;; z2:=f3.2;; z3:=f3.3;;
gap> V3 := [7,8,9];;
gap> A3 := [[z1,7,8],[z2,8,9],[z3,9,7],[z1^-1,8,7],[z2^-1,9,8],[z3^-1,7,9]];;
gap> D3 := FpWeightedDigraph( V3, A3 );
weighted digraph with vertices: [ 7, 8, 9 ]
and arcs: [ [ z1, 7, 8 ], [ z2, 8, 9 ], [ z3, 9, 7 ], [ z1^-1, 8, 7 ], 
  [ z2^-1, 9, 8 ], [ z3^-1, 7, 9 ] ]

gap> inv3 := InvolutoryArcs( D3 );
[ 4, 5, 6, 1, 2, 3 ]

### Section 6.2 : Graphs of Groups

## SubSection 6.2.1
## group fa and subgroup 3fa
gap> fa := FreeGroup( "a" );;
gap> a := fa.1;;
gap> SetName( fa, "fa" );
gap> hy := Subgroup( fa, [a^3] );;
gap> SetName( hy, "hy" );

## group fb and subgroup 2fb
gap> fb := FreeGroup( "b" );;
gap> b := fb.1;;
gap> SetName( fb, "fb" );
gap> hybar := Subgroup( fb, [b^2] );;
gap> SetName( hybar, "hybar" );

## Isomorphisms between subgroups 
gap> homy := GroupHomomorphismByImagesNC( hy, hybar, [a^3], [b^2] );;
gap> homybar := GroupHomomorphismByImagesNC( hybar, hy, [b^2], [a^3] );; 

## defining graph of groups 
gap> G1 := GraphOfGroups( D1, [fa,fb], [hy,hybar], [homy,homybar] );
Graph of Groups: 2 vertices; 2 arcs; groups [ fa, fb ]
gap> Display( G1 );
Graph of Groups with :- 
    vertices: [ 5, 6 ]
        arcs: [ [ y, 5, 6 ], [ y^-1, 6, 5 ] ]
      groups: [ fa, fb ]
   subgroups: [ hy, hybar ]
isomorphisms: [ [ [ a^3 ], [ b^2 ] ], [ [ b^2 ], [ a^3 ] ] ]

## SubSection 6.2.2
gap> IsGraphOfFpGroups(G1);
true
gap> IsomorphismsOfGraphOfGroups(G1);
[ [ a^3 ] -> [ b^2 ], [ b^2 ] -> [ a^3 ] ]

## SubSection 6.2.3
gap> RTG1 := RightTransversalsOfGraphOfGroups( G1 );
[ [ <identity ...>, a, a^2 ], [ <identity ...>, b ] ]
gap> LTG1 := LeftTransversalsOfGraphOfGroups( G1 );
[ [ <identity ...>, a^-1, a^-2 ], [ <identity ...>, b^-1 ] ]

### Section 6.3  Words in a Graph of Groups and their normal forms

## SubSection 6.3.1
gap> L1 := [ a^7, 1, b^-6, 2, a^-11, 1, b^9, 2, a^7 ];;
gap> gw1 := GraphOfGroupsWord( G1, 5, L1 );
(5)a^7.y.b^-6.y^-1.a^-11.y.b^9.y^-1.a^7(5)
gap> IsGraphOfGroupsWord( gw1 );
true
gap> [ GGTail( gw1 ), GGHead( gw1 ) ];
[ 5, 5 ]
gap> GraphOfGroupsOfWord( gw1 );
Graph of Groups: 2 vertices; 2 arcs; groups [ fa, fb ]
gap> WordOfGraphOfGroupsWord( gw1 );
[ a^7, 1, b^-6, 2, a^-11, 1, b^9, 2, a^7 ]

## SubSection 6.3.2
gap> nw1 := ReducedGraphOfGroupsWord( gw1 );
(5)a^-1.y.b^-1.y^-1.a^10(5)

### Section 6,4 : Free products with amalgamation and HNN extensions

## Subsection 6.4.1
## set up the first group s3 and a subgroup c3=<a1>
gap> f1 := FreeGroup( 2, "a" );;
gap> rel1 := [f1.1^3, f1.2^2, (f1.1*f1.2)^2];;
gap> s3 := f1/rel1;;
gap> gs3 := GeneratorsOfGroup(s3);;
gap> SetName(s3,"s3");
gap> a1:=gs3[1];;  a2:=gs3[2];;
gap> H1 := Subgroup(s3,[a1]);;

## then the second group a4 and subgroup c3=<b1>
gap> f2 := FreeGroup( 2, "b" );;
gap> rel2 := [f2.1^3, f2.2^3, (f2.1*f2.2)^2];;
gap> a4 := f2/rel2;;
gap> ga4 := GeneratorsOfGroup(a4);;
gap> SetName(a4,"a4");
gap> b1 := ga4[1];;  b2:=ga4[2];;
gap> H2 := Subgroup(a4,[b1]);;
gap> iso := GroupHomomorphismByImages(H1,H2,[a1],[b1]);;
gap> inv := InverseGeneralMapping(iso);;
gap> fpa := FreeProductWithAmalgamation( s3, a4, iso );
<fp group on the generators [ fa1, fa2, fa3, fa4 ]>
gap> RelatorsOfFpGroup( fpa );
[ fa1^3, fa2^2, fa1*fa2*fa1*fa2, fa3^3, fa4^3, fa3*fa4*fa3*fa4, fa1*fa3^-1 ]
gap> gg1 := GraphOfGroupsRewritingSystem( fpa );;
gap> Display( gg1 );
Graph of Groups with :- 
    vertices: [ 5, 6 ]
        arcs: [ [ y, 5, 6 ], [ y^-1, 6, 5 ] ]
      groups: [ s3, a4 ]
   subgroups: [ Group( [ a1 ] ), Group( [ b1 ] ) ]
isomorphisms: [ [ [ a1 ], [ b1 ] ], [ [ b1 ], [ a1 ] ] ]
gap> LeftTransversalsOfGraphOfGroups( gg1 );
[ [ <identity ...>, a2^-1 ], [ <identity ...>, b2^-1, b1^-1*b2^-1, b1*b2^-1 ] 
 ]
gap> gfpa := GeneratorsOfGroup( fpa );;
gap> w2 := (gfpa[1]*gfpa[2]*gfpa[3]^gfpa[4])^3;
fa1*fa2*fa4^-1*fa3*fa4*fa1*fa2*fa4^-1*fa3*fa4*fa1*fa2*fa4^-1*fa3*fa4
gap> n2 := NormalFormGGRWS( fpa, w2 );
fa2*fa3*fa4^-1*fa2*fa4^-1*fa2*fa3^-1*fa4*fa3^-1

## Subsection 4.4.2
gap> H3 := Subgroup(a4,[b2]);;
gap> i23 := GroupHomomorphismByImages( H2, H3, [b1], [b2] );;
gap> hnn := HnnExtension( a4, i23 );
<fp group on the generators [ fe1, fe2, fe3 ]>
gap> phnn := PresentationFpGroup( hnn );;
gap> TzPrint( phnn );
#I  generators: [ fe1, fe2, fe3 ]
#I  relators:
#I  1.  3  [ 1, 1, 1 ]
#I  2.  3  [ 2, 2, 2 ]
#I  3.  4  [ 1, 2, 1, 2 ]
#I  4.  4  [ -3, 1, 3, -2 ]
gap> gg2 := GraphOfGroupsRewritingSystem( hnn );
Graph of Groups: 1 vertices; 2 arcs; groups [ a4 ]
gap> LeftTransversalsOfGraphOfGroups( gg2 );
[ [ <identity ...>, b2^-1, b1^-1*b2^-1, b1*b2^-1 ], 
  [ <identity ...>, b1^-1, b1, b2^-1*b1 ] ]
gap> gh := GeneratorsOfGroup( hnn );;
gap> w3 := (gh[1]^gh[2])*gh[3]^-1*(gh[1]*gh[3]*gh[2]^2)^2*gh[3]*gh[2];
fe2^-1*fe1*fe2*fe3^-1*fe1*fe3*fe2^2*fe1*fe3*fe2^2*fe3*fe2
gap> n3 := NormalFormGGRWS( hnn, w3 );
fe2*fe1*fe3*fe2*fe1*fe3
gap> fpainfo := FpaInfo( fpa );
rec( groups := [ s3, a4 ], isomorphism := [ a1 ] -> [ b1 ], 
  positions := [ [ 1, 2 ], [ 3, 4 ] ] )
gap> hnninfo := HnnInfo( hnn );
rec( group := a4, isomorphism := [ b1 ] -> [ b2 ] )
gap> SetInfoLevel( InfoGpd, gpd_infolevel_saved );;  
gap> STOP_TEST( "ggraph.tst", 100000 );

#############################################################################
##
#E  ggraph.tst . . . .. . . . . . . . . . . . . . . . . . . . . . . ends here
