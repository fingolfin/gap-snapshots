#############################################################################
##
#W  zlattice.tst                GAP library                     Thomas Breuer
##
#H  @(#)$Id: zlattice.tst,v 1.2 2002/04/15 10:08:43 sal Exp $
##
#Y  Copyright (C)  1999,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##

gap> START_TEST("$Id: zlattice.tst,v 1.2 2002/04/15 10:08:43 sal Exp $");


# trivial cases of `LLLReducedBasis'
gap> LLLReducedBasis( [ ] );
rec( basis := [  ], mue := [  ], B := [  ] )
gap> LLLReducedBasis( [ [ 0, 0 ], [ 0, 0 ] ], "linearcomb" );
rec( basis := [  ], relations := [ [ 1, 0 ], [ 0, 1 ] ], 
  transformation := [  ], mue := [  ], B := [  ] )


gap> STOP_TEST( "zlattice.tst", 136000 );


#############################################################################
##
#E

