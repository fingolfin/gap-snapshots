#############################################################################
##
#W  ctblmoli.tst               GAP Library                      Thomas Breuer
##
#H  @(#)$Id: ctblmoli.tst,v 4.12 2003/11/15 17:05:31 gap Exp $
##
#Y  Copyright (C)  1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##

gap> START_TEST("$Id: ctblmoli.tst,v 4.12 2003/11/15 17:05:31 gap Exp $");

gap> G:= AlternatingGroup( 5 );;
gap> psi:= First( Irr( G ), x -> Degree( x ) = 3 );;
gap> molser:= MolienSeries( psi );
( 1-z^2-z^3+z^6+z^7-z^9 ) / ( (1-z^5)*(1-z^3)*(1-z^2)^2 )
gap> List( [ 0 .. 20 ], i -> ValueMolienSeries( molser, i ) );
[ 1, 0, 1, 0, 1, 0, 2, 0, 2, 0, 3, 0, 4, 0, 4, 1, 5, 1, 6, 1, 7 ]
gap> MolienSeriesWithGivenDenominator( molser, [ 2, 6, 10 ] );
( 1+z^15 ) / ( (1-z^10)*(1-z^6)*(1-z^2) )


gap> y:= E(3);; x:= E(3)^2;;
gap> G:= Group(
gap>            [ [ 0, y, 0, 0, 0, 0 ],
gap>              [ x, 0, 0, 0, 0, 0 ],
gap>              [ 0, 0, 1, 0, 0, 0 ],
gap>              [ 0, 0, 0, 1, 0, 0 ],
gap>              [ 0, 0, 0, 0, 1, 0 ],
gap>              [ 0, 0, 0, 0, 0, 1 ] ],
gap>            PermutationMat( (1,2), 6, Rationals ),
gap>            PermutationMat( (2,3), 6, Rationals ),
gap>            PermutationMat( (3,4), 6, Rationals ),
gap>            PermutationMat( (4,5), 6, Rationals ) );;
gap> Size( G );
9720
gap> MolienSeries( NaturalCharacter( G ) );
( 1 ) / ( (1-z^12)*(1-z^9)*(1-z^6)*(1-z^5)*(1-z^3)*(1-z) )


gap> STOP_TEST( "ctblmoli.tst",416003661);


#############################################################################
##
#E  ctblmoli.tst  . . . . . . . . . . . . . . . . . . . . . . . . . ends here
##

