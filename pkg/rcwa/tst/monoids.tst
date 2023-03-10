#############################################################################
##
#W  monoids.tst                GAP4 Package `RCWA'                Stefan Kohl
##
##  This file contains automated tests of RCWA's functionality for computing
##  with rcwa monoids.
##
gap> START_TEST( "monoids.tst" );
gap> RCWADoThingsToBeDoneBeforeTest();
gap> T := RcwaMapping([[1,0,2],[3,1,2]]);; SetName(T,"T"); IsTame(T);;
gap> M := Monoid(T);
<rcwa monoid over Z with 1 generator>
gap> Size(M);
infinity
gap> IsTame(M);
false
gap> Print(M,"\n");
Monoid( [ RcwaMapping( [ [ 1, 0, 2 ], [ 3, 1, 2 ] ] ) ] )
gap> Display(M);

Wild rcwa monoid over Z, generated by

[

Wild surjective rcwa mapping of Z with modulus 2

        /
        | n/2      if n in 0(2)
 n |-> <  (3n+1)/2 if n in 1(2)
        |
        \

]

gap> T in M;
true
gap> RCWAInfo(2);
gap> T^5 in M;
#I  \in for an rcwa mapping <f> and an rcwa monoid <M>
#I  Trying to find <f> in balls around 1 ...
#I  <f> lies in the ball with radius 5.
true
gap> T5 := RcwaMapping([[1,0,2],[5,-1,2]]);; SetName(T5,"T5");
gap> T5 in M;
#I  \in for an rcwa mapping <f> and an rcwa monoid <M>
#I  <f> and <M> have incompatible prime sets.
false
gap> a := RcwaMapping([[3,0,2],[3, 1,4],[3,0,2],[3,-1,4]]);; SetName(a,"a");
gap> a in M;
#I  \in for an rcwa mapping <f> and an rcwa monoid <M>
#I  <f> does not leave some finite orbit of <M> invariant.
false
gap> f_zero := RcwaMapping([[1,0,1],[0,1,1]]);;
gap> f_zero in M;
#I  \in for an rcwa mapping <f> and an rcwa monoid <M>
#I  Mult(<f>) = 0, but Mult(<M>) <> 0.
false
gap> f_two := RcwaMapping([[1,0,1],[2,1,1]]);;
gap> f_two in M;
#I  \in for an rcwa mapping <f> and an rcwa monoid <M>
#I  The multiplier of <f> has factors which
#I  no multiplier of a generator of <M> has.
false
gap> ClassShift(0,1) in M;
#I  \in for an rcwa mapping <f> and an rcwa monoid <M>
#I  Support(<f>) is not a subset of Support(<M>).
false
gap> ClassReflection(0,1) in M;
#I  \in for an rcwa mapping <f> and an rcwa monoid <M>
#I  <M> is class-wise order-preserving, but <f> is not.
false
gap> RCWAInfo(0);
gap> T5 := RcwaMapping([[1,0,2],[5,-1,2]]);;
gap> M2 := Monoid(T,T5);
<rcwa monoid over Z with 2 generators>
gap> M3 := SparseRep(M2);
<rcwa monoid over Z with 2 generators>
gap> GeneratorsOfMonoid(M3);
[ <wild surjective rcwa mapping of Z with modulus 2 and 2 affine parts>, 
  <rcwa mapping of Z with modulus 2 and 2 affine parts> ]
gap> M2 = M3;
true
gap> M4 := StandardRep(M3);         
<rcwa monoid over Z with 2 generators>
gap> GeneratorsOfMonoid(M4);
[ <wild surjective rcwa mapping of Z with modulus 2>, 
  <rcwa mapping of Z with modulus 2> ]
gap> M4 = M3;
true
gap> M4 = M2;
true
gap> Mirrored(M2) = Mirrored(M3);
true
gap> Mirrored(Mirrored(M2)) = M2;
true
gap> Mirrored(Mirrored(M3)) = M2;
true
gap> IsClassWiseTranslating(M2);
false
gap> IsClassWiseTranslating(M3);
false
gap> IsClassWiseTranslating(Monoid(RcwaMapping([[1,1,1],[1,0,1]])));
true
gap> Ball(M2,27,5:Spheres);
[ [ 27 ], [ 41, 67 ], [ 62, 101, 102, 167 ], [ 31, 51, 152, 251, 252, 417 ], 
  [ 47, 76, 77, 126, 127, 377, 626, 627, 1042 ], 
  [ 38, 63, 71, 116, 117, 191, 192, 313, 317, 521, 566, 941, 942, 1567 ] ]
gap> RCWAInfo(2);
gap> RcwaMapping([[3,0,1]]) in M2;
#I  \in for an rcwa mapping <f> and an rcwa monoid <M>
#I  <f> is not surjective, but all generators of <M> are.
false
gap> RCWAInfo(0);
gap> T5m := RcwaMapping([[1,0,2],[5,-1,2]]);; SetName(T5m,"T5-");
gap> T5p := RcwaMapping([[1,0,2],[5, 1,2]]);; SetName(T5p,"T5+");
gap> M5 := Monoid(T5m,T5p);
<rcwa monoid over Z with 2 generators>
gap> IsSubset(M,M5);
false
gap> IsSubset(M5,M);
false
gap> M := M5;
<rcwa monoid over Z with 2 generators>
gap> Modulus(M);
0
gap> RCWAInfo(2);
gap> IsSubset(M,Monoid(T5m*T5p,T5p^2*T5m));
#I  \in for an rcwa mapping <f> and an rcwa monoid <M>
#I  Trying to find <f> in balls around 1 ...
#I  <f> lies in the ball with radius 2.
#I  \in for an rcwa mapping <f> and an rcwa monoid <M>
#I  Trying to find <f> in balls around 1 ...
#I  <f> lies in the ball with radius 3.
true
gap> T in M;
#I  \in for an rcwa mapping <f> and an rcwa monoid <M>
#I  <f> and <M> have incompatible prime sets.
false
gap> RCWAInfo(0);
gap> List([1..5],r->Length(Ball(M,One(M),r)));
[ 3, 7, 15, 31, 63 ]
gap> List([1..5],r->Length(Ball(M,T5m*T5p,r)));
[ 3, 7, 15, 31, 63 ]
gap> Support(M);
Z \ [ 0 ]
gap> List([1..10],r->Length(Ball(M,1,r,OnPoints)));
[ 3, 5, 8, 11, 16, 24, 35, 50, 69, 92 ]
gap> List([2..12],r->Intersection(Ball(M,1,r,OnPoints),[1..20]));
[ [ 1, 2, 3, 7, 8 ], [ 1, 2, 3, 4, 7, 8, 17, 18 ], 
  [ 1, 2, 3, 4, 7, 8, 9, 17, 18 ], [ 1, 2, 3, 4, 7, 8, 9, 17, 18 ], 
  [ 1, 2, 3, 4, 7, 8, 9, 11, 17, 18 ], [ 1, 2, 3, 4, 7, 8, 9, 11, 17, 18 ], 
  [ 1, 2, 3, 4, 7, 8, 9, 11, 13, 14, 17, 18 ], 
  [ 1, 2, 3, 4, 7, 8, 9, 11, 13, 14, 17, 18 ], 
  [ 1, 2, 3, 4, 7, 8, 9, 11, 13, 14, 16, 17, 18 ], 
  [ 1, 2, 3, 4, 7, 8, 9, 11, 13, 14, 16, 17, 18 ], 
  [ 1, 2, 3, 4, 7, 8, 9, 11, 13, 14, 16, 17, 18 ] ]
gap> M;
<wild rcwa monoid over Z with 2 generators>
gap> TrivialSubmonoid(M) = TrivialRcwaGroupOverZ;
true
gap> M2 := Restriction(M,RcwaMapping([[2,0,1]]));
<wild rcwa monoid over Z with 2 generators>
gap> Support(M2);
0(2) \ [ 0 ]
gap> Induction(M2,RcwaMapping([[2,0,1]])) = M;
true
gap> IsNaturalRcwa(M);
false
gap> IsWholeFamily(M);
false
gap> PrimeSet(M);
[ 2, 5 ]
gap> IsIntegral(M);
false
gap> IsClassWiseOrderPreserving(M);
true
gap> ShortOrbits(M,[-20..20],20);
[ [ 0 ] ]
gap> F := Monoid(RcwaMapping([[ 0,1,1],[1,1,1]]),
>                RcwaMapping([[-1,3,1],[0,2,1]]));
<rcwa monoid over Z with 2 generators>
gap> IsTame(F);
true
gap> Size(F);
11
gap> l := AsList(F);;
gap> ForAll(l,IsTame);
true
gap> List(l,Image);
[ Integers, 1(2) U [ 2 ], 0(2) U [ 1 ], 0(2) U [ 1 ], [ 1, 2 ], 0(2) U [ 1 ], 
  1(2) U [ 2 ], [ 1, 2 ], 1(2) U [ 2 ], 1(2) U [ 2 ], 0(2) U [ 1 ] ]
gap> List([1..4],k->Length(Set(List(l,f->f^k))));
[ 11, 4, 7, 4 ]
gap> for f in l do Print(f,"\n"); od;
RcwaMapping( [ [ 1, 0, 1 ] ] )
RcwaMapping( [ [ -1, 3, 1 ], [ 0, 2, 1 ] ] )
RcwaMapping( [ [ -1, 4, 1 ], [ 0, 1, 1 ] ] )
RcwaMapping( [ [ 0, 1, 1 ], [ -1, 3, 1 ] ] )
RcwaMapping( [ [ 0, 1, 1 ], [ 0, 2, 1 ] ] )
RcwaMapping( [ [ 0, 1, 1 ], [ 1, 1, 1 ] ] )
RcwaMapping( [ [ 0, 2, 1 ], [ -1, 2, 1 ] ] )
RcwaMapping( [ [ 0, 2, 1 ], [ 0, 1, 1 ] ] )
RcwaMapping( [ [ 0, 2, 1 ], [ 1, 0, 1 ] ] )
RcwaMapping( [ [ 1, -1, 1 ], [ 0, 2, 1 ] ] )
RcwaMapping( [ [ 1, 0, 1 ], [ 0, 1, 1 ] ] )
gap> RcwaMapping([[0,2,1],[-1,2,1]]) in F;
true
gap> T in F;
false
gap> z := Zero(One(F));
ZeroMapping( Integers, Integers )
gap> Image(z);
[ 0 ]
gap> ImagesSource(z);
[ 0 ]
gap> Image(z,Integers);
[ 0 ]
gap> M := Monoid(2*IdentityRcwaMappingOfZ);
<rcwa monoid over Z with 1 generator>
gap> Size(M);
infinity
gap> Ball(M,One(M),7);
[ IdentityMapping( Integers ), Rcwa mapping of Z: n -> 2n, 
  Rcwa mapping of Z: n -> 4n, Rcwa mapping of Z: n -> 8n, 
  Rcwa mapping of Z: n -> 16n, Rcwa mapping of Z: n -> 32n, 
  Rcwa mapping of Z: n -> 64n, Rcwa mapping of Z: n -> 128n ]
gap> Action(Restriction(F,RcwaMapping([[2,0,1]])),ResidueClass(0,2));
<rcwa monoid over Z with 2 generators>
gap> Induction(last,RcwaMapping([[2,0,1]])) = F;
true
gap> orbs := ShortOrbits(F,[5..10],20);
[ [ -3, -2, 1, 2, 5, 6 ], [ -5, -4, 1, 2, 7, 8 ], [ -7, -6, 1, 2, 9, 10 ] ]
gap> T := Action(F,orbs[1]);
<transformation monoid of degree 6 with 2 generators>
gap> IsTransformationMonoid(T);
true
gap> Size(T);
11
gap> List(MultiplicationTable(T),l->Length(Set(l)));
[ 11, 6, 6, 6, 2, 6, 6, 2, 6, 6, 6 ]
gap> List(TransposedMat(MultiplicationTable(T)),l->Length(Set(l)));
[ 11, 6, 6, 6, 2, 6, 6, 2, 6, 6, 6 ]
gap> L := RcwaMapping( [ [ 4, 1, 1 ], [ 16, 12, 1 ] ] );
<rcwa mapping of Z with modulus 2>
gap> R := RcwaMapping( [ [ 4, 0, 3 ], [ 8,  4, 3 ], [ 16,  4, 3 ],
>                        [ 2, 0, 3 ], [ 4, -1, 3 ], [  2, -1, 3 ] ] );
<rcwa mapping of Z with modulus 6>
gap> Ball(Monoid(L,R),1,4,OnPoints:Spheres);
[ [ 1 ], [ 4, 28 ], [ 5, 17, 37, 113 ], [ 3, 11, 75, 92, 100, 284, 604, 1820 ]
    , [ 2, 7, 50, 60, 133, 188, 369, 401, 492, 805, 1137, 1212, 1516, 2417, 
      7281, 9708 ] ]
gap> RCWADoThingsToBeDoneAfterTest();
gap> STOP_TEST( "monoids.tst", 150000000 );

#############################################################################
##
#E  monoids.tst . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
