# guava, chapter 2

# [ "doc/guava.xml", 364, 366 ]
gap> LoadPackage("guava");

# [ "doc/guava.xml", 373, 388 ]
gap> c1:=Codeword("101010101");
[ 1 0 1 0 1 0 1 0 1 ]
gap> v:=Z(2)*[1,1,1,1,1,1,1,1,1];
[ Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0 ]
gap> c2:=Codeword(v);
[ 1 1 1 1 1 1 1 1 1 ]
gap> c3:=c1+c2;
[ 0 1 0 1 0 1 0 1 0 ]
gap> Weight(c1);
5
gap> Weight(c2);
9
gap> Weight(c3);
4

# [ "doc/guava.xml", 403, 406 ]
gap> DistanceCodeword(c1, c2);
4

# [ "doc/guava.xml", 420, 433 ]
gap> x:=Indeterminate(GF(2));
x_1
gap> c4:=Codeword(x^7+x^2+x+1);
x^7 + x^2 + x + 1
gap> VectorCodeword(c4);
<an immutable GF2 vector of length 8>
gap> Display(last);
[ Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ]
gap> c5:=Codeword([1,0,0,0,0,0,1]);
[ 1 0 0 0 0 0 1 ]
gap> PolyCodeword(c5);
x_1^6+Z(2)^0

# [ "doc/guava.xml", 446, 459 ]
gap> l:=["111000", "011100", "001110", "000111", "100011", "110001", "000000",$
[ "111000", "011100", "001110", "000111", "100011", "110001", "000000", 
  "111111" ]
gap> m:=Codeword(l,6,GF(2));    
[ [ 1 1 1 0 0 0 ], [ 0 1 1 1 0 0 ], [ 0 0 1 1 1 0 ], [ 0 0 0 1 1 1 ], 
  [ 1 0 0 0 1 1 ], [ 1 1 0 0 0 1 ], [ 0 0 0 0 0 0 ], [ 1 1 1 1 1 1 ] ]
gap> C1:=ElementsCode(m, GF(2));
a (6,8,1..6)2..3 user defined unrestricted code over GF(2)
gap> IsLinearCode(C1);
false
gap> WeightDistribution(C1);
[ 1, 0, 0, 6, 0, 0, 1 ]

# [ "doc/guava.xml", 474, 477 ]
gap> C:= RandomLinearCode(12,5,GF(2));
a  [12,5,?] randomly generated code over GF(2)

# [ "doc/guava.xml", 495, 498 ]
gap> MinimumWeight(C);
3

# [ "doc/guava.xml", 509, 512 ]
gap> WeightDistribution(C);
[ 1, 0, 0, 2, 3, 6, 7, 6, 4, 2, 1, 0, 0 ]
