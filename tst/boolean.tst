#############################################################################
##
#W  boolean.tst                GAP Library                      Thomas Breuer
##
#H  @(#)$Id: boolean.tst,v 4.4.4.4 2005/08/29 14:50:35 gap Exp $
##
#Y  Copyright (C)  1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  Exclude from testall.g: too trivial?
##

gap> START_TEST("$Id: boolean.tst,v 4.4.4.4 2005/08/29 14:50:35 gap Exp $");

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

gap> STOP_TEST( "boolean.tst", 100000 );

#############################################################################
##
#E

