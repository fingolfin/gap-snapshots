# guava, chapter 4

# [ "doc/guava.xml", 1327, 1330 ]
gap> C := ElementsCode(["1100", "1010", "0001"], "example code", GF(2) );
a (4,3,1..4)2..4 example code over GF(2) 

# [ "doc/guava.xml", 1361, 1368 ]
gap> C := ElementsCode(["1100", "1010", "0001"], "example code", GF(2) );
a (4,3,1..4)2..4 example code over GF(2) 
gap> MinimumDistance(C);
2
gap> C;
a (4,3,2)2..4 example code over GF(2) 

# [ "doc/guava.xml", 1391, 1394 ]
gap> G := GeneratorMatCode([[1,0,1],[0,1,2]], "demo code", GF(3) );
a linear [3,2,1..2]1 demo code over GF(3) 

# [ "doc/guava.xml", 1422, 1425 ]
gap> G := GeneratorPolCode(Indeterminate(GF(2))+Z(2)^0, 7, GF(2) );
a cyclic [7,6,1..2]1 code defined by generator polynomial over GF(2)

# [ "doc/guava.xml", 1437, 1447 ]
gap> L := Z(2)*[ [0,0,0], [1,0,0], [0,1,1], [1,1,1] ];;
gap> C := ElementsCode( L, GF(2) );
a (3,4,1..3)1 user defined unrestricted code over GF(2)

# so far, GUAVA does not know what kind of code this is
gap> IsLinearCode( C );
true
gap> C;
a linear [3,2,1]1 user defined unrestricted code over GF(2) 

# [ "doc/guava.xml", 1475, 1484 ]
gap> R := ReedMullerCode( 1, 3 );
a linear [8,4,4]2 Reed-Muller (1,3) code over GF(2)
gap> w := [ 1, 0, 1, 1 ] * R;
[ 1 0 0 1 1 0 0 1 ]
gap> Decode( R, w );
[ 1 0 1 1 ]
gap> Decode( R, w + "10000000" ); # One error at the first position
[ 1 0 1 1 ]                       # Corrected by Guava 

# [ "doc/guava.xml", 1578, 1592 ]
gap> M := [ [0, 0], [1, 0], [0, 1], [1, 1] ];;
gap> C1 := ElementsCode( M, GF(2) );
a (2,4,1..2)0 user defined unrestricted code over GF(2)
gap> M = C1;
false
gap> C2 := GeneratorMatCode( [ [1, 0], [0, 1] ], GF(2) );
a linear [2,2,1]0 code defined by generator matrix over GF(2)
gap> C1 = C2;
true
gap> ReedMullerCode( 1, 3 ) = HadamardCode( 8 );
true
gap> WholeSpaceCode( 5, GF(4) ) = WholeSpaceCode( 5, GF(2) );
false

# [ "doc/guava.xml", 1636, 1643 ]
gap> C1:=RandomLinearCode(10,5);
a  [10,5,?] randomly generated code over GF(2)
gap> C2:=RandomLinearCode(9,4);
a  [9,4,?] randomly generated code over GF(2)
gap> C1+C2;
a linear [10,9,1]0..10 unknown linear code over GF(2)

# [ "doc/guava.xml", 1660, 1667 ]
gap> C1 := GeneratorMatCode( [ [1, 0,0,0], [0, 1,0,0] ], GF(2) );
a linear [4,2,1]1..2 code defined by generator matrix over GF(2)
gap> C2 := GeneratorMatCode( [ [0,0,1, 1], [0,0,0, 1] ], GF(2) );
a linear [4,2,1]1..2 code defined by generator matrix over GF(2)
gap> C1*C2;
a linear [16,4,1]4..12 direct product code

# [ "doc/guava.xml", 1702, 1709 ]
gap> C := GeneratorMatCode( [ [1, 0,0,0], [0, 1,0,0] ], GF(2) );
a linear [4,2,1]1..2 code defined by generator matrix over GF(2)
gap> m:=Codeword("11");
[ 1 1 ]
gap> m*C;
[ 1 1 0 0 ]

# [ "doc/guava.xml", 1734, 1751 ]
gap> C:=HammingCode(3);
a linear [7,4,3]1 Hamming (3,2) code over GF(2)
gap> c:=Random(C);
[ 0 0 0 1 1 1 1 ]
gap> InformationWord(C,c);
[ 0 1 1 1 ]
gap> c:=Codeword("1111100");
[ 1 1 1 1 1 0 0 ]
gap> InformationWord(C,c);
Error, ERROR: codeword must belong to code
gap> C:=NordstromRobinsonCode();
a (16,256,6)4 Nordstrom-Robinson code over GF(2)
gap> c:=Random(C);
[ 0 0 0 1 0 0 0 1 0 0 1 0 1 1 0 1 ]
gap> InformationWord(C,c);
"ERROR: code must be linear"

# [ "doc/guava.xml", 1785, 1792 ]
gap> C:= HammingCode( 2 );; eC:= AsSSortedList( C );
[ [ 0 0 0 ], [ 1 1 1 ] ]
gap> eC[2] in C;
true
gap> [ 0 ] in C;
false 

# [ "doc/guava.xml", 1811, 1818 ]
gap> IsSubset( HammingCode(3), RepetitionCode( 7 ) );
true
gap> IsSubset( RepetitionCode( 7 ), HammingCode( 3 ) );
false
gap> IsSubset( WholeSpaceCode( 7 ), HammingCode( 3 ) );
true

# [ "doc/guava.xml", 1836, 1841 ]
gap> IsCode( 1 );
false
gap> IsCode( ReedMullerCode( 2,3 ) );
true

# [ "doc/guava.xml", 1863, 1872 ]
gap> C := ElementsCode( [ [0,0,0],[1,1,1] ], GF(2) );
a (3,2,1..3)1 user defined unrestricted code over GF(2)
gap> IsLinearCode( C );
true
gap> IsLinearCode( ElementsCode( [ [1,1,1] ], GF(2) ) );
false
gap> IsLinearCode( 1 );
false 

# [ "doc/guava.xml", 1895, 1905 ]
gap> C := ElementsCode( [ [0,0,0], [1,1,1] ], GF(2) );
a (3,2,1..3)1 user defined unrestricted code over GF(2)
gap> # GUAVA does not know the code is cyclic
gap> IsCyclicCode( C );      # this command tells GUAVA to find out
true
gap> IsCyclicCode( HammingCode( 4, GF(2) ) );
false
gap> IsCyclicCode( 1 );
false 

# [ "doc/guava.xml", 1938, 1949 ]
gap> H := HammingCode(2);
a linear [3,1,3]1 Hamming (2,2) code over GF(2)
gap> IsPerfectCode( H );
true
gap> IsPerfectCode( ElementsCode([[1,1,0],[0,0,1]],GF(2)) );
true
gap> IsPerfectCode( ReedSolomonCode( 6, 3 ) );
false
gap> IsPerfectCode( BinaryGolayCode() );
true 

# [ "doc/guava.xml", 1983, 1990 ]
gap> C1 := ReedSolomonCode( 6, 3 );
a cyclic [6,4,3]2 Reed-Solomon code over GF(7)
gap> IsMDSCode( C1 );  # verify it is an MDS code, as 6-3+1 = 4
true
gap> IsMDSCode( QRCode( 23, GF(2) ) );
false 

# [ "doc/guava.xml", 2018, 2025 ]
gap> IsSelfDualCode( ExtendedBinaryGolayCode() );
true
gap> C := ReedMullerCode( 1, 3 );
a linear [8,4,4]2 Reed-Muller (1,3) code over GF(2)
gap> DualCode( C ) = C;
true 

# [ "doc/guava.xml", 2045, 2052 ]
gap> R := ReedMullerCode(1,4);
a linear [16,5,8]6 Reed-Muller (1,4) code over GF(2)
gap> IsSelfOrthogonalCode(R);
true
gap> IsSelfDualCode(R);
false 

# [ "doc/guava.xml", 2076, 2089 ]
gap> C:=BinaryGolayCode();
a cyclic [23,12,7]3 binary Golay code over GF(2)
gap> WeightDistribution(C);
[ 1, 0, 0, 0, 0, 0, 0, 253, 506, 0, 0, 1288, 1288, 0, 0, 506, 253, 0, 0, 0, 0, 0, 0, 1 ]
gap> IsDoublyEvenCode(C);  
false
gap> C:=ExtendedCode(C);  
a linear [24,12,8]4 extended code
gap> WeightDistribution(C);
[ 1, 0, 0, 0, 0, 0, 0, 0, 759, 0, 0, 0, 2576, 0, 0, 0, 759, 0, 0, 0, 0, 0, 0, 0, 1 ]
gap> IsDoublyEvenCode(C);  
true

# [ "doc/guava.xml", 2115, 2126 ]
gap> x:=Indeterminate(GF(2));                     
x_1
gap> C:=QuasiCyclicCode( [x^0, 1+x^3+x^5+x^6+x^7], 11, GF(2) );
a linear [22,11,1..6]4..7 quasi-cyclic code over GF(2)
gap> IsSelfDualCode(C);  # self-dual is a restriction of self-orthogonal
true
gap> IsDoublyEvenCode(C);
false
gap> IsSinglyEvenCode(C);
true

# [ "doc/guava.xml", 2150, 2169 ]
gap> C:=BinaryGolayCode();
a cyclic [23,12,7]3 binary Golay code over GF(2)
gap> IsSelfOrthogonalCode(C);
false
gap> IsEvenCode(C);
false
gap> C:=ExtendedCode(C);
a linear [24,12,8]4 extended code
gap> IsSelfOrthogonalCode(C);
true
gap> IsEvenCode(C);
true
gap> C:=ExtendedCode(QRCode(17,GF(2)));
a linear [18,9,6]3..5 extended code
gap> IsSelfOrthogonalCode(C);
false
gap> IsEvenCode(C);
true

# [ "doc/guava.xml", 2199, 2205 ]
gap> IsSelfComplementaryCode( HammingCode( 3, GF(2) ) );
true
gap> IsSelfComplementaryCode( EvenWeightSubcode(
> HammingCode( 3, GF(2) ) ) );
false 

# [ "doc/guava.xml", 2221, 2229 ]
gap> IsAffineCode( HammingCode( 3, GF(2) ) );
true
gap> IsAffineCode( CosetCode( HammingCode( 3, GF(2) ),
> Codeword([ 1, 0, 0, 0, 0, 0, 0 ]) ) );
true
gap> IsAffineCode( NordstromRobinsonCode() );
false 

# [ "doc/guava.xml", 2245, 2255 ]
gap> code := ElementsCode( [ [0,0,0], [0,1,1], [0,2,2], [0,3,3],
>                             [1,0,1], [1,1,0], [1,2,3], [1,3,2],
>                             [2,0,2], [2,1,3], [2,2,0], [2,3,1],
>                             [3,0,3], [3,1,2], [3,2,1], [3,3,0] ],
>                             GF(4) );;
gap> IsAlmostAffineCode( code );
true
gap> IsAlmostAffineCode( NordstromRobinsonCode() );
false 

# [ "doc/guava.xml", 2304, 2317 ]
gap> x:= Indeterminate( GF(2) );; pol:= x^3+x+1; 
x_1^3+x_1+Z(2)^0
gap> H := GeneratorPolCode( pol, 7, GF(2));          
a cyclic [7,4,1..3]1 code defined by generator polynomial over GF(2)
gap> H = HammingCode(3, GF(2));
false

# verify that H is equivalent to a Hamming code
gap> IsEquivalent(H, HammingCode(3, GF(2)));
true
gap> CodeIsomorphism(H, HammingCode(3, GF(2)));
(3,4)(5,6,7) 

# [ "doc/guava.xml", 2343, 2352 ]
gap> x:= Indeterminate( GF(2) );; pol:= x^3+x+1; 
x_1^3+x_1+Z(2)^0
gap> H := GeneratorPolCode( pol, 7, GF(2));          
a cyclic [7,4,1..3]1 code defined by generator polynomial over GF(2)
gap> CodeIsomorphism(H, HammingCode(3, GF(2)));
(3,4)(5,6,7) 
gap> PermutedCode(H, (3,4)(5,6,7)) = HammingCode(3, GF(2));
true 

# [ "doc/guava.xml", 2385, 2405 ]
gap> R := RepetitionCode(7,GF(2));
a cyclic [7,1,7]3 repetition code over GF(2)

# verify that every permutation keeps R identical, that is, the
# automorphism group is Sym(7)
gap> AutomorphismGroup(R);
Sym( [ 1 .. 7 ] )
gap> C := CordaroWagnerCode(7);
a linear [7,2,4]3 Cordaro-Wagner code over GF(2)
gap> AsSSortedList(C);
[ [ 0 0 0 0 0 0 0 ], [ 0 0 1 1 1 1 1 ], [ 1 1 0 0 0 1 1 ], [ 1 1 1 1 1 0 0 ] ]
gap> AutomorphismGroup(C);
Group([ (3,4), (4,5), (1,6)(2,7), (1,2), (6,7) ])
gap> C2 :=  PermutedCode(C, (1,6)(2,7));
a linear [7,2,4]3 permuted code
gap> AsSSortedList(C2);
[ [ 0 0 0 0 0 0 0 ], [ 0 0 1 1 1 1 1 ], [ 1 1 0 0 0 1 1 ], [ 1 1 1 1 1 0 0 ] ]
gap> C2 = C;
true 

# [ "doc/guava.xml", 2441, 2447 ]
gap> R := RepetitionCode(3,GF(3));
a cyclic [3,1,3]2 repetition code over GF(3)
gap> G:=PermutationAutomorphismGroup(R);;
gap> G=SymmetricGroup(3);
true

# [ "doc/guava.xml", 2476, 2479 ]
gap> IsFinite( RepetitionCode( 1000, GF(11) ) );
true 

# [ "doc/guava.xml", 2493, 2498 ]
gap> Size( RepetitionCode( 1000, GF(11) ) );
11
gap> Size( NordstromRobinsonCode() );
256 

# [ "doc/guava.xml", 2515, 2522 ]
gap> C1 := ElementsCode([[0,0,0], [1,0,1], [0,1,0]], GF(4));
a (3,3,1..3)2..3 user defined unrestricted code over GF(4)
gap> LeftActingDomain( C1 );
GF(2^2)
gap> LeftActingDomain( HammingCode( 3, GF(9) ) );
GF(3^2) 

# [ "doc/guava.xml", 2536, 2545 ]
gap> Dimension( NullCode( 5, GF(5) ) );
0
gap> C := BCHCode( 15, 4, GF(4) );
a cyclic [15,9,5]3..4 BCH code, delta=5, b=1 over GF(4)
gap> Dimension( C );
9
gap> Size( C ) = Size( LeftActingDomain( C ) ) ^ Dimension( C );
true 

# [ "doc/guava.xml", 2574, 2583 ]
gap> C := ConferenceCode( 5 );
a (5,12,2)1..4 conference code over GF(2)
gap> AsSSortedList( C );
[ [ 0 0 0 0 0 ], [ 0 0 1 1 1 ], [ 0 1 0 1 1 ], [ 0 1 1 0 1 ], [ 0 1 1 1 0 ], 
  [ 1 0 0 1 1 ], [ 1 0 1 0 1 ], [ 1 0 1 1 0 ], [ 1 1 0 0 1 ], [ 1 1 0 1 0 ], 
  [ 1 1 1 0 0 ], [ 1 1 1 1 1 ] ]
gap> CodewordNr( C, [ 1, 2 ] );
[ [ 0 0 0 0 0 ], [ 0 0 1 1 1 ] ]

# [ "doc/guava.xml", 2641, 2646 ]
gap> C1 := ExtendedCode( HammingCode( 3, GF(2) ) );
a linear [8,4,4]2 extended code
gap> Print( "This is ", NordstromRobinsonCode(), ". \n");
This is a (16,256,6)4 Nordstrom-Robinson code over GF(2). 

# [ "doc/guava.xml", 2657, 2666 ]
gap> x:= Indeterminate( GF(3) );; pol:= x^2+1;
x_1^2+Z(3)^0
gap> Factors(pol);
[ x_1^2+Z(3)^0 ]
gap> H := GeneratorPolCode( pol, 8, GF(3));
a cyclic [8,6,1..2]1..2 code defined by generator polynomial over GF(3)
gap> String(H);
"a cyclic [8,6,1..2]1..2 code defined by generator polynomial over GF(3)"

# [ "doc/guava.xml", 2686, 2698 ]
gap> Display( RepetitionCode( 6, GF(3) ) );
a cyclic [6,1,6]4 repetition code over GF(3)
gap> C1 := ExtendedCode( HammingCode(2) );;
gap> C2 := PuncturedCode( ReedMullerCode( 2, 3 ) );;
gap> Display( LengthenedCode( UUVCode( C1, C2 ) ) );
a linear [12,8,2]2..4 code, lengthened with 1 column(s) of
a linear [11,8,1]1..2 U U+V construction code of
U: a linear [4,1,4]2 extended code of
   a linear [3,1,3]1 Hamming (2,2) code over GF(2)
V: a linear [7,7,1]0 punctured code of
   a cyclic [8,7,2]1 Reed-Muller (2,3) code over GF(2)

# [ "doc/guava.xml", 2715, 2733 ]
gap> bounds := BoundsMinimumDistance( 20, 17, GF(4) );
gap> DisplayBoundsInfo(bounds);
an optimal linear [20,17,d] code over GF(4) has d=3
--------------------------------------------------------------------------------------------------
Lb(20,17)=3, by shortening of:
Lb(21,18)=3, by applying contruction B to a [81,77,3] code
Lb(81,77)=3, by shortening of:
Lb(85,81)=3, reference: Ham
--------------------------------------------------------------------------------------------------
Ub(20,17)=3, by considering shortening to:
Ub(7,4)=3, by considering puncturing to:
Ub(6,4)=2, by construction B applied to:
Ub(2,1)=2, repetition code
--------------------------------------------------------------------------------------------------
Reference Ham:
%T this reference is unknown, for more info
%T contact A.E. Brouwer (aeb@cwi.nl)

# [ "doc/guava.xml", 2764, 2779 ]
gap> GeneratorMat( HammingCode( 3, GF(2) ) );
[ [ an immutable GF2 vector of length 7], 
  [ an immutable GF2 vector of length 7], 
  [ an immutable GF2 vector of length 7], 
  [ an immutable GF2 vector of length 7] ]
gap> Display(last);
 1 1 1 . . . .
 1 . . 1 1 . .
 . 1 . 1 . 1 .
 1 1 . 1 . . 1
gap> GeneratorMat( RepetitionCode( 5, GF(25) ) );
[ [ Z(5)^0, Z(5)^0, Z(5)^0, Z(5)^0, Z(5)^0 ] ]
gap> GeneratorMat( NullCode( 14, GF(4) ) );
[  ]

# [ "doc/guava.xml", 2803, 2819 ]
gap> CheckMat( HammingCode(3, GF(2) ) );
[ [ 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0 ], 
  [ 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0 ],
  [ Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0 ] ]
gap> Display(last);
 . . . 1 1 1 1
 . 1 1 . . 1 1
 1 . 1 . 1 . 1
gap> CheckMat( RepetitionCode( 5, GF(25) ) );
[ [ Z(5)^0, Z(5)^2, 0*Z(5), 0*Z(5), 0*Z(5) ],
  [ 0*Z(5), Z(5)^0, Z(5)^2, 0*Z(5), 0*Z(5) ],
  [ 0*Z(5), 0*Z(5), Z(5)^0, Z(5)^2, 0*Z(5) ],
  [ 0*Z(5), 0*Z(5), 0*Z(5), Z(5)^0, Z(5)^2 ] ]
gap> CheckMat( WholeSpaceCode( 12, GF(4) ) );
[  ] 

# [ "doc/guava.xml", 2843, 2850 ]
gap> GeneratorPol(GeneratorMatCode([[1, 1, 0], [0, 1, 1]], GF(2)));
x_1+Z(2)^0
gap> GeneratorPol( WholeSpaceCode( 4, GF(2) ) );
Z(2)^0
gap> GeneratorPol( NullCode( 7, GF(3) ) );
x_1^7-Z(3)^0

# [ "doc/guava.xml", 2876, 2883 ]
gap> CheckPol(GeneratorMatCode([[1, 1, 0], [0, 1, 1]], GF(2)));
x_1^2+x_1+Z(2)^0
gap> CheckPol(WholeSpaceCode(4, GF(2)));
x_1^4+Z(2)^0
gap> CheckPol(NullCode(7,GF(3)));
Z(3)^0

# [ "doc/guava.xml", 2906, 2915 ]
gap> C1 := ReedSolomonCode( 16, 5 );
a cyclic [16,12,5]3..4 Reed-Solomon code over GF(17)
gap> RootsOfCode( C1 );
[ Z(17), Z(17)^2, Z(17)^3, Z(17)^4 ]
gap> C2 := RootsCode( 16, last );
a cyclic [16,12,5]3..4 code defined by roots over GF(17)
gap> C1 = C2;
true 

# [ "doc/guava.xml", 2945, 2952 ]
gap> WordLength( NordstromRobinsonCode() );
16
gap> WordLength( PuncturedCode( WholeSpaceCode(7) ) );
6
gap> WordLength( UUVCode( WholeSpaceCode(7), RepetitionCode(7) ) );
14 

# [ "doc/guava.xml", 2975, 2982 ]
gap> C := TernaryGolayCode();
a cyclic [11,6,5]2 ternary Golay code over GF(3)
gap> Redundancy(C);
5
gap> Redundancy( DualCode(C) );
6 

# [ "doc/guava.xml", 3045, 3064 ]
gap> C := MOLSCode(7);; MinimumDistance(C);
3
gap> WeightDistribution(C);
[ 1, 0, 0, 24, 24 ]
gap> MinimumDistance( WholeSpaceCode( 5, GF(3) ) );
1
gap> MinimumDistance( NullCode( 4, GF(2) ) );
4
gap> C := ConferenceCode(9);; MinimumDistance(C);
4
gap> InnerDistribution(C);
[ 1, 0, 0, 0, 63/5, 9/5, 18/5, 0, 9/10, 1/10 ] 
gap> C := MOLSCode(7);; w := CodewordNr( C, 17 );
[ 3 3 6 2 ]
gap> MinimumDistance( C, w );
0
gap> C := RemovedElementsCode( C, w );; MinimumDistance( C, w );
3                           # so w no longer belongs to C 

# [ "doc/guava.xml", 3136, 3145 ]
gap> C:=RandomLinearCode(50,22,GF(2));
a  [50,22,?] randomly generated code over GF(2)
gap> MinimumDistanceLeon(C); time;
6
211
gap> MinimumDistance(C); time;
6
1204

# [ "doc/guava.xml", 3190, 3289 ]
gap> # Extended ternary quadratic residue code of length 48
gap> n := 47;;
gap> x := Indeterminate(GF(3));;
gap> F := Factors(x^n-1);;
gap> v := List([1..n], i->Zero(GF(3)));;
gap> v := v + MutableCopyMat(VectorCodeword( Codeword(F[2]) ));;
gap> G := CirculantMatrix(24, v);;
gap> for i in [1..Size(G)] do; s:=Zero(GF(3));
> for j in [1..Size(G[i])] do; s:=s+G[i][j]; od; Append(G[i], [ s ]);
> od;;
gap> C := GeneratorMatCodeNC(G, GF(3));
a  [48,24,?] randomly generated code over GF(3)
gap> MinimumWeight(C);
[48,24] linear code over GF(3) - minimum weight evaluation
Known lower-bound: 1
There are 2 generator matrices, ranks : 24 24 
The weight of the minimum weight codeword satisfies 0 mod 3 congruence
Enumerating codewords with information weight 1 (w=1)
    Found new minimum weight 15
Number of matrices required for codeword enumeration 2
Completed w= 1, 48 codewords enumerated, lower-bound 6, upper-bound 15
Termination expected with information weight 6 at matrix 1
-----------------------------------------------------------------------------
Enumerating codewords with information weight 2 (w=2) using 2 matrices
Completed w= 2, 1104 codewords enumerated, lower-bound 6, upper-bound 15
Termination expected with information weight 6 at matrix 1
-----------------------------------------------------------------------------
Enumerating codewords with information weight 3 (w=3) using 2 matrices
Completed w= 3, 16192 codewords enumerated, lower-bound 9, upper-bound 15
Termination expected with information weight 6 at matrix 1
-----------------------------------------------------------------------------
Enumerating codewords with information weight 4 (w=4) using 2 matrices
Completed w= 4, 170016 codewords enumerated, lower-bound 12, upper-bound 15
Termination expected with information weight 6 at matrix 1
-----------------------------------------------------------------------------
Enumerating codewords with information weight 5 (w=5) using 2 matrices
Completed w= 5, 1360128 codewords enumerated, lower-bound 12, upper-bound 15
Termination expected with information weight 6 at matrix 1
-----------------------------------------------------------------------------
Enumerating codewords with information weight 6 (w=6) using 1 matrices
Completed w= 6, 4307072 codewords enumerated, lower-bound 15, upper-bound 15
-----------------------------------------------------------------------------
Minimum weight: 15
15
gap> 

gap> # Binary cyclic code [151,45,36]
gap> n := 151;;
gap> x := Indeterminate(GF(2));;
gap> F := Factors(x^n-1);;
gap> C := CheckPolCode(F[2]*F[3]*F[3]*F[4], n, GF(2));
a cyclic [151,45,1..50]31..75 code defined by check polynomial over GF(2)
gap> MinimumWeight(C);
[151,45] cyclic code over GF(2) - minimum weight evaluation
Known lower-bound: 1
The weight of the minimum weight codeword satisfies 0 mod 4 congruence
Enumerating codewords with information weight 1 (w=1)
    Found new minimum weight 56
    Found new minimum weight 44
Number of matrices required for codeword enumeration 1
Completed w= 1, 45 codewords enumerated, lower-bound 8, upper-bound 44
Termination expected with information weight 11
-----------------------------------------------------------------------------
Enumerating codewords with information weight 2 (w=2) using 1 matrix
Completed w= 2, 990 codewords enumerated, lower-bound 12, upper-bound 44
Termination expected with information weight 11
-----------------------------------------------------------------------------
Enumerating codewords with information weight 3 (w=3) using 1 matrix
   Found new minimum weight 40
   Found new minimum weight 36
Completed w= 3, 14190 codewords enumerated, lower-bound 16, upper-bound 36
Termination expected with information weight 9
-----------------------------------------------------------------------------
Enumerating codewords with information weight 4 (w=4) using 1 matrix
Completed w= 4, 148995 codewords enumerated, lower-bound 20, upper-bound 36
Termination expected with information weight 9
-----------------------------------------------------------------------------
Enumerating codewords with information weight 5 (w=5) using 1 matrix
Completed w= 5, 1221759 codewords enumerated, lower-bound 24, upper-bound 36
Termination expected with information weight 9
-----------------------------------------------------------------------------
Enumerating codewords with information weight 6 (w=6) using 1 matrix
Completed w= 6, 8145060 codewords enumerated, lower-bound 24, upper-bound 36
Termination expected with information weight 9
-----------------------------------------------------------------------------
Enumerating codewords with information weight 7 (w=7) using 1 matrix
Completed w= 7, 45379620 codewords enumerated, lower-bound 28, upper-bound 36
Termination expected with information weight 9
-----------------------------------------------------------------------------
Enumerating codewords with information weight 8 (w=8) using 1 matrix
Completed w= 8, 215553195 codewords enumerated, lower-bound 32, upper-bound 36
Termination expected with information weight 9
-----------------------------------------------------------------------------
Enumerating codewords with information weight 9 (w=9) using 1 matrix
Completed w= 9, 886163135 codewords enumerated, lower-bound 36, upper-bound 36
-----------------------------------------------------------------------------
Minimum weight: 36
36

# [ "doc/guava.xml", 3341, 3355 ]
gap> C:=RandomLinearCode(5,2,GF(2));
a  [5,2,?] randomly generated code over GF(2)
gap> DecreaseMinimumDistanceUpperBound(C,1,4);
rec( mindist := 3, word := [ 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0 ] )
gap> MinimumDistance(C);
3
gap> C:=RandomLinearCode(8,4,GF(2));
a  [8,4,?] randomly generated code over GF(2)
gap> DecreaseMinimumDistanceUpperBound(C,3,4);
rec( mindist := 2,
  word := [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ] )
gap> MinimumDistance(C);
2

# [ "doc/guava.xml", 3405, 3455 ]
gap> C:=RandomLinearCode(60,20,GF(2));
a  [60,20,?] randomly generated code over GF(2)
gap> #mindist(C);time;
gap> #mindistleon(C,10,30);time; #doesn't work well
gap> a:=MinimumDistanceRandom(C,10,30);time; # done 10 times -with fastest time!!

 This is a probabilistic algorithm which may return the wrong answer.
[ 12, [ 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 1 1 0 0 1 0 0 0 1 0 0 0 0 0 0 1 0 0 
        1 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 ] ]
130
gap> a[2] in C;
true
gap> b:=DecreaseMinimumDistanceUpperBound(C,10,1); time; #only done once!
rec( mindist := 12, word := [ 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 
      Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 
      0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 
      Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 
      0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 
      0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 
      0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2) ] )
649
gap> Codeword(b!.word) in C;
true
gap> MinimumDistance(C);time;
12
196
gap> c:=MinimumDistanceLeon(C);time;
12
66
gap> C:=RandomLinearCode(30,10,GF(3));
a  [30,10,?] randomly generated code over GF(3)
gap> a:=MinimumDistanceRandom(C,10,10);time;

 This is a probabilistic algorithm which may return the wrong answer.
[ 13, [ 0 0 0 1 0 0 0 0 0 0 1 0 2 2 1 1 0 2 2 0 1 0 2 1 0 0 0 1 0 2 ] ]
229
gap> a[2] in C;
true
gap> MinimumDistance(C);time;
9
45
gap> c:=MinimumDistanceLeon(C);
Code must be binary. Quitting.
0
gap> a:=MinimumDistanceRandom(C,1,29);time;

 This is a probabilistic algorithm which may return the wrong answer.
[ 10, [ 0 0 1 0 2 0 2 0 1 0 0 0 0 0 0 1 0 1 0 0 1 0 0 0 0 0 2 2 2 0 ] ]
53

# [ "doc/guava.xml", 3557, 3580 ]
gap> H := RandomLinearCode(10, 5, GF(2));
a  [10,5,?] randomly generated code over GF(2)
gap> CoveringRadius(H);
3
gap> H := HammingCode(4, GF(2));; IsPerfectCode(H);
true
gap> CoveringRadius(H);
1                       # Hamming codes have minimum distance 3
gap> CoveringRadius(ReedSolomonCode(7,4));
3 
gap> CoveringRadius( BCHCode( 17, 3, GF(2) ) );
3
gap> CoveringRadius( HammingCode( 5, GF(2) ) );
1
gap> C := ReedMullerCode( 1, 9 );;
gap> CoveringRadius( C );
CoveringRadius: warning, the covering radius of
this code cannot be computed straightforward.
Try to use IncreaseCoveringRadiusLowerBound( code ).
(see the manual for more details).
The covering radius of code lies in the interval:
[ 240 .. 248 ]

# [ "doc/guava.xml", 3618, 3625 ]
gap> C := BCHCode( 17, 3, GF(2) );;
gap> BoundsCoveringRadius( C );
[ 3 .. 4 ]
gap> SetCoveringRadius( C, [ 2 .. 3 ] );
gap> BoundsCoveringRadius( C );
[ [ 2 .. 3 ] ]

# [ "doc/guava.xml", 3657, 3664 ]
gap> C:=HammingCode(3,GF(2));
a linear [7,4,3]1 Hamming (3,2) code over GF(2)
gap> MinimumWeightWords(C);
[ [ 1 0 0 0 0 1 1 ], [ 0 1 0 1 0 1 0 ], [ 0 1 0 0 1 0 1 ], [ 1 0 0 1 1 0 0 ], [ 0 0 1 0 1 1 0 ],
  [ 0 0 1 1 0 0 1 ], [ 1 1 1 0 0 0 0 ] ]


# [ "doc/guava.xml", 3694, 3701 ]
gap> WeightDistribution( ConferenceCode(9) );
[ 1, 0, 0, 0, 0, 18, 0, 0, 0, 1 ]
gap> WeightDistribution( RepetitionCode( 7, GF(4) ) );
[ 1, 0, 0, 0, 0, 0, 0, 3 ]
gap> WeightDistribution( WholeSpaceCode( 5, GF(2) ) );
[ 1, 5, 10, 10, 5, 1 ] 

# [ "doc/guava.xml", 3731, 3736 ]
gap> InnerDistribution( ConferenceCode(9) );
[ 1, 0, 0, 0, 63/5, 9/5, 18/5, 0, 9/10, 1/10 ]
gap> InnerDistribution( RepetitionCode( 7, GF(4) ) );
[ 1, 0, 0, 0, 0, 0, 0, 3 ] 

# [ "doc/guava.xml", 3764, 3773 ]
gap> H := HadamardCode(20);
a (20,40,10)6..8 Hadamard code of order 20 over GF(2)
gap> c := Codeword("10110101101010010101", H);
[ 1 0 1 1 0 1 0 1 1 0 1 0 1 0 0 1 0 1 0 1 ]
gap> DistancesDistribution(H, c);
[ 0, 0, 0, 0, 0, 1, 0, 7, 0, 12, 0, 12, 0, 7, 0, 1, 0, 0, 0, 0, 0 ]
gap> MinimumDistance(H, c);
5                           # distance to H 

# [ "doc/guava.xml", 3803, 3815 ]
gap> C := RepetitionCode( 3, GF(2) );
a cyclic [3,1,3]1 repetition code over GF(2)
gap> OD := OuterDistribution(C);
[ [ [ 0 0 0 ], [ 1, 0, 0, 1 ] ], [ [ 1 1 1 ], [ 1, 0, 0, 1 ] ],
  [ [ 0 0 1 ], [ 0, 1, 1, 0 ] ], [ [ 1 1 0 ], [ 0, 1, 1, 0 ] ],
  [ [ 1 0 0 ], [ 0, 1, 1, 0 ] ], [ [ 0 1 1 ], [ 0, 1, 1, 0 ] ],
  [ [ 0 1 0 ], [ 0, 1, 1, 0 ] ], [ [ 1 0 1 ], [ 0, 1, 1, 0 ] ] ]
gap> WeightDistribution(C) = OD[1][2];
true
gap> DistancesDistribution( C, Codeword("110") ) = OD[4][2];
true 

# [ "doc/guava.xml", 3885, 3900 ]
gap> C := HammingCode(3);
a linear [7,4,3]1 Hamming (3,2) code over GF(2)
gap> c := "1010"*C;                    # encoding
[ 1 0 1 1 0 1 0 ]
gap> Decode(C, c);                     # decoding
[ 1 0 1 0 ]
gap> Decode(C, Codeword("0010101"));
[ 1 1 0 1 ]                            # one error corrected
gap> C!.SpecialDecoder := function(C, c)
> return NullWord(Dimension(C));
> end;
function ( C, c ) ... end
gap> Decode(C, c);
[ 0 0 0 0 ]           # new decoder always returns null word 

# [ "doc/guava.xml", 3939, 3970 ]
gap> C := HammingCode(3);
a linear [7,4,3]1 Hamming (3,2) code over GF(2)
gap> c := "1010"*C;                    # encoding
[ 1 0 1 1 0 1 0 ]
gap> Decodeword(C, c);                     # decoding
[ 1 0 1 1 0 1 0 ]
gap> R:=PolynomialRing(GF(11),["t"]);
GF(11)[t]
gap> P:=List([1,3,4,5,7],i->Z(11)^i);
[ Z(11), Z(11)^3, Z(11)^4, Z(11)^5, Z(11)^7 ]
gap> C:=GeneralizedReedSolomonCode(P,3,R);
a linear [5,3,1..3]2  generalized Reed-Solomon code over GF(11)
gap> MinimumDistance(C);
3
gap> c:=Random(C);
[ 0 9 6 2 1 ]
gap> v:=Codeword("09620");
[ 0 9 6 2 0 ]
gap> GeneralizedReedSolomonDecoderGao(C,v);
[ 0 9 6 2 1 ]
gap> Decodeword(C,v); # calls the special interpolation decoder
[ 0 9 6 2 1 ]
gap> G:=GeneratorMat(C);
[ [ Z(11)^0, 0*Z(11), 0*Z(11), Z(11)^8, Z(11)^9 ],
  [ 0*Z(11), Z(11)^0, 0*Z(11), Z(11)^0, Z(11)^8 ],
  [ 0*Z(11), 0*Z(11), Z(11)^0, Z(11)^3, Z(11)^8 ] ]
gap> C1:=GeneratorMatCode(G,GF(11));
a linear [5,3,1..3]2 code defined by generator matrix over GF(11)
gap> Decodeword(C,v); # calls syndrome decoding
[ 0 9 6 2 1 ]

# [ "doc/guava.xml", 4021, 4036 ]
gap> R:=PolynomialRing(GF(11),["t"]);
GF(11)[t]
gap> P:=List([1,3,4,5,7],i->Z(11)^i);
[ Z(11), Z(11)^3, Z(11)^4, Z(11)^5, Z(11)^7 ]
gap> C:=GeneralizedReedSolomonCode(P,3,R);
a linear [5,3,1..3]2  generalized Reed-Solomon code over GF(11)
gap> MinimumDistance(C);
3
gap> c:=Random(C);
[ 0 9 6 2 1 ]
gap> v:=Codeword("09620");
[ 0 9 6 2 0 ]
gap> GeneralizedReedSolomonDecoderGao(C,v); 
[ 0 9 6 2 1 ]

# [ "doc/guava.xml", 4090, 4125 ]
gap> F:=GF(16);
GF(2^4)
gap> a:=PrimitiveRoot(F);; b:=a^7;; b^4+b^3+1; 
0*Z(2)
gap> Pts:=List([0..14],i->b^i);
[ Z(2)^0, Z(2^4)^7, Z(2^4)^14, Z(2^4)^6, Z(2^4)^13, Z(2^2), Z(2^4)^12, Z(2^4)^4,
  Z(2^4)^11, Z(2^4)^3, Z(2^2)^2, Z(2^4)^2, Z(2^4)^9, Z(2^4), Z(2^4)^8 ]
gap> x:=X(F);;
gap> R1:=PolynomialRing(F,[x]);;
gap> vars:=IndeterminatesOfPolynomialRing(R1);;
gap> y:=X(F,vars);;
gap> R2:=PolynomialRing(F,[x,y]);;
gap> C:=GeneralizedReedSolomonCode(Pts,3,R1); 
a linear [15,3,1..13]10..12  generalized Reed-Solomon code over GF(16)
gap> MinimumDistance(C); ## 6 error correcting
13
gap> z:=Zero(F);;
gap> r:=[z,z,z,z,z,z,z,z,b^6,b^2,b^5,b^14,b,b^7,b^11];; 
gap> r:=Codeword(r);
[ 0 0 0 0 0 0 0 0 a^12 a^14 a^5 a^8 a^7 a^4 a^2 ]
gap> cs:=GeneralizedReedSolomonListDecoder(C,r,2); time;
[ [ 0 a^9 a^3 a^13 a^6 a^10 a^11 a a^12 a^14 a^5 a^8 a^7 a^4 a^2 ],
  [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ] ]
250
gap> c1:=cs[1]; c1 in C;
[ 0 a^9 a^3 a^13 a^6 a^10 a^11 a a^12 a^14 a^5 a^8 a^7 a^4 a^2 ]
true
gap> c2:=cs[2]; c2 in C;
[ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ]
true
gap> WeightCodeword(c1-r);
7
gap> WeightCodeword(c2-r);
7

# [ "doc/guava.xml", 4162, 4178 ]
gap> C:=HammingCode(4,GF(2));
a linear [15,11,3]1 Hamming (4,2) code over GF(2)
gap> c:=Random(C);
[ 0 0 0 1 0 0 1 0 0 1 1 0 1 0 1 ]
gap> v:=List(c);
[ 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2),
  Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0 ]
gap> v[1]:=Z(2)+v[1]; # flip 1st bit of c to create an error
Z(2)^0
gap> v:=Codeword(v);
[ 1 0 0 1 0 0 1 0 0 1 1 0 1 0 1 ]
gap> BitFlipDecoder(C,v);
[ 0 0 0 1 0 0 1 0 0 1 1 0 1 0 1 ]



# [ "doc/guava.xml", 4205, 4232 ]
gap> F:=GF(16);
GF(2^4)
gap> a:=PrimitiveRoot(F);; b:=a^7; b^4+b^3+1;
Z(2^4)^7
0*Z(2)
gap> Pts:=List([0..14],i->b^i);
[ Z(2)^0, Z(2^4)^7, Z(2^4)^14, Z(2^4)^6, Z(2^4)^13, Z(2^2), Z(2^4)^12,
  Z(2^4)^4, Z(2^4)^11, Z(2^4)^3, Z(2^2)^2, Z(2^4)^2, Z(2^4)^9, Z(2^4),
  Z(2^4)^8 ]
gap> x:=X(F);;
gap> R1:=PolynomialRing(F,[x]);;
gap> vars:=IndeterminatesOfPolynomialRing(R1);;
gap> y:=X(F,vars);;
gap> R2:=PolynomialRing(F,[x,y]);;
gap> C:=GeneralizedReedSolomonCode(Pts,3,R1);
a linear [15,3,1..13]10..12  generalized Reed-Solomon code over GF(16)
gap> MinimumDistance(C); # 6 error correcting
13
gap> z:=Zero(F);
0*Z(2)
gap> r:=[z,z,z,z,z,z,z,z,b^6,b^2,b^5,b^14,b,b^7,b^11];; # 7 errors
gap> r:=Codeword(r);
[ 0 0 0 0 0 0 0 0 a^12 a^14 a^5 a^8 a^7 a^4 a^2 ]
gap> cs:=NearestNeighborGRSDecodewords(C,r,7);
[ [ [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ], 0*Z(2) ],
  [ [ 0 a^9 a^3 a^13 a^6 a^10 a^11 a a^12 a^14 a^5 a^8 a^7 a^4 a^2 ], x_1+Z(2)^0 ] ]

# [ "doc/guava.xml", 4264, 4292 ]
gap> F:=GF(16);
GF(2^4)
gap> a:=PrimitiveRoot(F);; b:=a^7; b^4+b^3+1;
Z(2^4)^7
0*Z(2)
gap> Pts:=List([0..14],i->b^i);
[ Z(2)^0, Z(2^4)^7, Z(2^4)^14, Z(2^4)^6, Z(2^4)^13, Z(2^2), Z(2^4)^12,
  Z(2^4)^4, Z(2^4)^11, Z(2^4)^3, Z(2^2)^2, Z(2^4)^2, Z(2^4)^9, Z(2^4),
  Z(2^4)^8 ]
gap> x:=X(F);;
gap> R1:=PolynomialRing(F,[x]);;
gap> vars:=IndeterminatesOfPolynomialRing(R1);;
gap> y:=X(F,vars);;
gap> R2:=PolynomialRing(F,[x,y]);;
gap> C:=GeneralizedReedSolomonCode(Pts,3,R1);
a linear [15,3,1..13]10..12  generalized Reed-Solomon code over GF(16)
gap> MinimumDistance(C);
13
gap> z:=Zero(F);
0*Z(2)
gap> r:=[z,z,z,z,z,z,z,z,b^6,b^2,b^5,b^14,b,b^7,b^11];;
gap> r:=Codeword(r);
[ 0 0 0 0 0 0 0 0 a^12 a^14 a^5 a^8 a^7 a^4 a^2 ]
gap> cs:=NearestNeighborDecodewords(C,r,7);
[ [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ], 
  [ 0 a^9 a^3 a^13 a^6 a^10 a^11 a a^12 a^14 a^5 a^8 a^7 a^4 a^2 ] ]


# [ "doc/guava.xml", 4327, 4339 ]
gap> C := HammingCode(4);
a linear [15,11,3]1 Hamming (4,2) code over GF(2)
gap> v := CodewordNr( C, 7 );
[ 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 ]
gap> Syndrome( C, v );
[ 0 0 0 0 ]
gap> Syndrome( C, Codeword( "000000001100111" ) );
[ 1 1 1 1 ]
gap> Syndrome( C, Codeword( "000000000000001" ) );
[ 1 1 1 1 ]    # the same syndrome: both codewords are in the same
               # coset of C 

# [ "doc/guava.xml", 4369, 4386 ]
gap> H := HammingCode(2);
a linear [3,1,3]1 Hamming (2,2) code over GF(2)
gap> SyndromeTable(H);
[ [ [ 0 0 0 ], [ 0 0 ] ], [ [ 1 0 0 ], [ 0 1 ] ],
  [ [ 0 1 0 ], [ 1 0 ] ], [ [ 0 0 1 ], [ 1 1 ] ] ]
gap> c := Codeword("101");
[ 1 0 1 ]
gap> c in H;
false          # c is not an element of H
gap> Syndrome(H,c);
[ 1 0 ]        # according to the syndrome table,
               # the error vector [ 0 1 0 ] belongs to this syndrome
gap> c - Codeword("010") in H;
true           # so the corrected codeword is
               # [ 1 0 1 ] - [ 0 1 0 ] = [ 1 1 1 ],
               # this is an element of H 

# [ "doc/guava.xml", 4419, 4423 ]
gap> StandardArray(RepetitionCode(3)); 
[ [ [ 0 0 0 ], [ 1 1 1 ] ], [ [ 0 0 1 ], [ 1 1 0 ] ], 
  [ [ 0 1 0 ], [ 1 0 1 ] ], [ [ 1 0 0 ], [ 0 1 1 ] ] ]

# [ "doc/guava.xml", 4448, 4476 ]
gap> C0:=HammingCode(3,GF(2));
a linear [7,4,3]1 Hamming (3,2) code over GF(2)
gap> G0:=GeneratorMat(C0);;
gap> G := List(G0, ShallowCopy);;
gap> PutStandardForm(G);
()
gap> Display(G);
 1 . . . . 1 1
 . 1 . . 1 . 1
 . . 1 . 1 1 .
 . . . 1 1 1 1
gap> H0:=CheckMat(C0);;
gap> Display(H0);
 . . . 1 1 1 1
 . 1 1 . . 1 1
 1 . 1 . 1 . 1
gap> c0:=Random(C0);
[ 0 0 0 1 1 1 1 ]
gap> v01:=c0[1]+Z(2)^2;;
gap> v1:=List(c0, ShallowCopy);;
gap> v1[1]:=v01;;
gap> v1:=Codeword(v1);
[ 1 0 0 1 1 1 1 ]
gap> c1:=PermutationDecode(C0,v1);
[ 0 0 0 1 1 1 1 ]
gap> c1=c0;
true
