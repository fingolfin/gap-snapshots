# Gauss, single 6
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("gauss06.tst");

# doc/../gap/Sparse.gi:237-284
gap> M := [[0,0,0,1,0],[0,1,1,1,1],[1,1,1,1,0]] * One( GF(2) );;
gap> Display(M);
 . . . 1 .
 . 1 1 1 1
 1 1 1 1 .
gap> N := [[1,1,0,0,0],[0,0,1,0,1]] * One( GF(2) );;
gap> Display(N);
 1 1 . . .
 . . 1 . 1
gap> ReduceMatTransformation(M,N);
rec( 
  reduced_matrix := 
    [ <a GF2 vector of length 5>, <a GF2 vector of length 5>, 
      <a GF2 vector of length 5> ], 
  transformation := [ <a GF2 vector of length 2>,
      <a GF2 vector of length 2>, <a GF2 vector of length 2> ] )
gap> Display(last.reduced_matrix);
 . . . 1 .
 . 1 . 1 .
 . . . 1 1
gap> Display(last.transformation);
 . .
 . 1
 1 1
gap> Display( M + last.transformation * N );
 . . . 1 .
 . 1 . 1 .
 . . . 1 1 
gap> SM := SparseMatrix(M); SN := SparseMatrix(N);
<a 3 x 5 sparse matrix over GF(2)>
<a 2 x 5 sparse matrix over GF(2)>
gap> ReduceMatTransformation(SM,SN);
rec( reduced_matrix := <a 3 x 5 sparse matrix over GF(2)>,
  transformation := <a 3 x 2 sparse matrix over GF(2)> )
gap> Display(last.reduced_matrix);
 . . . 1 .
 . 1 . 1 .
 . . . 1 1
gap> Display(last.transformation);
 . .
 . 1
 1 1
gap> Display( SM + last.transformation * SN );
 . . . 1 .
 . 1 . 1 .
 . . . 1 1

#
gap> STOP_TEST("gauss06.tst", 1);
