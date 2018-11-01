    gap> NumberLibraryNearRings( GTW12_3 );
    48137
    gap> NumberLibraryNearRingsWithOne( GTW4_1 );
    1
    gap> Filtered( AllLibraryNearRingsWithOne( GTW4_1 ),
    >              n -> not IsDistributiveNearRing( n ) );
    [  ]
    gap> NumberLibraryNearRingsWithOne( GTW4_2 );
    5
    gap> Filtered( AllLibraryNearRingsWithOne( GTW4_2 ),
    >              n -> not IsDistributiveNearRing( n ) );
    [ LibraryNearRing(4/2, 12), LibraryNearRing(4/2, 22) ]
    gap> PrintTable( LibraryNearRing( GTW4_2, 12 ) );
    Let:
    n0 := (())
    n1 := ((3,4))
    n2 := ((1,2))
    n3 := ((1,2)(3,4))

       +  \ n0  n1  n2  n3
      --------------------
      n0  \ n0  n1  n2  n3
      n1  \ n1  n0  n3  n2
      n2  \ n2  n3  n0  n1
      n3  \ n3  n2  n1  n0

       *  \ n0  n1  n2  n3
      --------------------
      n0  \ n0  n0  n0  n0
      n1  \ n0  n0  n1  n1
      n2  \ n0  n0  n2  n2
      n3  \ n0  n1  n2  n3
    gap> PrintTable( LibraryNearRing( GTW4_2, 22 ) );
    Let:
    n0 := (())
    n1 := ((3,4))
    n2 := ((1,2))
    n3 := ((1,2)(3,4))

       +  \ n0  n1  n2  n3
      --------------------
      n0  \ n0  n1  n2  n3
      n1  \ n1  n0  n3  n2
      n2  \ n2  n3  n0  n1
      n3  \ n3  n2  n1  n0

       *  \ n0  n1  n2  n3
      --------------------
      n0  \ n0  n0  n2  n2
      n1  \ n0  n1  n2  n3
      n2  \ n0  n2  n2  n0
      n3  \ n0  n3  n2  n1
    gap> nr_list := [ ];
    [ ]
    gap> for i in [1..NumberLibraryNearRings( GTW8_4 )] do
    >       n := LibraryNearRing( GTW8_4, i );
    >       if ( not IsZeroSymmetricNearRing( n ) or
    >            IsIntegralNearRing( n ) or
    >            Identity( n ) <> fail
    >          ) then
    >         Add( nr_list, n );
    >       fi;
    >    od;
    gap> Length( nr_list );
    141
    gap> Filtered( nr_list, IsBooleanNearRing );
    [ LibraryNearRing(8/4, 1314), LibraryNearRing(8/4, 1380),
      LibraryNearRing(8/4, 1446), LibraryNearRing(8/4, 1447) ]
