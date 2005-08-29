#############################################################################
##
#W  rss.tst                   GAP library		       Gene Cooperman
#W							     and Scott Murray
##
#H  @(#)$Id: rss.tst,v 4.4.2.4 2005/08/29 14:50:35 gap Exp $
##
#Y  Copyright (C)  1998,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  Exclude from testall.g: why?
##

gap> START_TEST("$Id: rss.tst,v 4.4.2.4 2005/08/29 14:50:35 gap Exp $");

gap> G := GL(4,2);
SL(4,2)
gap> RandomSchreierSims(G);
SL(4,2)
gap> HasChainSubgroup(G);
true
gap> G := MathieuGroup(22);;
gap> RandomSchreierSims(G);;
gap> HasChainSubgroup(G);
true
gap> G := GL(7,2);
SL(7,2)
gap> RandomSchreierSims(G);
SL(7,2)
gap> HasChainSubgroup(G);  
true

gap> STOP_TEST( "rss.tst", 65400000 );


#############################################################################
##
#E  

