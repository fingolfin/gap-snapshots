# guava, chapter 6

# [ "doc/guava.xml", 8498, 8509 ]
gap> C1 := HammingCode( 3, GF(2) );
a linear [7,4,3]1 Hamming (3,2) code over GF(2)
gap> C2 := ExtendedCode( C1 );
a linear [8,4,4]2 extended code
gap> IsEquivalent( C2, ReedMullerCode( 1, 3 ) );
true
gap> List( AsSSortedList( C2 ), WeightCodeword );
[ 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 8 ]
gap> C3 := EvenWeightSubcode( C1 );
a linear [7,3,4]2..3 even weight subcode 

# [ "doc/guava.xml", 8549, 8560 ]
gap> C1 := BCHCode( 15, 5, GF(2) );
a cyclic [15,7,5]3..5 BCH code, delta=5, b=1 over GF(2)
gap> C2 := PuncturedCode( C1 );
a linear [14,7,4]3..5 punctured code
gap> ExtendedCode( C2 ) = C1;
false
gap> PuncturedCode( C1, [1,2,3,4,5,6,7] );
a linear [8,7,1]1 punctured code
gap> PuncturedCode( WholeSpaceCode( 4, GF(5) ) );
a linear [3,3,1]0 punctured code  # The dimension decreased from 4 to 3 

# [ "doc/guava.xml", 8594, 8602 ]
gap> C1 := EvenWeightSubcode( BCHCode( 8, 4, GF(3) ) );
an (8,33,4..8)3..8 even weight subcode
gap> List( AsSSortedList( C1 ), WeightCodeword );
[ 0, 4, 4, 4, 4, 4, 4, 6, 4, 4, 4, 4, 6, 4, 4, 6, 4, 4, 8, 6, 4, 6, 8, 4, 4, 
  4, 6, 4, 6, 8, 4, 6, 8 ]
gap> EvenWeightSubcode( ReedMullerCode( 1, 3 ) );
a linear [8,4,4]2 Reed-Muller (1,3) code over GF(2) 

# [ "doc/guava.xml", 8631, 8644 ]
gap> C1 := PuncturedCode( ReedMullerCode( 1, 4 ) );
a linear [15,5,7]5 punctured code
gap> C2 := BCHCode( 15, 7, GF(2) );
a cyclic [15,5,7]5 BCH code, delta=7, b=1 over GF(2)
gap> C2 = C1;
false
gap> p := CodeIsomorphism( C1, C2 );
( 2, 4,14, 9,13, 7,11,10, 6, 8,12, 5)
gap> C3 := PermutedCode( C1, p );
a linear [15,5,7]5 permuted code
gap> C2 = C3;
true 

# [ "doc/guava.xml", 8669, 8677 ]
gap> C1 := HammingCode( 4 );; WeightDistribution( C1 );
[ 1, 0, 0, 35, 105, 168, 280, 435, 435, 280, 168, 105, 35, 0, 0, 1 ]
gap> L := Filtered( AsSSortedList(C1), i -> WeightCodeword(i) = 3 );;
gap> C2 := ExpurgatedCode( C1, L );
a linear [15,4,3..4]5..11 code, expurgated with 7 word(s)
gap> WeightDistribution( C2 );
[ 1, 0, 0, 0, 14, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0 ] 

# [ "doc/guava.xml", 8721, 8736 ]
gap> C31 := ReedMullerCode( 1, 3 );
a linear [8,4,4]2 Reed-Muller (1,3) code over GF(2)
gap> C32 := AugmentedCode(C31,["00000011","00000101","00010001"]);
a linear [8,7,1..2]1 code, augmented with 3 word(s)
gap> C32 = ReedMullerCode( 2, 3 );
true 
gap> C1 := CordaroWagnerCode(6);
a linear [6,2,4]2..3 Cordaro-Wagner code over GF(2)
gap> Codeword( [0,0,1,1,1,1] ) in C1;
true
gap> C2 := AugmentedCode( C1 );
a linear [6,3,1..2]2..3 code, augmented with 1 word(s)
gap> Codeword( [1,1,0,0,0,0] ) in C2;
true

# [ "doc/guava.xml", 8761, 8772 ]
gap> C1 := HammingCode( 4 );; WeightDistribution( C1 );
[ 1, 0, 0, 35, 105, 168, 280, 435, 435, 280, 168, 105, 35, 0, 0, 1 ]
gap> L := Filtered( AsSSortedList(C1), i -> WeightCodeword(i) = 3 );;
gap> C2 := RemovedElementsCode( C1, L );
a (15,2013,3..15)2..15 code with 35 word(s) removed
gap> WeightDistribution( C2 );
[ 1, 0, 0, 0, 105, 168, 280, 435, 435, 280, 168, 105, 35, 0, 0, 1 ]
gap> MinimumDistance( C2 );
3        # C2 is not linear, so the minimum weight does not have to
         # be equal to the minimum distance 

# [ "doc/guava.xml", 8801, 8812 ]
gap> C1 := NullCode( 6, GF(2) );
a cyclic [6,0,6]6 nullcode over GF(2)
gap> C2 := AddedElementsCode( C1, [ "111111" ] );
a (6,2,1..6)3 code with 1 word(s) added
gap> IsCyclicCode( C2 );
true
gap> C3 := AddedElementsCode( C2, [ "101010", "010101" ] );
a (6,4,1..6)2 code with 2 word(s) added
gap> IsCyclicCode( C3 );
true 

# [ "doc/guava.xml", 8858, 8877 ]
gap> C1 := HammingCode( 4 );
a linear [15,11,3]1 Hamming (4,2) code over GF(2)
gap> C2 := ShortenedCode( C1 );
a linear [14,10,3]2 shortened code
gap> C3 := ElementsCode( ["1000", "1101", "0011" ], GF(2) );
a (4,3,1..4)2 user defined unrestricted code over GF(2)
gap> MinimumDistance( C3 );
2
gap> C4 := ShortenedCode( C3 );
a (3,2,2..3)1..2 shortened code
gap> AsSSortedList( C4 );
[ [ 0 0 0 ], [ 1 0 1 ] ]
gap> C5 := HammingCode( 5, GF(2) );
a linear [31,26,3]1 Hamming (5,2) code over GF(2)
gap> C6 := ShortenedCode( C5, [ 1, 2, 3 ] );
a linear [28,23,3]2 shortened code
gap> OptimalityLinearCode( C6 );
0

# [ "doc/guava.xml", 8911, 8916 ]
gap> C1 := CordaroWagnerCode( 5 );
a linear [5,2,3]2 Cordaro-Wagner code over GF(2)
gap> C2 := LengthenedCode( C1 );
a linear [6,3,2]2..3 code, lengthened with 1 column(s) 

# [ "doc/guava.xml", 8938, 8954 ]
gap> C := BCHCode(31,11);
a cyclic [31,11,11]7..11 BCH code, delta=11, b=1 over GF(2)
gap> S1:= SubCode(C);
a linear [31,10,11]7..13 subcode
gap> WeightDistribution(S1);
[ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 120, 190, 0, 0, 272, 255, 0, 0, 120, 66,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
gap> S2:= SubCode(C, 8);
a linear [31,3,11]14..20 subcode
gap> History(S2);
[ "a linear [31,3,11]14..20 subcode of",
  "a cyclic [31,11,11]7..11 BCH code, delta=11, b=1 over GF(2)" ]
gap> WeightDistribution(S2);
[ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0 ]

# [ "doc/guava.xml", 8982, 8990 ]
gap> C1 := BCHCode( 15, 7 );
a cyclic [15,5,7]5 BCH code, delta=7, b=1 over GF(2)
gap> C2 := ResidueCode( C1 );
a linear [8,4,4]2 residue code
gap> c := Codeword( [ 0,0,0,1,0,0,1,1,0,1,0,1,1,1,1 ], C1);;
gap> C3 := ResidueCode( C1, c );
a linear [7,4,3]1 residue code 

# [ "doc/guava.xml", 9015, 9035 ]
gap> C1 := ReedMullerCode( 2, 5 );
a linear [32,16,8]6 Reed-Muller (2,5) code over GF(2)
gap> C2 := ConstructionBCode( C1 );
a linear [24,9,8]5..10 Construction B (8 coordinates)
gap> BoundsMinimumDistance( 24, 9, GF(2) );
rec( n := 24, k := 9, q := 2, references := rec(  ), 
  construction := [ [ Operation "UUVCode" ], 
      [ [ [ Operation "UUVCode" ], [ [ [ Operation "DualCode" ], 
                      [ [ [ Operation "RepetitionCode" ], [ 6, 2 ] ] ] ], 
                  [ [ Operation "CordaroWagnerCode" ], [ 6 ] ] ] ], 
          [ [ Operation "CordaroWagnerCode" ], [ 12 ] ] ] ], lowerBound := 8, 
  lowerBoundExplanation := [ "Lb(24,9)=8, u u+v construction of C1 and C2:", 
      "Lb(12,7)=4, u u+v construction of C1 and C2:", 
      "Lb(6,5)=2, dual of the repetition code", 
      "Lb(6,2)=4, Cordaro-Wagner code", "Lb(12,2)=8, Cordaro-Wagner code" ], 
  upperBound := 8, 
  upperBoundExplanation := [ "Ub(24,9)=8, otherwise construction B would 
                             contradict:", "Ub(18,4)=8, Griesmer bound" ] )
# so C2 is optimal

# [ "doc/guava.xml", 9065, 9076 ]
gap> R := ReedMullerCode( 1, 3 );
a linear [8,4,4]2 Reed-Muller (1,3) code over GF(2)
gap> RD := DualCode( R );
a linear [8,4,4]2 Reed-Muller (1,3) code over GF(2)
gap> R = RD;
true
gap> N := WholeSpaceCode( 7, GF(4) );
a cyclic [7,7,1]0 whole space code over GF(4)
gap> DualCode( N ) = NullCode( 7, GF(4) );
true 

# [ "doc/guava.xml", 9106, 9118 ]
gap> R := RepetitionCode( 4, GF(4) );
a cyclic [4,1,4]3 repetition code over GF(4)
gap> R2 := ConversionFieldCode( R );
a linear [8,2,4]3..4 code, converted to basefield GF(2)
gap> Size( R ) = Size( R2 );
true
gap> GeneratorMat( R );
[ [ Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0 ] ]
gap> GeneratorMat( R2 );
[ [ Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2) ],
  [ 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0 ] ] 

# [ "doc/guava.xml", 9145, 9153 ]
gap> C:=RandomLinearCode(10,4,GF(4)); MinimumDistance(C);
a  [10,4,?] randomly generated code over GF(4)
5
gap> trC:=TraceCode(C,GF(2)); MinimumDistance(trC);
a linear [10,7,1]1..3 user defined unrestricted code over GF(2)
1


# [ "doc/guava.xml", 9178, 9190 ]
gap> H := HammingCode(3, GF(2));
a linear [7,4,3]1 Hamming (3,2) code over GF(2)
gap> c := Codeword("1011011");; c in H;
false
gap> C := CosetCode(H, c);
a (7,16,3)1 coset code
gap> List(AsSSortedList(C), el-> Syndrome(H, el));
[ [ 1 1 1 ], [ 1 1 1 ], [ 1 1 1 ], [ 1 1 1 ], [ 1 1 1 ], [ 1 1 1 ],
  [ 1 1 1 ], [ 1 1 1 ], [ 1 1 1 ], [ 1 1 1 ], [ 1 1 1 ], [ 1 1 1 ],
  [ 1 1 1 ], [ 1 1 1 ], [ 1 1 1 ], [ 1 1 1 ] ]
# All elements of the coset have the same syndrome in H 

# [ "doc/guava.xml", 9223, 9236 ]
gap> N := NordstromRobinsonCode();; WeightDistribution(N);
[ 1, 0, 0, 0, 0, 0, 112, 0, 30, 0, 112, 0, 0, 0, 0, 0, 1 ]
gap> C := ConstantWeightSubcode(N, 8);
a (16,30,6..16)5..8 code with codewords of weight 8
gap> WeightDistribution(C);
[ 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0 ] 
gap> eg := ExtendedTernaryGolayCode();; WeightDistribution(eg);
[ 1, 0, 0, 0, 0, 0, 264, 0, 0, 440, 0, 0, 24 ]
gap> C := ConstantWeightSubcode(eg);
a (12,264,6..12)3..6 code with codewords of weight 6
gap> WeightDistribution(C);
[ 0, 0, 0, 0, 0, 0, 264, 0, 0, 0, 0, 0, 0 ] 

# [ "doc/guava.xml", 9278, 9286 ]
gap> G := GeneratorMatCode( Z(2) * [ [0,1,1,0], [0,1,0,1], [0,0,1,1] ], 
          "random form code", GF(2) );
a linear [4,2,1..2]1..2 random form code over GF(2)
gap> Codeword( GeneratorMat( G ) );
[ [ 0 1 0 1 ], [ 0 0 1 1 ] ]
gap> Codeword( GeneratorMat( StandardFormCode( G ) ) );
[ [ 1 0 0 1 ], [ 0 1 0 1 ] ] 

# [ "doc/guava.xml", 9317, 9328 ]
gap> PiecewiseConstantCode( [ 2, 3 ],
     [ [ 0, 0 ], [ 0, 3 ], [ 1, 0 ], [ 2, 2 ] ],GF(2) );
the C code programs are compiled, so using Leon's binary....
the C code programs are compiled, so using Leon's binary....
the C code programs are compiled, so using Leon's binary....
the C code programs are compiled, so using Leon's binary....
a (5,7,1..5)1..5 piecewise constant code over GF(2)
gap> AsSSortedList(last);
[ [ 0 0 0 0 0 ], [ 0 0 1 1 1 ], [ 0 1 0 0 0 ], [ 1 0 0 0 0 ], 
  [ 1 1 0 1 1 ], [ 1 1 1 0 1 ], [ 1 1 1 1 0 ] ]

# [ "doc/guava.xml", 9370, 9378 ]
gap> C1 := ElementsCode( [ [1,0], [4,5] ], GF(7) );;
gap> C2 := ElementsCode( [ [0,0,0], [3,3,3] ], GF(7) );;
gap> D := DirectSumCode(C1, C2);;
gap> AsSSortedList(D);
[ [ 1 0 0 0 0 ], [ 1 0 3 3 3 ], [ 4 5 0 0 0 ], [ 4 5 3 3 3 ] ]
gap> D = C1 + C2;   # addition = direct sum
true 

# [ "doc/guava.xml", 9410, 9419 ]
gap> C1 := EvenWeightSubcode(WholeSpaceCode(4, GF(2)));
a cyclic [4,3,2]1 even weight subcode
gap> C2 := RepetitionCode(4, GF(2));
a cyclic [4,1,4]2 repetition code over GF(2)
gap> R := UUVCode(C1, C2);
a linear [8,4,4]2 U U+V construction code
gap> R = ReedMullerCode(1,3);
true 

# [ "doc/guava.xml", 9447, 9454 ]
gap> L1 := LexiCode(10, 4, GF(2));
a linear [10,5,4]2..4 lexicode over GF(2)
gap> L2 := LexiCode(8, 3, GF(2));
a linear [8,4,3]2..3 lexicode over GF(2)
gap> D := DirectProductCode(L1, L2);
a linear [80,20,12]20..45 direct product code 

# [ "doc/guava.xml", 9475, 9487 ]
gap> C := CyclicCodes(7, GF(2));
[ a cyclic [7,7,1]0 enumerated code over GF(2),
  a cyclic [7,6,1..2]1 enumerated code over GF(2),
  a cyclic [7,3,1..4]2..3 enumerated code over GF(2),
  a cyclic [7,0,7]7 enumerated code over GF(2),
  a cyclic [7,3,1..4]2..3 enumerated code over GF(2),
  a cyclic [7,4,1..3]1 enumerated code over GF(2),
  a cyclic [7,1,7]3 enumerated code over GF(2),
  a cyclic [7,4,1..3]1 enumerated code over GF(2) ]
gap> IntersectionCode(C[6], C[8]) = C[7];
true 

# [ "doc/guava.xml", 9511, 9524 ]
gap> G := GeneratorMatCode([[1,0,1],[0,1,1]]*Z(2)^0, GF(2));
a linear [3,2,1..2]1 code defined by generator matrix over GF(2)
gap> H := GeneratorMatCode([[1,1,1]]*Z(2)^0, GF(2));
a linear [3,1,3]1 code defined by generator matrix over GF(2)
gap> U := UnionCode(G, H);
a linear [3,3,1]0 union code
gap> c := Codeword("010");; c in G;
false
gap> c in H;
false
gap> c in U;
true 

# [ "doc/guava.xml", 9566, 9573 ]
gap> c := HammingCode( 3, GF(2) );
a linear [7,4,3]1 Hamming (3,2) code over GF(2)
gap> d := WholeSpaceCode( 7, GF(2) );
a cyclic [7,7,1]0 whole space code over GF(2)
gap> e := ExtendedDirectSumCode( c, d, 3 );
a linear [21,15,1..3]2 3-fold extended direct sum code

# [ "doc/guava.xml", 9628, 9640 ]
gap> c := HammingCode( 3, GF(2) );
a linear [7,4,3]1 Hamming (3,2) code over GF(2)
gap> d := ReedMullerCode( 1, 4 );
a linear [16,5,8]6 Reed-Muller (1,4) code over GF(2)
gap> e := DirectSumCode( c, d );
a linear [23,9,3]7 direct sum code
gap> f := AmalgamatedDirectSumCode( c, d );;
gap> MinimumDistance( f );;
gap> CoveringRadius( f );; 
gap> f;
a linear [22,8,3]7 amalgamated direct sum code

# [ "doc/guava.xml", 9681, 9687 ]
gap> C1 := HammingCode( 3, GF(2) );;
gap> C2 := EvenWeightSubcode( WholeSpaceCode( 6, GF(2) ) );;
gap> BlockwiseDirectSumCode( C1, [[ 0,0,0,0,0,0,0 ],[ 1,0,1,0,1,0,0 ]],
> C2, [[ 0,0,0,0,0,0 ],[ 1,0,1,0,1,0 ]] );
a (13,1024,1..13)1..2 blockwise direct sum code

# [ "doc/guava.xml", 9713, 9745 ]
gap> C1 := BCHCode(127, 43);
a cyclic [127,29,43]31..59 BCH code, delta=43, b=1 over GF(2)
gap> C2 := BCHCode(127, 47);
a cyclic [127,22,47..51]36..63 BCH code, delta=47, b=1 over GF(2)
gap> C3 := BCHCode(127, 55);
a cyclic [127,15,55]41..62 BCH code, delta=55, b=1 over GF(2)
gap> G1 := ShallowCopy( GeneratorMat(C2) );;
gap> Append(G1, [ GeneratorMat(C1)[23] ]);;
gap> C1 := GeneratorMatCode(G1, GF(2));
a linear [127,23,1..43]35..63 code defined by generator matrix over GF(2)
gap> MinimumDistance(C1);
43
gap> C := [ C1, C2, C3 ];
[ a linear [127,23,43]35..63 code defined by generator matrix over GF(2), 
  a cyclic [127,22,47..51]36..63 BCH code, delta=47, b=1 over GF(2), 
  a cyclic [127,15,55]41..62 BCH code, delta=55, b=1 over GF(2) ]
gap> IsSubset(C[1], C[2]);
true
gap> IsSubset(C[2], C[3]);
true
gap> A := [ RepetitionCode(4, GF(2)), EvenWeightSubcode( QRCode(17, GF(2)) ) ];
[ a cyclic [4,1,4]2 repetition code over GF(2), a cyclic [17,8,6]3..6 even weight subcode ]
gap> CX := ConstructionXCode(C, A);
a linear [148,23,53]43..74 Construction X code
gap> History(CX);
[ "a linear [148,23,53]43..74 Construction X code of", 
  "Base codes: [ a cyclic [127,15,55]41..62 BCH code, delta=55, b=1 over GF(2)\
, a cyclic [127,22,47..51]36..63 BCH code, delta=47, b=1 over GF(2), a linear \
[127,23,43]35..63 code defined by generator matrix over GF(2) ]", 
  "Auxiliary codes: [ a cyclic [4,1,4]2 repetition code over GF(2), a cyclic [\
17,8,6]3..6 even weight subcode ]" ]

# [ "doc/guava.xml", 9796, 9828 ]
gap> a := PrimitiveRoot(GF(32));
Z(2^5)
gap> f0 := MinimalPolynomial( GF(2), a^0 );
x_1+Z(2)^0
gap> f1 := MinimalPolynomial( GF(2), a^1 );
x_1^5+x_1^2+Z(2)^0
gap> f5 := MinimalPolynomial( GF(2), a^5 );
x_1^5+x_1^4+x_1^2+x_1+Z(2)^0
gap> C2 := CheckPolCode( f0 * f1, 31, GF(2) );; MinimumDistance(C2);; Display(C2);
a cyclic [31,6,15]10..13 code defined by check polynomial over GF(2)
gap> C3 := CheckPolCode( f0 * f5, 31, GF(2) );; MinimumDistance(C3);; Display(C3);
a cyclic [31,6,15]10..13 code defined by check polynomial over GF(2)
gap> C1 := UnionCode(C2, C3);; MinimumDistance(C1);; Display(C1);
a linear [31,11,11]7..11 union code of
U: a cyclic [31,6,15]10..13 code defined by check polynomial over GF(2)
V: a cyclic [31,6,15]10..13 code defined by check polynomial over GF(2)
gap> A1 := BestKnownLinearCode( 10, 5, GF(2) );
a linear [10,5,4]2..4 shortened code
gap> A2 := DualCode( RepetitionCode(6, GF(2)) );
a cyclic [6,5,2]1 dual code
gap> CXX:= ConstructionXXCode(C1, C2, C3, A1, A2 );
a linear [47,11,15..17]13..23 Construction XX code
gap> MinimumDistance(CXX);
17
gap> History(CXX);        
[ "a linear [47,11,17]13..23 Construction XX code of", 
  "C1: a cyclic [31,11,11]7..11 union code", 
  "C2: a cyclic [31,6,15]10..13 code defined by check polynomial over GF(2)", 
  "C3: a cyclic [31,6,15]10..13 code defined by check polynomial over GF(2)", 
  "A1: a linear [10,5,4]2..4 shortened code", 
  "A2: a cyclic [6,5,2]1 dual code" ]

# [ "doc/guava.xml", 9874, 9913 ]
gap> #
gap> # Binary code
gap> #
gap> O := [ CyclicMDSCode(2,3,7), BestKnownLinearCode(9,5,GF(2)), CyclicMDSCode(2,3,4) ];
[ a cyclic [9,7,3]1 MDS code over GF(8), a linear [9,5,3]2..3 shortened code, 
  a cyclic [9,4,6]4..5 MDS code over GF(8) ]
gap> A := ExtendedCode( HammingCode(3,GF(2)) );;
gap> I := [ SubCode(A), A, DualCode( RepetitionCode(8, GF(2)) ) ];
[ a linear [8,3,4]3..4 subcode, a linear [8,4,4]2 extended code, a cyclic [8,7,2]1 dual code ]
gap> C := BZCodeNC(O, I);
a linear [72,38,12]0..72 Blokh Zyablov concatenated code
gap> #
gap> # Non binary code
gap> #
gap> O2 := ExtendedCode(GoppaCode(ConwayPolynomial(5,2), Elements(GF(5))));;
gap> O3 := ExtendedCode(GoppaCode(ConwayPolynomial(5,3), Elements(GF(5))));;
gap> O1 := DualCode( O3 );;
gap> MinimumDistance(O1);; MinimumDistance(O2);; MinimumDistance(O3);;
gap> Cy := CyclicCodes(5, GF(5));;
gap> for i in [4, 5] do; MinimumDistance(Cy[i]);; od;
gap> O  := [ O1, O2, O3 ];
[ a linear [6,4,3]1 dual code, a linear [6,3,4]2..3 extended code,
  a linear [6,2,5]3..4 extended code ]
gap> I  := [ Cy[5], Cy[4], Cy[3] ];
[ a cyclic [5,1,5]3..4 enumerated code over GF(5),
  a cyclic [5,2,4]2..3 enumerated code over GF(5),
  a cyclic [5,3,1..3]2 enumerated code over GF(5) ]
gap> C  := BZCodeNC( O, I );
a linear [30,9,5..15]0..30 Blokh Zyablov concatenated code
gap> MinimumDistance(C);
15
gap> History(C);
[ "a linear [30,9,15]0..30 Blokh Zyablov concatenated code of",
  "Inner codes: [ a cyclic [5,1,5]3..4 enumerated code over GF(5), a cyclic [5\
,2,4]2..3 enumerated code over GF(5), a cyclic [5,3,1..3]2 enumerated code ove\
r GF(5) ]",
  "Outer codes: [ a linear [6,4,3]1 dual code, a linear [6,3,4]2..3 extended c\
ode, a linear [6,2,5]3..4 extended code ]" ]
