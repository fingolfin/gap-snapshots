#############################################################################
##
#W  function.g                   GAP library                    Thomas Breuer
#W                                                             & Frank Celler
##
#H  @(#)$Id: function.g,v 4.14.4.1 2005/05/05 09:14:28 gap Exp $
##
#Y  Copyright (C)  1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file deals with functions.
##
Revision.function_g :=
    "@(#)$Id: function.g,v 4.14.4.1 2005/05/05 09:14:28 gap Exp $";


#############################################################################
##
#C  IsFunction( <obj> )	. . . . . . . . . . . . . . . . category of functions
##
##  is the category of functions.
DeclareCategoryKernel( "IsFunction",
    IS_OBJECT,
    IS_FUNCTION );


#############################################################################
##
#C  IsOperation( <obj> )  . . . . . . . . . . . . . .  category of operations
##
##  is the category of operations. Every operation is a function, but not
##  vice versa.
DeclareCategoryKernel( "IsOperation",
    IS_FUNCTION,
    IS_OPERATION );


#############################################################################
##
#V  FunctionsFamily . . . . . . . . . . . . . . . . . . . family of functions
##
##  is the family of all functions.
BIND_GLOBAL( "FunctionsFamily", NewFamily( "FunctionsFamily", IsFunction ) );


#############################################################################
##
#V  TYPE_FUNCTION . . . . . . . . . . . . . . . . . . . .  type of a function
##
BIND_GLOBAL( "TYPE_FUNCTION", NewType( FunctionsFamily,
                          IsFunction and IsInternalRep ) );


#############################################################################
##
#F  TYPE_OPERATION  . . . . . . . . . . . . . . . . . . . type of a operation
##
BIND_GLOBAL( "TYPE_OPERATION",
    NewType( FunctionsFamily,
             IsFunction and IsOperation and IsInternalRep ) );


#############################################################################
##
#F  NameFunction( <func> )  . . . . . . . . . . . . . . .  name of a function
##
##  returns the name of a function. For operations, this is the name used in
##  their declaration. For functions, this is the variable name they were
##  first assigned to. (For some internal functions, this might be a name
##  *different* from the name that is documented.)
##  If no such name exists, `"unknown"' is returned.

#T  If objects simulate functions this must become an operation.
##
BIND_GLOBAL( "NameFunction", NAME_FUNC );


#############################################################################
##
#F  NumberArgumentsFunction( <func> )
##
##  returns the number of arguments the function <func> accepts. For
##  functions that use `arg' to take a variable number of arguments, as well
##  as for operations, -1 is returned. For attributes, 1 is returned.
BIND_GLOBAL( "NumberArgumentsFunction", NARG_FUNC );


#############################################################################
##
#F  NamesLocalVariablesFunction( <func> )
##
##  returns a mutable list of strings;
##  the first entries are the names of the arguments of the function <func>,
##  in the same order as they were entered in the definition of <func>,
##  and the remaining ones are the local variables as given in the `local'
##  statement in <func>.
##  (The number of arguments can be computed with `NumberArgumentsFunction'.)
##
BIND_GLOBAL( "NamesLocalVariablesFunction", NAMS_FUNC );


#############################################################################
##
#F  CallFuncList( <func>, <args> )  . . . . . . . . . . . . . call a function
##
##  returns the result, when calling function <func> with the arguments
##  given in the list <args>, i.e.~<args> is ``unwrapped'' so that <args> 
##  appears as several arguments to <func>.

#T  If objects simulate functions this must become an operation.
##
UNBIND_GLOBAL("CallFuncList"); # was declared 2b defined
BIND_GLOBAL( "CallFuncList", CALL_FUNC_LIST );


#############################################################################
##
#F  ReturnTrue( ... ) . . . . . . . . . . . . . . . . . . . . . . always true
##
##  This function takes any number of arguments, and always returns `true'.
BIND_GLOBAL( "ReturnTrue", RETURN_TRUE );


#############################################################################
##
#F  ReturnFalse( ... )  . . . . . . . . . . . . . . . . . . . .  always false
##
##  This function takes any number of arguments, and always returns `false'.
BIND_GLOBAL( "ReturnFalse", RETURN_FALSE );


#############################################################################
##
#F  ReturnFail( ... ) . . . . . . . . . . . . . . . . . . . . . . always fail
##
##  This function takes any number of arguments, and always returns `fail'.
BIND_GLOBAL( "ReturnFail", RETURN_FAIL );


#############################################################################
##
#F  IdFunc( <obj> ) . . . . . . . . . . . . . . . . . . . . . .  return <obj>
##
##  returns <obj>.
BIND_GLOBAL( "IdFunc", ID_FUNC );


#############################################################################
##
#M  ViewObj( <func> ) . . . . . . . . . . . . . . . . . . . . . . view method
##

InstallMethod( ViewObj, "for a function", true, [IsFunction], 0,
        function ( func )
    local nams, narg, i;
    Print("function( ");
    nams := NAMS_FUNC(func);
    narg := NARG_FUNC(func);
    if nams = fail then
        Print( "<",narg," unnamed arguments>" );
    elif narg = -1 then
        Print("arg");
    elif narg > 0 then
        Print(nams[1]);
        for i in [2..narg] do
            Print(", ",nams[i]);
        od;
    fi;
    Print(" ) ... end");
end);

    
BIND_GLOBAL( "PRINT_OPERATION",    function ( op )
    Print("<Operation \"",NAME_FUNC(op),"\">");
         end);  
    
    InstallMethod( ViewObj, "for an operation", true, [IsOperation], 0,
        PRINT_OPERATION);

#############################################################################
##
#E  function.g	. . . . . . . . . . . . . . . . . . . . . . . . . . ends here
##
