    gap> points := [1..7];;
    gap> blocks := [[1,2,3],[1,4,5],[1,6,7],[2,4,7],[2,5,6],[3,5,7],
    >                                                          [3,4,6]];;
    gap> D := DesignFromPointsAndBlocks( points, blocks );
    <an incidence structure with 7 points and 7 blocks>
    gap> M := [[1,0,1,1],
    >          [1,1,0,0],
    >          [1,1,1,0]];;
    gap> DesignFromIncidenceMat( M );
    <an incidence structure with 3 points and 4 blocks>
    gap> n := LibraryNearRing( GTW9_2, 90 );
    LibraryNearRing(9/2, 90)
    gap> IsPlanarNearRing( n );
    true
    gap> D1 := DesignFromPlanarNearRing( n, "*" );
    <a 2 - ( 9, 4, 3 ) nearring generated design>
    gap> D2 := DesignFromPlanarNearRing( n, " " );
    <a 2 - ( 9, 5, 5 ) nearring generated design>
    gap> aux := FpfAutomorphismGroupsCyclic( [3,3], 4 );
    [ [ [ f1, f2 ] -> [ f1*f2, f1*f2^2 ] ],
      <pc group of size 9 with 2 generators> ]
    gap> f := aux[1][1];
    [ f1, f2 ] -> [ f1*f2, f1*f2^2 ]
    gap> phi := Group( f );
    <group with 1 generators>
    gap> G := aux[2];
    <pc group of size 9 with 2 generators>
    gap> D3 := DesignFromFerreroPair( G, phi, "*" );
    <a 2 - ( 9, 4, 3 ) nearring generated design>
    gap> # D3 is actually isomorphic to D1
    gap> n := LibraryNearRing( GTW9_1, 202 );
    LibraryNearRing(9/1, 202)
    gap> IsWdNearRing( n );
    true
    gap> DesignFromWdNearRing( n );
    <a 1 - ( 9, 5, 10 ) nearring generated design>
    gap> D1;
    <a 2 - ( 9, 4, 3 ) nearring generated design>
    gap> PointsOfDesign( D1 );
    [ (()), ((4,5,6)), ((4,6,5)), ((1,2,3)), ((1,2,3)(4,5,6)),
      ((1,2,3)(4,6,5)), ((1,3,2)), ((1,3,2)(4,5,6)), ((1,3,2)(4,6,5)) ]
    gap> PointsOfDesign( D1 ){[2,4]};
    [ ((4,5,6)), ((1,2,3)) ]
    gap> # returns the points in position 2 and 4
    gap> Length( BlocksOfDesign( D1 ) );
    18
    gap> BlocksOfDesign( D1 ){[3]};
    [ [ ((4,6,5)), (()), ((1,2,3)(4,5,6)), ((1,3,2)(4,5,6)) ] ]
    gap> # returns the block in position 3 as a list of points
    gap> DesignParameter( D1 );
    [ 2, 9, 18, 8, 4, 3 ]
    gap> # t = 2, v = 9, b = 18, r = 8, k = 4, lambda = 3
    gap> M1 := IncidenceMat( D1 );
    [ [ 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1 ],
      [ 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1 ],
      [ 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0 ],
      [ 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1 ],
      [ 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1 ],
      [ 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0 ],
      [ 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0 ],
      [ 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0 ],
      [ 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0 ] ]
    gap> PrintIncidenceMat( D1 );
    ..1.1.1..1.11..1.1
    1...1..11..1.11..1
    1.1....1.11..1.11.
    1..1.1..1.1.1..1.1
    .11..11...1..11..1
    .1.11.1.1....1.11.
    1..1.11..1.1..1.1.
    .11..1.11..11...1.
    .1.11..1.11.1.1...
    gap> BlockIntersectionNumbers( D1, 2 );
    [ 0, 4, 2, 2, 2, 2, 2, 2, 2, 1, 2, 1, 2, 2, 2, 1, 2, 1 ]
    gap> # the second has empty intersection with the first block
    gap> # and intersects all others in at most 2 points
    gap> IsCircularDesign( D1 );
    true
    gap> IsPointIncidentBlock( D1, 3, 1 );
    true
    gap> # point 3 is incident with block 1
    gap> IsPointIncidentBlock( D1, 3, 2 );
    false
    gap> PointsIncidentBlocks( D1, [1, 4] );
    [ 4, 7 ]
    gap> # block 1 and block 4 are together incident with
    gap> # points 4 and 7
    gap> BlocksIncidentPoints( D1, [2, 7] );
    [ 1, 12, 15 ]
    gap> # point 2 and point 7 are together incident with
    gap> # blocks 1, 12, 15
    gap> BlocksOfDesign( D1 ){last};
    [ [ ((4,5,6)), ((4,6,5)), ((1,2,3)), ((1,3,2)) ],
      [ ((1,3,2)), ((1,3,2)(4,5,6)), (()), ((4,5,6)) ],
      [ ((1,3,2)(4,6,5)), ((1,3,2)), ((4,5,6)), ((1,2,3)(4,5,6)) ] ]
    gap> # the actual point sets of blocks 1, 12, and 15
    gap> BlocksIncidentPoints( D1, [2, 3, 7] );
    [ 1 ]
    gap> # points 2, 3, 7 are together incident with block 1
    gap> PointsIncidentBlocks( D1, [1] );
    [ 2, 3, 4, 7 ]
    gap> # block 1 is incident with points 2, 3, 4, 7
