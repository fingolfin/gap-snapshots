#############################################################################
##
#W  hardtest.tst            GAP 4 package `tomlib'              Thomas Breuer
##
#H  @(#)$Id: tomlib.tst,v 1.2 2003/10/09 16:29:05 gap Exp $
##
#Y  Copyright (C)  2003,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##

gap> START_TEST("$Id: hardtest.tst,v 1.2 2003/10/09 16:29:05 gap Exp $");

gap> LoadPackage( "tomlib" );
true

# Check that all tables of marks are internally consistent.
# (This test takes more than a day.)
gap> for name in AllLibTomNames() do
> Print( name, "\n" );
>      tom:= TableOfMarks( name );
>      if not IsInternallyConsistent( tom ) then
>        Print( "#E  inconsistent t.o.m. of `", name, "'\n" );
>      fi;
> od;

gap> STOP_TEST( "hardtest.tst", 200000000000 );


#############################################################################
##
#E

