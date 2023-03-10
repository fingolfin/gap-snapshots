#############################################################################
##
#W  treehomsg.gd             automgrp package                  Yevgen Muntyan
#W                                                             Dmytro Savchuk
##
#Y  Copyright (C) 2003 - 2018 Yevgen Muntyan, Dmytro Savchuk
##


###############################################################################
##
#C  IsTreeHomomorphismSemigroup
##
##  Category of semigroups of tree homomorphisms.
##
DeclareSynonym("IsTreeHomomorphismSemigroup", IsSemigroup and IsTreeHomomorphismCollection);
InstallTrueMethod(IsActingOnTree, IsTreeHomomorphismSemigroup);


###############################################################################
##
#P  IsSelfSimilar (<G>)
##
##  Returns whether the group or semigroup <G> is self-similar (see "Short math background").
##
DeclareProperty("IsSelfSimilar", IsTreeHomomorphismSemigroup and IsActingOnRegularTree);
DeclareFilter("CanEasilyTestSelfSimilarity");
InstallTrueMethod(CanEasilyTestSelfSimilarity, HasIsSelfSimilar);


#############################################################################
##
#P  IsSphericallyTransitive (<G>)
##
##  Returns whether the group <G> is spherically transitive (see~"Short math background").
##  \beginexample
##  gap> Grigorchuk_Group := AutomatonGroup("a=(1,1)(1,2),b=(a,c),c=(a,d),d=(1,b)");
##  < a, b, c, d >
##  gap> IsSphericallyTransitive(Grigorchuk_Group);
##  true
##  \endexample
##
DeclareProperty("IsSphericallyTransitive", IsTreeHomomorphismSemigroup);


#############################################################################
##
#O  IsTransitiveOnLevel (<G>, <lev>)
##
##  Returns whether the group (semigroup) <G> acts transitively on level <lev>.
##
##  \beginexample
##  gap> Grigorchuk_Group := AutomatonGroup("a=(1,1)(1,2),b=(a,c),c=(a,d),d=(1,b)");
##  < a, b, c, d >
##  gap> IsTransitiveOnLevel(Group([a,b]),3);
##  true
##  gap> IsTransitiveOnLevel(Group([a,b]),4);
##  false
##  \endexample
##
DeclareOperation("IsTransitiveOnLevel", [IsTreeHomomorphismSemigroup, IsPosInt]);


###############################################################################
##
#O  TransformationSemigroupOnLevel (<G>, <k>)
##
##  Returns the semigroup of transformations induced by the action of the semigroup <G> at the <k>-th
##  level.
##  \beginexample
##  gap> S := AutomatonSemigroup("y=(1,u)[1,1],u=(y,u)(1,2)");
##  < 1, y, u >
##  gap> T := TransformationSemigroupOnLevel(S,3);
##  <transformation monoid on 8 pts with 2 generators>
##  gap> Size(T);
##  11
##  \endexample
##
KeyDependentOperation("TransformationSemigroupOnLevel", IsTreeHomomorphismSemigroup, IsPosInt, ReturnTrue);


#############################################################################
##
#O  MarkovOperator( <G>, <lev>, <weights> )
##
##  Computes the matrix of the Markov operator related to the (semi)group <G> on the <lev>-th level
##  of the tree. If <G> is a group generated by $g_1,g_2,\ldots,g_n$, then the Markov operator
##  is defined as $(`PermOnLevelAsMatrix'(g_1)+\cdots+`PermOnLevelAsMatrix'(g_n)+
##  `PermOnLevelAsMatrix'(g_1^{-1})+\cdots+`PermOnLevelAsMatrix'(g_n^{-1}))/(2*n)$.
##  If <S> is a semigroup generated by $s_1,s_2,\ldots,s_n$, then the Markov operator
##  is defined similarly with `PermOnLevelAsMatrix' being replaced with `TransformationOnLevelAsMatrix'.
##  If the list of <weights> is given, uses its entries as coefficients of operators correspondings to
##  the generators of a group or semigroup. In the case of a group, the length of <weights> must be twice
##  as big as the number of generators of <G>. The list <weights> may consist either of numbers or of strings
##  representing the names of indeterminates.
##  See also
##  `PermOnLevelAsMatrix' ("PermOnLevelAsMatrix") and `TransformationOnLevelAsMatrix' ("TransformationOnLevelAsMatrix").
##  \beginexample
##  gap> L := AutomatonGroup("p=(p,q)(1,2), q=(p,q)");
##  < p, q >
##  gap> MarkovOperator(L, 3);
##  [ [ 0, 0, 1/4, 1/4, 0, 1/4, 0, 1/4 ], [ 0, 0, 1/4, 1/4, 1/4, 0, 1/4, 0 ],
##    [ 1/4, 1/4, 0, 0, 1/4, 0, 1/4, 0 ], [ 1/4, 1/4, 0, 0, 0, 1/4, 0, 1/4 ],
##    [ 0, 1/4, 1/4, 0, 0, 1/2, 0, 0 ], [ 1/4, 0, 0, 1/4, 1/2, 0, 0, 0 ],
##    [ 0, 1/4, 1/4, 0, 0, 0, 1/2, 0 ], [ 1/4, 0, 0, 1/4, 0, 0, 0, 1/2 ] ]
##  gap> MarkovOperator(L,3,["a","b","c","d"]);
##  [ [ 0, 0, d, b, 0, c, 0, a ], [ 0, 0, b, d, c, 0, a, 0 ],
##    [ b, d, 0, 0, a, 0, c, 0 ], [ d, b, 0, 0, 0, a, 0, c ],
##    [ 0, a, c, 0, 0, b+d, 0, 0 ], [ a, 0, 0, c, b+d, 0, 0, 0 ],
##    [ 0, c, a, 0, 0, 0, b+d, 0 ], [ c, 0, 0, a, 0, 0, 0, b+d ] ]
##  \endexample
##  In the case of semigroups we have:
##  \beginexample
##  gap> S := AutomatonSemigroup("c=(c,d)[1,1],d=(c,c)(1,2)");
##  < c, d >
##  gap> MarkovOperator(S,3,["w1","w2"]);
##  [ [ w1, 0, 0, 0, w2, 0, 0, 0 ], [ w1, 0, 0, 0, w2, 0, 0, 0 ],
##    [ 0, w1, 0, 0, 0, w2, 0, 0 ], [ w1, 0, 0, 0, w2, 0, 0, 0 ],
##    [ w2, 0, w1, 0, 0, 0, 0, 0 ], [ w2, 0, w1, 0, 0, 0, 0, 0 ],
##    [ w1, w2, 0, 0, 0, 0, 0, 0 ], [ w1+w2, 0, 0, 0, 0, 0, 0, 0 ] ]
##  gap> MarkovOperator(S,3,[1/3,2/3]);
##  [ [ 1/3, 0, 0, 0, 2/3, 0, 0, 0 ], [ 1/3, 0, 0, 0, 2/3, 0, 0, 0 ],
##    [ 0, 1/3, 0, 0, 0, 2/3, 0, 0 ], [ 1/3, 0, 0, 0, 2/3, 0, 0, 0 ],
##    [ 2/3, 0, 1/3, 0, 0, 0, 0, 0 ], [ 2/3, 0, 1/3, 0, 0, 0, 0, 0 ],
##    [ 1/3, 2/3, 0, 0, 0, 0, 0, 0 ], [ 1, 0, 0, 0, 0, 0, 0, 0 ] ]
##  \endexample
##

DeclareOperation("MarkovOperator", [IsTreeHomomorphismSemigroup, IsCyclotomic, IsList]);
DeclareOperation("MarkovOperator", [IsTreeHomomorphismSemigroup, IsCyclotomic]);


###############################################################################
##
#O  Section( <G>, <v> )
##
##  For a (semi)group <G> acting on a rooted tree stabilizing the vertex <v> of
##  the tree returns the (semi)group
##  generated by the sections of generators of <G> at vertex <v>. Generates error
##  if the vertex <v> is not fixed by <G>.
##  The vertex <v> can be a list representing the vertex, or a positive integer
##  representing a vertex of the first level of the tree.
##  \beginexample
##  gap> G := AutomatonGroup("u=(v,u)(1,2),v=(u,1)");
##  < u, v >
##  gap> S := StabilizerOfVertex(G,[1,2]);
##  < u^2*v^-1, u*v*u^-1, v*u^2, v^2, u^-1*v*u >
##  gap> Section(S,[1,2]);
##  < u^2*v, u*v >
##  \endexample
##
DeclareOperation("Section", [IsTreeHomomorphismSemigroup, IsList]);
DeclareOperation("Section", [IsTreeHomomorphismSemigroup, IsPosInt]);



#E
