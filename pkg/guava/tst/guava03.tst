# guava, chapter 3

# [ "doc/guava.xml", 534, 553 ]
gap> C:=RandomLinearCode(20,10,GF(4));
a  [20,10,?] randomly generated code over GF(4)
gap> c:=Random(C);
[ 1 a 0 0 0 1 1 a^2 0 0 a 1 1 1 a 1 1 a a 0 ]
gap> NamesOfComponents(C);
[ "Representative", "ZeroImmutable", "name", "LeftActingDomain", "Dimension", 
  "GeneratorsOfLeftOperatorAdditiveGroup", "Basis", "NiceFreeLeftModule", 
  "GeneratorMat", "WordLength" ]
gap> NamesOfComponents(c);
[ "VectorCodeword", "WordLength", "treatAsPoly" ]
gap> c!.VectorCodeword;
< immutable compressed vector length 20 over GF(4) >
gap> Display(last);
[ Z(2^2), Z(2^2), Z(2^2), Z(2)^0, Z(2^2), Z(2^2)^2, 0*Z(2), Z(2^2), Z(2^2),
  Z(2)^0, Z(2^2)^2, 0*Z(2), 0*Z(2), Z(2^2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2^2)^2,
  Z(2)^0, 0*Z(2) ]
gap> C!.Dimension;
10

# [ "doc/guava.xml", 687, 702 ]
gap> c := Codeword([0,1,1,1,0]);
[ 0 1 1 1 0 ]
gap> VectorCodeword( c ); 
[ 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2) ]
gap> c2 := Codeword([0,1,1,1,0], GF(3));
[ 0 1 1 1 0 ]
gap> VectorCodeword( c2 );
[ 0*Z(3), Z(3)^0, Z(3)^0, Z(3)^0, 0*Z(3) ]
gap> Codeword([c, c2, "0110"]);
[ [ 0 1 1 1 0 ], [ 0 1 1 1 0 ], [ 0 1 1 0 ] ]
gap> p := UnivariatePolynomial(GF(2), [Z(2)^0, 0*Z(2), Z(2)^0]);
x_1^2+Z(2)^0
gap> Codeword(p);
x^2 + 1 

# [ "doc/guava.xml", 726, 739 ]
gap> C := WholeSpaceCode(7,GF(5));
a cyclic [7,7,1]0 whole space code over GF(5)
gap> Codeword(["0220110", [1,1,1]], C);
[ [ 0 2 2 0 1 1 0 ], [ 1 1 1 0 0 0 0 ] ]
gap> Codeword(["0220110", [1,1,1]], 7, GF(5));
[ [ 0 2 2 0 1 1 0 ], [ 1 1 1 0 0 0 0 ] ] 
gap> C:=RandomLinearCode(10,5,GF(3));
a  [10,5,?] randomly generated code over GF(3)
gap> Codeword("1000000000",C);
[ 1 0 0 0 0 0 0 0 0 0 ]
gap> Codeword("1000000000",10,GF(3));
[ 1 0 0 0 0 0 0 0 0 0 ]

# [ "doc/guava.xml", 777, 788 ]
gap> B := BinaryGolayCode();
a cyclic [23,12,7]3 binary Golay code over GF(2)
gap> c := CodewordNr(B, 4);
x^22 + x^20 + x^17 + x^14 + x^13 + x^12 + x^11 + x^10
gap> R := ReedSolomonCode(2,2);
a cyclic [2,1,2]1 Reed-Solomon code over GF(3)
gap> AsSSortedList(R);
[ [ 0 0 ], [ 1 1 ], [ 2 2 ] ]
gap> CodewordNr(R, [1,3]);
[ [ 0 0 ], [ 2 2 ] ]

# [ "doc/guava.xml", 808, 817 ]
gap> IsCodeword(1);
false
gap> IsCodeword(ReedMullerCode(2,3));
false
gap> IsCodeword("11111");
false
gap> IsCodeword(Codeword("11111"));
true 

# [ "doc/guava.xml", 863, 884 ]
gap> P := UnivariatePolynomial(GF(2), Z(2)*[1,0,0,1]);
x_1^3+Z(2)^0
gap> c := Codeword(P, GF(2));
x^3 + 1
gap> P = c;        # codeword operation
true
gap> c2 := Codeword("1001", GF(2));
[ 1 0 0 1 ]
gap> c = c2;
true 
gap> C:=HammingCode(3);
a linear [7,4,3]1 Hamming (3,2) code over GF(2)
gap> c1:=Random(C);
[ 1 0 0 1 1 0 0 ]
gap> c2:=Random(C);
[ 0 1 0 0 1 0 1 ]
gap> EQ(c1,c2);
false
gap> not EQ(c1,c2);
true

# [ "doc/guava.xml", 919, 928 ]
gap> C:=RandomLinearCode(10,5,GF(3));
a  [10,5,?] randomly generated code over GF(3)
gap> c:=Random(C);
[ 1 0 2 2 2 2 1 0 2 0 ]
gap> Codeword(c+"2000000000");
[ 0 0 2 2 2 2 1 0 2 0 ]
gap> Codeword(c+"1000000000");
Error, <x> and <y> have different characteristic

# [ "doc/guava.xml", 971, 998 ]
gap> C:=RandomLinearCode(10,5);
a  [10,5,?] randomly generated code over GF(3)
gap> c:=Random(C);
[ 0 0 0 0 0 0 0 0 0 0 ]
gap> c+C;
< add. coset of a  [10,5,?] randomly generated code over GF(2) >
gap> c+C=C;
true
gap> IsLinearCode(c+C);
false
gap> v:=Codeword("100000000");
[ 1 0 0 0 0 0 0 0 0 ]
gap> v+C;
< add. coset of a  [10,5,?] randomly generated code over GF(2) >
gap> C=v+C;
false
gap> C := GeneratorMatCode( [ [1, 0,0,0], [0, 1,0,0] ], GF(2) );
a linear [4,2,1]1..2 code defined by generator matrix over GF(2)
gap> Elements(C);
[ [ 0 0 0 0 ], [ 0 1 0 0 ], [ 1 0 0 0 ], [ 1 1 0 0 ] ]
gap> v:=Codeword("0011");
[ 0 0 1 1 ]
gap> C+v;
< add. coset of a linear [4,2,4]1 code defined by generator matrix over GF(2) >
gap> Elements(C+v);
[ [ 0 0 1 1 ], [ 0 1 1 1 ], [ 1 0 1 1 ], [ 1 1 1 1 ] ]

# [ "doc/guava.xml", 1047, 1051 ]
gap> a := Codeword("011011");; 
gap> VectorCodeword(a);
[ 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0 ]

# [ "doc/guava.xml", 1067, 1071 ]
gap> a := Codeword("011011");; 
gap> PolyCodeword(a);
x_1^5+x_1^4+x_1^2+x_1

# [ "doc/guava.xml", 1104, 1112 ]
gap> B := BinaryGolayCode();
a cyclic [23,12,7]3 binary Golay code over GF(2)
gap> c := CodewordNr(B, 4);
x^22 + x^20 + x^17 + x^14 + x^13 + x^12 + x^11 + x^10
gap> TreatAsVector(c);
gap> c;
[ 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 1 0 0 1 0 1 ] 

# [ "doc/guava.xml", 1143, 1152 ]
gap> a := Codeword("00001",GF(2));
[ 0 0 0 0 1 ]
gap> TreatAsPoly(a); a;
x^4
gap> b := NullWord(6,GF(4));
[ 0 0 0 0 0 0 ]
gap> TreatAsPoly(b); b;
0 

# [ "doc/guava.xml", 1185, 1194 ]
gap> NullWord(8);
[ 0 0 0 0 0 0 0 0 ]
gap> Codeword("0000") = NullWord(4);
true
gap> NullWord(5,GF(16));
[ 0 0 0 0 0 ]
gap> NullWord(ExtendedTernaryGolayCode());
[ 0 0 0 0 0 0 0 0 0 0 0 0 ] 

# [ "doc/guava.xml", 1215, 1223 ]
gap> a := Codeword([0, 1, 2, 0, 1, 2]);; b := NullWord(6, GF(3));;
gap> DistanceCodeword(a, b);
4
gap> DistanceCodeword(b, a);
4
gap> DistanceCodeword(a, a);
0 

# [ "doc/guava.xml", 1240, 1245 ]
gap> a := Codeword("012320023002");; Support(a);
[ 2, 3, 4, 5, 8, 9, 12 ]
gap> Support(NullWord(7));
[  ] 

# [ "doc/guava.xml", 1255, 1261 ]
gap> L := Codeword(["000000", "101010", "222000"], GF(3));;
gap> S := Union(List(L, i -> Support(i)));
[ 1, 2, 3, 5 ]
gap> Length(S);
4 

# [ "doc/guava.xml", 1279, 1288 ]
gap> WeightCodeword(Codeword("22222"));
5
gap> WeightCodeword(NullWord(3));
0
gap> C := HammingCode(3);
a linear [7,4,3]1 Hamming (3,2) code over GF(2)
gap> Minimum(List(AsSSortedList(C){[2..Size(C)]}, WeightCodeword ) );
3 
