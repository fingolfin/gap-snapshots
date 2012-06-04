#############################################################################
##
#W  hurwitz.tst                  FR Package               Jakob Kroeker
##
#H  @(#)$Id: hurwitz.tst,v 1.2 2012/05/10 23:45:43 gap Exp $
##
#Y  Copyright (C) 2012,  Laurent Bartholdi
##
#############################################################################
##
##  This file tests the finite field hurwitz map search part
##
#############################################################################

gap> SetInfoLevel(InfoFR,1); 
gap> HURWITZTEST_RENORMALIZATION_@FR();
gap> HURWITZTEST_SEARCH_SPACE_SIZE_@FR();
gap> HURWITZTEST_THREE_CV_@FR();
gap> HURWITZTEST_STRICT_NORMALIZATION_@FR();
gap> HURWITZTEST_FOUR_CRITICAL_VALUES_@FR();
gap> HURWITZTEST_UNCOMMON_CV_@FR();

#E hurwitz.tst . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
