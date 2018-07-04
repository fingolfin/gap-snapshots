# guava, chapter 8

# [ "doc/guava.xml", 12751, 12770 ]
gap> F:=GF(3);;
gap> x:= Indeterminate( F );; pol:= x^2+1;
x_1^2+Z(3)^0
gap> C := GeneratorPolCode(pol,8,F);
a cyclic [8,6,1..2]1..2 code defined by generator polynomial over GF(3)
gap> v:=Codeword("12101111");
[ 1 2 1 0 1 1 1 1 ]
gap> v:=VectorCodeword(v);
[ Z(3)^0, Z(3), Z(3)^0, 0*Z(3), Z(3)^0, Z(3)^0, Z(3)^0, Z(3)^0 ]
gap> G:=GeneratorMat(C);
[ [ Z(3)^0, 0*Z(3), Z(3)^0, 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3) ],
  [ 0*Z(3), Z(3)^0, 0*Z(3), Z(3)^0, 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3) ],
  [ 0*Z(3), 0*Z(3), Z(3)^0, 0*Z(3), Z(3)^0, 0*Z(3), 0*Z(3), 0*Z(3) ],
  [ 0*Z(3), 0*Z(3), 0*Z(3), Z(3)^0, 0*Z(3), Z(3)^0, 0*Z(3), 0*Z(3) ],
  [ 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), Z(3)^0, 0*Z(3), Z(3)^0, 0*Z(3) ],
  [ 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), Z(3)^0, 0*Z(3), Z(3)^0 ] ]
gap> AClosestVectorCombinationsMatFFEVecFFE(G,F,v,1,1);
[ 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), Z(3)^0, 0*Z(3), Z(3)^0 ]

# [ "doc/guava.xml", 12794, 12806 ]
gap> F:=GF(3);;
gap> x:= Indeterminate( F );; pol:= x^2+1;
x_1^2+Z(3)^0
gap> C := GeneratorPolCode(pol,8,F);
a cyclic [8,6,1..2]1..2 code defined by generator polynomial over GF(3)
gap> v:=Codeword("12101111"); v:=VectorCodeword(v);;
[ 1 2 1 0 1 1 1 1 ]
gap> G:=GeneratorMat(C);;
gap> AClosestVectorCombinationsMatFFEVecFFECoords(G,F,v,1,1);
[ [ 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), Z(3)^0, 0*Z(3), Z(3)^0 ],
  [ 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), Z(3)^0 ] ]

# [ "doc/guava.xml", 12830, 12840 ]
gap> v:=[ Z(3)^0, Z(3), Z(3)^0, 0*Z(3), Z(3)^0, Z(3)^0, Z(3)^0, Z(3)^0 ];;
gap> vecs:=[ [ Z(3)^0, 0*Z(3), Z(3)^0, 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3) ],
>   [ 0*Z(3), Z(3)^0, 0*Z(3), Z(3)^0, 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3) ],
>   [ 0*Z(3), 0*Z(3), Z(3)^0, 0*Z(3), Z(3)^0, 0*Z(3), 0*Z(3), 0*Z(3) ],
>   [ 0*Z(3), 0*Z(3), 0*Z(3), Z(3)^0, 0*Z(3), Z(3)^0, 0*Z(3), 0*Z(3) ],
>   [ 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), Z(3)^0, 0*Z(3), Z(3)^0, 0*Z(3) ],
>   [ 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), Z(3)^0, 0*Z(3), Z(3)^0 ] ];;
gap> DistancesDistributionMatFFEVecFFE(vecs,GF(3),v);
[ 0, 4, 6, 60, 109, 216, 192, 112, 30 ]

# [ "doc/guava.xml", 12869, 12879 ]
gap> v:=[ Z(3)^0, Z(3), Z(3)^0, 0*Z(3), Z(3)^0, Z(3)^0, Z(3)^0, Z(3)^0 ];;
gap> vecs:=[ [ Z(3)^0, 0*Z(3), Z(3)^0, 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3) ],
>   [ 0*Z(3), Z(3)^0, 0*Z(3), Z(3)^0, 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3) ],
>   [ 0*Z(3), 0*Z(3), Z(3)^0, 0*Z(3), Z(3)^0, 0*Z(3), 0*Z(3), 0*Z(3) ],
>   [ 0*Z(3), 0*Z(3), 0*Z(3), Z(3)^0, 0*Z(3), Z(3)^0, 0*Z(3), 0*Z(3) ],
>   [ 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), Z(3)^0, 0*Z(3), Z(3)^0, 0*Z(3) ],
>   [ 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), Z(3)^0, 0*Z(3), Z(3)^0 ] ];;
gap> DistancesDistributionVecFFEsVecFFE(vecs,v);
[ 0, 0, 0, 0, 0, 4, 0, 1, 1 ]

# [ "doc/guava.xml", 12901, 12905 ]
gap> v:=[ Z(3)^0, Z(3), Z(3)^0, 0*Z(3), Z(3)^0, Z(3)^0, Z(3)^0, Z(3)^0 ];;
gap> WeightVecFFE(v);
7

# [ "doc/guava.xml", 12935, 12940 ]
gap> v1:=[ Z(3)^0, Z(3), Z(3)^0, 0*Z(3), Z(3)^0, Z(3)^0, Z(3)^0, Z(3)^0 ];;
gap> v2:=[ Z(3), Z(3)^0, Z(3)^0, 0*Z(3), Z(3)^0, Z(3)^0, Z(3)^0, Z(3)^0 ];;
gap> DistanceVecFFE(v1,v2);
2
