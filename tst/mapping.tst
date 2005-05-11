#############################################################################
##
#W  mapping.tst                 GAP library                     Thomas Breuer
##
#H  @(#)$Id: mapping.tst,v 4.13.4.3 2005/05/11 14:53:02 gap Exp $
##
#Y  Copyright (C)  1996,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  To be listed in testall.g
##

gap> START_TEST("$Id: mapping.tst,v 4.13.4.3 2005/05/11 14:53:02 gap Exp $");

gap> M:= GF(3);
GF(3)
gap> tuples:= List( Tuples( AsList( M ), 2 ), Tuple );;
gap> Print(tuples,"\n");
[ Tuple( [ 0*Z(3), 0*Z(3) ] ), Tuple( [ 0*Z(3), Z(3)^0 ] ), 
  Tuple( [ 0*Z(3), Z(3) ] ), Tuple( [ Z(3)^0, 0*Z(3) ] ), 
  Tuple( [ Z(3)^0, Z(3)^0 ] ), Tuple( [ Z(3)^0, Z(3) ] ), 
  Tuple( [ Z(3), 0*Z(3) ] ), Tuple( [ Z(3), Z(3)^0 ] ), 
  Tuple( [ Z(3), Z(3) ] ) ]

gap> map:= GeneralMappingByElements( M, M, [] );
<general mapping: GF(3) -> GF(3) >
gap> IsInjective( map );
true
gap> IsSingleValued( map );
true
gap> IsSurjective( map );
false
gap> IsTotal( map );
false

gap> map:= GeneralMappingByElements( M, M, tuples{ [ 1, 2, 4, 7 ] } );
<general mapping: GF(3) -> GF(3) >
gap> IsInjective( map );
false
gap> IsSingleValued( map );
false
gap> IsSurjective( map );
false
gap> IsTotal( map );
true

gap> inv:= InverseGeneralMapping( map );
InverseGeneralMapping( <general mapping: GF(3) -> GF(3) > )
gap> Print(AsList( UnderlyingRelation( inv ) ),"\n");
[ Tuple( [ 0*Z(3), 0*Z(3) ] ), Tuple( [ 0*Z(3), Z(3)^0 ] ), 
  Tuple( [ 0*Z(3), Z(3) ] ), Tuple( [ Z(3)^0, 0*Z(3) ] ) ]
gap> IsInjective( inv );
false
gap> IsSingleValued( inv );
false
gap> IsSurjective( inv );
true
gap> IsTotal( inv );
false

gap> comp:= CompositionMapping( inv, map );
CompositionMapping( InverseGeneralMapping( <general mapping: GF(3) -> GF(
3) > ), <general mapping: GF(3) -> GF(3) > )
gap> Print(AsList( UnderlyingRelation( comp ) ),"\n");
[ Tuple( [ 0*Z(3), 0*Z(3) ] ), Tuple( [ 0*Z(3), Z(3)^0 ] ), 
  Tuple( [ 0*Z(3), Z(3) ] ), Tuple( [ Z(3)^0, 0*Z(3) ] ), 
  Tuple( [ Z(3)^0, Z(3)^0 ] ), Tuple( [ Z(3)^0, Z(3) ] ), 
  Tuple( [ Z(3), 0*Z(3) ] ), Tuple( [ Z(3), Z(3)^0 ] ), 
  Tuple( [ Z(3), Z(3) ] ) ]
gap> IsInjective( comp );
false
gap> IsSingleValued( comp );
false
gap> IsSurjective( comp );
true
gap> IsTotal( comp );
true

gap> anticomp:= CompositionMapping( map, inv );
CompositionMapping( <general mapping: GF(3) -> GF(
3) >, InverseGeneralMapping( <general mapping: GF(3) -> GF(3) > ) )
gap> Print(AsList( UnderlyingRelation( anticomp ) ),"\n");
[ Tuple( [ 0*Z(3), 0*Z(3) ] ), Tuple( [ 0*Z(3), Z(3)^0 ] ), 
  Tuple( [ Z(3)^0, 0*Z(3) ] ), Tuple( [ Z(3)^0, Z(3)^0 ] ) ]
gap> IsInjective( anticomp );
false
gap> IsSingleValued( anticomp );
false
gap> IsSurjective( anticomp );
false
gap> IsTotal( anticomp );
false

gap> t1:= Tuple( [ (), () ] );;  t2:= Tuple( [ (1,2), (1,2) ] );;
gap> g:= Group( (1,2) );;
gap> t:= TrivialSubgroup( g );;
gap> map1:= GeneralMappingByElements( g, g, [ t1, t2 ] );;
gap> map2:= GeneralMappingByElements( t, t, [ t1 ] );;
gap> IsMapping( map1 );
true
gap> IsMapping( map2 );
true
gap> com:= CompositionMapping( map2, map1 );;
gap> Source( com );
Group([ (1,2) ])
gap> Images( com, (1,2) );
[  ]
gap> IsTotal( com );
false
gap> IsSurjective( com );
true
gap> IsSingleValued( com );
true
gap> IsInjective( com );
true

gap> map:= GeneralMappingByElements( M, M, tuples{ [ 1, 4 ] } );
<general mapping: GF(3) -> GF(3) >
gap> IsInjective( map );
false
gap> IsSingleValued( map );
true
gap> IsSurjective( map );
false
gap> IsTotal( map );
false

gap> inv:= InverseGeneralMapping( map );
InverseGeneralMapping( <general mapping: GF(3) -> GF(3) > )
gap> AsList( UnderlyingRelation( inv ) );
[ Tuple( [ 0*Z(3), 0*Z(3) ] ), Tuple( [ 0*Z(3), Z(3)^0 ] ) ]
gap> IsInjective( inv );
true
gap> IsSingleValued( inv );
false
gap> IsSurjective( inv );
false
gap> IsTotal( inv );
false

gap> comp:= CompositionMapping( inv, map );
CompositionMapping( InverseGeneralMapping( <general mapping: GF(3) -> GF(
3) > ), <general mapping: GF(3) -> GF(3) > )
gap> IsInjective( comp );
false
gap> IsSingleValued( comp );
false
gap> IsSurjective( comp );
false
gap> IsTotal( comp );
false

gap> ImagesSource( map );
[ 0*Z(3) ]
gap> PreImagesRange( map );
[ 0*Z(3), Z(3)^0 ]

gap> comp:= CompositionMapping( IdentityMapping( Range( map ) ), map );
<general mapping: GF(3) -> GF(3) >
gap> comp = IdentityMapping( Source( map ) ) * map;
true
gap> map = comp;
true
gap> comp = map;
true
gap> map = inv;
false
gap> inv = map;
false

gap> map < inv;
true
gap> inv < map;
false

gap> conj:= map ^ inv;
CompositionMapping( InverseGeneralMapping( <general mapping: GF(3) -> GF(
3) > ), CompositionMapping( <general mapping: GF(3) -> GF(
3) >, <general mapping: GF(3) -> GF(3) > ) )
gap> IsSubset( UnderlyingRelation( conj ), UnderlyingRelation( map ) );
true
gap> IsSubset( UnderlyingRelation( map ), UnderlyingRelation( conj ) );
false

gap> One( map );
IdentityMapping( GF(3) )
gap> Z(3) / IdentityMapping( GF(3) );
Z(3)

gap> map:= GeneralMappingByElements( M, M, tuples{ [ 1, 4, 8 ] } );
<general mapping: GF(3) -> GF(3) >
gap> IsInjective( map );
false
gap> IsSingleValued( map );
true
gap> IsSurjective( map );
false
gap> IsTotal( map );
true

gap> ImageElm( map, Z(3) );
Z(3)^0
gap> ImagesElm( map, Z(3) );
[ Z(3)^0 ]
gap> ImagesSet( map, [ 0*Z(3), Z(3) ] );
[ 0*Z(3), Z(3)^0 ]
gap> ImagesSet( map, GF(3) );
[ 0*Z(3), Z(3)^0 ]
gap> ImagesRepresentative( map, Z(3) );
Z(3)^0

gap> (0*Z(3)) ^ map;
0*Z(3)

gap> map:= InverseGeneralMapping( map );
InverseGeneralMapping( <mapping: GF(3) -> GF(3) > )
gap> Print(AsList( UnderlyingRelation( map ) ),"\n");
[ Tuple( [ 0*Z(3), 0*Z(3) ] ), Tuple( [ 0*Z(3), Z(3)^0 ] ), 
  Tuple( [ Z(3)^0, Z(3) ] ) ]

gap> IsInjective( map );
true
gap> IsSingleValued( map );
false
gap> IsSurjective( map );
true
gap> IsTotal( map );
false

gap> PreImageElm( map, Z(3) );
Z(3)^0
gap> PreImagesElm( map, Z(3) );
[ Z(3)^0 ]
gap> PreImagesSet( map, [ 0*Z(3), Z(3) ] );
[ 0*Z(3), Z(3)^0 ]
gap> PreImagesSet( map, GF(3) );
[ 0*Z(3), Z(3)^0 ]
gap> PreImagesRepresentative( map, Z(3) );
Z(3)^0

gap> map:= GeneralMappingByElements( M, M, tuples{ [ 2, 6, 7 ] } );
<general mapping: GF(3) -> GF(3) >
gap> IsInjective( map );
true
gap> IsSingleValued( map );
true
gap> IsSurjective( map );
true
gap> IsTotal( map );
true

gap> ImageElm( map, Z(3) );
0*Z(3)
gap> ImagesElm( map, Z(3) );
[ 0*Z(3) ]
gap> ImagesSet( map, [ 0*Z(3), Z(3) ] );
[ 0*Z(3), Z(3)^0 ]
gap> ImagesSet( map, GF(3) );
[ 0*Z(3), Z(3)^0, Z(3) ]
gap> ImagesRepresentative( map, Z(3) );
0*Z(3)

gap> map:= InverseGeneralMapping( map );
InverseGeneralMapping( <mapping: GF(3) -> GF(3) > )
gap> Print(AsList( UnderlyingRelation( map ) ),"\n");
[ Tuple( [ 0*Z(3), Z(3) ] ), Tuple( [ Z(3)^0, 0*Z(3) ] ), 
  Tuple( [ Z(3), Z(3)^0 ] ) ]
gap> IsInjective( map );
true
gap> IsSingleValued( map );
true
gap> IsSurjective( map );
true
gap> IsTotal( map );
true

gap> PreImageElm( map, Z(3) );
0*Z(3)
gap> PreImagesElm( map, Z(3) );
[ 0*Z(3) ]
gap> PreImagesSet( map, [ 0*Z(3), Z(3) ] );
[ 0*Z(3), Z(3)^0 ]
gap> PreImagesSet( map, GF(3) );
[ 0*Z(3), Z(3)^0, Z(3) ]
gap> PreImagesRepresentative( map, Z(3) );
0*Z(3)

gap> ImagesSource( map );
[ 0*Z(3), Z(3)^0, Z(3) ]
gap> PreImagesRange( map );
[ 0*Z(3), Z(3)^0, Z(3) ]

gap> g := Group((1,2),(3,4));;
gap> i := IdentityMapping( g );;
gap> i2 := AsGroupGeneralMappingByImages(i);;
gap> j:=GroupGeneralMappingByImages(g,g,AsSSortedList(g),AsSSortedList(g));;
gap> i2 = j;
true

gap> STOP_TEST( "mapping.tst", 23200000 );


#############################################################################
##
#E

