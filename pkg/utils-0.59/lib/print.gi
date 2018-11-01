#############################################################################
##
#W  print.gi                  GAP4 package `Utils'              Chris Wensley
##
#Y  Copyright (C) 2015-2018, The GAP Group 

#############################################################################
##  this function has been transferred from XMod 
##  (08/09/18) the function is obsolete, better to use: Perform(L,Display)
##
#M  PrintListOneItemPerLine( <list> )
##
InstallMethod( PrintListOneItemPerLine, "generic method for lists", 
    true, [ IsList ], 0,
function( L )

##    local  len, i;
##
##    len := Length( L );
##    if ( len < 2 ) then
##        Print( L, "\n" );
##    else
##        Print( "[ " );
##        for i in [1..len-1] do
##            if IsBound( L[i] ) then
##                Print( L[i], ",\n  " );
##            else
##                Print( "," );
##            fi;
##        od;
##        Print( L[len], " ]\n" );
##    fi;

    Perform( L, Display );
end );

#############################################################################
##  this function has been transferred from XMod and renamed 
##  (08/09/18) functions are obsolete, better to use: Perform(L,Display)
##
#M  PrintOneItemPerLine( <arg> )
#M  PrintIteratorOneItemPerLine( <iterator> )
##
InstallGlobalFunction( PrintOneItemPerLine, 

function( arg )

    local obj;

    obj := arg[1]; 
    if IsList( obj ) then 
        PrintListOneItemPerLine( obj ); 
    elif IsIterator( obj ) then 
        PrintIteratorOneItemPerLine( obj ); 
    else 
        PrintIteratorOneItemPerLine( Iterator( obj ) ); 
    fi;
end );

InstallMethod( PrintIteratorOneItemPerLine, "generic method for iterators", 
    true, [ IsIterator ], 0,
function( iter )

##    local  it, x;
##
##    it := ShallowCopy( iter );
##    for x in it do 
##        Print( x, "\n" ); 
##    od;

    Perform( iter, Display ); 
end );

#############################################################################
##  these operations have not been transferred from any other package  
##
#M  PrintSelection( <args> )
#M  PrintSelectionFromList( <list>, <first>, <step>, <last> )
#M  PrintSelectionFromIterator( <iterator>, <first>, <step>, <last> )
##
InstallGlobalFunction( "PrintSelection", 

function( arg ) 

    local  nargs, obj, first, step, last, L, ok; 

    nargs := Length( arg ); 
    obj := arg[1]; 
    if ( ( nargs = 1 ) or ( nargs > 4 ) ) then 
        Error( "expecting 2, 3 or 4 arguments" ); 
    elif ( nargs = 2 ) then 
        L := arg[2]; 
        if IsList( L ) then 
            ok := ForAll( L, n -> IsPosInt(n) ); 
            if not ok then 
                Error( "L must only contain positive integers" ); 
            fi; 
            if IsList( obj ) then 
                PrintSelectionFromListByList( obj, L ); 
            elif IsIterator( obj ) then 
                PrintSelectionFromIteratorByList( obj, L ); 
            else 
                PrintSelectionFromIteratorByList( Iterator( obj ), L ); 
            fi;
        else 
            Error( "second argument not a list" ); 
        fi;
    else 
        first := arg[2]; 
        step := arg[3]; 
        if ( nargs = 3 ) then 
            if IsList( obj ) then 
                last := Length( obj );
            else 
                last := infinity; 
            fi;
        else 
            last := arg[4]; 
        fi; 
        if IsList( obj ) then 
            PrintSelectionFromList( obj, first, step, last ); 
        elif IsIterator( obj ) then 
            PrintSelectionFromIterator( obj, first, step, last ); 
        else 
            PrintSelectionFromIterator( Iterator( obj ), first, step, last ); 
        fi; 
    fi; 
end ); 

InstallMethod( PrintSelectionFromList, "generic method for lists", 
    true, [ IsList, IsPosInt, IsPosInt, IsPosInt ], 0,
function( L, first, step, last )

    local  len, i;

    len := Minimum( Length( L ), last );
    if ( first <= len ) then 
        Print( first, " : ", L[first], "\n" ); 
        len := len-first; 
        i := first; 
        while ( len >= step ) do 
            i := i+step; 
            Print( i, " : ", L[i], "\n" ); 
            len := len-step; 
        od;
    fi; 
end );

InstallOtherMethod( PrintSelectionFromIterator, "generic method for iterators", 
    true, [ IsIterator, IsPosInt, IsPosInt, IsAdditiveElement ], 0,
function( iter0, first, step, last )

    local  iter, pos, i, x;

    if ( last < first ) then 
        Error( "expecting first <= last" ); 
    fi;
    iter := ShallowCopy( iter0 ); 
    i := 0; 
    while( ( i < first ) and not IsDoneIterator( iter ) ) do 
        i := i+1;
        x := NextIterator( iter ); 
    od; 
    if ( i = first ) then 
        pos := first; 
        Print( pos, " : ", x, "\n" );
    fi;
    while ( not IsDoneIterator( iter ) and ( pos < last ) ) do 
        while ( not IsDoneIterator( iter ) and ( pos < last ) ) do 
            i := 0;
            while( ( i<step ) and ( pos+i < last ) 
                   and not IsDoneIterator( iter ) ) do 
                i := i+1;
                x := NextIterator( iter ); 
            od; 
            pos := pos + i;
            if ( i = step ) then 
                Print( pos, " : ", x, "\n" );
            fi;
        od;
    od; 
end );

InstallMethod( PrintSelectionFromListByList, "generic method for lists", 
    true, [ IsList, IsList ], 0,
function( L, posL )

    local  len, i;

    if not ForAll( posL, n -> IsPosInt( n ) ) then 
        Error( "posL should be a list of positive integers" ); 
    fi; 
    len := Length( L );
    for i in [1..len] do 
        if ( i in posL ) then 
            Print( i, " : ", L[i], "\n" );
        fi; 
    od; 
end );

InstallMethod( PrintSelectionFromIteratorByList, "generic method for iterators", 
    true, [ IsIterator, IsList ], 0,
function( iter0, posL )

    local  iter, max, i, x;

    if not ForAll( posL, n -> IsPosInt( n ) ) then 
        Error( "posL should be a list of positive integers" ); 
    fi; 
    iter := ShallowCopy( iter0 ); 
    max := Maximum( posL );
    i := 0; 
    while ( ( i < max ) and not IsDoneIterator( iter ) ) do
        x := NextIterator( iter ); 
        i := i+1;
        if ( i in posL ) then 
            Print( i, " : ", x, "\n" );
        fi; 
    od; 
end );

#############################################################################
##
#E  print.gi  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here