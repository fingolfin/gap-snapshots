    gap> C9 := CyclicGroup( 9 );
    <pc group of size 9 with 2 generators>
    gap> a := GroupHomomorphismByFunction( C9, C9, x -> x^-1 );;
    gap> phi := Group( a );;
    gap> Size( phi );
    2
    gap> IsFpfAutomorphismGroup( phi, C9 );
    true
    gap> G := ElementaryAbelianGroup( 49 );;
    gap> FpfAutomorphismGroupsMaxSize( G );
    [ 48, 2 ]
    gap> C15 := CyclicGroup( 15 );;
    gap> FpfAutomorphismGroupsMaxSize( C15 );
    [ 2, 1 ]
    gap> aux := FpfAutomorphismGroupsMetacyclic( [3,3,5,5], 4, -1 );
    [ [ [ [ f1, f2, f3, f4 ] -> [ f1^2, f2^3, f3*f4, f3*f4^2 ],
              [ f1, f2, f3, f4 ] -> [ f2^4, f1, f4^2, f3 ] ] ],
      <pc group of size 225 with 4 generators> ]
    gap> phi := Group( aux[1][1] );
    <group with 2 generators>
    gap> G := aux[2];
    <pc group of size 225 with 4 generators>
    gap> FrobeniusGroup( phi, G );
    <pc group of size 1800 with 7 generators>
    gap> F := GF(5);;
    gap> A := [[2,0],[0,3]]*One(F);
    [ [ Z(5), 0*Z(5) ], [ 0*Z(5), Z(5)^3 ] ]
    gap> IsFpfRepresentation( [A], F );
    true
    gap> DegreeOfIrredFpfRepCyclic( 5, 9 );
    6
    gap> DegreeOfIrredFpfRepMetacyclic( 5, 4, -1 );
    2
    gap> DegreeOfIrredFpfRep2( 7, 30, 11, -1 );
    8
    gap> DegreeOfIrredFpfRep3( 5, 3, 1 );
    2
    gap> DegreeOfIrredFpfRep4( 5, 3, 1, -1 );
    4
    gap> aux := FpfRepresentationsCyclic( 5, 8 );
    [ [ [ [ Z(5)^3, Z(5)^2 ], [ Z(5), Z(5) ] ],
          [ [ Z(5)^2, Z(5) ], [ Z(5)^0, Z(5)^0 ] ] ], [ 1, 7 ] ]
    gap> mats := aux[1];
    [ [ [ Z(5)^3, Z(5)^2 ], [ Z(5), Z(5) ] ],
      [ [ Z(5)^2, Z(5) ], [ Z(5)^0, Z(5)^0 ] ] ]
    gap> indexlist := aux[2];
    [ 1, 7 ]
    gap> aux := FpfRepresentationsMetacyclic( 7, 4, -1 );
    [ [ [ [ [ Z(7)^2, Z(7) ], [ Z(7), Z(7)^5 ] ],
              [ [ 0*Z(7), Z(7)^3 ], [ Z(7)^0, 0*Z(7) ] ] ] ], [ 1 ] ]
    gap> mats := aux[1];
    [ [ [ [ Z(7)^2, Z(7) ], [ Z(7), Z(7)^5 ] ],
          [ [ 0*Z(7), Z(7)^3 ], [ Z(7)^0, 0*Z(7) ] ] ] ]
    gap> DegreeOfIrredFpfRep2( 11, 30, 11, -1 );
    4
    gap> aux := FpfRepresentations2( 11, 30, 11, -1 );
    [ [ [ <block matrix of dimensions (2*2)x(2*2)>,
              <block matrix of dimensions (2*2)x(2*2)>,
              <block matrix of dimensions (2*2)x(2*2)> ],
          [ <block matrix of dimensions (2*2)x(2*2)>,
              <block matrix of dimensions (2*2)x(2*2)>,
              <block matrix of dimensions (2*2)x(2*2)> ] ], [ 1, 13 ] ]
    gap> aux := FpfRepresentations3( 5, 3, 1 );
    [ [ [ [ [ Z(5), 0*Z(5) ], [ 0*Z(5), Z(5)^3 ] ],
              [ [ 0*Z(5), Z(5)^2 ], [ Z(5)^0, 0*Z(5) ] ],
              [ [ Z(5)^3, Z(5)^0 ], [ Z(5), Z(5)^0 ] ] ] ], [ 1 ] ]
    gap> aux := FpfRepresentations4( 7, 3, 1, -1 );
    [ [ [ [ [ Z(7)^2, Z(7) ], [ Z(7), Z(7)^5 ] ],
              [ [ 0*Z(7), Z(7)^3 ], [ Z(7)^0, 0*Z(7) ] ],
              [ [ Z(7)^2, 0*Z(7) ], [ Z(7)^0, Z(7)^4 ] ],
              [ [ Z(7)^5, Z(7) ], [ Z(7), Z(7)^2 ] ] ],
          [ [ [ Z(7)^2, Z(7) ], [ Z(7), Z(7)^5 ] ],
              [ [ 0*Z(7), Z(7)^3 ], [ Z(7)^0, 0*Z(7) ] ],
              [ [ Z(7)^2, 0*Z(7) ], [ Z(7)^0, Z(7)^4 ] ],
              [ [ Z(7)^2, Z(7)^4 ], [ Z(7)^4, Z(7)^5 ] ] ] ],
      [ [ 1, 1 ], [ -1, 1 ] ] ]
    gap> aux := FpfAutomorphismGroupsCyclic( [25,5], 4 );
    [ [ [ f1, f3 ] -> [ f1^2*f2, f3^2 ],
          [ f1, f3 ] -> [ f1^2*f2, f3^3 ] ],
      <pc group of size 125 with 2 generators> ]
    gap> as := aux[1];
    [ [ f1, f3 ] -> [ f1^2*f2, f3^2 ], [ f1, f3 ] -> [ f1^2*f2, f3^3 ] ]
    gap> G := aux[2];
    <pc group of size 125 with 2 generators>
    gap> aux := FpfAutomorphismGroupsMetacyclic( [3,3,5,5], 4, -1 );
    [ [ [ [ f1, f2, f3, f4 ] -> [ f1^2, f2^3, f3*f4, f3*f4^2 ],
              [ f1, f2, f3, f4 ] -> [ f2^4, f1, f4^2, f3 ] ] ],
      <pc group of size 225 with 4 generators> ]
    gap> fs := aux[1];
    [ [ [ f1, f2, f3, f4 ] -> [ f1^2, f2^3, f3*f4, f3*f4^2 ],
          [ f1, f2, f3, f4 ] -> [ f2^4, f1, f4^2, f3 ] ] ]
    gap> phi := Group( fs[1] );
    <group with 2 generators>
    gap> G := aux[2];
    <pc group of size 225 with 4 generators>
    gap> aux := FpfAutomorphismGroupsMetacyclic( [7,7,17,17], 8, -1 );;
    gap> fs := aux[1];
    [ [ [ f1, f2, f3, f4 ] -> [ f1^9, f2^2, f3^4*f4^2, f3*f4^6 ],
          [ f1, f2, f3, f4 ] -> [ f2^16, f1, f3^4*f4^5, f3^5*f4^3 ] ],
      [ [ f1, f2, f3, f4 ] -> [ f1^9, f2^2, f3^3*f4^5, f3^6*f4 ],
          [ f1, f2, f3, f4 ] -> [ f2^16, f1, f3^3*f4^4, f3*f4^4 ] ] ]
    gap> phis := List( fs, Group );
    [ <group with 2 generators>, <group with 2 generators> ]
    gap> G := aux[2];
    <pc group of size 14161 with 4 generators>
    gap> aux := FpfAutomorphismGroups2( [11,11,11,11], 30, 11, -1 );
    [ [ [ [ f1, f2, f3, f4 ] -> [ f1^5*f2^4, f1^3*f2^10, f3^2*f4^8,
                  f3^6*f4 ],
              [ f1, f2, f3, f4 ] -> [ f1^3*f2^10, f1^10*f2^8, f3^8*f4,
                  f3*f4^3 ],
              [ f1, f2, f3, f4 ] -> [ f3^10, f4^10, f1, f2 ] ] ],
      <pc group of size 14641 with 4 generators> ]
    gap> phi := Group( aux[1][1] );
    <group with 3 generators>
    gap> G := aux[2];
    <pc group of size 14641 with 4 generators>
    gap> aux := FpfAutomorphismGroups3( [5,5], 3, 1 );
    [ [ [ [ f1, f2 ] -> [ f1^2, f2^3 ], [ f1, f2 ] -> [ f2^4, f1 ],
              [ f1, f2 ] -> [ f1^3*f2, f1^2*f2 ] ] ],
      <pc group of size 25 with 2 generators> ]
    gap> phi := Group( aux[1][1] );
    <group with 3 generators>
    gap> G := aux[2];
    <pc group of size 25 with 2 generators>
    gap> aux := FpfAutomorphismGroups4( [7,7], 3, 1, -1 );
    [ [ [ [ f1, f2 ] -> [ f1^2*f2^3, f1^3*f2^5 ],
              [ f1, f2 ] -> [ f2^6, f1 ], [ f1, f2 ] -> [ f1^2, f1*f2^4 ],
              [ f1, f2 ] -> [ f1^5*f2^3, f1^3*f2^2 ] ] ],
      <pc group of size 49 with 2 generators> ]
    gap> phi := Group( aux[1][1] );
    <group with 4 generators>
    gap> G := aux[2];
    <pc group of size 49 with 2 generators>
