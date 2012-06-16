#############################################################################
##
#W  chapter-12.tst                 FR Package               Laurent Bartholdi
##
#H  @(#)$Id: chapter-12.tst,v 1.2 2012/06/05 09:57:49 gap Exp $
##
#Y  Copyright (C) 2008,  Laurent Bartholdi
##
#############################################################################
##
##  This file tests the helper functions
##
#############################################################################

gap> START_TEST("fr:chapter 12");
gap> 
gap> Info(InfoFR,1,"12.2 Periodic lists");
#I  12.2 Periodic lists
gap> 
gap> Info(InfoFR,1,"12.3 Word growth");
#I  12.3 Word growth
gap> 
gap> Info(InfoFR,1,"12.4 Finding short relations");
#I  12.4 Finding short relations
gap> 
gap> Info(InfoFR,1,"12.5 Braid groups");
#I  12.5 Braid groups
gap> 
gap> Info(InfoFR,1,"12.6 Trans");
#I  12.6 Trans
gap> 
gap> Info(InfoFR,1,"12.7 PMCOMPLEX");
#I  12.7 PMCOMPLEX
gap> 1.0_z;
1.
gap> last/2;
0.5
gap> Info(InfoFR,1,"12.9 Dirichlet series");
#I  12.9 Dirichlet series
gap> 
gap> Info(InfoFR,1,"12.10 Projective reps");
#I  12.10 Projective reps
gap> 
gap> 
gap> STOP_TEST( "chapter-12.tst", 3*10^8 );
fr:chapter 12
GAP4stones: 10000

#E chapter-12.tst . . . . . . . . . . . . . . . . . . . . . . . . . ends here
