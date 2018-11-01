    gap> FpfAutomorphismGroupsMaxSize( CyclicGroup(25) );
    [ 4, 1 ]
    gap> FpfAutomorphismGroupsMaxSize( ElementaryAbelianGroup(25) );
    [ 24, 2 ]
    gap> aux := FpfAutomorphismGroupsMetacyclic( [5,5], 4, -1 );
    [ [ [ [ f1, f2 ] -> [ f1^2, f2^3 ], [ f1, f2 ] -> [ f2^4, f1 ] ] ],
      <pc group of size 25 with 2 generators> ]
    gap> phi := Group( aux[1][1] );
    <group with 2 generators>
    gap> G := aux[2];
    <pc group of size 25 with 2 generators>
    gap> OrbitRepresentativesForPlanarNearRing( G, phi, 1 );
    [ [ f1 ] ]
    gap> reps := OrbitRepresentativesForPlanarNearRing( G, phi, 2 );
    [ [ f1, f1*f2 ], [ f1, f1^2*f2^2 ] ]
    gap> n := PlanarNearRing( G, phi, reps[1] );
    ExplicitMultiplicationNearRing ( <pc group of size 25 with
    2 generators> , multiplication )
    gap> Length(OrbitRepresentativesForPlanarNearRing( G, phi, 3 ));
    6
