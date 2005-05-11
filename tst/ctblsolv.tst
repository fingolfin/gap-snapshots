#############################################################################
##
#W  ctblsolv.tst               GAP Library                      Thomas Breuer
##
#H  @(#)$Id: ctblsolv.tst,v 1.7.2.3 2005/05/11 14:53:02 gap Exp $
##
#Y  Copyright (C)  1998,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  To be listed in testall.g
##

gap> START_TEST("$Id: ctblsolv.tst,v 1.7.2.3 2005/05/11 14:53:02 gap Exp $");

gap> CharacterDegrees( SmallGroup( 256, 529 ) );
[ [ 1, 8 ], [ 2, 30 ], [ 4, 8 ] ]
gap> for pair in [ [ 18, 3 ], [ 27, 3 ], [ 36, 7 ], [ 50, 3 ], [ 54, 4 ] ] do
>      G:= SmallGroup( pair[1], pair[2] );
>      if CharacterDegrees( G, 0 )
>         <> Collected( List( Irr( G ), x -> x[1] ) ) then
>        Error( IdGroup( G ) );
>      fi;
>    od;

gap> STOP_TEST( "ctblsolv.tst", 300000000 );


#############################################################################
##
#E

