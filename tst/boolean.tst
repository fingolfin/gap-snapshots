#############################################################################
##
#W  boolean.tst                GAP Library                      Thomas Breuer
##
#H  @(#)$Id: boolean.tst,v 4.4 2002/04/15 10:08:39 sal Exp $
##
#Y  Copyright (C)  1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##

gap> START_TEST("$Id: boolean.tst,v 4.4 2002/04/15 10:08:39 sal Exp $");

gap> not true;
false
gap> not false;
true

gap> true = true;
true
gap> true = false;
false
gap> false = true;
false
gap> false = false;
true

gap> true < true;
false
gap> true < false;
true
gap> false < true;
false
gap> false < false;
false

gap> true or true;
true
gap> true or false;
true
gap> false or true;
true
gap> false or false;
false

gap> true and true;
true
gap> true and false;
false
gap> false and true;
false
gap> false and false;
false

gap> STOP_TEST( "boolean.tst", 39000 );

#############################################################################
##
#E  boolean.tst . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
##



