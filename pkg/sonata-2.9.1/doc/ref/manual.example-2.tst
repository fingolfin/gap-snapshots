    gap> G := TWGroup( 24, 6 );
    24/6
    gap> mul_l := function ( x, y ) return y; end;
    function ( x, y ) ... end
    gap> IsNearRingMultiplication( G, mul_l );
    true
    gap> mul_r := function ( x, y ) return x; end;
    function ( x, y ) ... end
    gap> IsNearRingMultiplication( G, mul_r );
    #I  specified multiplication is not left distributive.
    false
    gap> IsNearRingMultiplication( G, mul_r, ["closed","ldistr"] );
    true
    gap> G := CyclicGroup( 4 );
    <pc group of size 4 with 2 generators>
    gap> GeneratorsOfGroup( G );
    [ f1, f2 ]
    gap> a := last[1];
    f1
    gap> Order( a );
    4
    gap> # a generates G indeed
    gap> elmlist := List( [0..3], x -> a^x );
    [ <identity> of ..., f1, f2, f1*f2 ]
    gap> # Let:  1 := identity of ..., 2 := f1, 3 := f2, 4 := f1*f2
    gap> # Consider the following multiplication table on G:
    gap> OT := [[1, 1, 1, 1],
    > [1, 4, 3, 2],
    > [1, 1, 1, 1],
    > [1, 2, 3, 4]];;
        gap> mul := NearRingMultiplicationByOperationTable( G, OT, elmlist );
    function ( x, y ) ... end
    gap> IsNearRingMultiplication( G, mul );
    true
    gap> n := ExplicitMultiplicationNearRing( GTW18_3, mul_l );
    ExplicitMultiplicationNearRing ( 18/3 , multiplication )
    gap> n = ExplicitMultiplicationNearRingNC( GTW18_3, mul_l );
    true
    gap> n := ExplicitMultiplicationNearRingNC( GTW18_3, mul_l );
    ExplicitMultiplicationNearRing ( 18/3 , multiplication )
    gap> IsNearRing( n );
    true
    gap> IsNearRing( GroupReduct( n ) );
    false
    gap> IsExplicitMultiplicationNearRing( n );
    true
    gap> n := ExplicitMultiplicationNearRingNC( GTW18_3, mul_l );
    ExplicitMultiplicationNearRing ( 18/3 , multiplication )
    gap> zero_mul := function ( x, y ) return (); end;
    function ( x, y ) ... end
    gap> z := ExplicitMultiplicationNearRingNC( GTW12_3, zero_mul );
    ExplicitMultiplicationNearRing ( 12/3 , multiplication )
    gap> d := DirectProductNearRing( n, z );
    DirectProductNearRing( ExplicitMultiplicationNearRing ( 18/3 , multi\
    plication ), ExplicitMultiplicationNearRing ( 12/3 , multiplication \
    ) )
    gap> IsExplicitMultiplicationNearRing( d );
    true
    gap> n := ExplicitMultiplicationNearRingNC( CyclicGroup( 3 ), mul_l );
    ExplicitMultiplicationNearRing ( <pc group of size 3 with
    1 generators> , multiplication )
    gap> SetSymbols( n, ["0","1","2"] );
    gap> PrintTable( n );
    Let:
    0 := (<identity> of ...)
    1 := (f1)
    2 := (f1^2)

      +  \ 0  1  2
      ------------
      0  \ 0  1  2
      1  \ 1  2  0
      2  \ 2  0  1

      *  \ 0  1  2
      ------------
      0  \ 0  1  2
      1  \ 0  1  2
      2  \ 0  1  2
    gap> n := LibraryNearRing( GTW3_1, 4 );
    LibraryNearRing(3/1, 4)
    gap> Symbols( n );
    [ "n0", "n1", "n2" ]
    gap> SetSymbolsSupervised( n,
            ["apple", "banana", "coconut", "donut", "potato"] );
    Warning: too many symbols ...ignoring the last 2 symbols
    gap> PrintTable( n, "m" );

            *  \ apple    banana   coconut
      ------------------------------------
      apple    \ apple    apple    apple
      banana   \ apple    banana   coconut
      coconut  \ apple    banana   coconut
    gap> mul_l := function ( x, y ) return y; end;
    function ( x, y ) ... end
    gap> n := ExplicitMultiplicationNearRingNC( GTW6_2, mul_l );
    ExplicitMultiplicationNearRing ( 6/2 , multiplication )
    gap> AsList( n );
    [ (()), ((2,3)), ((1,2)), ((1,2,3)), ((1,3,2)), ((1,3)) ]
    gap> e := AsNearRingElement( n, (2,3) );
    ((2,3))
    gap> e in n;
    true
    gap> f := AsNearRingElement( n, (1,3) );
    ((1,3))
    gap> e + f;
    ((1,3,2))
    gap> e * f;
    ((1,3))
    gap> p := AsGroupReductElement( e );
    (2,3)
    gap> IsPerm( p );
    true
    gap> p + p;
    Error no method found for operation SUM with 2 arguments at
    Error( "no method found for operation ", NAME_FUNC( operation ),
     " with 2 arguments" );
    Entering break read-eval-print loop, you can 'quit;' to quit to outer l\
    oop,
    or you can return to continue
    brk>
    gap> n := LibraryNearRing( GTW6_2, 39 );
    LibraryNearRing(6/2, 39)
    gap> e := Enumerator( n );
    <enumerator of near ring>
    gap> e[1];
    (())
    gap> x := AsNearRingElement( n, (1,2,3) );
    ((1,2,3))
    gap> Position( e, x );
    2
    gap> Length(e);
    6
    gap> l := AsList( n );
    [ (()), ((2,3)), ((1,2)), ((1,2,3)), ((1,3,2)), ((1,3)) ]
    gap> e[3] = l[3];
    false
    gap> AsSortedList( n );
    [ (()), ((2,3)), ((1,2)), ((1,2,3)), ((1,3,2)), ((1,3)) ]
    gap> n := LibraryNearRing( GTW6_2, 39 );
    LibraryNearRing(6/2, 39)
    gap> Random(n);
    ((1,3))
    gap> n := ExplicitMultiplicationNearRingNC( GTW8_4, mul_l );
    ExplicitMultiplicationNearRing ( 8/4 , multiplication )
    gap> GeneratorsOfNearRing( n );
    [ ((1,2,3,4)), ((2,4)) ]
    gap> n := LibraryNearRingWithOne( GTW24_3, 8 );
    LibraryNearRingWithOne(24/3, 8)
    gap> Size(n);
    24
    gap> GroupReduct( LibraryNearRingWithOne( GTW24_3, 8 ) );
    24/3
    gap> Endomorphisms ( LibraryNearRing( GTW12_4, 4 ) ) ;
    [ [ (1,2,4), (2,3,4) ] -> [ (), () ],
      [ (1,2,4), (2,3,4) ] -> [ (1,2,4), (2,3,4) ] ]
    gap> Length( Endomorphisms( GTW12_4 ) );
    33
    gap> Automorphisms( LibraryNearRing( GTW12_4, 4 ) );
    [ IdentityMapping( 12/4 ) ]
    gap> IsIsomorphicNearRing( MapNearRing( GTW2_1 ),
    > LibraryNearRingWithOne( GTW4_2, 5 ) );
    true
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> SubNearRings( n );
    [ ExplicitMultiplicationNearRing ( Group(()) , multiplication ),
      ExplicitMultiplicationNearRing ( Group([ (1,4)(2,3) ]) , multiplication ),
      ExplicitMultiplicationNearRing ( Group([ (1,2)(3,4) ]) , multiplication ),
      ExplicitMultiplicationNearRing ( Group([ (2,3,4) ]) , multiplication ),
      ExplicitMultiplicationNearRing ( Group([ (1,2,4) ]) , multiplication ),
      ExplicitMultiplicationNearRing ( Group([ (1,3,2) ]) , multiplication ),
      ExplicitMultiplicationNearRing ( Group([ (1,4,3) ]) , multiplication ),
      ExplicitMultiplicationNearRing ( Group([ (1,4)(2,3), (1,3)(2,4)
         ]) , multiplication ), ExplicitMultiplicationNearRing ( Group(
        [ (1,4)(2,3), (1,3)(2,4), (2,3,4) ]) , multiplication ) ]
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> i := InvariantSubNearRings( n );
    [ ExplicitMultiplicationNearRing ( Group(()) , multiplication ),
      ExplicitMultiplicationNearRing ( Group([ (1,2)(3,4) ]) , multiplication ),
      ExplicitMultiplicationNearRing ( Group([ (2,3,4) ]) , multiplication ),
      ExplicitMultiplicationNearRing ( Group([ (1,4,3) ]) , multiplication ),
      ExplicitMultiplicationNearRing ( Group([ (1,4)(2,3), (1,3)(2,4), (2,3,4)
         ]) , multiplication ) ]
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> S := Subgroup( GTW12_4, [ (1,2)(3,4) ] );
    Group([ (1,2)(3,4) ])
    gap> sn := SubNearRingBySubgroupNC( n, S );
    ExplicitMultiplicationNearRing ( Group([ (1,2)(3,4) ]) , multiplication )
    gap> n := LibraryNearRingWithOne( GTW27_4, 5 );
    LibraryNearRingWithOne(27/4, 5)
    gap> si := Filtered( SubNearRings( n ), s -> Identity( n ) in s );
    [ ExplicitMultiplicationNearRing ( Group(
        [ (1,23,14)(2,13,6)(3,27,22)(4,18,9)(5,20,12)(7,16,26)(8,25,17)(10,21,
            19)(11,24,15) ]) , multiplication ),
      ExplicitMultiplicationNearRing ( Group(
        [ (1,26,27)(2,19,20)(3,14,16)(4,24,25)(5,6,21)(7,22,23)(8,9,11)(10,12,
            13)(15,17,18), (1,22,16)(2,12,21)(3,26,23)(4,17,11)(5,19,13)(6,20,
            10)(7,14,27)(8,24,18)(9,25,15) ]) , multiplication ),
      ExplicitMultiplicationNearRing ( Group(
        [ (1,17,5)(2,22,8)(3,4,12)(6,26,18)(7,11,20)(9,19,23)(10,16,25)(13,14,
            24)(15,21,27), (1,15,6)(2,7,9)(3,25,13)(4,10,14)(5,27,18)(8,20,23)(11,
            19,22)(12,16,24)(17,21,26), (1,2,4)(3,6,11)(5,9,16)(7,13,17)(8,14,
            21)(10,18,22)(12,15,23)(19,24,26)(20,25,27) ]) , multiplication ) ]
    gap> Intersection( si );
    ExplicitMultiplicationNearRing ( Group(
    [ (1,23,14)(2,13,6)(3,27,22)(4,18,9)(5,20,12)(7,16,26)(8,25,17)(10,21,19)(11,
        24,15) ]) , multiplication )
    gap> Size( last );
    3
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> Identity( n );
    fail
    gap> One( n );
    fail
    gap> n := LibraryNearRingWithOne( GTW24_4, 8 );
    LibraryNearRingWithOne(24/4, 8)
    gap> Identity( n );
    ((1,2,3,4,5,6)(7,8))
    gap> One( n );
    ((1,2,3,4,5,6)(7,8))
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> IsNearRingWithOne( n );
    false
    gap> n := LibraryNearRingWithOne( GTW24_4, 8 );
    LibraryNearRingWithOne(24/4, 8)
    gap> Identity( n );
    ((1,2,3,4,5,6)(7,8))
    gap> IsNearRingWithOne( n );
    false
    gap> n := LibraryNearRingWithOne( GTW24_4, 8 );
    LibraryNearRingWithOne(24/4, 8)
    gap> NearRingUnits( n );
    [ ((1,2,3,4,5,6)(7,8)), ((1,6,5,4,3,2)(7,8)) ]
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> IsNearRingWithOne( n );
    false
    gap> Distributors( n );
    [ (()), ((2,3,4)), ((2,4,3)), ((1,2)(3,4)), ((1,2,3)), ((1,2,4)),
      ((1,3,2)), ((1,3,4)), ((1,3)(2,4)), ((1,4,2)), ((1,4,3)),
      ((1,4)(2,3)) ]
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> DistributiveElements( n );
    [ (()) ]
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> IsDistributiveNearRing( n );
    false
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> ZeroSymmetricElements( n );
    [ (()), ((2,3,4)), ((2,4,3)), ((1,2)(3,4)), ((1,2,3)), ((1,2,4)),
      ((1,3,2)), ((1,3,4)), ((1,3)(2,4)), ((1,4,2)), ((1,4,3)),
      ((1,4)(2,3)) ]
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> IdempotentElements( n );
    [ (()), ((1,4)(2,3)) ]
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> NilpotentElements( n );
    [ [ (()), 1 ], [ ((2,3,4)), 2 ], [ ((2,4,3)), 2 ],
      [ ((1,2)(3,4)), 2 ], [ ((1,2,3)), 2 ], [ ((1,2,4)), 2 ],
      [ ((1,3,2)), 2 ], [ ((1,3,4)), 2 ], [ ((1,4,2)), 2 ],
      [ ((1,4,3)), 2 ] ]
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> QuasiregularElements( n );
    [ (()), ((2,3,4)), ((2,4,3)), ((1,2)(3,4)), ((1,2,3)), ((1,2,4)),
      ((1,3,2)), ((1,3,4)), ((1,3)(2,4)), ((1,4,2)), ((1,4,3)) ]
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> RegularElements( n );
    [ (()), ((1,3)(2,4)), ((1,4)(2,3)) ]
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> IsAbelianNearRing( n );
    false
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> IsAbstractAffineNearRing( n );
    false
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> IsBooleanNearRing( n );
    false
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> IsNilNearRing( n );
    false
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> IsNilpotentNearRing( n );
    false
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> IsNilpotentFreeNearRing( n );
    false
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> IsCommutative( n );
    false
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> IsDgNearRing( n );
    false
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> IsIntegralNearRing( n );
    false
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> IsPrimeNearRing( n );
    true
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> IsQuasiregularNearRing( n );
    false
    gap> n := LibraryNearRing( GTW12_4, 8 );
    LibraryNearRing(12/4, 8)
    gap> IsRegularNearRing( n );
    false
     gap> n := LibraryNearRing( GTW12_4, 8 );
     LibraryNearRing(12/4, 8)
     gap> IsNearField( n );
     false
     gap> n := LibraryNearRing( GTW9_2, 90 );
     LibraryNearRing(9/2, 90)
     gap> IsPlanarNearRing( n );
     true
     gap> nr := LibraryNearRing( GTW9_1, 185 );
     LibraryNearRing(9/1, 185)
     gap> IsWdNearRing( nr );
     true
