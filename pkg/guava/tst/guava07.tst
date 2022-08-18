# guava, chapter 7

# [ "doc/guava.xml", 10057, 10064 ]
gap> UpperBoundSingleton(4, 3, 5);
25
gap> C := ReedSolomonCode(4,3);; Size(C);
25
gap> IsMDSCode(C);
true 

# [ "doc/guava.xml", 10101, 10108 ]
gap> UpperBoundHamming( 15, 3, 2 );
2048
gap> C := HammingCode( 4, GF(2) );
a linear [15,11,3]1 Hamming (4,2) code over GF(2)
gap> Size( C );
2048 

# [ "doc/guava.xml", 10128, 10133 ]
gap> UpperBoundJohnson( 13, 5 );
77
gap> UpperBoundHamming( 13, 5, 2);
89   # in this case the Johnson bound is better 

# [ "doc/guava.xml", 10158, 10167 ]
gap> UpperBoundPlotkin( 15, 7, 2 );
32
gap> C := BCHCode( 15, 7, GF(2) );
a cyclic [15,5,7]5 BCH code, delta=7, b=1 over GF(2)
gap> Size(C);
32
gap> WeightDistribution(C);
[ 1, 0, 0, 0, 0, 0, 0, 15, 15, 0, 0, 0, 0, 0, 0, 1 ] 

# [ "doc/guava.xml", 10191, 10198 ]
gap> UpperBoundPlotkin( 16, 3, 2 );
12288
gap> UpperBoundElias( 16, 3, 2 );
10280 
gap> UpperBoundElias( 20, 10, 3 );
16255

# [ "doc/guava.xml", 10216, 10223 ]
gap> UpperBoundGriesmer( 13, 5, 2 );
64
gap> UpperBoundGriesmer( 18, 9, 2 );
8        # the maximum number of words for a linear code is 8
gap> Size( PuncturedCode( HadamardCode( 20, 1 ) ) );
20       # this non-linear code has 20 elements 

# [ "doc/guava.xml", 10248, 10253 ]
gap> IsGriesmerCode( HammingCode( 3, GF(2) ) );
true
gap> IsGriesmerCode( BCHCode( 17, 2, GF(2) ) );
false 

# [ "doc/guava.xml", 10283, 10288 ]
gap> UpperBound( 10, 3, 2 );
85
gap> UpperBound( 25, 9, 8 );
1211778792827540 

# [ "doc/guava.xml", 10308, 10315 ]
gap> C := BCHCode( 45, 7 );
a cyclic [45,23,7..9]6..16 BCH code, delta=7, b=1 over GF(2)
gap> LowerBoundMinimumDistance( C );
7     # designed distance is lower bound for minimum distance 
gap> LowerBoundMinimumDistance( 45, 23, GF(2) );
10 

# [ "doc/guava.xml", 10339, 10352 ]
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

# [ "doc/guava.xml", 10379, 10384 ]
gap> LowerBoundSpherePacking(3,2,2);
2
gap> LowerBoundSpherePacking(3,3,2);
1

# [ "doc/guava.xml", 10412, 10418 ]
gap> C := BCHCode( 45, 7 );;
gap> UpperBoundMinimumDistance( C );
9 
gap> UpperBoundMinimumDistance( 45, 23, GF(2) );
11 

# [ "doc/guava.xml", 10456, 10474 ]
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

# [ "doc/guava.xml", 10509, 10514 ]
gap> BoundsCoveringRadius( BCHCode( 17, 3, GF(2) ) );
[ 3 .. 4 ]
gap> BoundsCoveringRadius( HammingCode( 5, GF(2) ) );
[ 1 ] 

# [ "doc/guava.xml", 10566, 10604 ]
gap> C:=RandomLinearCode(10,5,GF(2));
a  [10,5,?] randomly generated code over GF(2)
gap> IncreaseCoveringRadiusLowerBound(C,10);
Number of runs: 1000  best distance so far: 3
Number of runs: 2000  best distance so far: 3
Number of changes: 100
Number of runs: 3000  best distance so far: 3
Number of runs: 4000  best distance so far: 3
Number of runs: 5000  best distance so far: 3
Number of runs: 6000  best distance so far: 3
Number of runs: 7000  best distance so far: 3
Number of changes: 200
Number of runs: 8000  best distance so far: 3
Number of runs: 9000  best distance so far: 3
Number of runs: 10000  best distance so far: 3
Number of changes: 300
Number of runs: 11000  best distance so far: 3
Number of runs: 12000  best distance so far: 3
Number of runs: 13000  best distance so far: 3
Number of changes: 400
Number of runs: 14000  best distance so far: 3
user interrupt at... 
#
# used ctrl-c to break out of execution
#
... called from 
IncreaseCoveringRadiusLowerBound( code, -1, current ) called from
 function( arguments ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk> current;
[ Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0 ]
brk>
gap> CoveringRadius(C);
3


# [ "doc/guava.xml", 10627, 10636 ]
gap> C:=RandomLinearCode(10,5,GF(2));
a  [10,5,?] randomly generated code over GF(2)
gap> ExhaustiveSearchCoveringRadius(C);
Trying 3 ...
[ 3 .. 5 ]
gap> CoveringRadius(C);
3


# [ "doc/guava.xml", 10657, 10665 ]
gap> C:=RandomLinearCode(10,5,GF(2));
a  [10,5,?] randomly generated code over GF(2)
gap> GeneralLowerBoundCoveringRadius(C);
2
gap> CoveringRadius(C);
3


# [ "doc/guava.xml", 10684, 10692 ]
gap> C:=RandomLinearCode(10,5,GF(2));
a  [10,5,?] randomly generated code over GF(2)
gap> GeneralUpperBoundCoveringRadius(C);
4
gap> CoveringRadius(C);
3


# [ "doc/guava.xml", 10718, 10730 ]
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


# [ "doc/guava.xml", 10765, 10777 ]
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


# [ "doc/guava.xml", 10819, 10831 ]
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


# [ "doc/guava.xml", 10877, 10889 ]
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


# [ "doc/guava.xml", 10930, 10942 ]
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


# [ "doc/guava.xml", 10983, 10995 ]
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


# [ "doc/guava.xml", 11018, 11026 ]
gap> C:=RandomLinearCode(15,5,GF(2));
a  [15,5,?] randomly generated code over GF(2)
gap> CoveringRadius(C);
5
gap> LowerBoundCoveringRadiusInduction(15,6);
7


# [ "doc/guava.xml", 11048, 11056 ]
gap> C:=RandomLinearCode(15,5,GF(2));
a  [15,5,?] randomly generated code over GF(2)
gap> CoveringRadius(C);
5
gap> UpperBoundCoveringRadiusRedundancy(C);
10


# [ "doc/guava.xml", 11077, 11084 ]
gap> C:=RandomLinearCode(15,5,GF(2));
a  [15,5,?] randomly generated code over GF(2)
gap> CoveringRadius(C);
5
gap> UpperBoundCoveringRadiusDelsarte(C);
13

# [ "doc/guava.xml", 11113, 11120 ]
gap> C:=RandomLinearCode(15,5,GF(2));
a  [15,5,?] randomly generated code over GF(2)
gap> CoveringRadius(C);
5
gap> UpperBoundCoveringRadiusStrength(C);
7

# [ "doc/guava.xml", 11140, 11148 ]
gap> C:=RandomLinearCode(15,5,GF(2));
a  [15,5,?] randomly generated code over GF(2)
gap> CoveringRadius(C);
5
gap> UpperBoundCoveringRadiusGriesmerLike(C);
9


# [ "doc/guava.xml", 11169, 11177 ]
gap> C:=CyclicCodes(15,GF(2))[3];
a cyclic [15,12,1..2]1..3 enumerated code over GF(2)
gap> CoveringRadius(C);
3
gap> UpperBoundCoveringRadiusCyclicCode(C);
3


# [ "doc/guava.xml", 11236, 11250 ]
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

# [ "doc/guava.xml", 11278, 11288 ]
gap> GrayMat(3);
[ [ 0*Z(2), 0*Z(2), 0*Z(2) ], [ 0*Z(2), 0*Z(2), Z(2)^0 ],
  [ 0*Z(2), Z(2)^0, Z(2)^0 ], [ 0*Z(2), Z(2)^0, 0*Z(2) ],
  [ Z(2)^0, Z(2)^0, 0*Z(2) ], [ Z(2)^0, Z(2)^0, Z(2)^0 ],
  [ Z(2)^0, 0*Z(2), Z(2)^0 ], [ Z(2)^0, 0*Z(2), 0*Z(2) ] ]
gap> G := GrayMat( 4, GF(4) );; Length(G);
256          # the length of a GrayMat is always q^n
gap> G[101] - G[100];
[ 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2) ] 

# [ "doc/guava.xml", 11309, 11318 ]
gap> PrintArray(SylvesterMat(2));
[ [   1,   1 ],
  [   1,  -1 ] ]
gap> PrintArray( SylvesterMat(4) );
[ [   1,   1,   1,   1 ],
  [   1,  -1,   1,  -1 ],
  [   1,   1,  -1,  -1 ],
  [   1,  -1,  -1,   1 ] ] 

# [ "doc/guava.xml", 11346, 11358 ]
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

# [ "doc/guava.xml", 11373, 11382 ]
gap> M:=VandermondeMat([Z(5),Z(5)^2,Z(5)^0,Z(5)^3],2);
[ [ Z(5)^0, Z(5), Z(5)^2 ], [ Z(5)^0, Z(5)^2, Z(5)^0 ],
  [ Z(5)^0, Z(5)^0, Z(5)^0 ], [ Z(5)^0, Z(5)^3, Z(5)^2 ] ]
gap> Display(M);
 1 2 4
 1 4 1
 1 1 1
 1 3 4

# [ "doc/guava.xml", 11420, 11453 ]
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


# [ "doc/guava.xml", 11470, 11479 ]
gap> IsInStandardForm(IdentityMat(7, GF(2)));
true
gap> IsInStandardForm([[1, 1, 0], [1, 0, 1]], false);
true
gap> IsInStandardForm([[1, 3, 2, 7]]);
true
gap> IsInStandardForm(HadamardMat(4));
false 

# [ "doc/guava.xml", 11491, 11498 ]
gap> M := [[1,2,3,4],[1,2,3,4]];; PrintArray(M);
[ [  1,  2,  3,  4 ],
  [  1,  2,  3,  4 ] ]
gap> PrintArray(PermutedCols(M, (1,2,3)));
[ [  3,  1,  2,  4 ],
  [  3,  1,  2,  4 ] ] 

# [ "doc/guava.xml", 11524, 11537 ]
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

# [ "doc/guava.xml", 11567, 11580 ]
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

# [ "doc/guava.xml", 11622, 11640 ]
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

# [ "doc/guava.xml", 11653, 11658 ]
gap> IsLatinSquare([[1,2],[2,1]]);
true
gap> IsLatinSquare([[1,2,3],[2,3,1],[1,3,2]]);
false 

# [ "doc/guava.xml", 11673, 11679 ]
gap> M := MOLS(4,2);
[ [ [ 0, 1, 2, 3 ], [ 1, 0, 3, 2 ], [ 2, 3, 0, 1 ], [ 3, 2, 1, 0 ] ],
  [ [ 0, 2, 3, 1 ], [ 1, 3, 2, 0 ], [ 2, 0, 1, 3 ], [ 3, 1, 0, 2 ] ] ]
gap> AreMOLS(M);
true 

# [ "doc/guava.xml", 11714, 11717 ]
gap> CoordinateNorm( HammingCode( 3, GF(2) ), 3 );
3 

# [ "doc/guava.xml", 11736, 11739 ]
gap> CodeNorm( HammingCode( 3, GF(2) ) );
3 

# [ "doc/guava.xml", 11758, 11761 ]
gap> IsCoordinateAcceptable( HammingCode( 3, GF(2) ), 3 );
true 

# [ "doc/guava.xml", 11776, 11783 ]
gap> c := RepetitionCode( 7, GF(2) );;
gap> ham := HammingCode( 3, GF(2) );;
gap> d := EvenWeightSubcode( ham );;
gap> e := ConstantWeightSubcode( ham, 3 );;
gap> GeneralizedCodeNorm( ham, c, d, e );
4 

# [ "doc/guava.xml", 11809, 11812 ]
gap> IsNormalCode( HammingCode( 3, GF(2) ) );
true 

# [ "doc/guava.xml", 11848, 11854 ]
gap> CodeWeightEnumerator( ElementsCode( [ [ 0,0,0 ], [ 0,0,1 ],
> [ 0,1,1 ], [ 1,1,1 ] ], GF(2) ) );
x^3 + x^2 + x + 1
gap> CodeWeightEnumerator( HammingCode( 3, GF(2) ) );
x^7 + 7*x^4 + 7*x^3 + 1 

# [ "doc/guava.xml", 11873, 11878 ]
gap> CodeDistanceEnumerator( HammingCode( 3, GF(2) ),[0,0,0,0,0,0,1] );
x^6 + 3*x^5 + 4*x^4 + 4*x^3 + 3*x^2 + x
gap> CodeDistanceEnumerator( HammingCode( 3, GF(2) ),[1,1,1,1,1,1,1] );
x^7 + 7*x^4 + 7*x^3 + 1 # `[1,1,1,1,1,1,1]' $\in$ `HammingCode( 3, GF(2 ) )'

# [ "doc/guava.xml", 11899, 11902 ]
gap> CodeMacWilliamsTransform( HammingCode( 3, GF(2) ) );
7*x^4 + 1 

# [ "doc/guava.xml", 11927, 11932 ]
gap> CodeDensity( HammingCode( 3, GF(2) ) );
1
gap> CodeDensity( ReedMullerCode( 1, 4 ) );
14893/2048 

# [ "doc/guava.xml", 11956, 11966 ]
gap> SphereContent( 15, 0, GF(2) );
1    # Only one word with distance 0, which is the word itself
gap> SphereContent( 11, 3, GF(4) );
4984
gap> C := HammingCode(5);
a linear [31,26,3]1 Hamming (5,2) code over GF(2)
#the minimum distance is 3, so the code can correct one error
gap> ( SphereContent( 31, 1, GF(2) ) * Size(C) ) = 2 ^ 31;
true 

# [ "doc/guava.xml", 11990, 11993 ]
gap> Krawtchouk( 2, 0, 3, 2);
3 

# [ "doc/guava.xml", 12007, 12014 ]
gap> PrimitiveUnityRoot( GF(2), 15 );
Z(2^4)
gap> last^15;
Z(2)^0
gap> PrimitiveUnityRoot( GF(8), 21 );
Z(2^6)^3 

# [ "doc/guava.xml", 12031, 12035 ]
gap> PrimitivePolynomialsNr(3,4);
12


# [ "doc/guava.xml", 12047, 12051 ]
gap> IrreduciblePolynomialsNr(3,4);
20


# [ "doc/guava.xml", 12069, 12081 ]
gap> a:=Random(GF(4));
0*Z(2)
gap> M:=MatrixRepresentationOfElement(a,GF(4));; Display(M);
 .
gap> a:=Random(GF(4));
Z(2^2)
gap> M:=MatrixRepresentationOfElement(a,GF(4));; Display(M);
 . 1
 1 1
gap>


# [ "doc/guava.xml", 12115, 12126 ]
gap> P := UnivariatePolynomial( GF(3), Z(3)^0 * [1,0,1,2] );
Z(3)^0+x_1^2-x_1^3
gap> RecP := ReciprocalPolynomial( P );
-Z(3)^0+x_1+x_1^3
gap> ReciprocalPolynomial( RecP ) = P;
true 
gap> P := UnivariatePolynomial( GF(3), Z(3)^0 * [1,0,1,2] );
Z(3)^0+x_1^2-x_1^3
gap> ReciprocalPolynomial( P, 6 );
-x_1^3+x_1^4+x_1^6

# [ "doc/guava.xml", 12154, 12160 ]
gap> CyclotomicCosets( 2, 15 );
[ [ 0 ], [ 1, 2, 4, 8 ], [ 3, 6, 12, 9 ], [ 5, 10 ],
  [ 7, 14, 13, 11 ] ]
gap> CyclotomicCosets( 7, 6 );
[ [ 0 ], [ 1 ], [ 2 ], [ 3 ], [ 4 ], [ 5 ] ] 

# [ "doc/guava.xml", 12174, 12191 ]
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

# [ "doc/guava.xml", 12211, 12217 ]
gap> L:=[1,2,3,4,3,2,1,5,4,3,2,1];;
gap> MultiplicityInList(L,1);
3
gap> MultiplicityInList(L,6);
0

# [ "doc/guava.xml", 12235, 12239 ]
gap> L:=[1,2,3,4,3,2,1,5,4,3,2,1];;
gap> MostCommonInList(L);
1

# [ "doc/guava.xml", 12258, 12262 ]
gap> L:=[1,2,3,4];;
gap> RotateList(L);
[2,3,4,1]

# [ "doc/guava.xml", 12278, 12282 ]
gap> k:=3; L:=[1,2,3,4];;
gap> M:=CirculantMatrix(k,L);;
gap> Display(M);

# [ "doc/guava.xml", 12333, 12343 ]
gap> F:=GF(11);;
gap> R2:=PolynomialRing(F,2);
PolynomialRing(..., [ x_1, x_2 ])
gap> vars:=IndeterminatesOfPolynomialRing(R2);;
gap> x:=vars[1];; y:=vars[2];;
gap> poly:=y^2-x*(x^2-1);;
gap> DegreeMultivariatePolynomial(poly,R2);
3


# [ "doc/guava.xml", 12367, 12379 ]
gap> F:=GF(11);;
gap> R2:=PolynomialRing(F,2);
PolynomialRing(..., [ x_1, x_2 ])
gap> vars:=IndeterminatesOfPolynomialRing(R2);;
gap> x:=vars[1];; y:=vars[2];;
gap> poly:=y^2-x*(x^2-1);;
gap> DegreesMultivariatePolynomial(poly,R2);
[ [ [ x_1, x_1, 1 ], [ x_1, x_2, 0 ] ], [ [ x_2^2, x_1, 0 ], [ x_2^2, x_2, 2 ] ],
  [ [ x_1^3, x_1, 3 ], [ x_1^3, x_2, 0 ] ] ]
gap>


# [ "doc/guava.xml", 12411, 12437 ]
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


# [ "doc/guava.xml", 12477, 12491 ]
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


# [ "doc/guava.xml", 12516, 12520 ]
gap> GuavaVersion();
"3.11"


# [ "doc/guava.xml", 12536, 12544 ]
gap> F:=GF(11);; l := One(F);;
gap> ZechLog(2*l,8*l,F);
-24
gap> 8*l+l;(2*l)^(-24);
Z(11)^6
Z(11)^6


# [ "doc/guava.xml", 12565, 12574 ]
gap> F:=GF(11);
GF(11)
gap> R1:=PolynomialRing(F,["a"]);;
gap> var1:=IndeterminatesOfPolynomialRing(R1);; a:=var1[1];;
gap> coeffs:=Z(11)^0*[1,2,3,4];
[ Z(11)^0, Z(11), Z(11)^8, Z(11)^2 ]
gap> CoefficientToPolynomial(coeffs,R1);
Z(11)^2*a^3+Z(11)^8*a^2+Z(11)*a+Z(11)^0

# [ "doc/guava.xml", 12595, 12616 ]
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

# [ "doc/guava.xml", 12651, 12663 ]
gap> R2:=PolynomialRing(GF(3),["x1","x2"]);
PolynomialRing(..., [ x1, x2 ])
gap> vars:=IndeterminatesOfPolynomialRing(R2);
[ x1, x2 ]
gap> x2:=vars[2];
x2
gap> x1:=vars[1];
x1
gap> f:=x1^3+x2^3;;
gap> DivisorsMultivariatePolynomial(f,R2);
[ x1+x2, x1+x2, x1+x2 ]
