# Modules, single 33
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("modules33.tst");

# doc/../gap/BasicFunctors.gi:1822-1855
gap> ZZ := HomalgRingOfIntegers( );
Z
gap> M := HomalgMatrix( "[ 2, 3, 4,   5, 6, 7 ]", 2, 3, ZZ );;
gap> M := LeftPresentation( M );
<A non-torsion left module presented by 2 relations for 3 generators>
gap> N := TorsionObject( M );
<A cyclic torsion left module presented by yet unknown relations for a cyclic \
generator>
gap> iota := TorsionObjectEmb( M );
<A monomorphism of left modules>
gap> psi := Tor( 1, iota, N );
<A homomorphism of left modules>
gap> ByASmallerPresentation( psi );
<A non-zero homomorphism of left modules>
gap> Display( psi );
[ [  1 ] ]

the map is currently represented by the above 1 x 1 matrix
gap> torNN := Source( psi );
<A non-zero cyclic torsion left module presented by 1 relation for a cyclic ge\
nerator>
gap> IsIdenticalObj( torNN, Tor( 1, N, N ) ); ## the caching at work
true
gap> torMN := Range( psi );
<A non-zero cyclic torsion left module presented by 1 relation for a cyclic ge\
nerator>
gap> IsIdenticalObj( torMN, Tor( 1, M, N ) ); ## the caching at work
true
gap> Display( torNN );
Z/< 3 >
gap> Display( torMN );
Z/< 3 >

#
gap> STOP_TEST("modules33.tst", 1);
