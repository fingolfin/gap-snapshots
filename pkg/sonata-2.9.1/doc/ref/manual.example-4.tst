    gap> G := GTW4_2;
    4/2
    gap> t1 := EndoMappingByPositionList ( G, [1, 2, 4, 4] );
    <mapping: 4/2 -> 4/2 >
    gap> t2 := EndoMappingByFunction ( GTW8_2, g -> g^-1 );
    <mapping: 8/2 -> 8/2 >
    gap> IsGroupHomomorphism ( t2 );
    true
    gap> t3 := EndoMappingByFunction ( GTW6_2, g -> g^-1 );
    <mapping: 6/2 -> 6/2 >
    gap> IsGroupHomomorphism ( t3 );
    false
    gap> G1 := Group ((1,2,3), (1, 2));
    Group([ (1,2,3), (1,2) ])
    gap> G2 := Group ((2,3,4), (2, 3));
    Group([ (2,3,4), (2,3) ])
    gap> f1 := IsomorphismGroups ( G1, G2 );
    [ (1,2,3), (1,2) ] -> [ (2,3,4), (2,3) ]
    gap> f2 := IsomorphismGroups ( G2, G1 );
    [ (2,3,4), (2,3) ] -> [ (1,2,3), (1,2) ]
    gap> AsEndoMapping ( CompositionMapping ( f1, f2 ) );
    <mapping: Group( [ (2,3,4), (2,3) ] ) -> Group( [ (2,3,4), (2,3)
    ] ) >
    gap> m := IdentityEndoMapping ( GTW6_2 );
    <mapping: 6/2 -> 6/2 >
    gap> AsGroupGeneralMappingByImages ( m );
    [ (1,2), (1,2,3) ] -> [ (1,2), (1,2,3) ]
    gap> IsEndoMapping ( InnerAutomorphisms ( GTW6_2 ) [3] );
    true
    gap> AsList ( UnderlyingRelation ( IdentityEndoMapping ( Group ((1,2,3,4)) ) ) );
    [ Tuple( [ (), () ] ), Tuple( [ (1,2,3,4), (1,2,3,4) ] ),
      Tuple( [ (1,3)(2,4), (1,3)(2,4) ] ), Tuple( [ (1,4,3,2), (1,4,3,2) ] )
     ]
    gap> C3 := CyclicGroup (3);
    <pc group of size 3 with 1 generators>
    gap> m := ConstantEndoMapping (C3, AsSortedList (C3) [2]);
    MappingByFunction( <pc group of size 3 with
    1 generators>, <pc group of size 3 with
    1 generators>, function( x ) ... end )
    gap> List (AsList (C3), x -> Image (m, x));
    [ f1, f1, f1 ]
    gap> IsIdentityEndoMapping (EndoMappingByFunction (
    > AlternatingGroup ( [1..5] ), x -> x^31));
    true
    gap> C3 := CyclicGroup ( 3 );
    <pc group of size 3 with 1 generators>
    gap> IsConstantEndoMapping ( EndoMappingByFunction ( C3,  x -> x^3 ));
    true
    gap> G := Group ( (1,2,3), (1,2) );
    Group([ (1,2,3), (1,2) ])
    gap> IsDistributiveEndoMapping ( EndoMappingByFunction ( G, x -> x^3));
    false
    gap> IsDistributiveEndoMapping ( EndoMappingByFunction ( G, x -> x^7));
    true
    gap> t1 := ConstantEndoMapping ( GTW2_1, ());
    MappingByFunction( 2/1, 2/1, function( x ) ... end )
    gap> t2 := ConstantEndoMapping (GTW2_1, (1, 2));
    MappingByFunction( 2/1, 2/1, function( x ) ... end )
    gap> List ( AsList ( GTW2_1 ), x -> Image ( t1 * t2, x ));
    [ (1,2), (1,2) ]
    gap> G := SymmetricGroup ( 3 );
    Sym( [ 1 .. 3 ] )
    gap> invertingOnG := EndoMappingByFunction ( G, x -> x^-1 );
    <mapping: SymmetricGroup( [ 1 .. 3 ] ) -> SymmetricGroup(
    [ 1 .. 3 ] ) >
    gap> identityOnG := IdentityEndoMapping (G);
    <mapping: SymmetricGroup( [ 1 .. 3 ] ) -> SymmetricGroup(
    [ 1 .. 3 ] ) >
    gap> AsSortedList ( G );
    [ (), (2,3), (1,2), (1,2,3), (1,3,2), (1,3) ]
    gap> List ( AsSortedList (G),
    >              x -> Image ( identityOnG * invertingOnG, x ));
    [ (), (2,3), (1,2), (1,3,2), (1,2,3), (1,3) ]
    gap> List ( AsSortedList (G),
    >              x -> Image ( identityOnG + invertingOnG, x ));
    [ (), (), (), (), (), () ]
    gap> IsIdentityEndoMapping ( - invertingOnG );
    true
    gap> - invertingOnG = identityOnG;
    true
    gap> G := SymmetricGroup ( 3 );
    Sym( [ 1 .. 3 ] )
    gap> m := ConstantEndoMapping (G, (1,2,3)) + IdentityEndoMapping( G );
    MappingByFunction( Sym( [ 1 .. 3 ] ), Sym( [ 1 .. 3 ] ), function( g ) ... end )
    gap> PrintArray( GraphOfMapping( m ) );
    [ [       (),  (1,2,3) ],
      [    (2,3),    (1,3) ],
      [    (1,2),    (2,3) ],
      [  (1,2,3),  (1,3,2) ],
      [  (1,3,2),       () ],
      [    (1,3),    (1,2) ] ]
    gap> G := SymmetricGroup ( 3 );
    Sym( [ 1 .. 3 ] )
    gap> p := Random( PolynomialNearRing( G ) );
    <mapping: SymmetricGroup( [ 1 .. 3 ] ) -> SymmetricGroup( [ 1 .. 3 ] ) >
    gap> PrintAsTerm( p );
    g1 - x - 2 * g1 - g2 - x - g1 - g2 + g1 - x - 2 * g1 -
    g2 - x - g1 - g2 - 3 * x + g1
    gap> GeneratorsOfGroup( G );
    [ (1,2,3), (1,2) ]
