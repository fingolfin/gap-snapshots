#############################################################################
##
#W  primsan.tst                 GAP library                      Steve Linton
##
#H  @(#)$Id: primsan.tst,v 4.1.12.3 2005/05/11 14:53:02 gap Exp $
##
#Y  Copyright (C)  1999,  School of Computer Science, St Andrews
##
##  sanity test for primitive groups library -- takes 30-40 minutes on
##  a PIII/500, and need 400MB of RAM
##
##  Exclude from testall.g until the typical developer's desktop
##  is big and fast enough.
##

gap> START_TEST("$Id: primsan.tst,v 4.1.12.3 2005/05/11 14:53:02 gap Exp $");


#############################################################################
##
##  Define a function to check the primitive groups of degree n and 
##  loop over a range of n
##
gap> checkdegree := function(n) 
>     local g;
>     for g in AllPrimitiveGroups(DegreeOperation,n) do
>         if MovedPoints(g) <> [1..n] or not IsTransitive(g,[1..n]) 
>            or not IsPrimitive(g,[1..n]) then
>             Error("Failure at ",g," degree ",n,"\n");
>         fi;
>     od;
> end;;
gap> for n in [2..999] do 
>     checkdegree(n);
> od;

gap> STOP_TEST( "primsan.tst", 411290800000 );


#############################################################################
##
#E

