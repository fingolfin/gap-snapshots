#############################################################################
##
#W  eigen.tst                   GAP library		       Gene Cooperman
#W							     and Scott Murray
##
#H  @(#)$Id: eigen.tst,v 4.6.2.3 2005/05/11 14:53:02 gap Exp $
##
#Y  Copyright (C)  1998,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  Exclude from testall.g: why?
##

gap> START_TEST("$Id: eigen.tst,v 4.6.2.3 2005/05/11 14:53:02 gap Exp $");
gap> A := GL(4,3).1;
[ [ Z(3), 0*Z(3), 0*Z(3), 0*Z(3) ], [ 0*Z(3), Z(3)^0, 0*Z(3), 0*Z(3) ], 
  [ 0*Z(3), 0*Z(3), Z(3)^0, 0*Z(3) ], [ 0*Z(3), 0*Z(3), 0*Z(3), Z(3)^0 ] ]
gap> CharacteristicPolynomial(GF(3), A );
x_1^4+x_1^3-x_1-Z(3)^0
gap> GeneralisedEigenvalues(GF(3), A );
[ x_1+Z(3)^0, x_1-Z(3)^0 ]
gap> GeneralisedEigenspaces(GF(3),A);
[ <vector space over GF(3), with 1 generators>, 
  <vector space over GF(3), with 3 generators> ]
gap> STOP_TEST( "eigen.tst", 15900000 );


#############################################################################
##
#E  

