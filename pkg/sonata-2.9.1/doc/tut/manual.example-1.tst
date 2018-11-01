    gap> LoadPackage( "sonata" );
    gap> G := DihedralGroup( 8 );
    <pc group of size 8 with 3 generators>
    gap> IdTWGroup( G );
    [ 8, 4 ]
    gap> H := TWGroup( 8, 4 );
    8/4
    gap> AsList( H );
    [ (), (2,4), (1,2)(3,4), (1,2,3,4), (1,3), (1,3)(2,4), (1,4,3,2),
      (1,4)(2,3) ]
    gap> IsomorphismGroups(G,H);
    [ f1, f2, f3 ] -> [ (2,4), (1,2,3,4), (1,3)(2,4) ]
    gap> NumberSmallGroups( 32 );
    51
    gap> GTW32_46;
    32/46
    gap> GTW32_46 = TWGroup( 32, 46 );
    true
    gap> Filtered( GroupList, g -> not IsAbelian( g ) and
    >                              Size(Centre( g ))=1 );
    [ 6/2, 10/2, 12/4, 14/2, 18/4, 18/5, 20/5, 21/2, 22/2, 24/12, 26/2,
      30/4 ]
    gap> D16 := DihedralGroup( 16 );
    <pc group of size 16 with 4 generators>
    gap> S := Subgroups( D16 );
    [ Group([  ]), Group([ f4 ]), Group([ f1 ]), Group([ f1*f3 ]),
      Group([ f1*f4 ]), Group([ f1*f3*f4 ]), Group([ f1*f2 ]),
      Group([ f1*f2*f3 ]), Group([ f1*f2*f4 ]),
      Group([ f1*f2*f3*f4 ]), Group([ f4, f3 ]), Group([ f4, f1 ]),
      Group([ f1*f3, f4 ]), Group([ f4, f1*f2 ]),
      Group([ f1*f2*f3, f4 ]), Group([ f4, f3, f1 ]),
      Group([ f4, f3, f2 ]), Group([ f4, f3, f1*f2 ]),
      Group([ f4, f3, f1, f2 ]) ]
    gap> C := Filtered( S, G -> IsCharacteristicInParent( G ) );
    [ Group([  ]), Group([ f4 ]), Group([ f4, f3 ]), Group([ f4, f3, f2 ]),
      Group([ f4, f3, f1, f2 ]) ]
    gap> G := GTW6_2;
    6/2
    gap> Automorphisms( G );
    [ IdentityMapping( 6/2 ), ^(2,3), ^(1,3), ^(1,3,2), ^(1,2,3), ^(1,2) ]
    gap> Endos := Endomorphisms( G );
    [ [ (1,2), (1,2,3) ] -> [ (), () ], [ (1,2), (1,2,3) ] -> [ (2,3), () ],
      [ (1,2), (1,2,3) ] -> [ (1,3), () ], [ (1,2), (1,2,3) ] -> [ (1,2), () ],
      [ (1,2), (1,2,3) ] -> [ (2,3), (1,2,3) ],
      [ (1,2), (1,2,3) ] -> [ (2,3), (1,3,2) ],
      [ (1,2), (1,2,3) ] -> [ (1,2), (1,3,2) ],
      [ (1,2), (1,2,3) ] -> [ (1,2), (1,2,3) ],
      [ (1,2), (1,2,3) ] -> [ (1,3), (1,2,3) ],
      [ (1,2), (1,2,3) ] -> [ (1,3), (1,3,2) ] ]
    gap> IsFixedpointfree := function( endo )
    >local group;
    >  group := Source( endo ); # the domain of endo
    >  return ForAll( group, x -> (x <> x^endo) or (x = Identity(group)) );
    >  #                           x is not fixed or x is the identity
    >end;
    function ( endo ) ... end
    gap> e := Endos[4];
    [ (1,2), (1,2,3) ] -> [ (1,2), () ]
    gap> IsFixedpointfree( e );
    false
    gap> Filtered( Endos, IsFixedpointfree );
    [ [ (1,2), (1,2,3) ] -> [ (), () ] ]
    gap> G := GTW16_11;
    16/11
    gap> F := FrattiniSubgroup( G );
    Group([ (1,4,11,14)(2,7,10,16)(3,8,15,9)(5,12,6,13) ])
    gap> NontrivialRepresentativesModNormalSubgroup( G, F );
    [ (1,16,14,10,11,7,4,2)(3,12,9,5,15,13,8,6),
      (1,3)(2,5)(4,8)(6,10)(7,12)(9,14)(11,15)(13,16),
      (1,13,4,5,11,12,14,6)(2,3,7,8,10,15,16,9) ]
    gap> H := Group( last );
    Group([ (1,16,14,10,11,7,4,2)(3,12,9,5,15,13,8,6),
      (1,3)(2,5)(4,8)(6,10)(7,12)(9,14)(11,15)(13,16),
      (1,13,4,5,11,12,14,6)(2,3,7,8,10,15,16,9) ])
    gap> G = H;  # test
    true
