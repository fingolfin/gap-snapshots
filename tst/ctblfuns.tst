#############################################################################
##
#W  ctblfuns.tst               GAP Library                      Thomas Breuer
##
#H  @(#)$Id: ctblfuns.tst,v 1.6 2002/12/02 15:26:05 gap Exp $
##
#Y  Copyright (C)  1998,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##

gap> START_TEST("$Id: ctblfuns.tst,v 1.6 2002/12/02 15:26:05 gap Exp $");

gap> S4:= SymmetricGroup( 4 );
Sym( [ 1 .. 4 ] )
gap> V4:= Group( (1,2)(3,4), (1,3)(2,4) );
Group([ (1,2)(3,4), (1,3)(2,4) ])
gap> irr:= Irr( V4 );
[ Character( CharacterTable( Group([ (1,2)(3,4), (1,3)(2,4) ]) ), 
    [ 1, 1, 1, 1 ] ), Character( CharacterTable( Group(
    [ (1,2)(3,4), (1,3)(2,4) ]) ), [ 1, -1, -1, 1 ] ), 
  Character( CharacterTable( Group([ (1,2)(3,4), (1,3)(2,4) ]) ), 
    [ 1, -1, 1, -1 ] ), Character( CharacterTable( Group(
    [ (1,2)(3,4), (1,3)(2,4) ]) ), [ 1, 1, -1, -1 ] ) ]
gap> List( irr, x -> InertiaSubgroup( S4, x ) );
[ Sym( [ 1 .. 4 ] ), Group([ (1,4)(2,3), (1,3)(2,4), (1,2,4,3) ]),
  Group([ (1,4)(2,3), (1,3)(2,4), (1,4,3,2) ]),
  Group([ (1,4)(2,3), (1,3)(2,4), (1,2) ]) ]
gap> List( last, Size );
[ 24, 8, 8, 8 ]

gap> STOP_TEST( "ctblfuns.tst", 31000000 );

#############################################################################
##
#E

