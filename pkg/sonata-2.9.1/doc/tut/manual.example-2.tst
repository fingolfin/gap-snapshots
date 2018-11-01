    gap> G := GTW4_2;
    4/2
    gap> AsSortedList( G );
    [ (), (3,4), (1,2), (1,2)(3,4) ]
    gap> SetSymbols( G, [ "0", "a", "b", "c" ] );
    gap> PrintTable( G );
    Let:
    0 := ()
    a := (3,4)
    b := (1,2)
    c := (1,2)(3,4)

      +  \ 0 a b c
      ------------
      0  \ 0 a b c
      a  \ a 0 c b
      b  \ b c 0 a
      c  \ c b a 0

    gap> table := [ [ 1, 1, 1, 1 ],
    >               [ 1, 1, 2, 2 ],
    >               [ 1, 2, 4, 3 ],
    >               [ 1, 2, 3, 4 ] ];
    [ [ 1, 1, 1, 1 ], [ 1, 1, 2, 2 ], [ 1, 2, 4, 3 ], [ 1, 2, 3, 4 ] ]
    gap> mul:=NearRingMultiplicationByOperationTable(
    >             G, table, AsSortedList(G) );
    function( x, y ) ... end
    gap> N := ExplicitMultiplicationNearRing( G, mul );
    ExplicitMultiplicationNearRing ( 4/2 , multiplication )
    gap> PrintTable( N );
    Let:
    0 := (())
    a := ((3,4))
    b := ((1,2))
    c := ((1,2)(3,4))

      +  \ 0  a  b  c
      ---------------
      0  \ 0  a  b  c
      a  \ a  0  c  b
      b  \ b  c  0  a
      c  \ c  b  a  0

      *  \ 0  a  b  c
      ---------------
      0  \ 0  0  0  0
      a  \ 0  0  a  a
      b  \ 0  a  c  b
      c  \ 0  a  b  c
    gap> IsNearField( N );
    false
    gap> IsIntegralNearRing( N );
    false
    gap> IsNilpotentNearRing( N );
    false
    gap> t := GroupGeneralMappingByImages(
    >           G, G, AsSortedList(G), AsSortedList(G){[1,2,4,3]} );
    [ (), (3,4), (1,2), (1,2)(3,4) ] -> [ (), (3,4), (1,2)(3,4), (1,2) ]
    gap> id := IdentityMapping( G );
    IdentityMapping( 4/2 )
    gap> T := TransformationNearRingByGenerators( G, [t,id] );
    TransformationNearRingByGenerators(
    [ [ (), (3,4), (1,2), (1,2)(3,4) ] -> [ (), (3,4), (1,2)(3,4), (1,2) ],
      IdentityMapping( 4/2 ) ])
    gap> PrintTable(T);
    Let:
    n0 := <mapping: 4/2 -> 4/2 >
    n1 := <mapping: 4/2 -> 4/2 >
    n2 := <mapping: 4/2 -> 4/2 >
    n3 := <mapping: 4/2 -> 4/2 >

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
      n2  \ n0  n1  n2  n3
      n3  \ n0  n1  n3  n2
    gap> IsIsomorphicNearRing( N, T );
    true
    gap> N = T;
    false
