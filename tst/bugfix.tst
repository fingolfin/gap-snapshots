#############################################################################
##
#W  bugfix.tst
##
#H  $Id: bugfix.tst,v 1.42.2.2 2004/11/29 12:15:50 sal Exp $
##
gap> START_TEST("bugfixes test");

##  Bug 18 for fix 4
##
gap> Irr(CharacterTable("WeylD",4))[1];
Character( CharacterTable( "W(D4)" ), [ 3, -1, 3, -1, 1, -1, 3, -1, -1, 0, 0, 
  -1, 1 ] )

##  Check to see if the strongly connected component (Error 3) fix has been 
##     installed  
##
gap> M := Monoid([Transformation( [ 2, 3, 4, 5, 5 ] ),
> Transformation( [ 3, 1, 4, 5, 5 ] ),
> Transformation( [ 2, 1, 4, 3, 5 ] ) ]);;
gap> Size(GreensLClasses(M)[2])=2;
true

##  Check the fix in OrbitStabilizerAlgorithm (Error 4) for infinite groups. 
##
gap> N:=GroupByGenerators(
>   [ [ [ 0, -1, 0, 0 ], [ 1, 0, 0, 0 ], [ 0, 0, 0, -1 ], [ 0, 0, 1, 0 ] ], 
>     [ [ 0, 0, 1, 0 ], [ 0, 0, 0, 1 ], [ -1, 0, 0, 0 ], [ 0, -1, 0, 0 ] ], 
>     [ [ 0, 0, 1, 0 ], [ 0, 0, 0, 1 ], [ -1, 0, 1, 0 ], [ 0, -1, 0, 1 ] ], 
>     [ [ 0, 0, 1, 0 ], [ 0, 0, 0, 1 ], [ -1, 0, 0, -1 ], [ 0, -1, 1, 0 ] ], 
>     [ [ 1, 0, 0, 0 ], [ 0, 1, 0, 0 ], [ 0, 0, 0, -1 ], [ 0, 0, 1, 0 ] ], 
>     [ [ 0, 1, 0, 0 ], [ 1, 0, 0, 0 ], [ 0, 0, 0, 1 ], [ 0, 0, 1, 0 ] ] ] );
<matrix group with 6 generators>
gap> IsFinite(N);
false
gap> G:=GroupByGenerators( [ [ [ 0, -1, 0, 0 ], [ 1, 0, 0, 0 ], 
>   [ 0, 0, 0, -1 ], [ 0, 0, 1, 0 ] ] ] );
Group([ [ [ 0, -1, 0, 0 ], [ 1, 0, 0, 0 ], [ 0, 0, 0, -1 ], [ 0, 0, 1, 0 ] ] 
 ])
gap> Centralizer(N,G);
<matrix group of size infinity with 6 generators>

## iterated autgp (5)
gap> g:=Group((1,2,3),(4,5,6),(2,3)(5,6));;
gap> aut:=AutomorphismGroup(g);;
gap> ccu:=ConjugacyClasses(aut);;
gap> aut2:=AutomorphismGroup(aut);;


## field conversion (6)
gap> v := [];;
gap> ConvertToVectorRep(v,3);;
gap> ConvertToVectorRep(v,9);;


## EulerianFunction (10)
gap> EulerianFunction( DihedralGroup(8), 2);
24
gap> EulerianFunction( CyclicGroup(6), 1 );
2
gap> EulerianFunction( CyclicGroup(5), 1 );
4

gap> g:=SmallGroup(1,1);;
gap> ConjugacyClassesSubgroups(g);;

gap> g:=Group([ (3,5), (1,3,5) ]);;
gap> MaximalSubgroups(g);;

##GQuotients
gap> s := SymmetricGroup(4);;
gap> g := SmallGroup(48,1);;
gap> GQuotients(g,s);
[  ]

## Costantini bug, in inverting lists of compressed vectors
gap> p := 3;; e := 16;;
gap> g := ElementaryAbelianGroup(p^e);;
gap> l := PCentralLieAlgebra(g);;
gap> b := Basis(l);;
gap> b2 := b;;
gap> RelativeBasis(b,b2);;

## Testing if an element is in a Green's D equivalence class (fix 2 no. 12)
gap> s := Semigroup(Transformation([1,1,3,4]),Transformation([1,2,2,4]));;
gap> dc := GreensDClasses(s);;
gap> Transformation([1,1,3,4]) in dc[1];
false

## Testing if Green's D classes can be compared for finite semigroups
gap> s := Transformation([1,1,3,4,5]);;
gap> c := Transformation([2,3,4,5,1]);;
gap> op5 := Semigroup(s,c);;
gap> dcl := GreensDClasses(op5);;
gap> IsGreensLessThanOrEqual(dcl[4],dcl[5]);
false

## Testing that GroupHClassOfGreensDClass is implemented
gap> h := GroupHClassOfGreensDClass(dcl[4]);;

## Testing AssociatedReesMatrixSemigroupOfDClass.
##         IsZeroSimpleSemigroup, IsomorphismReesMatrixSemigroup,
##         and SandwichMatrixOfReesZeroMatrixSemigroup
##         create Greens D classes correctly.
gap> rms := AssociatedReesMatrixSemigroupOfDClass(dcl[5]);;
gap> s := Transformation([1,1,2]);;
gap> c := Transformation([2,3,1]);;
gap> op3 := Semigroup(s,c);;
gap> IsRegularSemigroup(op3);;
gap> dcl := GreensDClasses(op3);;
gap> d2 := dcl[2];; d1:= dcl[1];;
gap> i2 := SemigroupIdealByGenerators(op3,[Representative(d2)]);;
gap> GeneratorsOfSemigroup(i2);;
gap> i1 := SemigroupIdealByGenerators(i2,[Representative(d1)]);;
gap> GeneratorsOfSemigroup(i1);;
gap> c1 := ReesCongruenceOfSemigroupIdeal(i1);;
gap> q := i2/c1;;
gap> IsZeroSimpleSemigroup(q);;
gap> irms := IsomorphismReesMatrixSemigroup(q);;
gap> SandwichMatrixOfReesZeroMatrixSemigroup(Source(irms));;

gap> g := Group( (1,2),(1,2,3) );;
gap> i := TrivialSubgroup( g );;
gap> CentralizerModulo( g, i, (1,2) );
Group([ (1,2) ])

gap> x:= Sum( GeneratorsOfAlgebra( QuaternionAlgebra( Rationals, -2, -2 ) ) );;
gap> x * Inverse( x ) = One( x );
true
gap> LargestMovedPoint(ProjectiveSymplecticGroup(6,2)) = 63;
true
gap> t1:= CharacterTable( "Cyclic", 2 );;
gap> t2:= CharacterTable( "Cyclic", 3 );;
gap> t1 * t1;  ( t1 mod 2 ) * ( t1 mod 2 );
CharacterTable( "C2xC2" )
BrauerTable( "C2xC2", 2 )
gap> ( t1 mod 2 ) * t2;  t2 * ( t1 mod 2 );
BrauerTable( "C2xC3", 2 )
BrauerTable( "C3xC2", 2 )
gap> t:= CharacterTable( SymmetricGroup( 4 ) );;
gap> chi:= TrivialCharacter( t );;
gap> IntScalarProducts( t, [ chi ], chi );
true
gap> NonnegIntScalarProducts( t, [ chi ], chi );
true
gap> Representative( TrivialSubgroup( Group( (1,2) ) ) );
()
gap> Representative( TrivialSubspace( GF(2)^2 ) );
[ 0*Z(2), 0*Z(2) ]

gap> g:=SmallGroup(70,3);;
gap> g:=GroupByPcgs(Pcgs(g));;
gap> IdGroup(g);
[ 70, 3 ]

##  bugs 2, 3, 6, 7, 20 for fix 2.
gap> x:= Sum( GeneratorsOfAlgebra( QuaternionAlgebra( Rationals, -2, -2 ) ) );;
gap> x * Inverse( x ) = One( x );
true
gap> LargestMovedPoint(ProjectiveSymplecticGroup(6,2)) = 63;
true
gap> t1:= CharacterTable( "Cyclic", 2 );;
gap> t2:= CharacterTable( "Cyclic", 3 );;
gap> t1 * t1;  ( t1 mod 2 ) * ( t1 mod 2 );
CharacterTable( "C2xC2" )
BrauerTable( "C2xC2", 2 )
gap> ( t1 mod 2 ) * t2;  t2 * ( t1 mod 2 );
BrauerTable( "C2xC3", 2 )
BrauerTable( "C3xC2", 2 )
gap> t:= CharacterTable( SymmetricGroup( 4 ) );;
gap> chi:= TrivialCharacter( t );;
gap> IntScalarProducts( t, [ chi ], chi );
true
gap> NonnegIntScalarProducts( t, [ chi ], chi );
true
gap> Representative( TrivialSubgroup( Group( (1,2) ) ) );
()
gap> Representative( TrivialSubspace( GF(2)^2 ) );
[ 0*Z(2), 0*Z(2) ]

gap> G := Group(());;F := FreeGroup( 1, "f" );;
gap> hom := GroupHomomorphismByImages(F,G,GeneratorsOfGroup(F),
> GeneratorsOfGroup(G));;
gap> PreImagesRepresentative(hom,());
<identity ...>

##  bug 2 for fix 4.
gap> 1 * One( Integers mod NextPrimeInt( 2^16 ) );
ZmodpZObj( 1, 65537 )

gap> f:=FreeGroup("a","b");;g:=f/[Comm(f.1,f.2),f.1^5,f.2^7];;Pcgs(g);;
gap> n:=Subgroup(g,[g.2]);; m:=ModuloPcgs(g,n);;
gap> ExponentsOfPcElement(m,m[1]);
[ 1 ]

##  bug 11 for fix 4.
gap> x:= Indeterminate( Rationals );;
gap> f:= x^4 + 3*x^2 + 1;;
gap> F:= AlgebraicExtension( Rationals, f );;
gap> Basis( F )[1];;

# bug in ReducedSCTable:
gap> T:= EmptySCTable( 1, 0, "antisymmetric" );
[ [ [ [  ], [  ] ] ], -1, 0 ]
gap> ReducedSCTable( T, Z(3)^0 );
[ [ [ [  ], [  ] ] ], -1, 0*Z(3) ]

## Rees Matrix bug fix 4
gap> s := Semigroup(Transformation([2,3,1]));;
gap> IsSimpleSemigroup(s);;
gap> irms := IsomorphismReesMatrixSemigroup(s);;
gap> Size(Source(irms));
3

## Semigroup/Monoid rewriting system bug for fix 4
gap> f := FreeSemigroup("a","b");;
gap> a := f.1;; b := f.2;;
gap> s := f/[[a*b,b],[b*a,a]];;
gap> rws := KnuthBendixRewritingSystem(s);
Knuth Bendix Rewriting System for Semigroup( [ a, b ] ) with rules 
[ [ a*b, b ], [ b*a, a ] ]
gap> MakeConfluent(rws);
gap> rws;
Knuth Bendix Rewriting System for Semigroup( [ a, b ] ) with rules 
[ [ a*b, b ], [ b*a, a ], [ a^2, a ], [ b^2, b ] ]
gap> HasReducedConfluentRewritingSystem(s);
true

gap> x:= Indeterminate( Rationals );;
gap> a:= 1/(1+x);;
gap> b:= 1/(x+x^2);;
gap> a=b;
false

##  bugs 12 and 14 for fix 4
gap> IsRowVector( [ [ 1 ] ] );
false
gap> IsRowModule( TrivialSubmodule( GF(2)^[2,2] ) );
false

gap> g:=SL(2,5);;c:=Irr(g)[6];;
gap> hom:=IrreducibleRepresentationsDixon(g,c);;
gap> Size(Image(hom));
60

##  bug 16 for fix 4
gap> Difference( [ 1, 1 ], [] );
[ 1 ]

## bug 17 for fix 4
gap> f := FreeGroup( 2 );;
gap> g := f/[f.1^4,f.2^4,Comm(f.1,f.2)];;
gap> Elements(g);
[ <identity ...>, f1, f1^3, f2, f2^3, f1^2, f1*f2, f1*f2^3, f1^3*f2, 
  f1^3*f2^3, f2^2, f1^2*f2, f1^2*f2^3, f1*f2^2, f1^3*f2^2, f1^2*f2^2 ]

gap> NrPrimitiveGroups(441);
24

##  bug 2 for fix 5
gap> IsSubset( GF(2)^[2,2], GF(4)^[2,2] );
false

gap> G:=Group((8,12)(10,14),(8,10)(12,14),(4,6)(12,14),(2,4)(10,12),
> (4,8)(6,10), (9,13)(11,15),(9,11)(13,15),(5,7)(13,15),(3,5)(11,13),
> (5,9)(7,11));;
gap> x:=Group((1,8)(2,7)(3,6)(4,5)(9,16)(10,15)(11,14)(12,13),
> (1,9)(2,10)(3,11)(4,12)(5,13)(6,14)(7,15)(8,16),
> (1,4)(2,3)(5,8)(6,7)(9,12)(10,11)(13,16)(14,15),
> (1,10)(2,9)(3,12)(4,11)(5,14)(6,13)(7,16)(8,15));;
gap> y:=Group((1,8)(2,7)(3,6)(4,5)(9,14)(10,13)(11,16)(12,15),
> (1,11)(2,10)(3,9)(4,12)(5,15)(6,14)(7,13)(8,16),
> (1,4)(2,3)(5,8)(6,7)(9,10)(11,12)(13,14)(15,16),
> (1,10)(2,11)(3,12)(4,9)(5,14)(6,15)(7,16)(8,13));;
gap> RepresentativeAction(G,x,y)<>fail;
true

##  bug 5 for fix 5
gap> BaseOrthogonalSpaceMat( [ [ 1, 0 ] ] );
[ [ 0, 1 ] ]

##  bug 6 for fix 5
gap> IsSet( AUTOLOAD_PACKAGES );
true

##  bug 7 for fix 5
gap> tbl:= CharacterTable( "2.L2(3)" );;
gap> MolienSeries( tbl, Sum( Irr( tbl ){ [3,4] } ), Irr( tbl )[2] );
( 2*z^2+z^3-z^4+z^6 ) / ( (1-z^3)^2*(1-z^2)^2 )

##  bug 8 for fix 5
gap> l:= [ 1, 2 ];;  i:= Intersection( [ l ] );;
gap> IsIdenticalObj( l, i );
false

## bug 9 for fix 5
gap> A:=FullMatrixLieAlgebra(Rationals,2);
<Lie algebra over Rationals, with 3 generators>
gap> B:=LieDerivedSubalgebra(A);
<Lie algebra of dimension 3 over Rationals>
gap> D:=Derivations(Basis(B));
<Lie algebra of dimension 3 over Rationals>

##  bug 10 for fix 5
gap> k:=AbelianGroup([5,5,5]);
<pc group of size 125 with 3 generators>
gap> h:=SylowSubgroup(AutomorphismGroup(k),2);
<group>
gap> g:=SemidirectProduct(h,k);
<pc group with 10 generators>
gap> Centre(g);
Group([  ]) 

## bug 11 for fix 5
gap> m1:=[[0,1],[0,0]];;
gap> m2:=[[0,0],[1,0]];;
gap> m3:=[[1,0],[0,-1]];;
gap> M1:=MatrixByBlockMatrix(BlockMatrix([[1,1,m1]],2,2));;
gap> M2:=MatrixByBlockMatrix(BlockMatrix([[1,1,m2]],2,2));;
gap> M3:=MatrixByBlockMatrix(BlockMatrix([[1,1,m3]],2,2));;
gap> M4:=MatrixByBlockMatrix(BlockMatrix([[2,2,m1]],2,2));;
gap> M5:=MatrixByBlockMatrix(BlockMatrix([[2,2,m2]],2,2));;
gap> M6:=MatrixByBlockMatrix(BlockMatrix([[2,2,m3]],2,2));;
gap> L:=LieAlgebra(Rationals,[M1,M2,M3,M4,M5,M6]);
<Lie algebra over Rationals, with 6 generators>
gap> DirectSumDecomposition(L);
[ <two-sided ideal in <Lie algebra of dimension 6 over Rationals>, 
      (dimension 3)>, 
  <two-sided ideal in <Lie algebra of dimension 6 over Rationals>, 
      (dimension 3)> ]

##  bug 16 for fix 5
gap> IrrBaumClausen( Group(()));;

##  bug 17 for fix 5 (example taken from `vspcmat.tst')
gap> w:= LeftModuleByGenerators( GF(9),
>         [ [ [ Z(27), Z(3) ], [ Z(3), Z(3) ] ],
>           [ [ Z(27), Z(3) ], [ Z(3), Z(3) ] ],
>           [ [ 0*Z(3), Z(3) ], [ Z(3), Z(3) ] ] ] );;
gap> w = AsVectorSpace( GF(3), w );
true

##  bug 18 for fix 5
gap> List( Irr( AlternatingGroup( 5 ) ), TestMonomial );;

##  bug 2 for fix 6
gap> DerivedSubgroupsTom( TableOfMarks( "A10" ) );;

##  bug 3 for fix 6
gap> Order( ZmodnZObj( 2, 7 ) );;  Inverse( ZmodnZObj( 2, 7 ) );;

##  bug 4 for fix 6
gap> tbl:= CharacterTable( "2.L2(3)" );;
gap> z:= Indeterminate( Rationals );
x_1
gap> ser:= MolienSeries( tbl, Sum( Irr( tbl ){ [3,4] } ), Irr( tbl )[2] );;
gap> MolienSeriesWithGivenDenominator( ser, [ 6,6,4,4 ] );
( 2*z^2+z^3+3*z^4+6*z^5+3*z^6+7*z^7+7*z^8+3*z^9+6*z^10+4*z^11+z^12+3*z^13+z^14\
+z^16 ) / ( (1-z^6)^2*(1-z^4)^2 )


#############################################################################
##
##  Fixes for GAP 4.4
##

##  bug 8 for fix 1
gap> q:= QuaternionAlgebra( Rationals );;
gap> t:= TrivialSubspace( q );;
gap> tt:= Subspace( q, [] );;
gap> Intersection2( t, tt );;
gap> g:=SmallGroup(6,2);;
gap> f:=FreeGroup(3);;
gap> f:=f/[f.2*f.3];;
gap> q:=GQuotients(f,g);;
gap> k:=List(q,Kernel);;
gap> k:=Intersection(k);;
gap> hom:=IsomorphismFpGroup(TrivialSubgroup(g));;
gap> IsFpGroup(Range(hom));
true
gap> AbelianInvariantsMultiplier(SL(3,2));
[ 2 ]
gap> AllPrimitiveGroups(Size,60);
#W  AllPrimitiveGroups: Degree restricted to [ 1 .. 999 ]
[ A(5), PSL(2,5), A(5) ]
gap> ix18:=X(GF(5),1);;f:=ix18^5-1;;
gap> Discriminant(f);
0*Z(5)


gap> STOP_TEST( "bugfix.tst", 3964000000 );

#############################################################################
##
#E  bugfix.tst . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
##
