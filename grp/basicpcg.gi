#############################################################################
##
#W  basicpcg.gi                 GAP Library                      Frank Celler
##
#H  @(#)$Id: basicpcg.gi,v 4.14 2000/02/01 13:34:11 gap Exp $
##
#Y  Copyright (C)  1996,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the methods for the construction of the basic pc group
##  types.
##
Revision.basicpcg_gi :=
    "@(#)$Id: basicpcg.gi,v 4.14 2000/02/01 13:34:11 gap Exp $";


#############################################################################
##
#M  TrivialGroupCons( <IsPcGroup> )
##
InstallMethod( TrivialGroupCons,
    "pc group",
    [ IsPcGroup and IsFinite ],
    function( filter )
    filter:= CyclicGroup( IsPcGroup, 1 );
    SetIsTrivial( filter, true );
    return filter;
    end );

    
#############################################################################
##
#M  AbelianGroupCons( <IsPcGroup and IsFinite>, <ints> )
##
InstallMethod( AbelianGroupCons, "pc group", true,
    [ IsPcGroup and IsFinite, IsList ], 0,
function( filter, ints )
local   pis,  f,  g,  r,  k,  pi,  i,  geni,  j,  name,  ps;

    if not ForAll( ints, IsInt )  then
        Error( "<ints> must be a list of integers" );
    fi;
    if not ForAll( ints, x -> 0 < x )  then
      TryNextMethod();
    fi;
    if ForAll(ints,i->i=1) then
      # the stupid trivial group case
      return CyclicGroup(1);
    fi;

    pis := List( ints, Factors );
    f   := FreeGroup( Sum( List(pis{Filtered([1..Length(pis)],i->ints[i]>1)},
                                Length ) ) );
    g   := GeneratorsOfGroup(f);
    r   := [];
    k   := 1;
    geni:=[];
    for pi  in pis  do
      if pi[1]=1 then
        Add(geni,0);
      else
	Add(geni,k);
        for i  in [ 1 .. Length(pi)-1 ]  do
            Add( r, g[k]^pi[i] / g[k+1] );
            k := k + 1;
        od;
        Add( r, g[k]^pi[Length(pi)] );
        k := k + 1;
      fi;
    od;
    f := PolycyclicFactorGroup( f, r );
    SetSize( f, Product(ints) );
    SetIsAbelian( f, true );

    k:=[];
    g:=GeneratorsOfGroup(f);
    for i in geni do
      if i=0 then 
        Add(k,One(f));
      else
        Add(k,g[i]);
      fi;
    od;
    k:=GroupWithGenerators(k,One(f));
    SetSize(k,Size(f));
    SetIsAbelian( k, true );

    pis := [ ];
    ps := [ ];
    for i in ints do
      pi := PrimePowersInt( i );
      for j in [ 1, 3 .. Length( pi ) - 1 ] do
        if pi[ j ] in ps then
          SetIsCyclic( k, false );
        fi;
        AddSet( ps, pi[ j ] );
        Add( pis, pi[ j ] ^ pi[ j + 1 ] );
      od;
    od;
    if not HasIsCyclic( k ) then
      SetIsCyclic( k, true );
      SetNameIsomorphismClass( k, Concatenation( "c", String( Size( f ))));
      return k;
    fi;
    Sort( pis );
    SetAbelianInvariants( k, pis );
    pis := Collected( pis );
    name := "";
    for i in pis do
      Append( name, String( i[ 1 ] ) );
      if i[ 2 ] > 1 then
        name := Concatenation( name, "^", String( i[ 2 ] ) );
      fi;
      Append( name, "x" );
    od;
    Unbind( name[ Length( name ) ] );
    SetNameIsomorphismClass( k, name );
    return k;
end );


#############################################################################
##
#M  AlternatingGroupCons( <IsPcGroup and IsFinite>, <deg> )
##
InstallMethod( AlternatingGroupCons,
    "pc group with degree",
    true,
    [ IsPcGroup and IsFinite,
      IsInt and IsPosRat ],
    0,

function( filter, deg )
    local   alt;

    if 4 < deg  then
        Error( "<deg> must be at most 4" );
    fi;
    alt := GroupByPcgs(Pcgs(AlternatingGroupCons(IsPermGroup,[1..deg])));
    SetIsAlternatingGroup( alt, true );
    return alt;
end );


#############################################################################
##
#M  CyclicGroupCons( <IsPcGroup and IsFinite>, <n> )
##
InstallMethod( CyclicGroupCons,
    "pc group",
    true,
    [ IsPcGroup and IsFinite,
      IsInt and IsPosRat ],
    0,

function( filter, n )
    local   pi,  f,  g,  r,  i;

    # Catch the case n = 1.
    if n = 1 then
        f := GroupByRws( SingleCollector( FreeGroup( 0 ), [] ) );
        
    else
        pi := Factors( n );
        f  := FreeGroup( Length(pi) );
        g  := GeneratorsOfGroup(f);
        r  := [];
        for i  in [ 1 .. Length(g)-1 ]  do
            Add( r, g[i]^pi[i] / g[i+1] );
        od;
        Add( r, g[Length(g)] ^ pi[Length(g)] );
        f := PolycyclicFactorGroup( f, r );
    fi;

    SetSize( f, n );
    SetIsCyclic( f, true );
    SetNameIsomorphismClass( f, Concatenation( "c", String( n ) ) );
    return f;
end );


#############################################################################
##
#M  DihedralGroupCons( <IsPcGroup and IsFinite>, <n> )
##
InstallMethod( DihedralGroupCons,
    "pc group",
    true,
    [ IsPcGroup and IsFinite,
      IsInt and IsPosRat ],
    0,

function( filter, n )
    local   pi,  f,  g,  r,  i;

    if n mod 2 = 1  then
        TryNextMethod();
    elif n = 2 then return
        CyclicGroup( IsPcGroup, 2 );
    fi;
    pi := Factors(n/2);
    f  := FreeGroup( Length(pi)+1 );
    g  := GeneratorsOfGroup(f);
    r  := [];
    for i  in [ 2 .. Length(g)-1 ]  do
        Add( r, g[i]^pi[i-1] / g[i+1] );
    od;
    Add( r, g[Length(g)] ^ pi[Length(g)-1] );
    Add( r, g[1]^2 );
    for i  in [ 2 .. Length(g) ]  do
        Add( r, g[i]^g[1] * g[i] );
    od;
    f := PolycyclicFactorGroup( f, r );
    SetSize( f, n );
    return f;
end );


#############################################################################
##
#M  ElementaryAbelianGroupCons( <IsPcGroup and IsFinite>, <n> )
##
InstallMethod( ElementaryAbelianGroupCons,
    "pc group",
    true,
    [ IsPcGroup and IsFinite,
      IsInt and IsPosRat ],
    0,

function( filter, n )
    if n = 1  then
        return CyclicGroupCons( IsPcGroup, 1 );
    elif not IsPrimePowerInt(n)  then
        Error( "<n> must be a prime power" );
    fi;
    n:= AbelianGroupCons( IsPcGroup, Factors(n) );
    SetIsElementaryAbelian( n, true );
    return n;
end );


#############################################################################
##
#M  ExtraspecialGroupCons( <IsPcGroup and IsFinite>, <order>, <exponent> )
##
InstallMethod( ExtraspecialGroupCons,
    "pc group",
    true,
    [ IsPcGroup and IsFinite,
      IsInt,
      IsObject ],
    0,

function( filters, order, exp )

    local i,        # loop variable
          p,        # divisor of group order
          n,        # the group has order 'p'^(2*'n'+1)
          eps1,     # constant to distinguish odd and even 'p'
          eps2,     # constant to distinguish odd and even 'p'
          name,     # name of generators (default is "e")
          z,        # central element
          f,        # free group
          r,        # relators
          e;        # the group generators

    p := Factors(order);

    if    Length(p) = 1
       or Length(p) mod 2 <> 1
       or Length(Set(p)) <> 1
    then
        Error( "order of an extraspecial group is",
               " a nonprime odd power of a prime" );
    fi;

    n := ( Length(p) - 1 ) / 2;
    p := p[1];

    # determine the required type of the group    
    if p = 2 then
        if n = 1 then
            eps1 := 1;
        else
            eps1 := 0;
        fi;

        # central product of 'n' dihedral groups of order 8
        if exp = '+' or exp = "+" then
            eps2 := 0;

        # central product of 'n'-1 dihedral groups and a quaternionic group
        elif exp = '-' or exp = "-" then
            eps2 := 1;

        # zap
        else
            Error( "<exp> must be '+', '-', \"+\", or \"-\"" );
        fi;
    else
        if exp = p   or exp = '+' or exp = "+" then
            eps1 := 0;
        elif exp = p^2 or exp = '-' or exp = "-" then
            eps1 := 1;
        else
            Error( "<exp> must be <p>, <p>^2, '+', '-', \"+\", or \"-\"" );
        fi;
        eps2 := 0;
    fi;

    f := FreeGroup(2*n+1);
    e := GeneratorsOfGroup(f);
    z := e[ 2*n+1 ];
    r := [];

    # power relators
    Add( r, e[1]^p / z^eps1 );
    for i  in [ 2 .. 2*n-2 ]  do
        Add( r, e[i]^p );
    od;
    if 1 < n  then
        Add( r, e[2*n-1]^p / z^eps2 );
    fi;
    Add( r, e[2*n]^p / z^eps2 );
    Add( r, z^p );

    # nontrivial commutator relators
    for i  in [ 1 .. n ]  do
        Add( r, Comm( e[2*i], e[2*i-1] ) * z );
    od;

    # return the pc group
    return PolycyclicFactorGroup( f, r );

end );


#############################################################################
##
#M  SymmetricGroupCons( <IsPcGroup and IsFinite>, <deg> )
##
InstallMethod( SymmetricGroupCons,
    "pc group with degree",
    true,
    [ IsPcGroup and IsFinite,
      IsInt and IsPosRat ],
    0,

function( filter, deg )
    if 4 < deg  then
        Error( "<deg> must be at most 4" );
    fi;
    return GroupByPcgs(Pcgs(SymmetricGroupCons(IsPermGroup,[1..deg])));
end );


#############################################################################
##

#E

