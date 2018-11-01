    gap> G := GTW4_2;
    4/2
    gap> n := MapNearRing( G );
    TransformationNearRing(4/2)
    gap> action := function ( g, f )
    > return Image( f, g );
    > end;
    function ( g, f ) ... end
    gap> gamma := NGroup( G, n, action );
    < N-group of TransformationNearRing(4/2) >
    gap> IsNGroup( gamma );
    true
    gap> NearRingActingOnNGroup( gamma );
    TransformationNearRing(4/2)
    gap> ActionOfNearRingOnNGroup( gamma );
    function ( g, f ) ... end
    gap> Print( ActionOfNearRingOnNGroup( gamma ) );
    function ( g, f )
        return Image( f, g );
    gap> n := LibraryNearRing( GTW8_2, 3 );
    LibraryNearRing(8/2, 3)
    gap> NGroupByNearRingMultiplication( n ) = GTW8_2;
    true
    gap> N := LibraryNearRing( GTW4_2, 11 );
    LibraryNearRing(4/2, 11)
    gap> R := NearRingRightIdeals( N )[ 3 ];
    < nearring right ideal >
    gap> ng := NGroupByRightIdealFactor( N, R );
    < N-group of LibraryNearRing(4/2, 11) >
    gap> PrintTable( ng );
    Let:
    (0,0) := (())
    (1,0) := ((3,4))
    (0,1) := ((1,2))
    (1,1) := ((1,2)(3,4))
    --------------------------------------------------------------------
    g0 := <identity> of ...
    g1 := f1

    N = LibraryNearRing(4/2, 11) acts on
    G = Group( [ f1 ] )
    from the right by the following action:

             \ g0  g1
      ---------------
      (0,0)  \ g0  g0
      (1,0)  \ g0  g0
      (0,1)  \ g0  g1
      (1,1)  \ g0  g1

    gap> n := LibraryNearRing( TWGroup( 8, 2 ), 3 );
    LibraryNearRing(8/2, 3)
    gap> gamma := NGroupByNearRingMultiplication( n );
    < N-group of LibraryNearRing(8/2, 3) >
    gap> PrintTable( gamma );
    Let:
    n0 := (())
    n1 := ((3,4,5,6))
    n2 := ((3,5)(4,6))
    n3 := ((3,6,5,4))
    n4 := ((1,2))
    n5 := ((1,2)(3,4,5,6))
    n6 := ((1,2)(3,5)(4,6))
    n7 := ((1,2)(3,6,5,4))
    --------------------------------------------------------------------
    g0 := ()
    g1 := (3,4,5,6)
    g2 := (3,5)(4,6)
    g3 := (3,6,5,4)
    g4 := (1,2)
    g5 := (1,2)(3,4,5,6)
    g6 := (1,2)(3,5)(4,6)
    g7 := (1,2)(3,6,5,4)

    N = LibraryNearRing(8/2, 3) acts on
    G = Group( [ (1,2), (3,4,5,6) ] )
    from the right by the following action:

          \ g0  g1  g2  g3  g4  g5  g6  g7
      ------------------------------------
      n0  \ g0  g0  g0  g0  g0  g0  g0  g0
      n1  \ g0  g0  g0  g0  g0  g0  g0  g2
      n2  \ g0  g0  g0  g0  g0  g0  g0  g0
      n3  \ g0  g0  g0  g0  g0  g0  g0  g2
      n4  \ g0  g0  g0  g0  g0  g0  g0  g0
      n5  \ g0  g0  g0  g0  g0  g0  g0  g2
      n6  \ g0  g0  g0  g0  g0  g0  g0  g0
      n7  \ g0  g0  g0  g0  g0  g0  g0  g2

    gap> n := LibraryNearRing( TWGroup( 8, 2 ), 3 );
    LibraryNearRing(8/2, 3)
    gap> gamma := NGroupByNearRingMultiplication( n );
    < N-group of LibraryNearRing(8/2, 3) >
    gap> NearRingActingOnNGroup( gamma );
    LibraryNearRing(8/2, 3)
    gap> n := LibraryNearRing( TWGroup( 8, 2 ), 3 );
    LibraryNearRing(8/2, 3)
    gap> gamma := NGroupByNearRingMultiplication( n );
    < N-group of LibraryNearRing(8/2, 3) >
    gap> ActionOfNearRingOnNGroup( gamma );
    function ( g, n ) ... end
    gap> n := LibraryNearRing(GTW12_3,20465);
    LibraryNearRing(12/3, 20465)
    gap> ng := NGroupByNearRingMultiplication( n );
    < N-group of LibraryNearRing(12/3, 20465) >
    gap> Length( N0Subgroups( ng ) );
    9
    gap> n:=LibraryNearRing(GTW12_3,20465);
    LibraryNearRing(12/3, 20465)
    gap> ng := NGroupByNearRingMultiplication( n );
    < N-group of LibraryNearRing(12/3, 20465) >
    gap> NIdeals( ng );
    [ < N-group of LibraryNearRing(12/3, 20465) >,
      < N-group of LibraryNearRing(12/3, 20465) >,
      < N-group of LibraryNearRing(12/3, 20465) > ]
    gap> n:=LibraryNearRing(GTW12_3,20465);
    LibraryNearRing(12/3, 20465)
    gap> ng := NGroupByNearRingMultiplication( n );
    < N-group of LibraryNearRing(12/3, 20465) >
    gap> TypeOfNGroup( ng );
    fail
    gap> N := LibraryNearRing( GTW12_3, 100 );
    LibraryNearRing(12/3, 100)
    gap> I := NearRingIdeals( N );
    [ < nearring ideal >, < nearring ideal >, < nearring ideal > ]
    gap> List(I,Size);
    [ 1, 6, 12 ]
    gap> NN := NGroupByNearRingMultiplication( N );
    < N-group of LibraryNearRing(12/3, 100) >
    gap> NoetherianQuotient( N, NN, GroupReduct(I[2]), GroupReduct(I[2]) );
    < nearring ideal >
    gap> Size(last);
    12
    gap> f := LibraryNearRing( GTW8_4, 3 );
    LibraryNearRing(8/4, 3)
    gap> NuRadicals( f );
    rec( J2 := < nearring ideal >, J1 := < nearring ideal >,
      J1_2 := < nearring right ideal >, J0 := < nearring ideal > )
    gap> NuRadical( f, 1/2 );
    < nearring right ideal >
    gap> Size( NuRadical( f, 0 ) );
    8
    gap> AsList( NuRadical( f, 1 ) );
    [ (()), ((2,4)), ((1,2)(3,4)), ((1,2,3,4)), ((1,3)), ((1,3)(2,4)),
      ((1,4,3,2)), ((1,4)(2,3)) ]
    gap> NuRadical( f, 1/2 ) = NuRadical( f, 2 );
    true
