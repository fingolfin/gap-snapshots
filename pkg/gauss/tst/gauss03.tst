# Gauss, single 3
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("gauss03.tst");

# doc/../gap/Sparse.gi:24-61
gap> M := [[0,0,0,1,0],[0,1,1,1,1],[1,1,1,1,0]] * One( GF(2) );;
gap> Display(M);
 . . . 1 .
 . 1 1 1 1
 1 1 1 1 .
gap> EchelonMat(M);
rec( heads := [ 1, 2, 0, 3, 0 ],
  vectors := [ <an immutable GF2 vector of length 5>,
      <an immutable GF2 vector of length 5>,
      <an immutable GF2 vector of length 5> ] )
gap> Display( last.vectors );
 1 . . . 1
 . 1 1 . 1
 . . . 1 .
gap> SM := SparseMatrix( M );
<a 3 x 5 sparse matrix over GF(2)>
gap> EchelonMat( SM );
rec( heads := [ 1, 2, 0, 3, 0 ], vectors := <a 3 x 5 sparse matrix over GF(
    2)> )
gap> Display(last.vectors);
 1 . . . 1
 . 1 1 . 1
 . . . 1 .
gap> SM := SparseMatrix( [[7,4,5],[0,0,6],[0,4,4]] * One( Integers mod 8 ) );
<a 3 x 3 sparse matrix over (Integers mod 8)>
gap> Display( SM );
 7 4 5
 . . 6
 . 4 4
gap> EchelonMat( SM );
rec( heads := [ 1, 2, 3 ],
  vectors := <a 3 x 3 sparse matrix over (Integers mod 8)> )
gap> Display( last.vectors );
 1 . 1
 . 4 .
 . . 2      

#
gap> STOP_TEST("gauss03.tst", 1);
