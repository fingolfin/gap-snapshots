#############################################################################
##
#W  variable.g                  GAP library                      Frank Celler
##
#H  @(#)$Id: variable.g,v 4.14 2002/04/15 10:05:26 sal Exp $
##
#Y  Copyright (C)  1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file contains the functions for the special handling of those global
##  variables in {\GAP} library files that are *not* functions;
##  they are declared with `DeclareGlobalVariable' and initialized with
##  `InstallGlobal' resp.~`InstallFlushableGlobal'.
##
##  For the global functions in the {\GAP} libraray, see `oper.g'.
##
Revision.variable_g :=
    "@(#)$Id: variable.g,v 4.14 2002/04/15 10:05:26 sal Exp $";


#############################################################################
##

#C  IsToBeDefinedObj. . . . . . . .  represenation of "to be defined" objects
##
DeclareCategory( "IsToBeDefinedObj", IsObject );


#############################################################################
##
#V  ToBeDefinedObjFamily  . . . . . . . . . family of "to be defined" objects
##
BIND_GLOBAL( "ToBeDefinedObjFamily",
    NewFamily( "ToBeDefinedObjFamily", IsToBeDefinedObj ) );


#############################################################################
##
#V  ToBeDefinedObjType  . . . . . . . . . . . type of "to be defined" objects
##
BIND_GLOBAL( "ToBeDefinedObjType", NewType(
    ToBeDefinedObjFamily, IsPositionalObjectRep ) );


#############################################################################
##
#F  NewToBeDefinedObj() . . . . . . . . . create a new "to be defined" object
##
BIND_GLOBAL( "NewToBeDefinedObj", function(name)
    return Objectify( ToBeDefinedObjType, [name] );
end );



#############################################################################
##
#M  PrintObj( <obj> ) . . . . . . . . . . . . .  print "to be defined" object
##
InstallMethod( PrintObj,
    "for 'to be defined' objects",
    true,
    [ IsToBeDefinedObj ],
    0,

function(obj)
    Print( "<< ",obj![1]," to be defined>>" );
end );


#############################################################################
##
#O  FlushCaches( ) . . . . . . . . . . . . . . . . . . . . . Clear all caches
##
##  `FlushCaches()' will clear all clearable internal caches defined by
##  `InstallFlushableValue'.
##  These caches hold objects like finite fields once created and are used
##  to speed up computations as well as to avoid creating unique objects
##  several times, so `FlushCaches' is thought for debugging purposes.
##
##  All methods for `FlushCaches' must be installed that they clear the
##  cache and then return on `TryNextMethod', thus one call to `FlushCaches'
##  allows one to run all methods.
##
DeclareOperation( "FlushCaches", [] );
# This method is just that one method is callable. It is installed first, so
# it will be last in line.
InstallMethod(FlushCaches,"return method",true,[],0,function()end);


#############################################################################
##
#F  DeclareGlobalVariable( <name>[, <description>] )
##
##  `DeclareGlobalVariable' creates a new global variable named by the
##  string <name>.
##  If the second argument <description> is entered then this must be
##  a string that describes the meaning of the global variable.
##  Values can be assigned to the new variable with `InstallValue' or
##  `InstallFlushableValue'.
##
BIND_GLOBAL( "DeclareGlobalVariable", function( arg )
    BIND_GLOBAL( arg[1], NewToBeDefinedObj(arg[1]) );
end );


#############################################################################
##
#F  InstallValue( <gvar>, <value> )
#F  InstallFlushableValue( <gvar>, <value> )
##
##  `InstallValue' assigns the value <value> to the global variable <gvar>.
##  `InstallFlushableValue' does the same but additionally provides that
##  each call of `FlushCaches' will assign a structural copy of <value>
##  to <gvar>.
##
##  `InstallValue' does *not* work if <value> is an ``immediate object''
##  (i.e., an internally represented small integer or finite field element).
##  Furthermore, `InstallFlushableValue' works only if <value> is a list.
##
##  Using `DeclareGlobalVariable' and `InstallFlushableValue' has several
##  advantages, compared to simple assignments.
##  1. The initial value must be written down only once in the file;
##     this is an argument in particular for the variable `Primes2'.
##  2. The implementation of `FlushCaches' is not prescribed,
##     at least it is hidden in the function `InstallFlushableValue'.
##  3. It is possible to access the `#V' global variables from within GAP,
##     perhaps separately for each package.
##     Note that the assignments of other global variables via
##     `DeclareOperation', `DeclareProperty' etc. would admit this already.
#T     (This would raise the question whether also immutable `#V' variables
#T     shall be defined via a function call.)
##
##  (Note that `InstallFlushableValue' makes sense only for *mutable*
##  global lists.)
##
BIND_GLOBAL( "InstallValue", function ( gvar, value )
    if (not IsBound(REREADING) or REREADING = false) and not
       IsToBeDefinedObj( gvar ) then
        Error("InstallValue: a value has been installed already");
    else
        CLONE_OBJ (gvar, value);
    fi;
end);

BIND_GLOBAL( "InstallFlushableValue", function( gvar, value )
    local initval;

    if not IS_LIST( value ) then
      Error( "<value> must be a list" );
    fi;

    # Make a structural copy of the initial value.
    initval:= DEEP_COPY_OBJ( value );
    
    
    # Initialize the variable.
    if (not IsBound(REREADING) or REREADING = false) and not
       IsToBeDefinedObj( gvar ) then
        Error("InstallFlushableValue: a value has been installed already");
    else
        CLONE_OBJ (gvar, value);
    fi;

    # Install the method to flush the cache.
    InstallMethod( FlushCaches,
        true,
        [], 0,
        function()
            local i;
            for i in [ 1 .. LEN_LIST( gvar ) ] do
              Unbind( gvar[i] );
            od;
            for i in [ 1 .. LEN_LIST( initval ) ] do
              if IsBound( initval[i] ) then
                gvar[i]:= DEEP_COPY_OBJ( initval[i] );
              fi;
            od;
            TryNextMethod();
        end );
end );

##  Bind some keywords as global variables such that <Tab> completion works
##  for them. These variables are not accecible.
BIND_GLOBAL( "Unbind", 0 );
BIND_GLOBAL( "true", 0 );
BIND_GLOBAL( "false", 0 );
BIND_GLOBAL( "while", 0 );
BIND_GLOBAL( "repeat", 0 );
BIND_GLOBAL( "until", 0 );
BIND_GLOBAL( "SaveWorkspace", 0 );
BIND_GLOBAL( "else", 0 );
BIND_GLOBAL( "elif", 0 );
BIND_GLOBAL( "function", 0 );
BIND_GLOBAL( "local", 0 );
BIND_GLOBAL( "return", 0 );
BIND_GLOBAL( "then", 0 );
BIND_GLOBAL( "quit", 0 );
BIND_GLOBAL( "break", 0 );
BIND_GLOBAL( "continue", 0 );
BIND_GLOBAL( "IsBound", 0 );
BIND_GLOBAL( "TryNextMethod", 0 );
BIND_GLOBAL( "Info", 0 );
BIND_GLOBAL( "Assert", 0 );

#############################################################################
##

#E

