#############################################################################
##
#W  boolean.g                    GAP library                    Thomas Breuer
#W                                                             & Frank Celler
##
#H  @(#)$Id: boolean.g,v 4.6 2002/04/15 10:04:29 sal Exp $
##
#Y  Copyright (C)  1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file deals with booleans.
##
Revision.boolean_g :=
    "@(#)$Id: boolean.g,v 4.6 2002/04/15 10:04:29 sal Exp $";


#############################################################################
##
#C  IsBool(<obj>) . . . . . . . . . . . . . . . . . . .  category of booleans
##
##  tests whether <obj> is `true', `false' or `fail'.
DeclareCategoryKernel( "IsBool", IsObject, IS_BOOL );


#############################################################################
##
#V  BooleanFamily . . . . . . . . . . . . . . . . . . . .  family of booleans
##
BIND_GLOBAL( "BooleanFamily",
    NewFamily(  "BooleanFamily", IS_BOOL ) );


#############################################################################
##
#F  TYPE_BOOL . . . . . . . . . . . . . . . . . . . type of internal booleans
##
BIND_GLOBAL( "TYPE_BOOL",
    NewType( BooleanFamily, IS_BOOL and IsInternalRep ) );


#############################################################################
##
#m  String( <bool> )  . . . . . . . . . . . . . . . . . . . . . for a boolean
##
InstallMethod( String,
    "for a boolean",
    true,
    [ IsBool ], 0,
    function( bool )
    if bool = true then
      return "true";
    elif bool = false  then
      return "false";
    elif bool = fail  then
      return "fail";
    else
      Error( "unknown boolean <bool>" );
    fi;
    end );


#############################################################################
##

#E
##
