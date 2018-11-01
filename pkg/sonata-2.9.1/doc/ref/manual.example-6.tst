    gap> n := LibraryNearRing( GTW8_4, 12 );
    LibraryNearRing(8/4, 12)
    gap> e := AsNearRingElement( n, (1,3)(2,4) );
    ((1,3)(2,4))
    gap> r := NearRingRightIdealByGenerators( n, [e] );
    < nearring right ideal >
    gap> l := NearRingLeftIdealByGenerators( n, [e] );
    < nearring left ideal >
    gap> i := NearRingIdealByGenerators( n, [e] );
    < nearring ideal >
    gap> r = i;
    true
    gap> l = i;
    false
    gap> l = r;
    false
    gap> a := GroupReduct( n );
    8/4
    gap> nsgps := NormalSubgroups( a );
    [ Group(()), Group([ (1,3)(2,4) ]),
      Group([ (1,3)(2,4), (1,2)(3,4) ]), Group([ (1,3)(2,4), (2,4) ]),
      Group([ (1,2,3,4), (1,3)(2,4) ]), 8/4 ]
    gap> l := Filtered( nsgps,
    > s -> IsSubgroupNearRingRightIdeal( n, s ) );
    [ Group(()), Group([ (1,3)(2,4), (2,4) ]), 8/4 ]
    gap> l := List( l,
    > s -> NearRingRightIdealBySubgroupNC( n, s ) );
    [ < nearring right ideal >, < nearring right ideal >,
      < nearring right ideal > ]
    gap> NearRingIdeals( n );
    [ < nearring ideal >, < nearring ideal >, < nearring ideal > ]
    gap> NearRingRightIdeals( n );
    [ < nearring right ideal >, < nearring right ideal >,
      < nearring right ideal > ]
    gap> NearRingLeftIdeals( n );
    [ < nearring left ideal >, < nearring left ideal >, < nearring left ideal >,
      < nearring left ideal > ]
    gap> n := LibraryNearRing( GTW6_2, 39 );
    LibraryNearRing(6/2, 39)
    gap> e := Enumerator(n)[3];
    ((1,3,2))
    gap> l := NearRingLeftIdealByGenerators( n, [e] );
    < nearring left ideal >
    gap> IsNRI( l );
    true
    gap> IsNearRingLeftIdeal( l );
    true
    gap> IsNearRingRightIdeal( l );
    true
    gap> l;
    < nearring ideal >
    gap> n := LibraryNearRing( GTW6_2, 39 );
    LibraryNearRing(6/2, 39)
    gap> s := Subgroups( GroupReduct( n ) );
    [ Group(()), Group([ (2,3) ]), Group([ (1,3) ]), Group([ (1,2) ]),
      Group([ (1,3,2) ]), Group([ (1,2,3), (1,2) ]) ]
    gap> List( s, sg -> IsSubgroupNearRingLeftIdeal( n, sg ) );
    [ true, false, false, false, true, true ]
    gap> List( s, sg -> IsSubgroupNearRingRightIdeal( n, sg ) );
    [ true, false, false, false, true, true ]
    gap> n := LibraryNearRingWithOne( GTW27_2, 5 );
    LibraryNearRingWithOne(27/2, 5)
    gap> Filtered( NearRingIdeals( n ), IsPrimeNearRingIdeal );
    [ < nearring ideal of size 9 >, < nearring ideal of size 27 > ]
    gap> n := LibraryNearRingWithOne( GTW27_2, 5 );
    LibraryNearRingWithOne(27/2, 5)
    gap> Filtered( NearRingIdeals( n ), IsMaximalNearRingIdeal );
    [ < nearring ideal of size 9 > ]
    gap> n := LibraryNearRing( GTW8_2, 2 );
    LibraryNearRing(8/2, 2)
    gap> li := NearRingLeftIdeals( n );
    [ < nearring left ideal >, < nearring left ideal >,
      < nearring left ideal >, < nearring left ideal >,
      < nearring left ideal >, < nearring left ideal > ]
    gap> l := li[3];
    < nearring left ideal >
    gap> e := Enumerator( l );;
    gap> e[2];
    ((1,2)(3,6,5,4))
    gap> AsList( e ); AsList( l );
    [ (()), ((1,2)(3,6,5,4)), ((3,5)(4,6)), ((1,2)(3,4,5,6)) ]
    [ (()), ((1,2)(3,6,5,4)), ((3,5)(4,6)), ((1,2)(3,4,5,6)) ]
    gap> Random( l );
    ((3,5)(4,6))
    gap> Random( n ) in l;
    true
    gap> Random( n ) in l;
    false
    gap> l := LibraryNearRing( GTW6_2, 3 );
    LibraryNearRing(6/2, 3)
    gap> i := NearRingIdeals( l );
    [ < nearring ideal >, < nearring ideal > ]
    gap> List( i, Size );
    [ 1, 6 ]
    gap> NearRingCommutator( i[2], i[2] );
    < nearring ideal of size 6 >
    gap> l := LibraryNearRing( GTW8_4, 13 );
    LibraryNearRing(8/4, 13)
    gap> NearRingIdeals( l );
    [ < nearring ideal >, < nearring ideal >, < nearring ideal > ]
    gap> PrintNearRingCommutatorsTable( l );
    [ 1, 1, 1 ]
    [ 1, 1, 2 ]
    [ 1, 2, 2 ]
    gap> NumberLibraryNearRings( GTW4_2 );
    23
    gap> Filtered( AllLibraryNearRings( GTW4_2 ), IsSimpleNearRing );
    [ LibraryNearRing(4/2, 3), LibraryNearRing(4/2, 16),
      LibraryNearRing(4/2, 17) ]
    gap> n := LibraryNearRing( GTW8_2, 2 );
    LibraryNearRing(8/2, 2)
    gap> e := AsNearRingElement( n, (1,2) );
    ((1,2))
    gap> e in n;
    true
    gap> i := NearRingRightIdealByGenerators( n, [e] );
    < nearring right ideal >
    gap> Size(i);
    4
    gap> IsNearRingLeftIdeal( i );
    true
    gap> i;
    < nearring ideal of size 4 >
    gap> f := n/i;
    FactorNearRing( LibraryNearRing(8/2, 2), < nearring ideal of size 4 > )
    gap> IdLibraryNearRing(f);
    [ 2/1, 1 ]
