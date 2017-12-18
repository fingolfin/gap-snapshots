#############################################################################
##
#A  anusp.tst                ANUPQ package                        Greg Gamble
#A                                                              Werner Nickel
##
##  Tests `StandardPresentation'.
##  This has been derived by conversion of the GAP 3 file of the same name to
##  GAP 4.
##  The number of GAPstones returned at the end do not mean much as  they  do
##  not measure the time spent by the `pq' binary.
##
gap> START_TEST( "Testing ANUPQ `StandardPresentation'" );
gap> SetInfoLevel(InfoANUPQ, 1);
gap> D8 := SmallGroup(8, 3);
<pc group of size 8 with 3 generators>
gap> Q8 := SmallGroup(8, 4);
<pc group of size 8 with 3 generators>
gap> S := StandardPresentation( Q8 );
<fp group on the generators [ f1, f2, f3 ]>
gap> RelatorsOfFpGroup(S);
[ f1^2*f3^-1, f2^2*f3^-1, f3^2, f2^-1*f1^-1*f2*f1*f3^-1 ]
gap> S := StandardPresentation( D8 );
<fp group on the generators [ f1, f2, f3 ]>
gap> RelatorsOfFpGroup(S);
[ f1^2, f2^2, f3^2, f2^-1*f1^-1*f2*f1*f3^-1 ]
gap> IsIsomorphicPGroup( D8, D8 );
true
gap> IsIsomorphicPGroup( D8, Q8 );
false
gap> F := FreeGroup( "a", "b" );; a := F.1;; b := F.2;;
gap> G := F / [ a^625,
>               Comm(Comm(Comm(Comm(b,a), a), a), a) / Comm(b, a)^5,
>               Comm(Comm(b,a), b), b^625 ];;
gap> H := StandardPresentation( G : Prime := 5, ClassBound := 20, Metabelian );
<fp group on the generators [ f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, 
  f12, f13, f14, f15, f16, f17, f18, f19, f20 ]>
gap> F := FreeGroup( "a", "b", "c", "d" );;
gap> a := F.1;; b := F.2;; c := F.3;; d := F.4;;
gap> G := F / [ b^4, b^2 / Comm(Comm (b, a), a), d^16,
>               a^16 / (c * d),  b^8 / (d * c^4) ];
<fp group on the generators [ a, b, c, d ]>
gap> H := Pq( G : Prime := 2, ClassBound := 1 );
<pc group of size 4 with 2 generators>
gap> hom := GroupHomomorphismByImages( H, H, [H.1, H.2], [H.2, H.1 * H.2] );
[ f1, f2 ] -> [ f2, f1*f2 ]
gap> SetIsBijective( hom, true );
gap> A := GroupByGenerators( [hom] );
<group with 1 generators>
gap> Order( A );
3
gap> SetAutomorphismGroup( H, A );
gap> S := StandardPresentation( G : pQuotient := H, ClassBound := 14 );
<fp group with 53 generators>
gap> RelatorsOfFpGroup(S);
[ f1^2*f4^-1, f2^2*f5^-1, 
  f3^2*f53^-1*f52^-1*f49^-1*f46^-1*f42^-1*f41^-1*f40^-1*f36^-1*f31^-1*f29^-1*f\
26^-1*f22^-1*f18^-1*f11^-1*f9^-1*f8^-1*f6^-1, f4^2*f7^-1, f5^2, 
  f6^2*f51^-1*f40^-1*f39^-1*f31^-1*f21^-1*f17^-1*f14^-1*f12^-1*f11^-1*f9^-1, 
  f7^2*f10^-1, 
  f8^2*f53^-1*f52^-1*f50^-1*f48^-1*f46^-1*f44^-1*f43^-1*f42^-1*f41^-1*f36^-1*f\
35^-1*f34^-1*f31^-1*f30^-1*f29^-1*f25^-1*f22^-1*f21^-1*f17^-1, 
  f9^2*f53^-1*f51^-1*f48^-1*f47^-1*f46^-1*f45^-1*f44^-1*f43^-1*f37^-1*f35^-1*f\
34^-1*f29^-1*f25^-1*f22^-1*f21^-1*f18^-1*f17^-1*f15^-1*f12^-1, f10^2*f13^-1, 
  f11^2*f52^-1*f50^-1*f49^-1*f48^-1*f46^-1*f45^-1*f44^-1*f43^-1*f41^-1*f40^-1*\
f37^-1*f35^-1*f34^-1*f30^-1*f29^-1*f26^-1*f21^-1, 
  f12^2*f51^-1*f50^-1*f49^-1*f47^-1*f46^-1*f44^-1*f43^-1*f42^-1*f41^-1*f39^-1*\
f37^-1*f36^-1*f35^-1*f31^-1*f29^-1*f26^-1*f25^-1*f21^-1*f19^-1*f15^-1, 
  f13^2*f16^-1, 
  f14^2*f52^-1*f51^-1*f49^-1*f48^-1*f47^-1*f45^-1*f43^-1*f42^-1*f40^-1*f39^-1*\
f36^-1*f34^-1*f31^-1*f25^-1, 
  f15^2*f52^-1*f49^-1*f46^-1*f43^-1*f42^-1*f41^-1*f40^-1*f39^-1*f37^-1*f36^-1*\
f35^-1*f30^-1*f29^-1*f23^-1*f19^-1, f16^2*f20^-1, 
  f17^2*f52^-1*f50^-1*f49^-1*f48^-1*f45^-1*f43^-1*f39^-1*f36^-1*f29^-1, 
  f18^2*f51^-1*f50^-1*f49^-1*f47^-1*f44^-1*f43^-1*f41^-1*f37^-1*f30^-1, 
  f19^2*f53^-1*f51^-1*f49^-1*f47^-1*f46^-1*f45^-1*f41^-1*f40^-1*f39^-1*f34^-1*\
f27^-1*f23^-1, f20^2*f24^-1, f21^2*f51^-1*f48^-1*f44^-1*f41^-1*f34^-1, 
  f22^2*f53^-1*f49^-1*f46^-1*f42^-1*f35^-1, 
  f23^2*f52^-1*f51^-1*f49^-1*f48^-1*f44^-1*f43^-1*f32^-1*f27^-1, 
  f24^2*f28^-1, f25^2*f49^-1*f46^-1*f39^-1, f26^2*f52^-1*f47^-1*f40^-1, 
  f27^2*f48^-1*f38^-1*f32^-1, f28^2*f33^-1, f29^2*f50^-1*f43^-1, 
  f30^2*f52^-1*f44^-1, f31^2*f53^-1*f45^-1, f32^2*f38^-1, f33^2, 
  f34^2*f48^-1, f35^2*f49^-1, f36^2*f50^-1, f37^2*f51^-1, f38^2, f39^2, 
  f40^2, f41^2, f42^2, f43^2, f44^2, f45^2, f46^2, f47^2, f48^2, f49^2, 
  f50^2, f51^2, f52^2, f53^2, f2^-1*f1^-1*f2*f1*f3^-1, 
  f3^-1*f1^-1*f3*f1*f5^-1, f3^-1*f2^-1*f3*f2*f6^-1, 
  f4^-1*f2^-1*f4*f2*f53^-1*f52^-1*f51^-1*f50^-1*f49^-1*f46^-1*f44^-1*f42^-1*f4\
0^-1*f39^-1*f37^-1*f36^-1*f35^-1*f29^-1*f17^-1*f14^-1*f8^-1*f6^-1*f5^-1, 
  f4^-1*f3^-1*f4*f3*f53^-1*f52^-1*f51^-1*f46^-1*f44^-1*f43^-1*f31^-1*f30^-1*f2\
5^-1*f22^-1*f21^-1*f17^-1*f8^-1, f5^-1*f1^-1*f5*f1*f8^-1, 
  f5^-1*f3^-1*f5*f3*f53^-1*f52^-1*f50^-1*f48^-1*f47^-1*f46^-1*f45^-1*f40^-1*f3\
7^-1*f36^-1*f34^-1*f31^-1*f30^-1*f29^-1*f25^-1*f22^-1*f18^-1*f14^-1*f11^-1, 
  f5^-1*f4^-1*f5*f4*f52^-1*f46^-1*f43^-1*f42^-1*f41^-1*f39^-1*f36^-1*f31^-1*f3\
0^-1*f25^-1*f22^-1*f18^-1*f17^-1*f14^-1, 
  f6^-1*f1^-1*f6*f1*f53^-1*f49^-1*f46^-1*f45^-1*f41^-1*f40^-1*f36^-1*f34^-1*f3\
1^-1*f29^-1*f26^-1*f22^-1*f21^-1*f17^-1*f11^-1, f6^-1*f2^-1*f6*f2*f9^-1, 
  f6^-1*f3^-1*f6*f3*f52^-1*f50^-1*f47^-1*f46^-1*f44^-1*f43^-1*f40^-1*f37^-1*f3\
5^-1*f31^-1*f30^-1*f29^-1*f25^-1*f22^-1*f21^-1*f14^-1, 
  f6^-1*f4^-1*f6*f4*f53^-1*f51^-1*f49^-1*f47^-1*f45^-1*f44^-1*f43^-1*f41^-1*f3\
9^-1*f35^-1*f29^-1*f26^-1*f25^-1*f21^-1*f14^-1, 
  f6^-1*f5^-1*f6*f5*f50^-1*f48^-1*f47^-1*f46^-1*f43^-1*f37^-1*f35^-1*f34^-1*f3\
1^-1*f30^-1*f29^-1*f26^-1*f22^-1*f18^-1*f17^-1, 
  f7^-1*f2^-1*f7*f2*f53^-1*f51^-1*f48^-1*f44^-1*f43^-1*f42^-1*f40^-1*f39^-1*f3\
7^-1*f26^-1*f21^-1*f14^-1*f12^-1*f11^-1*f9^-1, 
  f7^-1*f3^-1*f7*f3*f53^-1*f50^-1*f49^-1*f48^-1*f46^-1*f43^-1*f42^-1*f40^-1*f3\
7^-1*f36^-1*f25^-1*f21^-1, 
  f7^-1*f5^-1*f7*f5*f53^-1*f52^-1*f50^-1*f49^-1*f46^-1*f45^-1*f44^-1*f43^-1*f4\
2^-1*f40^-1*f39^-1*f34^-1*f29^-1*f25^-1, 
  f7^-1*f6^-1*f7*f6*f53^-1*f52^-1*f51^-1*f50^-1*f49^-1*f48^-1*f47^-1*f44^-1*f4\
3^-1*f41^-1*f40^-1*f39^-1*f34^-1*f30^-1*f29^-1, 
  f8^-1*f1^-1*f8*f1*f53^-1*f51^-1*f50^-1*f43^-1*f41^-1*f39^-1*f35^-1*f29^-1*f2\
1^-1*f18^-1*f14^-1, f8^-1*f2^-1*f8*f2*f11^-1, 
  f8^-1*f3^-1*f8*f3*f52^-1*f51^-1*f50^-1*f49^-1*f48^-1*f45^-1*f41^-1*f37^-1*f3\
6^-1*f35^-1*f34^-1*f31^-1*f30^-1*f26^-1*f14^-1, 
  f8^-1*f4^-1*f8*f4*f52^-1*f49^-1*f48^-1*f44^-1*f42^-1*f40^-1*f37^-1*f36^-1*f3\
1^-1*f30^-1*f22^-1*f17^-1, 
  f8^-1*f5^-1*f8*f5*f53^-1*f52^-1*f51^-1*f46^-1*f44^-1*f43^-1*f31^-1*f30^-1*f2\
5^-1*f22^-1*f21^-1*f17^-1, 
  f8^-1*f6^-1*f8*f6*f52^-1*f51^-1*f47^-1*f45^-1*f44^-1*f43^-1*f36^-1*f29^-1*f2\
6^-1*f22^-1*f21^-1, f8^-1*f7^-1*f8*f7*f49^-1*f46^-1*f44^-1*f29^-1, 
  f9^-1*f1^-1*f9*f1*f53^-1*f50^-1*f49^-1*f48^-1*f47^-1*f44^-1*f39^-1*f34^-1*f3\
1^-1*f30^-1*f29^-1*f22^-1*f21^-1*f17^-1*f14^-1, f9^-1*f2^-1*f9*f2*f12^-1, 
  f9^-1*f3^-1*f9*f3*f53^-1*f51^-1*f50^-1*f48^-1*f47^-1*f45^-1*f44^-1*f43^-1*f4\
2^-1*f41^-1*f40^-1*f39^-1*f37^-1*f36^-1*f35^-1*f30^-1*f18^-1, 
  f9^-1*f4^-1*f9*f4*f53^-1*f51^-1*f48^-1*f47^-1*f46^-1*f45^-1*f42^-1*f40^-1*f3\
9^-1*f37^-1*f36^-1*f35^-1*f30^-1*f17^-1, 
  f9^-1*f5^-1*f9*f5*f53^-1*f50^-1*f49^-1*f46^-1*f45^-1*f41^-1*f39^-1*f34^-1*f3\
1^-1*f30^-1*f26^-1*f25^-1*f21^-1, 
  f9^-1*f6^-1*f9*f6*f51^-1*f50^-1*f49^-1*f48^-1*f47^-1*f46^-1*f45^-1*f43^-1*f4\
0^-1*f39^-1*f37^-1*f35^-1*f31^-1*f29^-1*f26^-1, 
  f9^-1*f7^-1*f9*f7*f53^-1*f52^-1*f51^-1*f50^-1*f48^-1*f46^-1*f45^-1*f44^-1*f4\
3^-1*f39^-1*f35^-1, 
  f9^-1*f8^-1*f9*f8*f53^-1*f48^-1*f45^-1*f44^-1*f41^-1*f35^-1*f34^-1, 
  f10^-1*f2^-1*f10*f2*f53^-1*f52^-1*f51^-1*f49^-1*f47^-1*f46^-1*f45^-1*f44^-1*\
f43^-1*f42^-1*f41^-1*f40^-1*f39^-1*f35^-1*f34^-1*f25^-1*f22^-1*f21^-1*f18^-1*f\
17^-1*f12^-1, 
  f10^-1*f3^-1*f10*f3*f50^-1*f48^-1*f46^-1*f44^-1*f41^-1*f39^-1*f34^-1, 
  f10^-1*f5^-1*f10*f5*f50^-1*f49^-1*f48^-1*f46^-1*f43^-1*f39^-1, 
  f10^-1*f6^-1*f10*f6*f52^-1*f50^-1*f48^-1*f44^-1*f43^-1, 
  f10^-1*f8^-1*f10*f8*f50^-1*f43^-1, f10^-1*f9^-1*f10*f9*f49^-1, 
  f11^-1*f1^-1*f11*f1*f14^-1, 
  f11^-1*f2^-1*f11*f2*f53^-1*f52^-1*f47^-1*f45^-1*f43^-1*f41^-1*f37^-1*f35^-1*\
f34^-1*f31^-1*f29^-1*f26^-1*f25^-1*f22^-1*f17^-1, 
  f11^-1*f3^-1*f11*f3*f51^-1*f50^-1*f44^-1*f36^-1*f35^-1*f34^-1*f31^-1*f22^-1*\
f21^-1*f18^-1, 
  f11^-1*f4^-1*f11*f4*f52^-1*f51^-1*f49^-1*f48^-1*f47^-1*f45^-1*f43^-1*f42^-1*\
f40^-1*f39^-1*f36^-1*f34^-1*f31^-1*f25^-1*f17^-1, 
  f11^-1*f5^-1*f11*f5*f52^-1*f48^-1*f47^-1*f46^-1*f45^-1*f44^-1*f37^-1*f35^-1*\
f30^-1*f29^-1*f26^-1*f21^-1, 
  f11^-1*f6^-1*f11*f6*f52^-1*f51^-1*f49^-1*f45^-1*f44^-1*f42^-1*f41^-1*f40^-1*\
f39^-1*f35^-1*f29^-1*f26^-1, 
  f11^-1*f7^-1*f11*f7*f53^-1*f52^-1*f51^-1*f45^-1*f44^-1*f35^-1, 
  f11^-1*f9^-1*f11*f9*f49^-1*f47^-1*f46^-1*f45^-1*f44^-1*f43^-1*f41^-1*f40^-1*\
f36^-1*f35^-1*f34^-1, f11^-1*f10^-1*f11*f10*f49^-1, 
  f12^-1*f1^-1*f12*f1*f52^-1*f49^-1*f48^-1*f46^-1*f45^-1*f44^-1*f43^-1*f37^-1*\
f34^-1*f31^-1*f30^-1*f25^-1*f22^-1, f12^-1*f2^-1*f12*f2*f15^-1, 
  f12^-1*f3^-1*f12*f3*f52^-1*f49^-1*f48^-1*f47^-1*f45^-1*f44^-1*f36^-1*f30^-1*\
f29^-1*f26^-1*f25^-1, 
  f12^-1*f4^-1*f12*f4*f52^-1*f51^-1*f49^-1*f47^-1*f46^-1*f41^-1*f40^-1*f37^-1*\
f35^-1*f34^-1*f29^-1*f25^-1, 
  f12^-1*f5^-1*f12*f5*f53^-1*f49^-1*f47^-1*f45^-1*f44^-1*f42^-1*f37^-1*f36^-1*\
f35^-1*f34^-1*f30^-1*f29^-1, 
  f12^-1*f6^-1*f12*f6*f49^-1*f48^-1*f46^-1*f45^-1*f42^-1*f41^-1*f37^-1*f36^-1,
  f12^-1*f7^-1*f12*f7*f51^-1*f50^-1*f45^-1*f44^-1*f43^-1, 
  f12^-1*f8^-1*f12*f8*f52^-1*f50^-1*f48^-1*f47^-1*f46^-1*f45^-1*f44^-1*f43^-1*\
f40^-1*f36^-1*f35^-1*f34^-1, 
  f12^-1*f9^-1*f12*f9*f52^-1*f50^-1*f48^-1*f43^-1*f41^-1*f40^-1, 
  f12^-1*f11^-1*f12*f11*f52^-1*f51^-1*f48^-1*f43^-1*f41^-1*f40^-1, 
  f13^-1*f2^-1*f13*f2*f53^-1*f52^-1*f46^-1*f45^-1*f44^-1*f41^-1*f39^-1*f34^-1*\
f31^-1*f30^-1*f26^-1*f25^-1*f21^-1*f19^-1*f15^-1, f13^-1*f3^-1*f13*f3*f48^-1, 
  f14^-1*f1^-1*f14*f1*f17^-1, f14^-1*f2^-1*f14*f2*f18^-1, 
  f14^-1*f3^-1*f14*f3*f53^-1*f52^-1*f51^-1*f46^-1*f45^-1*f42^-1*f41^-1*f39^-1*\
f37^-1*f36^-1*f34^-1*f31^-1*f29^-1*f26^-1*f25^-1*f22^-1*f21^-1, 
  f14^-1*f4^-1*f14*f4*f53^-1*f52^-1*f50^-1*f47^-1*f45^-1*f43^-1*f42^-1*f40^-1*\
f34^-1*f31^-1*f30^-1*f25^-1, 
  f14^-1*f5^-1*f14*f5*f53^-1*f52^-1*f51^-1*f50^-1*f48^-1*f47^-1*f46^-1*f42^-1*\
f41^-1*f36^-1*f34^-1*f31^-1*f25^-1, 
  f14^-1*f6^-1*f14*f6*f49^-1*f47^-1*f40^-1*f36^-1*f35^-1*f34^-1*f31^-1, 
  f14^-1*f7^-1*f14*f7*f52^-1*f46^-1*f45^-1*f39^-1, 
  f14^-1*f8^-1*f14*f8*f52^-1*f47^-1*f46^-1*f45^-1*f44^-1*f41^-1*f36^-1*f35^-1*\
f34^-1, 
  f14^-1*f9^-1*f14*f9*f51^-1*f48^-1*f47^-1*f46^-1*f44^-1*f43^-1*f40^-1*f36^-1*\
f35^-1*f34^-1, 
  f14^-1*f11^-1*f14*f11*f52^-1*f50^-1*f49^-1*f47^-1*f46^-1*f45^-1*f44^-1*f43^-\
1*f40^-1*f36^-1*f35^-1*f34^-1, f14^-1*f12^-1*f14*f12*f50^-1*f49^-1*f48^-1, 
  f15^-1*f1^-1*f15*f1*f52^-1*f51^-1*f48^-1*f46^-1*f45^-1*f44^-1*f43^-1*f42^-1*\
f36^-1*f31^-1*f29^-1*f25^-1, f15^-1*f2^-1*f15*f2*f19^-1, 
  f15^-1*f3^-1*f15*f3*f51^-1*f48^-1*f40^-1*f39^-1*f37^-1*f30^-1, 
  f15^-1*f4^-1*f15*f4*f51^-1*f45^-1*f44^-1*f43^-1*f36^-1*f29^-1, 
  f15^-1*f5^-1*f15*f5*f53^-1*f52^-1*f47^-1*f46^-1*f45^-1*f44^-1*f43^-1*f41^-1*\
f40^-1*f39^-1*f34^-1, 
  f15^-1*f6^-1*f15*f6*f53^-1*f50^-1*f49^-1*f47^-1*f45^-1*f43^-1*f40^-1, 
  f15^-1*f7^-1*f15*f7*f49^-1, f15^-1*f11^-1*f15*f11*f50^-1*f49^-1*f48^-1, 
  f15^-1*f14^-1*f15*f14*f50^-1*f49^-1*f48^-1, 
  f16^-1*f2^-1*f16*f2*f51^-1*f48^-1*f46^-1*f44^-1*f42^-1*f41^-1*f40^-1*f39^-1*\
f37^-1*f36^-1*f35^-1*f30^-1*f29^-1*f19^-1, 
  f17^-1*f1^-1*f17*f1*f53^-1*f49^-1*f48^-1*f47^-1*f43^-1*f42^-1*f40^-1*f39^-1*\
f36^-1*f34^-1*f31^-1*f30^-1*f29^-1*f25^-1, f17^-1*f2^-1*f17*f2*f21^-1, 
  f17^-1*f3^-1*f17*f3*f52^-1*f51^-1*f49^-1*f47^-1*f46^-1*f45^-1*f44^-1*f43^-1*\
f42^-1*f40^-1*f39^-1*f37^-1*f34^-1*f25^-1, 
  f17^-1*f4^-1*f17*f4*f53^-1*f52^-1*f51^-1*f49^-1*f48^-1*f39^-1*f36^-1*f35^-1*\
f29^-1, 
  f17^-1*f5^-1*f17*f5*f52^-1*f51^-1*f50^-1*f47^-1*f45^-1*f44^-1*f41^-1*f39^-1*\
f35^-1*f34^-1*f29^-1, 
  f17^-1*f6^-1*f17*f6*f52^-1*f50^-1*f49^-1*f48^-1*f47^-1*f46^-1*f45^-1*f44^-1*\
f43^-1*f40^-1*f35^-1*f34^-1, f17^-1*f7^-1*f17*f7*f43^-1, 
  f17^-1*f8^-1*f17*f8*f52^-1*f51^-1, 
  f17^-1*f9^-1*f17*f9*f52^-1*f51^-1*f49^-1*f48^-1*f46^-1*f45^-1, 
  f17^-1*f11^-1*f17*f11*f52^-1*f51^-1*f46^-1*f45^-1, 
  f17^-1*f12^-1*f17*f12*f50^-1*f49^-1*f48^-1, 
  f17^-1*f14^-1*f17*f14*f50^-1*f49^-1*f48^-1, f18^-1*f1^-1*f18*f1*f22^-1, 
  f18^-1*f2^-1*f18*f2*f53^-1*f51^-1*f49^-1*f48^-1*f46^-1*f43^-1*f42^-1*f37^-1*\
f36^-1*f34^-1*f31^-1*f30^-1*f25^-1, 
  f18^-1*f3^-1*f18*f3*f53^-1*f51^-1*f49^-1*f48^-1*f46^-1*f45^-1*f44^-1*f43^-1*\
f39^-1*f36^-1*f35^-1*f31^-1*f30^-1*f29^-1*f26^-1, 
  f18^-1*f4^-1*f18*f4*f53^-1*f50^-1*f49^-1*f48^-1*f47^-1*f45^-1*f44^-1*f42^-1*\
f41^-1*f40^-1*f37^-1*f36^-1*f34^-1*f25^-1, 
  f18^-1*f5^-1*f18*f5*f52^-1*f50^-1*f49^-1*f47^-1*f43^-1*f41^-1*f37^-1*f30^-1,
  f18^-1*f6^-1*f18*f6*f52^-1*f51^-1*f50^-1*f49^-1*f48^-1*f47^-1*f46^-1*f44^-1*\
f43^-1*f40^-1*f37^-1*f36^-1*f35^-1*f34^-1, 
  f18^-1*f7^-1*f18*f7*f51^-1*f45^-1*f44^-1, 
  f18^-1*f8^-1*f18*f8*f52^-1*f50^-1*f49^-1*f47^-1*f46^-1*f45^-1*f44^-1*f43^-1*\
f40^-1*f36^-1*f35^-1*f34^-1, 
  f18^-1*f9^-1*f18*f9*f52^-1*f50^-1*f49^-1*f43^-1*f41^-1*f40^-1, 
  f18^-1*f11^-1*f18*f11*f52^-1*f51^-1*f48^-1*f43^-1*f41^-1*f40^-1, 
  f18^-1*f12^-1*f18*f12*f50^-1*f49^-1*f48^-1, 
  f18^-1*f17^-1*f18*f17*f50^-1*f49^-1*f48^-1, 
  f19^-1*f1^-1*f19*f1*f53^-1*f52^-1*f51^-1*f49^-1*f46^-1*f44^-1*f43^-1*f42^-1*\
f35^-1, f19^-1*f2^-1*f19*f2*f23^-1, 
  f19^-1*f3^-1*f19*f3*f52^-1*f51^-1*f49^-1*f47^-1*f46^-1*f43^-1*f40^-1*f39^-1,
  f19^-1*f4^-1*f19*f4*f51^-1*f50^-1*f48^-1*f46^-1*f39^-1, 
  f19^-1*f5^-1*f19*f5*f52^-1*f51^-1*f49^-1*f44^-1*f43^-1, 
  f19^-1*f6^-1*f19*f6*f51^-1*f50^-1, f19^-1*f8^-1*f19*f8*f50^-1*f49^-1*f48^-1,
  f20^-1*f2^-1*f20*f2*f53^-1*f52^-1*f47^-1*f46^-1*f45^-1*f44^-1*f43^-1*f41^-1*\
f40^-1*f39^-1*f34^-1*f27^-1*f23^-1, f21^-1*f1^-1*f21*f1*f25^-1, 
  f21^-1*f2^-1*f21*f2*f52^-1*f50^-1*f48^-1*f47^-1*f45^-1*f39^-1*f35^-1*f29^-1,
  f21^-1*f3^-1*f21*f3*f53^-1*f51^-1*f50^-1*f49^-1*f48^-1*f43^-1*f35^-1*f34^-1*\
f30^-1, f21^-1*f4^-1*f21*f4*f49^-1*f46^-1*f39^-1*f29^-1, 
  f21^-1*f5^-1*f21*f5*f51^-1*f50^-1*f49^-1*f44^-1*f43^-1*f40^-1*f34^-1, 
  f21^-1*f6^-1*f21*f6*f52^-1*f51^-1*f49^-1*f46^-1*f45^-1*f43^-1*f40^-1, 
  f21^-1*f7^-1*f21*f7*f49^-1, f21^-1*f8^-1*f21*f8*f46^-1*f45^-1, 
  f21^-1*f9^-1*f21*f9*f52^-1*f51^-1*f50^-1*f49^-1*f48^-1, 
  f21^-1*f11^-1*f21*f11*f52^-1*f51^-1, 
  f21^-1*f14^-1*f21*f14*f50^-1*f49^-1*f48^-1, 
  f22^-1*f1^-1*f22*f1*f50^-1*f49^-1*f48^-1*f47^-1*f46^-1*f45^-1*f44^-1*f41^-1*\
f40^-1*f37^-1*f36^-1*f35^-1*f34^-1*f25^-1, f22^-1*f2^-1*f22*f2*f26^-1, 
  f22^-1*f3^-1*f22*f3*f52^-1*f51^-1*f47^-1*f46^-1*f44^-1*f43^-1*f42^-1*f40^-1*\
f37^-1*f35^-1*f34^-1*f31^-1*f30^-1, 
  f22^-1*f4^-1*f22*f4*f52^-1*f49^-1*f46^-1*f45^-1*f42^-1*f39^-1*f29^-1, 
  f22^-1*f5^-1*f22*f5*f53^-1*f51^-1*f50^-1*f47^-1*f46^-1*f44^-1*f43^-1*f42^-1*\
f40^-1*f36^-1*f34^-1, f22^-1*f6^-1*f22*f6*f49^-1*f43^-1*f42^-1*f41^-1*f40^-1, 
  f22^-1*f7^-1*f22*f7*f50^-1*f49^-1, 
  f22^-1*f8^-1*f22*f8*f52^-1*f51^-1*f46^-1*f45^-1, 
  f22^-1*f9^-1*f22*f9*f46^-1*f45^-1, 
  f22^-1*f11^-1*f22*f11*f50^-1*f49^-1*f48^-1*f46^-1*f45^-1, 
  f22^-1*f14^-1*f22*f14*f50^-1*f49^-1*f48^-1, 
  f23^-1*f1^-1*f23*f1*f53^-1*f46^-1*f45^-1*f43^-1*f39^-1, 
  f23^-1*f2^-1*f23*f2*f27^-1, f23^-1*f3^-1*f23*f3*f52^-1*f51^-1*f44^-1, 
  f23^-1*f4^-1*f23*f4*f43^-1, f23^-1*f5^-1*f23*f5*f48^-1, 
  f24^-1*f2^-1*f24*f2*f52^-1*f51^-1*f49^-1*f48^-1*f44^-1*f43^-1*f27^-1, 
  f25^-1*f1^-1*f25*f1*f29^-1, f25^-1*f2^-1*f25*f2*f30^-1, 
  f25^-1*f3^-1*f25*f3*f51^-1*f50^-1*f45^-1*f43^-1*f40^-1*f39^-1*f35^-1*f34^-1,
  f25^-1*f4^-1*f25*f4*f52^-1*f51^-1*f46^-1*f44^-1*f43^-1*f39^-1, 
  f25^-1*f5^-1*f25*f5*f50^-1*f48^-1*f46^-1*f39^-1, 
  f25^-1*f6^-1*f25*f6*f52^-1*f51^-1*f50^-1*f49^-1*f48^-1*f45^-1, 
  f25^-1*f8^-1*f25*f8*f50^-1*f49^-1*f48^-1, 
  f25^-1*f9^-1*f25*f9*f50^-1*f49^-1*f48^-1, 
  f25^-1*f11^-1*f25*f11*f50^-1*f49^-1*f48^-1, f26^-1*f1^-1*f26*f1*f31^-1, 
  f26^-1*f2^-1*f26*f2*f53^-1*f52^-1*f51^-1*f50^-1*f46^-1*f44^-1*f43^-1*f42^-1*\
f36^-1*f34^-1, f26^-1*f3^-1*f26*f3*f48^-1*f44^-1*f42^-1*f41^-1*f39^-1*f37^-1, 
  f26^-1*f4^-1*f26*f4*f53^-1*f45^-1*f36^-1, 
  f26^-1*f5^-1*f26*f5*f52^-1*f50^-1*f49^-1*f47^-1*f43^-1*f41^-1, 
  f26^-1*f6^-1*f26*f6*f52^-1*f51^-1*f47^-1*f46^-1*f45^-1, 
  f26^-1*f8^-1*f26*f8*f50^-1*f49^-1*f48^-1*f46^-1*f45^-1, 
  f26^-1*f9^-1*f26*f9*f52^-1*f51^-1, f26^-1*f11^-1*f26*f11*f52^-1*f51^-1, 
  f27^-1*f1^-1*f27*f1*f49^-1, f27^-1*f2^-1*f27*f2*f32^-1, 
  f28^-1*f2^-1*f28*f2*f48^-1*f38^-1*f32^-1, 
  f29^-1*f1^-1*f29*f1*f52^-1*f51^-1*f50^-1*f46^-1*f44^-1*f39^-1, 
  f29^-1*f2^-1*f29*f2*f34^-1, f29^-1*f3^-1*f29*f3*f52^-1*f39^-1, 
  f29^-1*f4^-1*f29*f4*f50^-1*f49^-1*f43^-1, 
  f29^-1*f5^-1*f29*f5*f49^-1*f48^-1*f43^-1, f29^-1*f6^-1*f29*f6*f49^-1*f48^-1,
  f30^-1*f1^-1*f30*f1*f35^-1, 
  f30^-1*f2^-1*f30*f2*f52^-1*f50^-1*f48^-1*f46^-1*f44^-1*f39^-1, 
  f30^-1*f3^-1*f30*f3*f52^-1*f51^-1*f50^-1*f49^-1*f45^-1*f44^-1*f43^-1*f40^-1,
  f30^-1*f4^-1*f30*f4*f52^-1*f50^-1*f46^-1*f45^-1*f39^-1, 
  f30^-1*f5^-1*f30*f5*f52^-1*f44^-1, 
  f30^-1*f6^-1*f30*f6*f51^-1*f50^-1*f49^-1*f48^-1, 
  f30^-1*f8^-1*f30*f8*f50^-1*f49^-1*f48^-1, f31^-1*f1^-1*f31*f1*f36^-1, 
  f31^-1*f2^-1*f31*f2*f37^-1, 
  f31^-1*f3^-1*f31*f3*f53^-1*f50^-1*f47^-1*f46^-1*f42^-1*f41^-1, 
  f31^-1*f4^-1*f31*f4*f53^-1*f51^-1*f50^-1*f49^-1*f48^-1*f45^-1, 
  f31^-1*f5^-1*f31*f5*f53^-1*f50^-1*f49^-1*f48^-1*f45^-1, 
  f31^-1*f6^-1*f31*f6*f53^-1*f52^-1*f51^-1, f32^-1*f2^-1*f32*f2*f38^-1, 
  f33^-1*f2^-1*f33*f2*f38^-1, f34^-1*f1^-1*f34*f1*f39^-1, 
  f34^-1*f2^-1*f34*f2*f49^-1*f43^-1, f34^-1*f3^-1*f34*f3*f49^-1*f48^-1*f44^-1,
  f34^-1*f4^-1*f34*f4*f43^-1, f34^-1*f5^-1*f34*f5*f48^-1, 
  f35^-1*f1^-1*f35*f1*f52^-1*f50^-1*f49^-1*f46^-1*f45^-1*f39^-1, 
  f35^-1*f2^-1*f35*f2*f40^-1, 
  f35^-1*f3^-1*f35*f3*f52^-1*f49^-1*f48^-1*f45^-1*f44^-1, 
  f35^-1*f4^-1*f35*f4*f43^-1, f35^-1*f5^-1*f35*f5*f50^-1*f48^-1, 
  f36^-1*f1^-1*f36*f1*f53^-1*f51^-1*f49^-1*f48^-1*f45^-1, 
  f36^-1*f2^-1*f36*f2*f41^-1, f36^-1*f3^-1*f36*f3*f52^-1*f51^-1*f46^-1, 
  f36^-1*f4^-1*f36*f4*f50^-1, f36^-1*f5^-1*f36*f5*f50^-1, 
  f37^-1*f1^-1*f37*f1*f42^-1, 
  f37^-1*f2^-1*f37*f2*f53^-1*f51^-1*f50^-1*f49^-1*f48^-1*f45^-1, 
  f37^-1*f3^-1*f37*f3*f53^-1*f51^-1*f50^-1*f47^-1, 
  f37^-1*f4^-1*f37*f4*f52^-1*f51^-1*f50^-1*f49^-1*f48^-1*f45^-1, 
  f37^-1*f5^-1*f37*f5*f51^-1, f39^-1*f1^-1*f39*f1*f43^-1, 
  f39^-1*f2^-1*f39*f2*f44^-1, f39^-1*f3^-1*f39*f3*f49^-1*f48^-1, 
  f40^-1*f1^-1*f40*f1*f45^-1, f40^-1*f2^-1*f40*f2*f50^-1*f48^-1, 
  f40^-1*f3^-1*f40*f3*f51^-1, f40^-1*f4^-1*f40*f4*f50^-1, 
  f41^-1*f1^-1*f41*f1*f46^-1, f41^-1*f2^-1*f41*f2*f50^-1, 
  f41^-1*f3^-1*f41*f3*f52^-1, f41^-1*f4^-1*f41*f4*f50^-1, 
  f42^-1*f1^-1*f42*f1*f52^-1*f51^-1*f50^-1*f49^-1*f48^-1*f45^-1, 
  f42^-1*f2^-1*f42*f2*f47^-1, f42^-1*f3^-1*f42*f3*f53^-1*f51^-1, 
  f42^-1*f4^-1*f42*f4*f50^-1, f43^-1*f2^-1*f43*f2*f48^-1, 
  f44^-1*f1^-1*f44*f1*f49^-1, f45^-1*f1^-1*f45*f1*f50^-1, 
  f45^-1*f2^-1*f45*f2*f51^-1, f46^-1*f1^-1*f46*f1*f50^-1, 
  f46^-1*f2^-1*f46*f2*f52^-1, f47^-1*f1^-1*f47*f1*f53^-1 ]
gap> STOP_TEST( "anusp.tst", 1000000 );
