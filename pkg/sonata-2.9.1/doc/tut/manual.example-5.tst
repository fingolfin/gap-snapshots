    gap> I := InnerAutomorphismNearRing ( AlternatingGroup ( 4 ) );
    InnerAutomorphismNearRing( Alt( [ 1 .. 4 ] ) )
    gap> Size (I);
    3072
    gap> p := Random( I );
    <mapping: AlternatingGroup( [ 1 .. 4 ] ) -> AlternatingGroup( [ 1 .. 4 ] ) >
    gap> PrintAsTerm( p );
     - g1 + g2 - x - g2 + g1 + g2 + g1 - x + g2 - x + 2 * g1 -
    3 * x - g1 + x + g2 - x - g2 + g1 + x - g1 + x - g1 + x +
    g1 + x - g2 - x + g2 - g1 - x + g1 + x
    gap> GeneratorsOfGroup( AlternatingGroup( 4 ) );
    [ (1,2,3), (2,3,4) ]
    gap> A := AutomorphismNearRing ( DihedralGroup ( 8 ) );
    AutomorphismNearRing( <pc group of size 8 with 3 generators> )
    gap> Size (A);
    32
    gap> EndS4 := EndomorphismNearRing ( SymmetricGroup ( 4 ) );
    EndomorphismNearRing( Sym( [ 1 .. 4 ] ) )
    gap> Size ( EndS4 );
    927712935936
    gap> F1 := last;;
    gap> Collected ( Factors( F1 ));
    [ [ 2, 35 ], [ 3, 3 ] ]
    gap> G := GTW16_8;
    16/8
    gap> U := First ( NormalSubgroups( G ), N -> Size(N) = 2 );
    Group([ ( 1, 5)( 2,10)( 3,11)( 4,12)( 6,15)( 7,16)( 8, 9)(13,14) ])
    gap> HGU := RestrictedEndomorphismNearRing (G, U);
    RestrictedEndomorphismNearRing( 16/8, Group(
    [ ( 1, 5)( 2,10)( 3,11)( 4,12)( 6,15)( 7,16)( 8, 9)(13,14) ]) )
    gap> Size (HGU);
    8
    gap> EofG := EndomorphismNearRing ( G );
    EndomorphismNearRing( 16/8 )
    gap> EGU := NoetherianQuotient ( EofG, U, G );
    NoetherianQuotient( Group(
    [ ( 1, 5)( 2,10)( 3,11)( 4,12)( 6,15)( 7,16)( 8, 9)(13,14) ]) ,16/8 )
    gap> Size ( EGU );
    128
    gap> G := SymmetricGroup ( 3 );
    Sym( [ 1 .. 3 ] )
    gap> I := InnerAutomorphismNearRing ( G );
    InnerAutomorphismNearRing( Sym( [ 1 .. 3 ] ) )
    gap> Size( I );
    54
    gap> Filtered ( I,
    >       t -> ForAll( G, g -> Image(t, g) = Image(t, Image(t, g)) ) );;
    gap> Length( last );
    18
    gap> Filtered ( I, i -> i^2 = i );;
    gap> Length( last );
    18
    gap> G := SymmetricGroup( 3 );
    Sym( [ 1 .. 3 ] )
    gap> endos := Endomorphisms( G );
    [ [ (1,2,3), (1,2) ] -> [ (), () ], [ (1,2,3), (1,2) ] -> [ (), (1,3) ],
      [ (1,2,3), (1,2) ] -> [ (), (2,3) ], [ (1,2,3), (1,2) ] -> [ (), (1,2) ],
      [ (1,2,3), (1,2) ] -> [ (1,2,3), (1,3) ],
      [ (1,2,3), (1,2) ] -> [ (1,3,2), (1,2) ],
      [ (1,2,3), (1,2) ] -> [ (1,3,2), (1,3) ],
      [ (1,2,3), (1,2) ] -> [ (1,2,3), (2,3) ],
      [ (1,2,3), (1,2) ] -> [ (1,2,3), (1,2) ],
      [ (1,2,3), (1,2) ] -> [ (1,3,2), (2,3) ] ]
    gap> C := CentralizerNearRing( G, endos );
    CentralizerNearRing( Sym( [ 1 .. 3 ] ), ... )
    gap> Size ( C );
    6
    gap> I := NearRingIdeals( C );
    [ < nearring ideal >, < nearring ideal >, < nearring ideal >,
      < nearring ideal > ]
    gap> List( I, Size );
    [ 1, 2, 3, 6 ]
    gap> P := PolynomialNearRing( GTW16_6 );
    PolynomialNearRing( 16/6 )
    gap> Size( P );
    256
    gap> C := LocalInterpolationNearRing(P, 2);
    LocalInterpolationNearRing( PolynomialNearRing( 16/6 ), 2 )
    gap> Size (C);
    256
    gap> C := CompatibleFunctionNearRing( GTW16_6 );
    < transformation nearring with 7 generators >
    gap> Size(C);
    256;
    gap> Is1AffineComplete( GTW16_6 );
    true
    gap> ScottLength( SymmetricGroup( 3 ) );
    2
