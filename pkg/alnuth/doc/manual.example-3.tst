gap> m1 := [ [ 1, 0, 0, -7 ],
             [ 7, 1, 0, -7 ],
             [ 0, 7, 1, -7 ],
             [ 0, 0, 7, -6 ] ];;

gap> m2 := [ [ 0, 0, -13, 14 ],
             [ -1, 0, -13, 1 ],
             [ 13, -1, -13, 1 ],
             [ 0, 13, -14, 1 ] ];;

gap> F := FieldByMatricesNC( [m1, m2] );
<rational matrix field of unknown degree>

gap> DegreeOverPrimeField(F);
4
gap> PrimitiveElement(F);
[ [ -1, 1, 1, 0 ], [ -2, 0, 2, 1 ], [ -2, -1, 1, 2 ], [ -1, -1, 0, 1 ] ]

gap> Basis(F);
Basis( <rational matrix field of degree 4>,
[ [ [ 1, 0, 0, 0 ], [ 0, 1, 0, 0 ], [ 0, 0, 1, 0 ], [ 0, 0, 0, 1 ] ],
  [ [ 0, 1, 0, 0 ], [ -1, 1, 1, 0 ], [ -1, 0, 1, 1 ], [ -1, 0, 0, 1 ] ],
  [ [ 0, 0, 1, 0 ], [ -1, 0, 1, 1 ], [ -1, -1, 1, 1 ], [ 0, -1, 0, 1 ] ],
  [ [ 0, 0, 0, 1 ], [ -1, 0, 0, 1 ], [ 0, -1, 0, 1 ], [ 0, 0, -1, 1 ] ] ] )

gap> MaximalOrderBasis(F);
Basis( <rational matrix field of degree 4>,
[ [ [ 1, 0, 0, 0 ], [ 0, 1, 0, 0 ], [ 0, 0, 1, 0 ], [ 0, 0, 0, 1 ] ],
  [ [ -1, 1, 1, 0 ], [ -2, 0, 2, 1 ], [ -2, -1, 1, 2 ], [ -1, -1, 0, 1 ] ],
  [ [ -3, -2, 2, 3 ], [ -3, -5, 0, 5 ], [ 0, -5, -3, 3 ], [ 2, -2, -3, 0 ] ],
  [ [ -1, -1, 0, 1 ], [ 0, -2, -1, 1 ], [ 1, -1, -2, 0 ], [ 1, 0, -1, -1 ] ]
 ] )

gap> U := UnitGroup(F);
<matrix group with 2 generators>

gap> u := GeneratorsOfGroup( U );;

gap> nat := IsomorphismPcpGroup(U);;
gap> H := Image(nat);
Pcp-group with orders [ 10, 0 ]
gap> ImageElm( nat, u[1] );
g1
gap> ImageElm( nat, u[2] );
g2
gap> ImageElm( nat, u[1]*u[2] );
g1*g2
gap> u[1] = PreImagesRepresentative(nat, GeneratorsOfGroup(H)[1] );
true
gap> g := UnivariatePolynomial( Rationals, [ 16, 64, -28, -4, 1 ] );
x_1^4-4*x_1^3-28*x_1^2+64*x_1+16

gap> F := FieldByPolynomialNC(g);
<algebraic extension over the Rationals of degree 4>
gap> PrimitiveElement(F);
a
gap> MaximalOrderBasis(F);
Basis( <algebraic extension over the Rationals of degree 4>,
[ !1, 1/2*a, 1/4*a^2, 1/56*a^3+1/14*a^2+1/14*a-2/7 ] )

gap> U := UnitGroup(F);
<group with 4 generators>

gap> natU := IsomorphismPcpGroup(U);;
gap> elms := List( [1..10], x-> Random(F) );;

gap>  PcpPresentationOfMultiplicativeSubgroup( F, elms );
Pcp-group with orders [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]

gap> isom := IsomorphismPcpGroup( F, elms );;
gap> y := RandomGroupElement( elms );;
gap> z := ImageElm( isom, y );;
gap> y = PreImagesRepresentative( isom, z );
true

gap> FactorsPolynomialAlgExt( F, g );
[ x_1+(-a), x_1+(a-2), x_1+(-1/7*a^3+3/7*a^2+31/7*a-40/7),
  x_1+(1/7*a^3-3/7*a^2-31/7*a+26/7) ]
