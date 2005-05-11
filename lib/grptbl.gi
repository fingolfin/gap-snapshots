#############################################################################
##
#W  grptbl.gi                   GAP library                     Thomas Breuer
##
#H  @(#)$Id: grptbl.gi,v 4.22.4.1 2005/05/06 08:46:30 gap Exp $
##
#Y  Copyright (C)  1996,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file contains the methods for magmas given by their multiplication
##  tables.
##
Revision.grptbl_gi :=
    "@(#)$Id: grptbl.gi,v 4.22.4.1 2005/05/06 08:46:30 gap Exp $";


#############################################################################
##
#R  IsMagmaByMultiplicationTableObj( <obj> )
##
##  At position 1 of the element $m_i$, the number $i$ is stored.
##
DeclareRepresentation( "IsMagmaByMultiplicationTableObj",
    IsPositionalObjectRep and IsMultiplicativeElementWithInverse,
    [ 1 ] );
#T change to IsPositionalObjectOneSlotRep!


#############################################################################
##
#M  PrintObj( <obj> )
##
InstallMethod( PrintObj,
    "for element of magma by mult. table",
    [ IsMagmaByMultiplicationTableObj ],
    function( obj )
    Print( "m", obj![1] );
    end );


#############################################################################
##
#M  \=( <x>, <y> )
#M  \<( <x>, <y> )
#M  \*( <x>, <y> )
#M  \^( <x>, <n> )
##
InstallMethod( \=,
    "for two elements of magma by mult. table",
    IsIdenticalObj,
    [ IsMagmaByMultiplicationTableObj,
      IsMagmaByMultiplicationTableObj ],
    function( x, y ) return x![1] = y![1]; end );

InstallMethod( \<,
    "for two elements of magma by mult. table",
    IsIdenticalObj,
    [ IsMagmaByMultiplicationTableObj,
      IsMagmaByMultiplicationTableObj ],
    function( x, y ) return x![1] < y![1]; end );

InstallMethod( \*,
    "for two elements of magma by mult. table",
    IsIdenticalObj,
    [ IsMagmaByMultiplicationTableObj,
      IsMagmaByMultiplicationTableObj ],
    function( x, y )
    local F;
    F:= FamilyObj( x );
    return F!.set[ MultiplicationTable( F )[ x![1] ][ y![1] ] ];
    end );


#############################################################################
##
#M  OneOp( <elm> )
##
InstallMethod( OneOp,
    "for an element in a magma by mult. table",
    [ IsMagmaByMultiplicationTableObj ],
    function( elm )
    local F, n, A, onepos, one;

    F:= FamilyObj( elm );
    n:= F!.n;

    # Check that the mult. table admits a left and right identity element.
    A:= MultiplicationTable( F );
    onepos:= Position( A, [ 1 .. n ] );
    if onepos = fail or A{ [ 1 .. n ] }[ onepos ] <> [ 1 .. n ] then
      one:= fail;
    else
      one:= F!.set[ onepos ];
    fi;

    SetOne( F, one );

    return one;
    end );


#############################################################################
##
#M  InverseOp( <elm> )
##
InstallMethod( InverseOp,
    "for an element in a magma by mult. table",
    [ IsMagmaByMultiplicationTableObj ],
    function( elm )
    local F, i, one, onepos, inv, j, n, A, invpos;

    F:= FamilyObj( elm );
    i:= elm![1];

    if IsBound( F!.inverse[i] ) then
      return F!.inverse[i];
    fi;

    # Check that `A' admits a left and right identity element.
    # (This is uniquely determined.)
    one:= One( elm );
    if one = fail then
      return fail;
    fi;
    onepos:= one![1];

    # Check that `elm' has a left and right inverse.
    # (If the multiplication is associative, this is uniquely determined.)
    inv:= fail;
    j:= 0;
    n:= F!.n;
    A:= MultiplicationTable( F );
    while j <= n do
      invpos:= Position( A[i], onepos, j );
      if invpos <> fail and A[ invpos ][i] = onepos then
        inv:= F!.set[ invpos ];
        break;
      fi;
      j:= invpos;
    od;

    F!.inverse[i]:= inv;

    return inv;
    end );


#############################################################################
##
#F  MagmaElement( <M>, <i> ) . . . . . . . . . .  <i>-th element of magma <M>
##
InstallGlobalFunction( MagmaElement, function( M, i )
    M:= AsSSortedList( M );
    if Length( M ) < i then
      return fail;
    else
      return M[i];
    fi;
end );


#############################################################################
##
#F  MagmaByMultiplicationTableCreator( <A>, <domconst> )
##
InstallGlobalFunction( MagmaByMultiplicationTableCreator,
    function( A, domconst )
    local F,      # the family of objects
          n,      # dimension of `A'
          range,  # the range `[ 1 .. n ]'
          elms,   # sorted list of elements
          M;      # the magma, result

    # Check that `A' is a valid multiplication table.
    if IsMatrix( A ) then
      n:= Length( A );
      range:= [ 1 .. n ];
      if     Length( A[1] ) = n
         and ForAll( A, row -> ForAll( row, x -> x in range ) ) then

        # Construct the family of objects.
        F:= NewFamily( "MagmaByMultTableObj",
                       IsMagmaByMultiplicationTableObj );
        F!.n:= n;
        SetMultiplicationTable( F, A );
        elms:= Immutable( List( range,
                   i -> Objectify( NewType( F,
                            IsMagmaByMultiplicationTableObj ), [ i ] ) ) );
        SetIsSSortedList( elms, true );
        F!.set:= elms;
        F!.inverse:= [];

        # Construct the magma.
        M:= domconst( CollectionsFamily( F ), elms );
        SetSize( M, n );
        SetAsSSortedList( M, elms );
        SetMultiplicationTable( M, MultiplicationTable( F ) );

        # Return the result.
        return M;
      fi;
    fi;
    Error( "<A> must be a square matrix with entries in `[ 1 .. n ]'" );
end );


#############################################################################
##
#F  MagmaByMultiplicationTable( <A> )
##
InstallGlobalFunction( MagmaByMultiplicationTable, function( A )
    return MagmaByMultiplicationTableCreator( A, MagmaByGenerators );
end );


#############################################################################
##
#F  MagmaWithOneByMultiplicationTable( <A> )
##
InstallGlobalFunction( MagmaWithOneByMultiplicationTable, function( A )
    local n,      # dimension of `A'
          onepos, # position of the identity in `A'
          M;      # the magma, result

    M:= MagmaByMultiplicationTableCreator( A, MagmaWithOneByGenerators );

    # Check that `A' admits a left and right identity element.
    n:= Length( A );
    onepos:= Position( A, [ 1 .. n ] );
    if onepos = fail or A{ [ 1 .. n ] }[ onepos ] <> [ 1 .. n ] then
      return fail;
    fi;

    # Store the identity in the family.
    SetOne( ElementsFamily( FamilyObj( M ) ), AsSSortedList( M )[ onepos ] );
    SetGeneratorsOfMagma( M, AsSSortedList( M ) );

    # Return the result.
    return M;
end );


#############################################################################
##
#F  MagmaWithInversesByMultiplicationTable( <A> )
##
InstallGlobalFunction( MagmaWithInversesByMultiplicationTable, function( A )
    local F,      # the family of objects
          n,      # dimension of `A'
          onepos, # position of the identity in `A'
          inv,    # list of positions of inverses
          i,      # loop over the elements
          invpos, # position of one inverse
          elms,   # sorted list of elements
          M;      # the magma, result

    M:= MagmaByMultiplicationTableCreator( A, 
            MagmaWithInversesByGenerators );

    # Check that `A' admits a left and right identity element.
    n:= Length( A );
    onepos:= Position( A, [ 1 .. n ] );
    if onepos = fail or A{ [ 1 .. n ] }[ onepos ] <> [ 1 .. n ] then
      return fail;
    fi;

    # Check that `A' admits inverses.
    inv:= [];
    for i in [ 1 .. n ] do
      invpos:= Position( A[i], onepos );
      if invpos = fail or A[ invpos ][i] <> onepos then
        return fail;
      fi;
      inv[i]:= invpos;
    od;

    # Store identity and inverses in the family.
    F:= ElementsFamily( FamilyObj( M ) );
    elms:= AsSSortedList( M );
    SetOne( F, elms[ onepos ] );
    F!.inverse:= Immutable( elms{ inv } );
    SetGeneratorsOfMagma( M, elms );

    # Return the result.
    return M;
end );


#############################################################################
##
#F  SemigroupByMultiplicationTable( <A> )
##
InstallGlobalFunction( SemigroupByMultiplicationTable, function( A )
    A:= MagmaByMultiplicationTable( A );
    if not IsAssociative( A ) then
      return fail;
    fi;
    return A;
end );


#############################################################################
##
#F  MonoidByMultiplicationTable( <A> )
##
InstallGlobalFunction( MonoidByMultiplicationTable, function( A )
    A:= MagmaWithOneByMultiplicationTable( A );
    if A = fail or not IsAssociative( A ) then
      return fail;
    fi;
    return A;
end );


#############################################################################
##
#F  GroupByMultiplicationTable( <A> )
##
InstallGlobalFunction( GroupByMultiplicationTable, function( A )
    A:= MagmaWithInversesByMultiplicationTable( A );
    if A = fail or not IsAssociative( A ) then
      return fail;
    fi;
    return A;
end );


#############################################################################
##
#M  MultiplicationTable( <elmlist> )
##
InstallMethod( MultiplicationTable,
    "for a list of elements",
    [ IsHomogeneousList ],
    elmlist -> List( elmlist, x -> List( elmlist,
                 y -> Position( elmlist, x * y ) ) ) );


#############################################################################
##
#M  MultiplicationTable( <M> )
##
InstallMethod( MultiplicationTable,
    "for a magma",
    [ IsMagma ],
    M -> MultiplicationTable( AsSSortedList( M ) ) );


#############################################################################
##
#E

