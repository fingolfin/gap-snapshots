##############################################################################
##
#W  mwo.tst                       Gpd Package                    Chris Wensley
##
##  version 1.14, 18/04/2012   
##
#Y  Copyright (C) 2012, Chris Wensley,  
#Y  School of Computer Science, Bangor University, U.K. 
##  
gap> START_TEST( "Testing examples in Chapter 1 of the Gpd manual" );
gap> gpd_infolevel_saved := InfoLevel( InfoGpd );; 
gap> SetInfoLevel( InfoGpd, 0 );; 

## ========================  MAGMA  ================================ ## 
gap> tm := [[1,2,4,3],[1,2,4,3],[3,4,2,1],[3,4,2,1]];; 
gap> Display( tm );
[ [  1,  2,  4,  3 ],
  [  1,  2,  4,  3 ],
  [  3,  4,  2,  1 ],
  [  3,  4,  2,  1 ] ]
gap> m := MagmaByMultiplicationTable( tm ); 
<magma with 4 generators>
gap> SetName( m, "m" ); 
gap> m1 := MagmaElement(m,1);; 
gap> m2 := MagmaElement(m,2);; 
gap> m3 := MagmaElement(m,3);; 
gap> m4 := MagmaElement(m,4);; 
gap> One(m); 
fail
gap> M78 := MagmaWithObjects( m, [-8,-7] ); 
magma with objects :-
    magma = m
  objects = [ -8, -7 ]

gap> SetName( M78, "M78" ); 
gap> [ IsAssociative(M78), IsCommutative(M78), IsDomainWithObjects(M78) ]; 
[ false, false, true ]
gap> a78 := MultiplicativeElementWithObjects( M78, m2, -7, -8 ); 
[m2 : -7 -> -8]
gap> b87 := MultiplicativeElementWithObjects( M78, m3, -8, -7 ); 
[m3 : -8 -> -7]
gap> ba := b87*a78; 
[m4 : -8 -> -8]
gap> ab := a78*b87;
[m4 : -7 -> -7]
gap> a78^2; 
fail
gap> [ ba^2, ba^3, ba^4=ba^2 ];
[ [m1 : -8 -> -8], [m3 : -8 -> -8], true ]
gap> IsSinglePiece( M78 ); 
true
gap> IsDirectProductWithCompleteGraph( M78 );
true
gap> IsDiscrete( M78 );
false

## ====================  SEMIGROUP  =============================== ## 
gap> t := Transformation( [1,1,2,3] );; 
gap> s := Transformation( [2,2,3,3] );;
gap> r := Transformation( [2,3,4,4] );; 
gap> sgp := Semigroup( t, s, r );; 
gap> SetName( sgp, "sgp<t,s,r>" ); 
gap> S123 := SemigroupWithObjects( sgp, [-3,-2,-1] ); 
semigroup with objects :-
    magma = sgp<t,s,r>
  objects = [ -3, -2, -1 ]

gap> [ IsAssociative(S123), IsCommutative(S123) ]; 
[ true, false ]
gap> CategoriesOfObject( S123 ); 
[ "IsListOrCollection", "IsCollection", "IsExtLElement", 
  "CategoryCollections(IsExtLElement)", "IsExtRElement", 
  "CategoryCollections(IsExtRElement)", 
  "CategoryCollections(IsMultiplicativeElement)", "IsGeneralizedDomain", 
  "IsMagma", "IsDomainWithObjects", 
  "CategoryCollections(IsMultiplicativeElementWithObjects)", 
  "IsMagmaWithObjects" ]
gap> t12 := MultiplicativeElementWithObjects( S123, t, -1, -2 );; 
gap> s23 := MultiplicativeElementWithObjects( S123, s, -2, -3 );; 
gap> r31 := MultiplicativeElementWithObjects( S123, r, -3, -1 );; 
gap> ts13 := t12 * s23;
[Transformation( [ 2, 2, 2, 3 ] ) : -1 -> -3]
gap> sr21 := s23 * r31;
[Transformation( [ 3, 3, 4, 4 ] ) : -2 -> -1]
gap> rt32 := r31 * t12;
[Transformation( [ 1, 2, 3, 3 ] ) : -3 -> -2]
gap> tsr1 := ts13 * r31;
[Transformation( [ 3, 3, 3, 4 ] ) : -1 -> -1]

## =========================  MONOID  ============================== ## 
gap> fm := FreeMonoid( 2, "f" );; 
gap> em := Identity( fm );; 
gap> gm := GeneratorsOfMonoid( fm );; 
gap> mon := fm/[ [gm[1]^3,em], [gm[1]*gm[2],gm[2]] ];; 
gap> M49 := MonoidWithObjects( mon, [-9,-4] ); 
monoid with objects :-
    magma = Monoid( [ f1, f2 ], ... )
  objects = [ -9, -4 ]

gap> [ IsAssociative(M49), IsCommutative(M49) ]; 
[ true, false ]
gap> KnownTruePropertiesOfObject( M49 ); 
[ "CanEasilyCompareElements", "CanEasilySortElements", "IsDuplicateFree", 
  "IsAssociative", "IsSinglePieceDomain", 
  "IsDirectProductWithCompleteGraphDomain" ]
gap> CategoriesOfObject( M49 ); 
[ "IsListOrCollection", "IsCollection", "IsExtLElement", 
  "CategoryCollections(IsExtLElement)", "IsExtRElement", 
  "CategoryCollections(IsExtRElement)", 
  "CategoryCollections(IsMultiplicativeElement)", "IsGeneralizedDomain", 
  "IsMagma", "IsDomainWithObjects", 
  "CategoryCollections(IsMultiplicativeElementWithObjects)", 
  "CategoryCollections(IsMultiplicativeElementWithObjectsAndOnes)", 
  "IsMagmaWithObjects", "IsMagmaWithObjectsAndOnes" ]
gap> genM := GeneratorsOfMagmaWithOne( M49 ); 
[ [<identity ...> : -9 -> -9], [f1 : -9 -> -9], [f2 : -9 -> -9], 
  [<identity ...> : -9 -> -4], [<identity ...> : -4 -> -9] ]
gap> g2 := genM[2];; g3 := genM[3];; g4 := genM[4];; g5 := genM[5];; 
gap> g5*g2*g4; 
[f1 : -4 -> -4]

## ================ GROUP AS SINGLE OBJECT GROUPOID ================= ## 
gap> d8 := Group( (1,2,3,4), (1,3) );; 
gap> SetName( d8, "d8" );
gap> D0 := DomainWithSingleObject( d8, 0 ); 
single piece groupoid: < d8, [ 0 ] >
gap> KnownTruePropertiesOfObject( D0 ); 
[ "CanEasilyCompareElements", "CanEasilySortElements", "IsDuplicateFree", 
  "IsAssociative", "IsSinglePieceDomain", "IsDiscreteDomainWithObjects", 
  "IsDirectProductWithCompleteGraphDomain" ]
gap> p0 := GroupoidElement( D0, (1,2,3,4), 0, 0 );; 
gap> q0 := GroupoidElement( D0, (1,3), 0, 0 );; 
gap> p0*q0; 
[(1,2)(3,4) : 0 -> 0]
gap> Size( D0 );
8

## =============  MORE THAN ONE CONSTITUENT  ======================== ## 
gap> N1 := UnionOfPieces( [ M78, S123 ] ); 
magma with objects having 2 pieces :-
1: M78
2: semigroup with objects :-
    magma = sgp<t,s,r>
  objects = [ -3, -2, -1 ]

gap> ObjectList( N1 ); 
[ -8, -7, -3, -2, -1 ]
gap> N2 := UnionOfPieces( [ M49, D0 ] );  
monoid with objects having 2 pieces :-
1: monoid with objects :-
    magma = Monoid( [ f1, f2 ], ... )
  objects = [ -9, -4 ]
2: single piece groupoid: < d8, [ 0 ] >
gap> ObjectList( N2 ); 
[ -9, -4, 0 ]
gap> Pieces( N2 ); 
[ monoid with objects :-
        magma = Monoid( [ f1, f2 ], ... )
      objects = [ -9, -4 ]
    , single piece groupoid: < d8, [ 0 ] > ]
gap> N3 := UnionOfPieces( [ N1, N2] );  
magma with objects having 4 pieces :-
1: monoid with objects :-
    magma = Monoid( [ f1, f2 ], ... )
  objects = [ -9, -4 ]
2: M78
3: semigroup with objects :-
    magma = sgp<t,s,r>
  objects = [ -3, -2, -1 ]
4: single piece groupoid: < d8, [ 0 ] >
gap> ObjectList( N3 ); 
[ -9, -8, -7, -4, -3, -2, -1, 0 ]
gap> Length( GeneratorsOfMagmaWithObjects( N3 ) ); 
49

## this should fail since the object sets are not disjoint: 
gap> N4 := UnionOfPieces( [ S123, DomainWithSingleObject( d8, -2 ) ] );  
fail
gap> SetInfoLevel( InfoGpd, gpd_infolevel_saved );;  
gap> STOP_TEST( "mwo.tst", 12500 );

#############################################################################
##
#E  mwo.tst . . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
