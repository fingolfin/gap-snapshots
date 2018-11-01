    gap> A := LibraryNearRing( GTW8_2, 12 );
    LibraryNearRing(8/2, 12)
    gap> B := LibraryNearRing( GTW12_4, 13 );
    LibraryNearRing(12/4, 13)
    gap> D := DirectProductNearRing( A, B );
    DirectProductNearRing( LibraryNearRing(8/2, 12),
      LibraryNearRing(12/4, 13) )
    gap> SetName( D, "A x B" );
    gap> D;
    A x B
    gap> elms := AsSortedList( D );;
    gap> gens := elms{[2,25]};
    [ (( 8, 9,10)), ((3,5)(4,6)) ]
    gap> L := NearRingLeftIdealByGenerators( D, gens );
    < nearring left ideal >
    gap> Size( L );
    24
    gap> IsNearRingRightIdeal( L );
    true
    gap> L;
    < nearring ideal of size 24 >
    gap> IsMaximalNearRingIdeal( L );
    false
    gap> F := D/L;
    FactorNearRing( A x B, < nearring ideal of size 24 > )
    gap> PrintTable( F, "am" );

       +  \ n0  n1  n2  n3
      --------------------
      n0  \ n0  n1  n2  n3
      n1  \ n1  n0  n3  n2
      n2  \ n2  n3  n0  n1
      n3  \ n3  n2  n1  n0

       *  \ n0  n1  n2  n3
      --------------------
      n0  \ n0  n0  n0  n0
      n1  \ n0  n0  n0  n0
      n2  \ n0  n0  n0  n0
      n3  \ n0  n0  n0  n0
    gap> IsElementaryAbelian( GroupReduct( F ) );
    true
    gap> # this would also convince us
    gap> IsCyclic( GroupReduct( F ) );
    false
    gap> SetSymbols( F, ["(0,0)","(0,1)","(1,0)","(1,1)"] );
    gap> PrintTable( F, "m" );

          *  \ (0,0)  (0,1)  (1,0)  (1,1)
      -----------------------------------
      (0,0)  \ (0,0)  (0,0)  (0,0)  (0,0)
      (0,1)  \ (0,0)  (0,0)  (0,0)  (0,0)
      (1,0)  \ (0,0)  (0,0)  (0,0)  (0,0)
      (1,1)  \ (0,0)  (0,0)  (0,0)  (0,0)
