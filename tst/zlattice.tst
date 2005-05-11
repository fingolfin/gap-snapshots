#############################################################################
##
#W  zlattice.tst                GAP library                     Thomas Breuer
##
#H  @(#)$Id: zlattice.tst,v 1.2.4.3 2005/05/11 14:53:02 gap Exp $
##
#Y  Copyright (C)  1999,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  To be listed in testall.g
##

gap> START_TEST("$Id: zlattice.tst,v 1.2.4.3 2005/05/11 14:53:02 gap Exp $");


# trivial cases of `LLLReducedBasis'
gap> LLLReducedBasis( [ ] );
rec( basis := [  ], mue := [  ], B := [  ] )
gap> LLLReducedBasis( [ [ 0, 0 ], [ 0, 0 ] ], "linearcomb" );
rec( basis := [  ], relations := [ [ 1, 0 ], [ 0, 1 ] ], 
  transformation := [  ], mue := [  ], B := [  ] )


gap> STOP_TEST( "zlattice.tst", 800000 );


#############################################################################
##
#E

