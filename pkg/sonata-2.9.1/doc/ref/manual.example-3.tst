    gap> l := AllLibraryNearRings( GTW3_1 );
    [ LibraryNearRing(3/1, 1), LibraryNearRing(3/1, 2),
      LibraryNearRing(3/1, 3), LibraryNearRing(3/1, 4),
      LibraryNearRing(3/1, 5) ]
    gap> Filtered( l, IsNearField );
    [ LibraryNearRing(3/1, 3) ]
    gap> NumberLibraryNearRings( GTW14_2 );
    1821
    gap> LN14_2_1234 := LibraryNearRing( GTW14_2, 1234 );
    LibraryNearRing(14/2, 1234)
    gap> NumberLibraryNearRingsWithOne( GTW24_6 );
    0
    gap> NumberLibraryNearRingsWithOne( GTW24_4 );
    10
    gap> LNwI24_4_8 := LibraryNearRingWithOne( GTW24_4, 8 );
    LibraryNearRingWithOne(24/4, 8)
    gap> AllLibraryNearRingsWithOne( GTW24_6 );
    [  ]
    gap> p := PolynomialNearRing( GTW4_2 );
    PolynomialNearRing( 4/2 )
    gap> IdLibraryNearRing( p );
    [ 8/3, 833 ]
    gap> n := LibraryNearRing( GTW3_1, 4 );
    LibraryNearRing(3/1, 4)
    gap> d := DirectProductNearRing( n, n );
    DirectProductNearRing( LibraryNearRing(3/1, 4), LibraryNearRing(3/1, 4)\
     )
    gap> IdLibraryNearRing( d );
    [ 9/2, 220 ]
    gap> l := LibraryNearRingWithOne( GTW12_3, 1 );
    LibraryNearRingWithOne(12/3, 1)
    gap> IdLibraryNearRing( l ); #this command requires time and memory!!!
    [ 12/3, 37984 ]
    gap> IdLibraryNearRingWithOne( l );
    [ 12/3, 1 ]
    gap> IsLibraryNearRing( LNwI24_4_8 );
    true
