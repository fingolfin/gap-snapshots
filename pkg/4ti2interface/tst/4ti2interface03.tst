# 4ti2Interface, single 3
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("4ti2interface03.tst");

# /doc/_Chunks.xml:57-63
gap> inequalities := [ [1,2,3,4], [0,1,0,7], [3,1,0,2], [0,0,1,0] ];
[ [ 1, 2, 3, 4 ], [ 0, 1, 0, 7 ], [ 3, 1, 0, 2 ], [ 0, 0, 1, 0 ] ]
gap> basis := 4ti2Interface_hilbert_inequalities( inequalities );;
gap> Length( basis );
29

#
gap> STOP_TEST("4ti2interface03.tst", 1);
