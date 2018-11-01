    gap> IsPairOfDicksonNumbers( 5, 4 );
    true
    gap> DicksonNearFields( 5, 4 );
    [ ExplicitMultiplicationNearRing ( <pc group of size 625 with
        4 generators> , multiplication ),
      ExplicitMultiplicationNearRing ( <pc group of size 625 with
        4 generators> , multiplication ) ]
    gap> NumberOfDicksonNearFields( 5, 4 );
    2
    gap> ExceptionalNearFields( 25 );
    [ ExplicitMultiplicationNearRing ( <pc group of size 25 with
        2 generators> , multiplication ) ]
    gap> AllExceptionalNearFields();
    [ ExplicitMultiplicationNearRing ( <pc group of size 25 with
        2 generators> , multiplication ),
      ExplicitMultiplicationNearRing ( <pc group of size 49 with
        2 generators> , multiplication ),
      ExplicitMultiplicationNearRing ( <pc group of size 121 with
        2 generators> , multiplication ),
      ExplicitMultiplicationNearRing ( <pc group of size 121 with
        2 generators> , multiplication ),
      ExplicitMultiplicationNearRing ( <pc group of size 529 with
        2 generators> , multiplication ),
      ExplicitMultiplicationNearRing ( <pc group of size 841 with
        2 generators> , multiplication ),
      ExplicitMultiplicationNearRing ( <pc group of size 3481 with
        2 generators> , multiplication ) ]
    gap> C7 := CyclicGroup( 7 );;
    gap> i := GroupHomomorphismByFunction( C7, C7, x -> x^-1 );;
    gap> phi := Group( i );;
    gap> orbs := Orbits( phi, C7 );
    [ [ <identity> of ... ], [ f1, f1^6 ], [ f1^2, f1^5 ],
      [ f1^3, f1^4 ] ]
    gap> # choose reps from the orbits
    gap> reps := [orbs[2][1], orbs[3][2]];
    [ f1, f1^5 ]
    gap> n := PlanarNearRing( C7, phi, reps );
    ExplicitMultiplicationNearRing ( <pc group of size 7 with
    1 generators> , multiplication )
    gap> C7 := CyclicGroup( 7 );;
    gap> i := GroupHomomorphismByFunction( C7, C7, x -> x^-1 );;
    gap> phi := Group( i );;
    gap> reps := OrbitRepresentativesForPlanarNearRing( C7, phi, 2 );
    [ [ f1, f1^2 ], [ f1, f1^5 ] ]
    gap> n1 := PlanarNearRing( C7, phi, reps[1] );;
    gap> n2 := PlanarNearRing( C7, phi, reps[2] );;
    gap> IsIsomorphicNearRing( n1, n2 );
    false
    gap> C9 := CyclicGroup( 9 );;
    gap> psi := GroupHomomorphismByFunction( C9, C9, x -> x^3 );;
    gap> Image( psi );
    Group([ f2, <identity> of ... ])
    gap> Image( psi ) = Kernel( psi );
    true
    gap> a := GroupHomomorphismByFunction( C9, C9, x -> x^4 );;
    gap> phi := Group( a );;
    gap> Size( phi );
    3
    gap> orbs := Orbits( phi, C9 );
    [ [ <identity> of ... ], [ f2 ], [ f2^2 ], [ f1, f1*f2, f1*f2^2 ],
      [ f1^2, f1^2*f2^2, f1^2*f2 ] ]
    gap> # choose reps from the orbits outside of Image( psi )
    gap> reps := [orbs[4][1], orbs[5][1]];
    [ f1, f1^2 ]
    gap> n := WdNearRing( C9, psi, phi, reps );
    ExplicitMultiplicationNearRing ( <pc group of size 9 with
    2 generators> , multiplication )
