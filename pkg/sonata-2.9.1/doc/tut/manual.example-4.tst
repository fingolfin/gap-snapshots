    gap> A4 := AlternatingGroup( 4 );
    Alt( [ 1 .. 4 ] )
    gap> AsSortedList( A4 );
    [ (), (2,3,4), (2,4,3), (1,2)(3,4), (1,2,3), (1,2,4), (1,3,2),
     (1,3,4), (1,3)(2,4), (1,4,2), (1,4,3), (1,4)(2,3) ]
    t := EndoMappingByPositionList( A4, [1,3,4,5,2,1,1,1,1,1,1,1] );
    <mapping: AlternatingGroup( [ 1 .. 4 ] ) -> AlternatingGroup(
    [ 1 .. 4 ] ) >
    gap> t+t;
    <mapping: AlternatingGroup( [ 1 .. 4 ] ) -> AlternatingGroup(
    [ 1 .. 4 ] ) >
    gap> last * t;
    <mapping: AlternatingGroup( [ 1 .. 4 ] ) -> AlternatingGroup(
    [ 1 .. 4 ] ) >
    gap> T := TransformationNearRingByGenerators( A4, [ t ] );;
    gap> Size( T );
    20736
    gap> F := Filtered( T, tfm -> Image( tfm, (1,2,3) ) = (1,2,3) );;
    gap> Length( F );
    1728
    gap> Random( F );;
    gap> IsCommutative( T );
    false
    gap> g := CyclicGroup(2);;
    gap> m := MapNearRing(g);;
    gap> Filtered( m, n -> not( IsCommutative(
    >        TransformationNearRingByGenerators( g, [n] ) ) ) );
    gap> [ <mapping: Group( [ f1 ] ) -> Group( [ f1 ] ) >,
           <mapping: Group( [ f1 ] ) -> Group( [ f1 ] ) > ]
    gap> GraphOfMapping(last[1]);
    [ [ <identity> of ..., f1 ], [ f1, <identity> of ... ] ]
