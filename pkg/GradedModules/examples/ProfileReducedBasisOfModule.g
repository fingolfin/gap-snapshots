Read( "ProfileMainExample.g" );

Hom( W, W );
WW := UnderlyingModule( W );
Res := Resolution( W );
Res2 := ShortenResolution( W );
Resolution( W );
BasisOfModule( W );
ByASmallerPresentation( W );
syz := SyzygiesGenerators( W );
wmor := GradedMap( wmat, "free", "free", "left", S );
wmor := GradedMap( wmat, "left", S );
SetIsMorphism( wmor, true );
ker := Kernel( wmor );
Y := Hom( S^0, W );
iota := TorsionObjectEmb( W );
pi := TorsionFreeFactorEpi( W );
C := HomalgComplex( pi, 0 );
Add( C, iota );
T := TorsionObject( W );
F := TorsionFreeFactor( W );
O := HomalgCocomplex( iota, -1 );
Add( O, pi );
W2 := TensorProduct( W, W );
WW2 := TensorProduct( WW, WW );
