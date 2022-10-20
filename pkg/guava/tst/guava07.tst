# guava, chapter 7

# [ "doc/guava.xml", 10049, 10056 ]
gap> UpperBoundSingleton(4, 3, 5);
25
gap> C := ReedSolomonCode(4,3);; Size(C);
25
gap> IsMDSCode(C);
true 

# [ "doc/guava.xml", 10093, 10100 ]
gap> UpperBoundHamming( 15, 3, 2 );
2048
gap> C := HammingCode( 4, GF(2) );
a linear [15,11,3]1 Hamming (4,2) code over GF(2)
gap> Size( C );
2048 

# [ "doc/guava.xml", 10120, 10125 ]
gap> UpperBoundJohnson( 13, 5 );
77
gap> UpperBoundHamming( 13, 5, 2);
89   # in this case the Johnson bound is better 

# [ "doc/guava.xml", 10150, 10159 ]
gap> UpperBoundPlotkin( 15, 7, 2 );
32
gap> C := BCHCode( 15, 7, GF(2) );
a cyclic [15,5,7]5 BCH code, delta=7, b=1 over GF(2)
gap> Size(C);
32
gap> WeightDistribution(C);
[ 1, 0, 0, 0, 0, 0, 0, 15, 15, 0, 0, 0, 0, 0, 0, 1 ] 

# [ "doc/guava.xml", 10183, 10190 ]
gap> UpperBoundPlotkin( 16, 3, 2 );
12288
gap> UpperBoundElias( 16, 3, 2 );
10280 
gap> UpperBoundElias( 20, 10, 3 );
16255

# [ "doc/guava.xml", 10208, 10215 ]
gap> UpperBoundGriesmer( 13, 5, 2 );
64
gap> UpperBoundGriesmer( 18, 9, 2 );
8        # the maximum number of words for a linear code is 8
gap> Size( PuncturedCode( HadamardCode( 20, 1 ) ) );
20       # this non-linear code has 20 elements 

# [ "doc/guava.xml", 10240, 10245 ]
gap> IsGriesmerCode( HammingCode( 3, GF(2) ) );
true
gap> IsGriesmerCode( BCHCode( 17, 2, GF(2) ) );
false 

# [ "doc/guava.xml", 10275, 10280 ]
gap> UpperBound( 10, 3, 2 );
85
gap> UpperBound( 25, 9, 8 );
1211778792827540 

# [ "doc/guava.xml", 10300, 10307 ]
gap> C := BCHCode( 45, 7 );
a cyclic [45,23,7..9]6..16 BCH code, delta=7, b=1 over GF(2)
gap> LowerBoundMinimumDistance( C );
7     # designed distance is lower bound for minimum distance 
gap> LowerBoundMinimumDistance( 45, 23, GF(2) );
10 

# [ "doc/guava.xml", 10331, 10344 ]
gap> LowerBoundGilbertVarshamov(24,8,2);
64
gap> LowerBoundGilbertVarshamov(7,3,2);
16
gap> LowerBoundMinimumDistance(7,4,2);
3
gap> LowerBoundGilbertVarshamov(3,3,2);
1
gap> LowerBoundMinimumDistance(3,3,2);
1
gap> LowerBoundGilbertVarshamov(25,10,2);
16

# [ "doc/guava.xml", 10371, 10376 ]
gap> LowerBoundSpherePacking(3,2,2);
2
gap> LowerBoundSpherePacking(3,3,2);
1

# [ "doc/guava.xml", 10404, 10410 ]
gap> C := BCHCode( 45, 7 );;
gap> UpperBoundMinimumDistance( C );
9 
gap> UpperBoundMinimumDistance( 45, 23, GF(2) );
11 

# [ "doc/guava.xml", 10448, 10466 ]
gap> bounds := BoundsMinimumDistance( 7, 3 );; DisplayBoundsInfo( bounds );
an optimal linear [7,3,d] code over GF(2) has d=4
------------------------------------------------------------------------------
Lb(7,3)=4, by shortening of:
Lb(8,4)=4, u u+v construction of C1 and C2:
Lb(4,3)=2, dual of the repetition code
Lb(4,1)=4, repetition code
------------------------------------------------------------------------------
Ub(7,3)=4, Griesmer bound
# The lower bound is equal to the upper bound, so a code with
# these parameters is optimal.
gap> C := BestKnownLinearCode( bounds );; Display( C );
a linear [7,3,4]2..3 shortened code of
a linear [8,4,4]2 U U+V construction code of
U: a cyclic [4,3,2]1 dual code of
   a cyclic [4,1,4]2 repetition code over GF(2)
V: a cyclic [4,1,4]2 repetition code over GF(2)

# [ "doc/guava.xml", 10501, 10506 ]
gap> BoundsCoveringRadius( BCHCode( 17, 3, GF(2) ) );
[ 3 .. 4 ]
gap> BoundsCoveringRadius( HammingCode( 5, GF(2) ) );
[ 1 ] 

# [ "doc/guava.xml", 10620, 10629 ]
gap> C:=RandomLinearCode(10,5,GF(2));
a  [10,5,?] randomly generated code over GF(2)
gap> ExhaustiveSearchCoveringRadius(C);
Trying 3 ...
[ 3 .. 5 ]
gap> CoveringRadius(C);
3


# [ "doc/guava.xml", 10650, 10658 ]
gap> C:=RandomLinearCode(10,5,GF(2));
a  [10,5,?] randomly generated code over GF(2)
gap> GeneralLowerBoundCoveringRadius(C);
2
gap> CoveringRadius(C);
3


# [ "doc/guava.xml", 10677, 10685 ]
gap> C:=RandomLinearCode(10,5,GF(2));
a  [10,5,?] randomly generated code over GF(2)
gap> GeneralUpperBoundCoveringRadius(C);
4
gap> CoveringRadius(C);
3


# [ "doc/guava.xml", 10711, 10723 ]
gap> C:=RandomLinearCode(10,5,GF(2));
a  [10,5,?] randomly generated code over GF(2)
gap> Size(C);
32
gap> CoveringRadius(C);
3
gap> LowerBoundCoveringRadiusSphereCovering(10,32,GF(2),false);
2
gap> LowerBoundCoveringRadiusSphereCovering(10,3,GF(2),true);
6


# [ "doc/guava.xml", 10758, 10770 ]
gap> C:=RandomLinearCode(10,5,GF(2));
a  [10,5,?] randomly generated code over GF(2)
gap> Size(C);
32
gap> CoveringRadius(C);
3
gap> LowerBoundCoveringRadiusVanWee1(10,32,GF(2),false);
2
gap> LowerBoundCoveringRadiusVanWee1(10,3,GF(2),true);
6


# [ "doc/guava.xml", 10812, 10824 ]
gap> C:=RandomLinearCode(10,5,GF(2));
a  [10,5,?] randomly generated code over GF(2)
gap> Size(C);
32
gap> CoveringRadius(C);
3
gap> LowerBoundCoveringRadiusVanWee2(10,32,false);
2
gap> LowerBoundCoveringRadiusVanWee2(10,3,true);
7


# [ "doc/guava.xml", 10870, 10882 ]
gap> C:=RandomLinearCode(10,5,GF(2));
a  [10,5,?] randomly generated code over GF(2)
gap> Size(C);
32
gap> CoveringRadius(C);
3
gap> LowerBoundCoveringRadiusCountingExcess(10,32,false);
0
gap> LowerBoundCoveringRadiusCountingExcess(10,3,true);
7


# [ "doc/guava.xml", 10923, 10935 ]
gap> C:=RandomLinearCode(10,5,GF(2));
a  [10,5,?] randomly generated code over GF(2)
gap> Size(C);
32
gap> CoveringRadius(C);
3
gap> LowerBoundCoveringRadiusEmbedded1(10,32,false);
2
gap> LowerBoundCoveringRadiusEmbedded1(10,3,true);
7


# [ "doc/guava.xml", 10976, 10988 ]
gap> C:=RandomLinearCode(15,5,GF(2));
a  [15,5,?] randomly generated code over GF(2)
gap> Size(C);
32
gap> CoveringRadius(C);
6
gap> LowerBoundCoveringRadiusEmbedded2(10,32,false);
2
gap> LowerBoundCoveringRadiusEmbedded2(10,3,true);
7


# [ "doc/guava.xml", 11011, 11019 ]
gap> C:=RandomLinearCode(15,5,GF(2));
a  [15,5,?] randomly generated code over GF(2)
gap> CoveringRadius(C);
5
gap> LowerBoundCoveringRadiusInduction(15,6);
7


# [ "doc/guava.xml", 11041, 11049 ]
gap> C:=RandomLinearCode(15,5,GF(2));
a  [15,5,?] randomly generated code over GF(2)
gap> CoveringRadius(C);
5
gap> UpperBoundCoveringRadiusRedundancy(C);
10


# [ "doc/guava.xml", 11070, 11077 ]
gap> C:=RandomLinearCode(15,5,GF(2));
a  [15,5,?] randomly generated code over GF(2)
gap> CoveringRadius(C);
5
gap> UpperBoundCoveringRadiusDelsarte(C);
13

# [ "doc/guava.xml", 11106, 11113 ]
gap> C:=RandomLinearCode(15,5,GF(2));
a  [15,5,?] randomly generated code over GF(2)
gap> CoveringRadius(C);
5
gap> UpperBoundCoveringRadiusStrength(C);
7

# [ "doc/guava.xml", 11133, 11141 ]
gap> C:=RandomLinearCode(15,5,GF(2));
a  [15,5,?] randomly generated code over GF(2)
gap> CoveringRadius(C);
5
gap> UpperBoundCoveringRadiusGriesmerLike(C);
9


# [ "doc/guava.xml", 11162, 11170 ]
gap> C:=CyclicCodes(15,GF(2))[3];
a cyclic [15,12,1..2]1..3 enumerated code over GF(2)
gap> CoveringRadius(C);
3
gap> UpperBoundCoveringRadiusCyclicCode(C);
3


# [ "doc/guava.xml", 11229, 11243 ]
gap> PrintArray( KrawtchoukMat( 3, 2 ) );
[ [   1,   1,   1,   1 ],
  [   3,   1,  -1,  -3 ],
  [   3,  -1,  -1,   3 ],
  [   1,  -1,   1,  -1 ] ]
gap> C := HammingCode( 3 );; a := WeightDistribution( C );
[ 1, 0, 0, 7, 7, 0, 0, 1 ]
gap> n := WordLength( C );; q := Size( LeftActingDomain( C ) );;
gap> k := Dimension( C );;
gap> q^( -k ) * KrawtchoukMat( n, q ) * a;
[ 1, 0, 0, 0, 7, 0, 0, 0 ]
gap> WeightDistribution( DualCode( C ) );
[ 1, 0, 0, 0, 7, 0, 0, 0 ] 

# [ "doc/guava.xml", 11271, 11281 ]
gap> GrayMat(3);
[ [ 0*Z(2), 0*Z(2), 0*Z(2) ], [ 0*Z(2), 0*Z(2), Z(2)^0 ],
  [ 0*Z(2), Z(2)^0, Z(2)^0 ], [ 0*Z(2), Z(2)^0, 0*Z(2) ],
  [ Z(2)^0, Z(2)^0, 0*Z(2) ], [ Z(2)^0, Z(2)^0, Z(2)^0 ],
  [ Z(2)^0, 0*Z(2), Z(2)^0 ], [ Z(2)^0, 0*Z(2), 0*Z(2) ] ]
gap> G := GrayMat( 4, GF(4) );; Length(G);
256          # the length of a GrayMat is always q^n
gap> G[101] - G[100];
[ 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2) ] 

# [ "doc/guava.xml", 11302, 11311 ]
gap> PrintArray(SylvesterMat(2));
[ [   1,   1 ],
  [   1,  -1 ] ]
gap> PrintArray( SylvesterMat(4) );
[ [   1,   1,   1,   1 ],
  [   1,  -1,   1,  -1 ],
  [   1,   1,  -1,  -1 ],
  [   1,  -1,  -1,   1 ] ] 

# [ "doc/guava.xml", 11339, 11351 ]
gap> C := HadamardMat(8);; PrintArray(C);
[ [   1,   1,   1,   1,   1,   1,   1,   1 ],
  [   1,  -1,   1,  -1,   1,  -1,   1,  -1 ],
  [   1,   1,  -1,  -1,   1,   1,  -1,  -1 ],
  [   1,  -1,  -1,   1,   1,  -1,  -1,   1 ],
  [   1,   1,   1,   1,  -1,  -1,  -1,  -1 ],
  [   1,  -1,   1,  -1,  -1,   1,  -1,   1 ],
  [   1,   1,  -1,  -1,  -1,  -1,   1,   1 ],
  [   1,  -1,  -1,   1,  -1,   1,   1,  -1 ] ]
gap> C * TransposedMat(C) = 8 * IdentityMat( 8, 8 );
true 

# [ "doc/guava.xml", 11366, 11375 ]
gap> M:=VandermondeMat([Z(5),Z(5)^2,Z(5)^0,Z(5)^3],2);
[ [ Z(5)^0, Z(5), Z(5)^2 ], [ Z(5)^0, Z(5)^2, Z(5)^0 ],
  [ Z(5)^0, Z(5)^0, Z(5)^0 ], [ Z(5)^0, Z(5)^3, Z(5)^2 ] ]
gap> Display(M);
 1 2 4
 1 4 1
 1 1 1
 1 3 4

# [ "doc/guava.xml", 11413, 11446 ]
gap> M := Z(2)*[[1,0,0,1],[0,0,1,1]];; PrintArray(M);
[ [    Z(2),  0*Z(2),  0*Z(2),    Z(2) ],
  [  0*Z(2),  0*Z(2),    Z(2),    Z(2) ] ]
gap> PutStandardForm(M);                   # identity at the left side
(2,3)
gap> PrintArray(M);
[ [    Z(2),  0*Z(2),  0*Z(2),    Z(2) ],
  [  0*Z(2),    Z(2),  0*Z(2),    Z(2) ] ]
gap> PutStandardForm(M, false);            # identity at the right side
(1,4,3)
gap> PrintArray(M);
[ [  0*Z(2),    Z(2),    Z(2),  0*Z(2) ],
  [  0*Z(2),    Z(2),  0*Z(2),    Z(2) ] ]
gap> C := BestKnownLinearCode( 23, 12, GF(2) );
a linear [23,12,7]3 punctured code
gap> G:=MutableCopyMat(GeneratorMat(C));;
gap> PutStandardForm(G);
()
gap> Display(G);
 1 . . . . . . . . . . . 1 . 1 . 1 1 1 . . . 1
 . 1 . . . . . . . . . . 1 1 1 1 1 . . 1 . . .
 . . 1 . . . . . . . . . 1 1 . 1 . . 1 . 1 . 1
 . . . 1 . . . . . . . . 1 1 . . . 1 1 1 . 1 .
 . . . . 1 . . . . . . . 1 1 . . 1 1 . 1 1 . 1
 . . . . . 1 . . . . . . . 1 1 . . 1 1 . 1 1 1
 . . . . . . 1 . . . . . . . 1 1 . . 1 1 . 1 1
 . . . . . . . 1 . . . . 1 . 1 1 . 1 1 1 1 . .
 . . . . . . . . 1 . . . . 1 . 1 1 . 1 1 1 1 .
 . . . . . . . . . 1 . . . . 1 . 1 1 . 1 1 1 .
 . . . . . . . . . . 1 . 1 . 1 1 1 . . . 1 1 1
 . . . . . . . . . . . 1 . 1 . 1 1 1 . . . 1 1


# [ "doc/guava.xml", 11463, 11472 ]
gap> IsInStandardForm(IdentityMat(7, GF(2)));
true
gap> IsInStandardForm([[1, 1, 0], [1, 0, 1]], false);
true
gap> IsInStandardForm([[1, 3, 2, 7]]);
true
gap> IsInStandardForm(HadamardMat(4));
false 

# [ "doc/guava.xml", 11484, 11491 ]
gap> M := [[1,2,3,4],[1,2,3,4]];; PrintArray(M);
[ [  1,  2,  3,  4 ],
  [  1,  2,  3,  4 ] ]
gap> PrintArray(PermutedCols(M, (1,2,3)));
[ [  3,  1,  2,  4 ],
  [  3,  1,  2,  4 ] ] 

# [ "doc/guava.xml", 11517, 11530 ]
gap> M := Z(9)*[[1,2],[2,1]];; PrintArray(M);
[ [    Z(3^2),  Z(3^2)^5 ],
  [  Z(3^2)^5,    Z(3^2) ] ]
gap> DefaultField( Flat(M) );
GF(3^2)
gap> VCFM := VerticalConversionFieldMat( M, GF(9) );; PrintArray(VCFM);
[ [  0*Z(3),  0*Z(3) ],
  [  Z(3)^0,    Z(3) ],
  [  0*Z(3),  0*Z(3) ],
  [    Z(3),  Z(3)^0 ] ]
gap> DefaultField( Flat(VCFM) );
GF(3) 

# [ "doc/guava.xml", 11560, 11573 ]
gap> M := Z(9)*[[1,2],[2,1]];; PrintArray(M);
[ [    Z(3^2),  Z(3^2)^5 ],
  [  Z(3^2)^5,    Z(3^2) ] ]
gap> DefaultField( Flat(M) );
GF(3^2)
gap> HCFM := HorizontalConversionFieldMat(M, GF(9));; PrintArray(HCFM);
[ [  0*Z(3),  Z(3)^0,  0*Z(3),    Z(3) ],
  [  Z(3)^0,  Z(3)^0,    Z(3),    Z(3) ],
  [  0*Z(3),    Z(3),  0*Z(3),  Z(3)^0 ],
  [    Z(3),    Z(3),  Z(3)^0,  Z(3)^0 ] ]
gap> DefaultField( Flat(HCFM) );
GF(3) 

# [ "doc/guava.xml", 11615, 11633 ]
gap> M := MOLS( 4, 3 );;PrintArray( M[1] );
[ [  0,  1,  2,  3 ],
  [  1,  0,  3,  2 ],
  [  2,  3,  0,  1 ],
  [  3,  2,  1,  0 ] ]
gap> PrintArray( M[2] );
[ [  0,  2,  3,  1 ],
  [  1,  3,  2,  0 ],
  [  2,  0,  1,  3 ],
  [  3,  1,  0,  2 ] ]
gap> PrintArray( M[3] );
[ [  0,  3,  1,  2 ],
  [  1,  2,  0,  3 ],
  [  2,  1,  3,  0 ],
  [  3,  0,  2,  1 ] ]
gap> MOLS( 12, 3 );
false 

# [ "doc/guava.xml", 11646, 11651 ]
gap> IsLatinSquare([[1,2],[2,1]]);
true
gap> IsLatinSquare([[1,2,3],[2,3,1],[1,3,2]]);
false 

# [ "doc/guava.xml", 11666, 11672 ]
gap> M := MOLS(4,2);
[ [ [ 0, 1, 2, 3 ], [ 1, 0, 3, 2 ], [ 2, 3, 0, 1 ], [ 3, 2, 1, 0 ] ],
  [ [ 0, 2, 3, 1 ], [ 1, 3, 2, 0 ], [ 2, 0, 1, 3 ], [ 3, 1, 0, 2 ] ] ]
gap> AreMOLS(M);
true 

# [ "doc/guava.xml", 11707, 11710 ]
gap> CoordinateNorm( HammingCode( 3, GF(2) ), 3 );
3 

# [ "doc/guava.xml", 11729, 11732 ]
gap> CodeNorm( HammingCode( 3, GF(2) ) );
3 

# [ "doc/guava.xml", 11751, 11754 ]
gap> IsCoordinateAcceptable( HammingCode( 3, GF(2) ), 3 );
true 

# [ "doc/guava.xml", 11769, 11776 ]
gap> c := RepetitionCode( 7, GF(2) );;
gap> ham := HammingCode( 3, GF(2) );;
gap> d := EvenWeightSubcode( ham );;
gap> e := ConstantWeightSubcode( ham, 3 );;
gap> GeneralizedCodeNorm( ham, c, d, e );
4 

# [ "doc/guava.xml", 11802, 11805 ]
gap> IsNormalCode( HammingCode( 3, GF(2) ) );
true 

# [ "doc/guava.xml", 11841, 11847 ]
gap> CodeWeightEnumerator( ElementsCode( [ [ 0,0,0 ], [ 0,0,1 ],
> [ 0,1,1 ], [ 1,1,1 ] ], GF(2) ) );
x^3 + x^2 + x + 1
gap> CodeWeightEnumerator( HammingCode( 3, GF(2) ) );
x^7 + 7*x^4 + 7*x^3 + 1 

# [ "doc/guava.xml", 11866, 11871 ]
gap> CodeDistanceEnumerator( HammingCode( 3, GF(2) ),[0,0,0,0,0,0,1] );
x^6 + 3*x^5 + 4*x^4 + 4*x^3 + 3*x^2 + x
gap> CodeDistanceEnumerator( HammingCode( 3, GF(2) ),[1,1,1,1,1,1,1] );
x^7 + 7*x^4 + 7*x^3 + 1 # `[1,1,1,1,1,1,1]' $\in$ `HammingCode( 3, GF(2 ) )'

# [ "doc/guava.xml", 11892, 11895 ]
gap> CodeMacWilliamsTransform( HammingCode( 3, GF(2) ) );
7*x^4 + 1 

# [ "doc/guava.xml", 11920, 11925 ]
gap> CodeDensity( HammingCode( 3, GF(2) ) );
1
gap> CodeDensity( ReedMullerCode( 1, 4 ) );
14893/2048 

# [ "doc/guava.xml", 11949, 11959 ]
gap> SphereContent( 15, 0, GF(2) );
1    # Only one word with distance 0, which is the word itself
gap> SphereContent( 11, 3, GF(4) );
4984
gap> C := HammingCode(5);
a linear [31,26,3]1 Hamming (5,2) code over GF(2)
#the minimum distance is 3, so the code can correct one error
gap> ( SphereContent( 31, 1, GF(2) ) * Size(C) ) = 2 ^ 31;
true 

# [ "doc/guava.xml", 11983, 11986 ]
gap> Krawtchouk( 2, 0, 3, 2);
3 

# [ "doc/guava.xml", 12000, 12007 ]
gap> PrimitiveUnityRoot( GF(2), 15 );
Z(2^4)
gap> last^15;
Z(2)^0
gap> PrimitiveUnityRoot( GF(8), 21 );
Z(2^6)^3 

# [ "doc/guava.xml", 12024, 12028 ]
gap> PrimitivePolynomialsNr(3,4);
12


# [ "doc/guava.xml", 12040, 12044 ]
gap> IrreduciblePolynomialsNr(3,4);
20


# [ "doc/guava.xml", 12062, 12072 ]
gap> a:=Random(GF(4));
0*Z(2)
gap> M:=MatrixRepresentationOfElement(a,GF(4));; Display(M);
 .
gap> a:=Random(GF(4));
Z(2^2)
gap> M:=MatrixRepresentationOfElement(a,GF(4));; Display(M);
 . 1
 1 1

# [ "doc/guava.xml", 12106, 12117 ]
gap> P := UnivariatePolynomial( GF(3), Z(3)^0 * [1,0,1,2] );
-x_1^3+x_1^2+Z(3)^0
gap> RecP := ReciprocalPolynomial( P );
x_1^3+x_1-Z(3)^0
gap> ReciprocalPolynomial( RecP ) = P;
true 
gap> P := UnivariatePolynomial( GF(3), Z(3)^0 * [1,0,1,2] );
-x_1^3+x_1^2+Z(3)^0
gap> ReciprocalPolynomial( P, 6 );
x_1^6+x_1^4-x_1^3

# [ "doc/guava.xml", 12145, 12151 ]
gap> CyclotomicCosets( 2, 15 );
[ [ 0 ], [ 1, 2, 4, 8 ], [ 3, 6, 12, 9 ], [ 5, 10 ],
  [ 7, 14, 13, 11 ] ]
gap> CyclotomicCosets( 7, 6 );
[ [ 0 ], [ 1 ], [ 2 ], [ 3 ], [ 4 ], [ 5 ] ] 

# [ "doc/guava.xml", 12165, 12182 ]
gap> H := HammingCode(2, GF(5));
a linear [6,4,3]1 Hamming (2,5) code over GF(5)
gap> WeightDistribution(H);
[ 1, 0, 0, 80, 120, 264, 160 ]
gap> WeightHistogram(H);
264----------------
               *
               *
               *
               *
               *  *
            *  *  *
         *  *  *  *
         *  *  *  *
+--------+--+--+--+--
0  1  2  3  4  5  6 

# [ "doc/guava.xml", 12202, 12208 ]
gap> L:=[1,2,3,4,3,2,1,5,4,3,2,1];;
gap> MultiplicityInList(L,1);
3
gap> MultiplicityInList(L,6);
0

# [ "doc/guava.xml", 12226, 12230 ]
gap> L:=[1,2,3,4,3,2,1,5,4,3,2,1];;
gap> MostCommonInList(L);
1

# [ "doc/guava.xml", 12249, 12253 ]
gap> L:=[1,2,3,4];;
gap> RotateList(L);
[2,3,4,1]

# [ "doc/guava.xml", 12269, 12273 ]
gap> k:=3; L:=[1,2,3,4];;
gap> M:=CirculantMatrix(k,L);;
gap> Display(M);

# [ "doc/guava.xml", 12324, 12334 ]
gap> F:=GF(11);;
gap> R2:=PolynomialRing(F,2);
PolynomialRing(..., [ x_1, x_2 ])
gap> vars:=IndeterminatesOfPolynomialRing(R2);;
gap> x:=vars[1];; y:=vars[2];;
gap> poly:=y^2-x*(x^2-1);;
gap> DegreeMultivariatePolynomial(poly,R2);
3


# [ "doc/guava.xml", 12358, 12368 ]
gap> F:=GF(11);;
gap> R2:=PolynomialRing(F,2);
PolynomialRing(..., [ x_1, x_2 ])
gap> vars:=IndeterminatesOfPolynomialRing(R2);;
gap> x:=vars[1];; y:=vars[2];;
gap> poly:=y^2-x*(x^2-1);;
gap> DegreesMultivariatePolynomial(poly,R2);
[ [ [ x_1, x_1, 1 ], [ x_1, x_2, 0 ] ], [ [ x_2^2, x_1, 0 ], [ x_2^2, x_2, 2 ] ],
  [ [ x_1^3, x_1, 3 ], [ x_1^3, x_2, 0 ] ] ]

# [ "doc/guava.xml", 12400, 12426 ]
gap> F:=GF(11);;
gap> R2:=PolynomialRing(F,2);
PolynomialRing(..., [ x_1, x_2 ])
gap> vars:=IndeterminatesOfPolynomialRing(R2);;
gap> x:=vars[1];; y:=vars[2];;
gap> poly:=y^2-x*(x^2-1);;
gap> PolynomialCoefficientsOfPolynomial(poly,x);
[ x_2^2, Z(11)^0, 0*Z(11), -Z(11)^0 ]
gap> PolynomialCoefficientsOfPolynomial(poly,y);
[ -x_1^3+x_1, 0*Z(11), Z(11)^0 ]
gap> CoefficientMultivariatePolynomial(poly,y,0,R2);
-x_1^3+x_1
gap> CoefficientMultivariatePolynomial(poly,y,1,R2);
0*Z(11)
gap> CoefficientMultivariatePolynomial(poly,y,2,R2);
Z(11)^0
gap> CoefficientMultivariatePolynomial(poly,x,0,R2);
x_2^2
gap> CoefficientMultivariatePolynomial(poly,x,1,R2);
Z(11)^0
gap> CoefficientMultivariatePolynomial(poly,x,2,R2);
0*Z(11)
gap> CoefficientMultivariatePolynomial(poly,x,3,R2);
-Z(11)^0


# [ "doc/guava.xml", 12466, 12480 ]
gap> F:=GF(11);;
gap> R2:=PolynomialRing(F,2);
PolynomialRing(..., [ x_1, x_2 ])
gap> vars:=IndeterminatesOfPolynomialRing(R2);;
gap> x:=vars[1];; y:=vars[2];;
gap> f:=3*y-3*x+1;; g:=-5*y+2*x-7;;
gap> soln:=SolveLinearSystem([f,g],[x,y]);
[ Z(11)^3, Z(11)^2 ]
gap> Value(f,[x,y],soln); # checking okay
0*Z(11)
gap> Value(g,[x,y],col); # checking okay
0*Z(11)


# [ "doc/guava.xml", 12505, 12509 ]
gap> GuavaVersion();
"3.11"


# [ "doc/guava.xml", 12525, 12533 ]
gap> F:=GF(11);; l := One(F);;
gap> ZechLog(2*l,8*l,F);
-24
gap> 8*l+l;(2*l)^(-24);
Z(11)^6
Z(11)^6


# [ "doc/guava.xml", 12554, 12563 ]
gap> F:=GF(11);
GF(11)
gap> R1:=PolynomialRing(F,["a"]);;
gap> var1:=IndeterminatesOfPolynomialRing(R1);; a:=var1[1];;
gap> coeffs:=Z(11)^0*[1,2,3,4];
[ Z(11)^0, Z(11), Z(11)^8, Z(11)^2 ]
gap> CoefficientToPolynomial(coeffs,R1);
Z(11)^2*a^3+Z(11)^8*a^2+Z(11)*a+Z(11)^0

# [ "doc/guava.xml", 12584, 12605 ]
gap> F:=GF(11);
GF(11)
gap> R1:=PolynomialRing(F,["a"]);;
gap> var1:=IndeterminatesOfPolynomialRing(R1);; a:=var1[1];;
gap> b:=X(F,"b",var1);
b
gap> var2:=Concatenation(var1,[b]);
[ a, b ]
gap> R2:=PolynomialRing(F,var2);
PolynomialRing(..., [ a, b ])
gap> c:=X(F,"c",var2);
c
gap> var3:=Concatenation(var2,[c]);
[ a, b, c ]
gap> R3:=PolynomialRing(F,var3);
PolynomialRing(..., [ a, b, c ])
gap> m:=b^3*c^7;
b^3*c^7
gap> DegreesMonomialTerm(m,R3);
[ 0, 3, 7 ]

# [ "doc/guava.xml", 12640, 12652 ]
gap> R2:=PolynomialRing(GF(3),["x1","x2"]);
GF(3)[x1,x2]
gap> vars:=IndeterminatesOfPolynomialRing(R2);
[ x1, x2 ]
gap> x2:=vars[2];
x2
gap> x1:=vars[1];
x1
gap> f:=x1^3+x2^3;;
gap> DivisorsMultivariatePolynomial(f,R2);
[ x1+x2, x1+x2, x1+x2 ]
