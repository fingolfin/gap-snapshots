# Modules, single 38
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("modules38.tst");

# doc/../examples/TorExt_Grothendieck.g:5-84
gap> ZZ := HomalgRingOfIntegers( );
Z
gap> imat := HomalgMatrix( "[ \
>   262,  -33,   75,  -40, \
>   682,  -86,  196, -104, \
>  1186, -151,  341, -180, \
> -1932,  248, -556,  292, \
>  1018, -127,  293, -156  \
> ]", 5, 4, ZZ );
<A 5 x 4 matrix over an internal ring>
gap> M := LeftPresentation( imat );
<A left module presented by 5 relations for 4 generators>
gap> F := InsertObjectInMultiFunctor( Functor_TensorProduct_for_fp_modules, 2, M, "TensorM" );
<The functor TensorM for f.p. modules and their maps over computable rings>
gap> G := LeftDualizingFunctor( ZZ );;
gap> II_E := GrothendieckSpectralSequence( F, G, M );
<A stable cohomological spectral sequence with sheets at levels 
[ 0 .. 2 ] each consisting of left modules at bidegrees [ -1 .. 0 ]x
[ 0 .. 1 ]>
gap> Display( II_E );
The associated transposed spectral sequence:

a cohomological spectral sequence at bidegrees
[ [ 0 .. 1 ], [ -1 .. 0 ] ]
---------
Level 0:

 * *
 * *
---------
Level 1:

 * *
 . .
---------
Level 2:

 s s
 . .

Now the spectral sequence of the bicomplex:

a cohomological spectral sequence at bidegrees
[ [ -1 .. 0 ], [ 0 .. 1 ] ]
---------
Level 0:

 * *
 * *
---------
Level 1:

 * *
 . s
---------
Level 2:

 s s
 . s
gap> filt := FiltrationBySpectralSequence( II_E, 0 );
<A descending filtration with degrees [ -1 .. 0 ] and graded parts:

-1:   <A non-zero left module presented by yet unknown relations for 9 generator\
s>

0:   <A non-zero left module presented by yet unknown relations for 4 generators\
>
of
<A left module presented by yet unknown relations for 29 generators>>
gap> ByASmallerPresentation( filt );
<A descending filtration with degrees [ -1 .. 0 ] and graded parts:
  -1:   <A non-zero torsion left module presented by 4 relations
             for 4 generators>
   0:   <A rank 1 left module presented by 2 relations for 3 generators>
of
<A rank 1 left module presented by 6 relations for 7 generators>>
gap> m := IsomorphismOfFiltration( filt );
<A non-zero isomorphism of left modules>

#
gap> STOP_TEST("modules38.tst", 1);
