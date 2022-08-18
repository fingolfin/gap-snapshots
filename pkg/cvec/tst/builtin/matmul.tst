gap> START_TEST("cvec: builtin/matmul.tst");

#
gap> CVEC.TEST.LIMIT_ALLFFE:=32;;
gap> CVEC.TEST.LIMIT_SLICE:=32;;
gap> inf := InfoLevel(InfoWarning);;
gap> SetInfoLevel(InfoWarning,0);;  # Get rid of messages for Conway polynomials

#
gap> CVEC.TEST.COMPRESSED_ALL("MATMUL",CVEC.TEST.MATMUL);
Testing MATMUL COMPRESSED p=2, d=1 ...
Testing MATMUL COMPRESSED p=2, d=2 ...
Testing MATMUL COMPRESSED p=2, d=3 ...
Testing MATMUL COMPRESSED p=2, d=4 ...
Testing MATMUL COMPRESSED p=2, d=5 ...
Testing MATMUL COMPRESSED p=2, d=6 ...
Testing MATMUL COMPRESSED p=2, d=7 ...
Testing MATMUL COMPRESSED p=2, d=8 ...
Testing MATMUL COMPRESSED p=3, d=1 ...
Testing MATMUL COMPRESSED p=3, d=2 ...
Testing MATMUL COMPRESSED p=3, d=3 ...
Testing MATMUL COMPRESSED p=3, d=4 ...
Testing MATMUL COMPRESSED p=3, d=5 ...
Testing MATMUL COMPRESSED p=5, d=1 ...
Testing MATMUL COMPRESSED p=5, d=2 ...
Testing MATMUL COMPRESSED p=5, d=3 ...
Testing MATMUL COMPRESSED p=7, d=1 ...
Testing MATMUL COMPRESSED p=7, d=2 ...
Testing MATMUL COMPRESSED p=11, d=1 ...
Testing MATMUL COMPRESSED p=11, d=2 ...
Testing MATMUL COMPRESSED p=13, d=1 ...
Testing MATMUL COMPRESSED p=13, d=2 ...
Testing MATMUL COMPRESSED p=17, d=1 ...
Testing MATMUL COMPRESSED p=19, d=1 ...
Testing MATMUL COMPRESSED p=23, d=1 ...
Testing MATMUL COMPRESSED p=29, d=1 ...
Testing MATMUL COMPRESSED p=31, d=1 ...
Testing MATMUL COMPRESSED p=37, d=1 ...
Testing MATMUL COMPRESSED p=41, d=1 ...
Testing MATMUL COMPRESSED p=43, d=1 ...
Testing MATMUL COMPRESSED p=47, d=1 ...
Testing MATMUL COMPRESSED p=53, d=1 ...
Testing MATMUL COMPRESSED p=59, d=1 ...
Testing MATMUL COMPRESSED p=61, d=1 ...
Testing MATMUL COMPRESSED p=67, d=1 ...
Testing MATMUL COMPRESSED p=71, d=1 ...
Testing MATMUL COMPRESSED p=73, d=1 ...
Testing MATMUL COMPRESSED p=79, d=1 ...
Testing MATMUL COMPRESSED p=83, d=1 ...
Testing MATMUL COMPRESSED p=89, d=1 ...
Testing MATMUL COMPRESSED p=97, d=1 ...
Testing MATMUL COMPRESSED p=101, d=1 ...
Testing MATMUL COMPRESSED p=103, d=1 ...
Testing MATMUL COMPRESSED p=107, d=1 ...
Testing MATMUL COMPRESSED p=109, d=1 ...
Testing MATMUL COMPRESSED p=113, d=1 ...
Testing MATMUL COMPRESSED p=127, d=1 ...
Testing MATMUL COMPRESSED p=131, d=1 ...
Testing MATMUL COMPRESSED p=137, d=1 ...
Testing MATMUL COMPRESSED p=139, d=1 ...
Testing MATMUL COMPRESSED p=149, d=1 ...
Testing MATMUL COMPRESSED p=151, d=1 ...
Testing MATMUL COMPRESSED p=157, d=1 ...
Testing MATMUL COMPRESSED p=163, d=1 ...
Testing MATMUL COMPRESSED p=167, d=1 ...
Testing MATMUL COMPRESSED p=173, d=1 ...
Testing MATMUL COMPRESSED p=179, d=1 ...
Testing MATMUL COMPRESSED p=181, d=1 ...
Testing MATMUL COMPRESSED p=191, d=1 ...
Testing MATMUL COMPRESSED p=193, d=1 ...
Testing MATMUL COMPRESSED p=197, d=1 ...
Testing MATMUL COMPRESSED p=199, d=1 ...
Testing MATMUL COMPRESSED p=211, d=1 ...
Testing MATMUL COMPRESSED p=223, d=1 ...
Testing MATMUL COMPRESSED p=227, d=1 ...
Testing MATMUL COMPRESSED p=229, d=1 ...
Testing MATMUL COMPRESSED p=233, d=1 ...
Testing MATMUL COMPRESSED p=239, d=1 ...
Testing MATMUL COMPRESSED p=241, d=1 ...
Testing MATMUL COMPRESSED p=251, d=1 ...

#
gap> CVEC.TEST.MATMUL(2,9);

#
gap> CVEC.TEST.MATMUL(3,10);

#
gap> CVEC.TEST.MATMUL(31,3);

#
gap> CVEC.TEST.MATMUL(257,1);

#
gap> SetInfoLevel(InfoWarning,inf);
gap> STOP_TEST("cvec: builtin/matmul.tst", 1);