#############################################################################
##
#W  workspaces/save-workspace.tst
#Y  Copyright (C) 2016                                      Michael Torpey
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##
##  This file, together with load-workspace.tst, tests the ability to save
##  and load workspaces which include Semigroups objects.  Objects should be
##  created and stored in save-workspace.tst, and then loaded and tested in
##  load-workspace.tst to ensure that they work correctly after being saved.
##
#############################################################################

# Set up testing environment
gap> START_TEST("Semigroups package: workspaces/save-workspace.tst");
gap> SetInfoLevel(InfoDebug, 0);
gap> LoadPackage("semigroups", false);;
gap> SEMIGROUPS.StartTest();

#############################################################################
##  Create objects below here, and add tests to load-workspace.tst to ensure
##  that they are saved to disk correctly.  Do not reuse variable names.
#############################################################################

#  Union-find structures
gap> uftable1 := UF_NEW(10);;
gap> UF_UNION(uftable1, [4, 9]);;
gap> UF_UNION(uftable1, [4, 2]);;
gap> uftable2 := UF_NEW(1);;
gap> uftable3 := UF_NEW(30000);;
gap> UF_UNION(uftable3, [20222, 234]);;

#  Congruences from libsemigroups
gap> S := Semigroup(Matrix(IsBooleanMat, [[0, 1], [1, 0]]), 
>                   Matrix(IsBooleanMat, [[1, 0], [1, 1]]), 
>                   Matrix(IsBooleanMat, [[1, 0], [0, 0]]), 
>                   Matrix(IsBooleanMat, [[1, 0], [0, 0]]));;
gap> cong := LeftSemigroupCongruence(S, [S.1, S.2]);;
gap> NrEquivalenceClasses(cong);
4
gap> EquivalenceRelationCanonicalLookup(cong);
[ 1, 1, 2, 1, 1, 3, 1, 1, 2, 1, 3, 1, 1, 2, 4, 3 ]

#  Semigroups from libsemigroups
gap> T := Semigroup(Matrix(IsBooleanMat, [[0, 1], [0, 0]]), 
>                   Matrix(IsBooleanMat, [[1, 0], [1, 1]]), 
>                   Matrix(IsBooleanMat, [[1, 0], [0, 1]]), 
>                   Matrix(IsBooleanMat, [[1, 0], [0, 0]]));;
gap> Size(T); 
9
gap> NrIdempotents(T);
8
gap> x := T.1 * T.2 * T.3 ^ 5 * T.2 * T.3;
Matrix(IsBooleanMat, [[1, 0], [0, 0]])
gap> Factorization(T, x);
[ 4 ]
gap> D := DClass(T, x);;
gap> id := Idempotents(D);
[ Matrix(IsBooleanMat, [[0, 1], [0, 1]]), 
  Matrix(IsBooleanMat, [[1, 1], [0, 0]]), 
  Matrix(IsBooleanMat, [[1, 1], [1, 1]]), 
  Matrix(IsBooleanMat, [[1, 0], [0, 0]]), 
  Matrix(IsBooleanMat, [[1, 0], [1, 0]]) ]
gap> ForAll(id, x -> x in T);
true
gap> U := AsSemigroup(IsTransformationSemigroup, T);
<transformation monoid of size 9, degree 4 with 3 generators>
gap> Size(U); 
9
gap> NrIdempotents(U);
8
gap> xx := U.1 * U.2 * U.3 ^ 5 * U.2 * U.3;
Transformation( [ 2, 2, 4, 4 ] )
gap> Factorization(U, xx);
[ 1, 2, 4 ]
gap> DD := DClass(U, xx);;
gap> idd := Idempotents(DD);
[ Transformation( [ 1, 1, 4, 4 ] ), Transformation( [ 2, 2, 4, 4 ] ), 
  Transformation( [ 3, 3, 3 ] ), Transformation( [ 1, 1, 1 ] ), 
  Transformation( [ 2, 2, 2 ] ) ]
gap> ForAll(idd, x -> x in U);
true

#  Bipartitions
gap> y := Bipartition([[1, 3], [2, 4, -1], [5, 6, -2, -3], [-4, -5], [-6]]);
<bipartition: [ 1, 3 ], [ 2, 4, -1 ], [ 5, 6, -2, -3 ], [ -4, -5 ], [ -6 ]>
gap> IsBipartition(y);
true
gap> DegreeOfBipartition(y);
6
gap> RankOfBipartition(y);
2
gap> NrTransverseBlocks(y);
2
gap> NrLeftBlocks(y);
3
gap> NrRightBlocks(y);
4
gap> NrBlocks(y);
5
gap> LeftBlocks(y);
<blocks: [ 1, 3 ], [ 2*, 4* ], [ 5*, 6* ]>
gap> RightBlocks(y);
<blocks: [ 1* ], [ 2*, 3* ], [ 4, 5 ], [ 6 ]>
gap> IntRepOfBipartition(y);
[ 1, 2, 1, 2, 3, 3, 2, 3, 3, 4, 4, 5 ]
gap> LeftProjection(y);
<bipartition: [ 1, 3 ], [ 2, 4, -2, -4 ], [ 5, 6, -5, -6 ], [ -1, -3 ]>
gap> RightProjection(y);
<bipartition: [ 1, -1 ], [ 2, 3, -2, -3 ], [ 4, 5 ], [ 6 ], [ -4, -5 ], 
 [ -6 ]>
gap> One(y);
<block bijection: [ 1, -1 ], [ 2, -2 ], [ 3, -3 ], [ 4, -4 ], [ 5, -5 ], 
 [ 6, -6 ]>
gap> IsBlockBijection(y);
false
gap> IsUniformBlockBijection(y);
false
gap> IsTransBipartition(y);
false
gap> IsDualTransBipartition(y);
false
gap> IsPermBipartition(y);
false
gap> IsPartialPermBipartition(y);
false

#  Blocks
gap> b := BlocksNC([[1, 3], [-2, -4, -7], [5, 6, 8, 9], [10]]);
<blocks: [ 1*, 3* ], [ 2, 4, 7 ], [ 5*, 6*, 8*, 9* ], [ 10* ]>
gap> ProjectionFromBlocks(b);
<bipartition: [ 1, 3, -1, -3 ], [ 2, 4, 7 ], [ 5, 6, 8, 9, -5, -6, -8, -9 ], 
 [ 10, -10 ], [ -2, -4, -7 ]>
gap> NrBlocks(b);
4
gap> RankOfBlocks(b);
3
gap> NrTransverseBlocks(b);
3
gap> DegreeOfBlocks(b);
10
gap> AsDigraph(b);
<digraph with 10 vertices, 23 edges>
gap> CanonicalBlocks(b);
<blocks: [ 1*, 2*, 3*, 4* ], [ 5, 6, 7 ], [ 8*, 9* ], [ 10* ]>

#############################################################################
##  Tests end here
#############################################################################

# Save the workspace
gap> SaveWorkspace(Concatenation(SEMIGROUPS.PackageDir,
>                                "/tst/workspaces/test-output.w"));
true

# SEMIGROUPS_UnbindVariables
gap> Unbind(S);
gap> Unbind(cong);
gap> Unbind(uftable1);
gap> Unbind(uftable2);
gap> Unbind(uftable3);

#E#
gap> SEMIGROUPS.StopTest();
gap> STOP_TEST("Semigroups package: workspaces/save-workspace.tst");