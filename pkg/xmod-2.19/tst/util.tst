#############################################################################
##
#W  util.tst                      XMOD test file                Chris Wensley
#W                                                                & Murat Alp
##  version 2.18, 18/04/2012 
##
#Y  Copyright (C) 2012, Murat Alp and Chris Wensley, 
#Y  School of Computer Science, Bangor University, U.K. 
##
#############################################################################
gap> START_TEST( "Testing examples in Chapter 9 of the the XMod manual" );
gap> saved_infolevel_xmod := InfoLevel( InfoXMod );; 
gap> SetInfoLevel( InfoXMod, 0 );;

## Chapter 9

## Section 9.1.1
gap> incd8;
[ (11,13,15,17)(12,14,16,18), (12,18)(13,17)(14,16) ] -> 
[ (11,13,15,17)(12,14,16,18), (12,18)(13,17)(14,16) ]
gap> imd8 := Image( incd8 );;
gap> resd8 := RestrictionMappingGroups( incd8, c4, imd8 );
[ (11,13,15,17)(12,14,16,18) ] -> [ (11,13,15,17)(12,14,16,18) ]
gap> Source( resd8 );
c4
gap> Range( resd8 );
Group([ (11,13,15,17)(12,14,16,18), (12,18)(13,17)(14,16) ])
gap> MappingToOne( c4, imd8 );
[ (11,13,15,17)(12,14,16,18) ] -> [ () ]

## Section 9.2.1
gap> end8 := EndomorphismClasses( d8, 1 );;
gap> Length( end8 );
13
gap> e4 := end8[4];
<enumerator>
gap> ## EndoClassNaturalHom( e4 );
gap> ## EndoClassIsomorphism( e4 );
gap> ## EndoClassConjugators( e4 );
gap> ## Size( AutoGroup( e4 ) ); 
gap> L := List( end8, e->Length(EndoClassConjugators(e))*Size(AutoGroup(e)) );; 
gap> Sort( L ); 
gap> L; 
[ 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 6, 6, 8 ]
gap> Sum(L);
36

## Section 9.2.2
gap> autd8 := AutomorphismGroup( d8 );;
gap> innd8 := InnerAutomorphismsByNormalSubgroup( d8, d8 );;
gap> GeneratorsOfGroup( innd8 );
[ ^(1,2,3,4), ^(1,3) ]
gap> IsGroupOfAutomorphisms( innd8 );
true

## Section 9.3.1
gap> x := (6,7)(8,9);;  y := (6,8)(7,9);;  z := (6,9)(7,8);;
gap> k4 := Group( x, y );;  SetName( k4, "k4" );
gap> s3 := Group( (1,2), (2,3) );;  SetName( s3, "s3" );
gap> alpha := GroupHomomorphismByImages( k4, k4, [x,y], [y,x] );;
gap> beta := GroupHomomorphismByImages( k4, k4, [x,y], [x,z] );;
gap> aut := Group( alpha, beta );;
gap> act := GroupHomomorphismByImages( s3, aut, [(1,2),(2,3)], [alpha,beta] );;
gap> abmod := AbelianModuleObject( k4, act );;
gap> Xabmod := XModByAbelianModule( abmod );
[k4->s3]
gap> Display( Xabmod );

Crossed module [k4->s3] :- 
: Source group k4 has generators:
  [ (6,7)(8,9), (6,8)(7,9) ]
: Range group s3 has generators:
  [ (1,2), (2,3) ]
: Boundary homomorphism maps source generators to:
  [ (), () ]
: Action homomorphism maps range generators to automorphisms:
  (1,2) --> { source gens --> [ (6,8)(7,9), (6,7)(8,9) ] }
  (2,3) --> { source gens --> [ (6,7)(8,9), (6,9)(7,8) ] }
  These 2 automorphisms generate the group of automorphisms.


## Section 9.4.1
gap> J := [ [1,2,3], [3,4], [3,4], [1,2,4] ];
[ [ 1, 2, 3 ], [ 3, 4 ], [ 3, 4 ], [ 1, 2, 4 ] ]
gap> DistinctRepresentatives( J );
[ 1, 3, 4, 2 ]
gap> K := [ [3,4], [1,2], [2,3], [2,3,4] ];
[ [ 3, 4 ], [ 1, 2 ], [ 2, 3 ], [ 2, 3, 4 ] ]
gap> CommonRepresentatives( J, K );
[ [ 3, 3, 3, 1 ], [ 1, 3, 4, 2 ] ]
gap> CommonTransversal( d16, c4 );
[ (), (12,18)(13,17)(14,16), (11,12,13,14,15,16,17,18), 
  (11,12)(13,18)(14,17)(15,16) ]
gap> SetInfoLevel( InfoXMod, saved_infolevel_xmod );; 
gap> STOP_TEST( "util.tst", 5000 );

#############################################################################
##
#E  util.tst . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
