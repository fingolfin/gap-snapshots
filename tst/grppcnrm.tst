#############################################################################
##
#W  grppcnrm.tst                GAP library                      Frank Celler
##
#H  @(#)$Id: grppcnrm.tst,v 4.11.2.4 2005/08/29 14:50:35 gap Exp $
##
#Y  Copyright (C)  1996,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  To be listed in testall.g
##

gap> START_TEST("$Id: grppcnrm.tst,v 4.11.2.4 2005/08/29 14:50:35 gap Exp $");


#############################################################################

# construct a nice big group
gap> f := FreeGroup(IsSyllableWordsFamily,65);;
gap> g := GeneratorsOfGroup(f);;

# setup generators as "fn"
gap> f1 := g[1];; f2 := g[2];; f3 := g[3];; f4 := g[4];; f5 := g[5];; f6 :=
gap> g[6];; f7 := g[7];; f8 := g[8];; f9 := g[9];; f10 := g[10];; f11 :=
gap> g[11];; f12 := g[12];; f13 := g[13];; f14 := g[14];; f15 := g[15];;
gap> f16 := g[16];; f17 := g[17];; f18 := g[18];; f19 := g[19];; f20 :=
gap> g[20];; f21 := g[21];; f22 := g[22];; f23 := g[23];; f24 := g[24];;
gap> f25 := g[25];; f26 := g[26];; f27 := g[27];; f28 := g[28];; f29 :=
gap> g[29];; f30 := g[30];; f31 := g[31];; f32 := g[32];; f33 := g[33];;
gap> f34 := g[34];; f35 := g[35];; f36 := g[36];; f37 := g[37];; f38 :=
gap> g[38];; f39 := g[39];; f40 := g[40];; f41 := g[41];; f42 := g[42];;
gap> f43 := g[43];; f44 := g[44];; f45 := g[45];; f46 := g[46];; f47 :=
gap> g[47];; f48 := g[48];; f49 := g[49];; f50 := g[50];; f51 := g[51];;
gap> f52 := g[52];; f53 := g[53];; f54 := g[54];; f55 := g[55];; f56 :=
gap> g[56];; f57 := g[57];; f58 := g[58];; f59 := g[59];; f60 := g[60];;
gap> f61 := g[61];; f62 := g[62];; f63 := g[63];; f64 := g[64];; f65 :=
gap> g[65];;


# and now the relators
gap> r := [ [ 2, f4*f8^2 ], [ 6, f8 ], [ 7, f9 ], [ 2, 1, f8^2 ], [ 4, 1,
gap> f8 ], [ 5, 1, f5 ], [ 6, 1, f6*f8^2 ], [ 7, 1, f8^2 ], [ 8, 1, f8 ], [
gap> 10, 1, f11^6 ], [ 11, 1, f11^5 ], [ 24, 1, f24*f36 ], [ 25, 1, f25*f37
gap> ], [ 26, 1, f26*f38 ], [ 27, 1, f27*f39 ], [ 28, 1, f28*f40 ], [ 29,
gap> 1, f29*f41 ], [ 30, 1, f30*f42 ], [ 31, 1, f31*f43 ], [ 32, 1, f32*f44
gap> ], [ 33, 1, f33*f45 ], [ 34, 1, f34*f46 ], [ 35, 1, f35*f47 ], [ 36,
gap> 1, f24*f36 ], [ 37, 1, f25*f37 ], [ 38, 1, f26*f38 ], [ 39, 1, f27*f39
gap> ], [ 40, 1, f28*f40 ], [ 41, 1, f29*f41 ], [ 42, 1, f30*f42 ], [ 43,
gap> 1, f31*f43 ], [ 44, 1, f32*f44 ], [ 45, 1, f33*f45 ], [ 46, 1, f34*f46
gap> ], [ 47, 1, f35*f47 ], [ 54, 1, f54*f60 ], [ 55, 1, f55*f61 ], [ 56,
gap> 1, f56*f62 ], [ 57, 1, f57*f63 ], [ 58, 1, f58*f64 ], [ 59, 1, f59*f65
gap> ], [ 60, 1, f54*f60 ], [ 61, 1, f55*f61 ], [ 62, 1, f56*f62 ], [ 63,
gap> 1, f57*f63 ], [ 64, 1, f58*f64 ], [ 65, 1, f59*f65 ], [ 5, 2, f6*f7 ],
gap> [ 24, 2, f28 ], [ 25, 2, f24*f25*f27*f28 ], [ 26, 2, f25 ], [ 27, 2,
gap> f26 ], [ 28, 2, f26*f27*f28*f29 ], [ 29, 2, f24 ], [ 30, 2,
gap> f31*f32*f33*f35*f54*f56*f57*f59 ], [ 31, 2,
gap> f30*f31*f34*f35*f54*f55*f56*f58*f59 ], [ 32, 2,
gap> f31*f32*f35*f54*f55*f56*f57*f59 ], [ 33, 2, f31*f35*f54*f55*f58*f59 ],
gap> [ 34, 2, f30*f31*f33*f35*f54*f55*f57 ], [ 35, 2,
gap> f30*f31*f32*f34*f55*f56*f58 ], [ 36, 2, f37*f40*f41 ], [ 37, 2,
gap> f38*f41 ], [ 38, 2, f37*f38*f40*f41 ], [ 39, 2, f36*f37*f40*f41 ], [
gap> 40, 2, f37*f38*f41 ], [ 41, 2, f36*f37*f39*f40*f41 ], [ 42, 2, f46*f65
gap> ], [ 43, 2, f46*f47*f60*f65 ], [ 44, 2, f42*f47*f61 ], [ 45, 2,
gap> f43*f46*f62*f65 ], [ 46, 2, f44*f46*f47*f63*f65 ], [ 47, 2,
gap> f45*f47*f64 ], [ 54, 2, f54*f56*f58 ], [ 55, 2,
gap> f54*f55*f56*f57*f58*f59 ], [ 56, 2, f55*f56*f57*f58*f59 ], [ 57, 2,
gap> f57*f59 ], [ 58, 2, f54*f56 ], [ 59, 2, f55*f57 ], [ 60, 2, f65 ], [
gap> 61, 2, f60*f65 ], [ 62, 2, f61 ], [ 63, 2, f62*f65 ], [ 64, 2, f63*f65
gap> ], [ 65, 2, f64 ], [ 12, 3, f12*f13*f14*f16*f17 ], [ 13, 3,
gap> f13*f15*f16 ], [ 14, 3, f13*f17 ], [ 15, 3, f13*f15*f16*f17 ], [ 16,
gap> 3, f14*f16*f17 ], [ 17, 3, f12*f13*f16 ], [ 18, 3,
gap> f19*f21*f22*f48*f50*f52 ], [ 19, 3,
gap> f18*f19*f20*f21*f23*f48*f49*f50*f51*f52*f53 ], [ 20, 3,
gap> f19*f20*f21*f22*f49*f50*f51*f52*f53 ], [ 21, 3, f19*f20*f23*f51*f53 ],
gap> [ 22, 3, f19*f20*f22*f48*f50 ], [ 23, 3, f18*f20*f21*f23*f49*f51 ], [
gap> 24, 3, f24*f25*f26*f28*f29 ], [ 25, 3, f25*f27*f28 ], [ 26, 3, f25*f29
gap> ], [ 27, 3, f25*f27*f28*f29 ], [ 28, 3, f26*f28*f29 ], [ 29, 3,
gap> f24*f25*f28 ], [ 30, 3, f31*f33*f34*f54*f56*f58 ], [ 31, 3,
gap> f30*f31*f32*f33*f35*f54*f55*f56*f57*f58*f59 ], [ 32, 3,
gap> f31*f32*f33*f34*f55*f56*f57*f58*f59 ], [ 33, 3, f31*f32*f35*f57*f59 ],
gap> [ 34, 3, f31*f32*f34*f54*f56 ], [ 35, 3, f30*f32*f33*f35*f55*f57 ], [
gap> 36, 3, f36*f37*f38*f40*f41 ], [ 37, 3, f37*f39*f40 ], [ 38, 3, f37*f41
gap> ], [ 39, 3, f37*f39*f40*f41 ], [ 40, 3, f38*f40*f41 ], [ 41, 3,
gap> f36*f37*f40 ], [ 42, 3, f43*f45*f46*f60*f62*f64 ], [ 43, 3,
gap> f42*f43*f44*f45*f47*f60*f61*f62*f63*f64*f65 ], [ 44, 3,
gap> f43*f44*f45*f46*f61*f62*f63*f64*f65 ], [ 45, 3, f43*f44*f47*f63*f65 ],
gap> [ 46, 3, f43*f44*f46*f60*f62 ], [ 47, 3, f42*f44*f45*f47*f61*f63 ], [
gap> 48, 3, f48*f50 ], [ 49, 3, f48*f49*f50*f51 ], [ 50, 3,
gap> f48*f49*f50*f51*f52 ], [ 51, 3, f49*f51*f52*f53 ], [ 52, 3,
gap> f48*f52*f53 ], [ 53, 3, f49*f53 ], [ 54, 3, f54*f56 ], [ 55, 3,
gap> f54*f55*f56*f57 ], [ 56, 3, f54*f55*f56*f57*f58 ], [ 57, 3,
gap> f55*f57*f58*f59 ], [ 58, 3, f54*f58*f59 ], [ 59, 3, f55*f59 ], [ 60,
gap> 3, f60*f62 ], [ 61, 3, f60*f61*f62*f63 ], [ 62, 3, f60*f61*f62*f63*f64
gap> ], [ 63, 3, f61*f63*f64*f65 ], [ 64, 3, f60*f64*f65 ], [ 65, 3,
gap> f61*f65 ], [ 5, 4, f8*f9^2 ], [ 36, 4, f37*f38*f40 ], [ 37, 4,
gap> f38*f39*f40 ], [ 38, 4, f37*f38*f39*f41 ], [ 39, 4, f36*f38*f40 ], [
gap> 40, 4, f36*f38*f41 ], [ 41, 4, f36*f38*f39 ], [ 42, 4,
gap> f45*f46*f61*f62*f63*f64*f65 ], [ 43, 4, f42*f45*f47*f60*f61 ], [ 44,
gap> 4, f42*f43*f46*f60*f61*f62 ], [ 45, 4, f42*f43*f44*f45*f46*f47*f64*f65
gap> ], [ 46, 4, f43*f44*f47*f60*f61*f62*f63*f64 ], [ 47, 4,
gap> f44*f45*f60*f61*f62*f63*f64*f65 ], [ 60, 4, f60*f63*f64 ], [ 61, 4,
gap> f60*f61*f63*f65 ], [ 62, 4, f60*f61*f62*f64 ], [ 63, 4,
gap> f60*f61*f62*f64*f65 ], [ 64, 4, f61*f62*f64*f65 ], [ 65, 4,
gap> f62*f63*f65 ], [ 6, 5, f7^2*f9^2 ], [ 7, 5, f8*f9^2 ], [ 8, 5, f9^2 ],
gap> [ 10, 5, f10^5*f11 ], [ 11, 5, f10^6*f11^6 ], [ 12, 5, f12*f24 ], [
gap> 13, 5, f13*f25 ], [ 14, 5, f14*f26 ], [ 15, 5, f15*f27 ], [ 16, 5,
gap> f16*f28 ], [ 17, 5, f17*f29 ], [ 18, 5, f18*f30 ], [ 19, 5, f19*f31 ],
gap> [ 20, 5, f20*f32 ], [ 21, 5, f21*f33 ], [ 22, 5, f22*f34 ], [ 23, 5,
gap> f23*f35 ], [ 24, 5, f24*f36 ], [ 25, 5, f25*f37 ], [ 26, 5, f26*f38 ],
gap> [ 27, 5, f27*f39 ], [ 28, 5, f28*f40 ], [ 29, 5, f29*f41 ], [ 30, 5,
gap> f30*f42 ], [ 31, 5, f31*f43 ], [ 32, 5, f32*f44 ], [ 33, 5, f33*f45 ],
gap> [ 34, 5, f34*f46 ], [ 35, 5, f35*f47 ], [ 36, 5, f12*f36 ], [ 37, 5,
gap> f13*f37 ], [ 38, 5, f14*f38 ], [ 39, 5, f15*f39 ], [ 40, 5, f16*f40 ],
gap> [ 41, 5, f17*f41 ], [ 42, 5, f18*f42 ], [ 43, 5, f19*f43 ], [ 44, 5,
gap> f20*f44 ], [ 45, 5, f21*f45 ], [ 46, 5, f22*f46 ], [ 47, 5, f23*f47 ],
gap> [ 48, 5, f48*f54 ], [ 49, 5, f49*f55 ], [ 50, 5, f50*f56 ], [ 51, 5,
gap> f51*f57 ], [ 52, 5, f52*f58 ], [ 53, 5, f53*f59 ], [ 54, 5, f54*f60 ],
gap> [ 55, 5, f55*f61 ], [ 56, 5, f56*f62 ], [ 57, 5, f57*f63 ], [ 58, 5,
gap> f58*f64 ], [ 59, 5, f59*f65 ], [ 60, 5, f48*f60 ], [ 61, 5, f49*f61 ],
gap> [ 62, 5, f50*f62 ], [ 63, 5, f51*f63 ], [ 64, 5, f52*f64 ], [ 65, 5,
gap> f53*f65 ], [ 24, 6, f26 ], [ 25, 6, f26*f27*f28*f29 ], [ 26, 6, f28 ],
gap> [ 27, 6, f24 ], [ 28, 6, f25 ], [ 29, 6, f27 ], [ 30, 6,
gap> f30*f32*f34*f56*f57 ], [ 31, 6, f30*f31*f32*f33*f34*f35*f56*f58 ], [
gap> 32, 6, f31*f32*f33*f34*f35*f54*f57*f59 ], [ 33, 6,
gap> f33*f35*f54*f55*f56*f57*f58 ], [ 34, 6, f30*f32*f54*f55*f58*f59 ], [
gap> 35, 6, f31*f33*f55*f56*f59 ], [ 36, 6, f37*f40*f41 ], [ 37, 6, f38*f41
gap> ], [ 38, 6, f37*f38*f40*f41 ], [ 39, 6, f36*f37*f40*f41 ], [ 40, 6,
gap> f37*f38*f41 ], [ 41, 6, f36*f37*f39*f40*f41 ], [ 42, 6, f46*f65 ], [
gap> 43, 6, f46*f47*f60*f65 ], [ 44, 6, f42*f47*f61 ], [ 45, 6,
gap> f43*f46*f62*f65 ], [ 46, 6, f44*f46*f47*f63*f65 ], [ 47, 6,
gap> f45*f47*f64 ], [ 54, 6, f54*f55*f56*f57*f58*f59 ], [ 55, 6, f54 ], [
gap> 56, 6, f54*f55 ], [ 57, 6, f57*f58*f59 ], [ 58, 6, f54*f55*f56*f57 ],
gap> [ 59, 6, f54*f55*f56*f57*f58 ], [ 60, 6, f65 ], [ 61, 6, f60*f65 ], [
gap> 62, 6, f61 ], [ 63, 6, f62*f65 ], [ 64, 6, f63*f65 ], [ 65, 6, f64 ],
gap> [ 12, 7, f14 ], [ 13, 7, f14*f15*f16*f17 ], [ 14, 7, f16 ], [ 15, 7,
gap> f12 ], [ 16, 7, f13 ], [ 17, 7, f15 ], [ 18, 7, f18*f20*f22*f50*f51 ],
gap> [ 19, 7, f18*f19*f20*f21*f22*f23*f50*f52 ], [ 20, 7,
gap> f19*f20*f21*f22*f23*f48*f51*f53 ], [ 21, 7,
gap> f21*f23*f48*f49*f50*f51*f52 ], [ 22, 7, f18*f20*f48*f49*f52*f53 ], [
gap> 23, 7, f19*f21*f49*f50*f53 ], [ 24, 7, f26 ], [ 25, 7, f26*f27*f28*f29
gap> ], [ 26, 7, f28 ], [ 27, 7, f24 ], [ 28, 7, f25 ], [ 29, 7, f27 ], [
gap> 30, 7, f30*f32*f34*f56*f57 ], [ 31, 7, f30*f31*f32*f33*f34*f35*f56*f58
gap> ], [ 32, 7, f31*f32*f33*f34*f35*f54*f57*f59 ], [ 33, 7,
gap> f33*f35*f54*f55*f56*f57*f58 ], [ 34, 7, f30*f32*f54*f55*f58*f59 ], [
gap> 35, 7, f31*f33*f55*f56*f59 ], [ 36, 7, f36*f39*f40*f41 ], [ 37, 7,
gap> f36*f38*f39 ], [ 38, 7, f36*f37*f38*f39 ], [ 39, 7, f36*f37*f39 ], [
gap> 40, 7, f36*f39*f41 ], [ 41, 7, f39*f40*f41 ], [ 42, 7,
gap> f44*f46*f47*f63*f64*f65 ], [ 43, 7, f44*f45*f46*f63 ], [ 44, 7,
gap> f45*f46*f47*f60*f64 ], [ 45, 7, f44*f60*f61*f63*f64 ], [ 46, 7,
gap> f42*f44*f45*f46*f47*f61*f62*f63 ], [ 47, 7,
gap> f43*f45*f46*f47*f62*f63*f64 ], [ 48, 7, f48*f49*f50*f51*f52*f53 ], [
gap> 49, 7, f48 ], [ 50, 7, f48*f49 ], [ 51, 7, f51*f52*f53 ], [ 52, 7,
gap> f48*f49*f50*f51 ], [ 53, 7, f48*f49*f50*f51*f52 ], [ 54, 7,
gap> f54*f55*f56*f57*f58*f59 ], [ 55, 7, f54 ], [ 56, 7, f54*f55 ], [ 57,
gap> 7, f57*f58*f59 ], [ 58, 7, f54*f55*f56*f57 ], [ 59, 7,
gap> f54*f55*f56*f57*f58 ], [ 60, 7, f64 ], [ 61, 7, f64*f65 ], [ 62, 7,
gap> f60*f65 ], [ 63, 7, f61*f64 ], [ 64, 7, f62*f64*f65 ], [ 65, 7,
gap> f63*f65 ], [ 24, 8, f25*f26*f28 ], [ 25, 8, f26*f27*f28 ], [ 26, 8,
gap> f25*f26*f27*f29 ], [ 27, 8, f24*f26*f28 ], [ 28, 8, f24*f26*f29 ], [
gap> 29, 8, f24*f26*f27 ], [ 30, 8, f33*f34*f55*f56*f57*f58*f59 ], [ 31, 8,
gap> f30*f33*f35*f54*f55 ], [ 32, 8, f30*f31*f34*f54*f55*f56 ], [ 33, 8,
gap> f30*f31*f32*f33*f34*f35*f58*f59 ], [ 34, 8,
gap> f31*f32*f35*f54*f55*f56*f57*f58 ], [ 35, 8,
gap> f32*f33*f54*f55*f56*f57*f58*f59 ], [ 36, 8, f36*f37*f38*f40 ], [ 37,
gap> 8, f37*f38*f39*f40 ], [ 38, 8, f37*f39*f41 ], [ 39, 8, f36*f38*f39*f40
gap> ], [ 40, 8, f36*f38*f40*f41 ], [ 41, 8, f36*f38*f39*f41 ], [ 42, 8,
gap> f42*f45*f46*f61*f62*f63*f64*f65 ], [ 43, 8, f42*f43*f45*f47*f60*f61 ],
gap> [ 44, 8, f42*f43*f44*f46*f60*f61*f62 ], [ 45, 8,
gap> f42*f43*f44*f46*f47*f64*f65 ], [ 46, 8,
gap> f43*f44*f46*f47*f60*f61*f62*f63*f64 ], [ 47, 8,
gap> f44*f45*f47*f60*f61*f62*f63*f64*f65 ], [ 54, 8, f54*f57*f58 ], [ 55,
gap> 8, f54*f55*f57*f59 ], [ 56, 8, f54*f55*f56*f58 ], [ 57, 8,
gap> f54*f55*f56*f58*f59 ], [ 58, 8, f55*f56*f58*f59 ], [ 59, 8,
gap> f56*f57*f59 ], [ 60, 8, f63*f64 ], [ 61, 8, f60*f63*f65 ], [ 62, 8,
gap> f60*f61*f64 ], [ 63, 8, f60*f61*f62*f63*f64*f65 ], [ 64, 8,
gap> f61*f62*f65 ], [ 65, 8, f62*f63 ], [ 12, 9, f13*f14*f16 ], [ 13, 9,
gap> f14*f15*f16 ], [ 14, 9, f13*f14*f15*f17 ], [ 15, 9, f12*f14*f16 ], [
gap> 16, 9, f12*f14*f17 ], [ 17, 9, f12*f14*f15 ], [ 18, 9,
gap> f21*f22*f49*f50*f51*f52*f53 ], [ 19, 9, f18*f21*f23*f48*f49 ], [ 20,
gap> 9, f18*f19*f22*f48*f49*f50 ], [ 21, 9, f18*f19*f20*f21*f22*f23*f52*f53
gap> ], [ 22, 9, f19*f20*f23*f48*f49*f50*f51*f52 ], [ 23, 9,
gap> f20*f21*f48*f49*f50*f51*f52*f53 ], [ 24, 9, f25*f26*f28 ], [ 25, 9,
gap> f26*f27*f28 ], [ 26, 9, f25*f26*f27*f29 ], [ 27, 9, f24*f26*f28 ], [
gap> 28, 9, f24*f26*f29 ], [ 29, 9, f24*f26*f27 ], [ 30, 9,
gap> f33*f34*f55*f56*f57*f58*f59 ], [ 31, 9, f30*f33*f35*f54*f55 ], [ 32,
gap> 9, f30*f31*f34*f54*f55*f56 ], [ 33, 9, f30*f31*f32*f33*f34*f35*f58*f59
gap> ], [ 34, 9, f31*f32*f35*f54*f55*f56*f57*f58 ], [ 35, 9,
gap> f32*f33*f54*f55*f56*f57*f58*f59 ], [ 36, 9, f37*f38*f40 ], [ 37, 9,
gap> f38*f39*f40 ], [ 38, 9, f37*f38*f39*f41 ], [ 39, 9, f36*f38*f40 ], [
gap> 40, 9, f36*f38*f41 ], [ 41, 9, f36*f38*f39 ], [ 42, 9,
gap> f45*f46*f61*f62*f63*f64*f65 ], [ 43, 9, f42*f45*f47*f60*f61 ], [ 44,
gap> 9, f42*f43*f46*f60*f61*f62 ], [ 45, 9, f42*f43*f44*f45*f46*f47*f64*f65
gap> ], [ 46, 9, f43*f44*f47*f60*f61*f62*f63*f64 ], [ 47, 9,
gap> f44*f45*f60*f61*f62*f63*f64*f65 ], [ 48, 9, f48*f51*f52 ], [ 49, 9,
gap> f48*f49*f51*f53 ], [ 50, 9, f48*f49*f50*f52 ], [ 51, 9,
gap> f48*f49*f50*f52*f53 ], [ 52, 9, f49*f50*f52*f53 ], [ 53, 9,
gap> f50*f51*f53 ], [ 54, 9, f54*f57*f58 ], [ 55, 9, f54*f55*f57*f59 ], [
gap> 56, 9, f54*f55*f56*f58 ], [ 57, 9, f54*f55*f56*f58*f59 ], [ 58, 9,
gap> f55*f56*f58*f59 ], [ 59, 9, f56*f57*f59 ], [ 60, 9, f60*f63*f64 ], [
gap> 61, 9, f60*f61*f63*f65 ], [ 62, 9, f60*f61*f62*f64 ], [ 63, 9,
gap> f60*f61*f62*f64*f65 ], [ 64, 9, f61*f62*f64*f65 ], [ 65, 9,
gap> f62*f63*f65 ], [ 12, 10, f13*f14*f16*f17 ], [ 13, 10, f15*f16 ], [ 14,
gap> 10, f13*f14*f17 ], [ 15, 10, f13*f16*f17 ], [ 16, 10, f14*f17 ], [ 17,
gap> 10, f12*f13*f16*f17 ], [ 18, 10, f19*f20*f21*f22*f48*f51*f52*f53 ], [
gap> 19, 10, f19*f23*f49*f51 ], [ 20, 10, f18*f20*f48*f50*f52 ], [ 21, 10,
gap> f20*f22*f48*f49*f52 ], [ 22, 10, f18*f19*f20*f22*f23*f49*f50*f51*f52
gap> ], [ 23, 10, f18*f19*f20*f21*f23*f50*f51*f52*f53 ], [ 36, 10,
gap> f37*f38*f39*f40 ], [ 37, 10, f38*f39 ], [ 38, 10, f36*f37*f38*f39*f41
gap> ], [ 39, 10, f36*f38*f40*f41 ], [ 40, 10, f36*f41 ], [ 41, 10,
gap> f37*f39*f41 ], [ 42, 10, f42*f44*f62*f63*f65 ], [ 43, 10,
gap> f42*f43*f44*f45*f60*f62*f64*f65 ], [ 44, 10,
gap> f42*f43*f44*f45*f46*f60*f61*f63*f65 ], [ 45, 10,
gap> f43*f45*f46*f47*f60*f61*f63*f64*f65 ], [ 46, 10,
gap> f42*f46*f47*f60*f61*f63*f64 ], [ 47, 10, f43*f47*f61*f62*f64*f65 ], [
gap> 48, 10, f48*f49*f51*f52 ], [ 49, 10, f48*f50*f51*f53 ], [ 50, 10,
gap> f49*f51*f52 ], [ 51, 10, f49*f50*f51*f53 ], [ 52, 10, f49*f50 ], [ 53,
gap> 10, f48*f50*f51 ], [ 60, 10, f60*f61*f62*f63*f64 ], [ 61, 10, f65 ], [
gap> 62, 10, f60 ], [ 63, 10, f62*f63*f64 ], [ 64, 10, f60*f61*f62*f65 ], [
gap> 65, 10, f60*f61*f62*f63 ], [ 24, 11, f25*f26*f28*f29 ], [ 25, 11,
gap> f27*f28 ], [ 26, 11, f25*f26*f29 ], [ 27, 11, f25*f28*f29 ], [ 28, 11,
gap> f26*f29 ], [ 29, 11, f24*f25*f28*f29 ], [ 30, 11,
gap> f31*f32*f33*f34*f54*f57*f58*f59 ], [ 31, 11, f31*f35*f55*f57 ], [ 32,
gap> 11, f30*f32*f54*f56*f58 ], [ 33, 11, f32*f34*f54*f55*f58 ], [ 34, 11,
gap> f30*f31*f32*f34*f35*f55*f56*f57*f58 ], [ 35, 11,
gap> f30*f31*f32*f33*f35*f56*f57*f58*f59 ], [ 36, 11, f37*f38*f39*f40 ], [
gap> 37, 11, f38*f39 ], [ 38, 11, f36*f37*f38*f39*f41 ], [ 39, 11,
gap> f36*f38*f40*f41 ], [ 40, 11, f36*f41 ], [ 41, 11, f37*f39*f41 ], [ 42,
gap> 11, f42*f44*f62*f63*f65 ], [ 43, 11, f42*f43*f44*f45*f60*f62*f64*f65
gap> ], [ 44, 11, f42*f43*f44*f45*f46*f60*f61*f63*f65 ], [ 45, 11,
gap> f43*f45*f46*f47*f60*f61*f63*f64*f65 ], [ 46, 11,
gap> f42*f46*f47*f60*f61*f63*f64 ], [ 47, 11, f43*f47*f61*f62*f64*f65 ], [
gap> 54, 11, f54*f55*f57*f58 ], [ 55, 11, f54*f56*f57*f59 ], [ 56, 11,
gap> f55*f57*f58 ], [ 57, 11, f55*f56*f57*f59 ], [ 58, 11, f55*f56 ], [ 59,
gap> 11, f54*f56*f57 ], [ 60, 11, f60*f61*f62*f63*f64 ], [ 61, 11, f65 ], [
gap> 62, 11, f60 ], [ 63, 11, f62*f63*f64 ], [ 64, 11, f60*f61*f62*f65 ], [
gap> 65, 11, f60*f61*f62*f63 ], [ 18, 12, f49*f50*f52*f53 ], [ 19, 12,
gap> f49*f51*f52 ], [ 20, 12, f48*f50*f52*f53 ], [ 21, 12, f48*f50*f51*f52
gap> ], [ 22, 12, f48*f50*f51 ], [ 23, 12, f48*f49*f51*f52 ], [ 18, 13,
gap> f49*f50 ], [ 19, 13, f48*f49*f51 ], [ 20, 13, f49*f50*f52 ], [ 21, 13,
gap> f48*f49*f51*f53 ], [ 22, 13, f48*f52 ], [ 23, 13, f48*f49*f53 ], [ 18,
gap> 14, f48*f49*f51*f52 ], [ 19, 14, f48*f50*f51*f53 ], [ 20, 14,
gap> f49*f51*f52 ], [ 21, 14, f49*f50*f51*f53 ], [ 22, 14, f49*f50 ], [ 23,
gap> 14, f48*f50*f51 ], [ 18, 15, f50*f51*f53 ], [ 19, 15, f48*f50*f52*f53
gap> ], [ 20, 15, f48*f49*f51*f53 ], [ 21, 15, f48*f49*f51*f52*f53 ], [ 22,
gap> 15, f48*f49*f51*f52 ], [ 23, 15, f49*f50*f52*f53 ], [ 18, 16,
gap> f48*f50*f51 ], [ 19, 16, f49*f50*f52 ], [ 20, 16, f48*f50*f51*f53 ], [
gap> 21, 16, f48*f49*f50*f52 ], [ 22, 16, f48*f49*f53 ], [ 23, 16, f49*f50
gap> ], [ 18, 17, f48*f51*f52 ], [ 19, 17, f48*f49*f51*f53 ], [ 20, 17,
gap> f48*f49*f50*f52 ], [ 21, 17, f48*f49*f50*f52*f53 ], [ 22, 17,
gap> f49*f50*f52*f53 ], [ 23, 17, f50*f51*f53 ], [ 30, 24, f55*f56*f58*f59
gap> ], [ 31, 24, f55*f57*f58 ], [ 32, 24, f54*f56*f58*f59 ], [ 33, 24,
gap> f54*f56*f57*f58 ], [ 34, 24, f54*f56*f57 ], [ 35, 24, f54*f55*f57*f58
gap> ], [ 30, 25, f55*f56 ], [ 31, 25, f54*f55*f57 ], [ 32, 25, f55*f56*f58
gap> ], [ 33, 25, f54*f55*f57*f59 ], [ 34, 25, f54*f58 ], [ 35, 25,
gap> f54*f55*f59 ], [ 30, 26, f54*f55*f57*f58 ], [ 31, 26, f54*f56*f57*f59
gap> ], [ 32, 26, f55*f57*f58 ], [ 33, 26, f55*f56*f57*f59 ], [ 34, 26,
gap> f55*f56 ], [ 35, 26, f54*f56*f57 ], [ 30, 27, f56*f57*f59 ], [ 31, 27,
gap> f54*f56*f58*f59 ], [ 32, 27, f54*f55*f57*f59 ], [ 33, 27,
gap> f54*f55*f57*f58*f59 ], [ 34, 27, f54*f55*f57*f58 ], [ 35, 27,
gap> f55*f56*f58*f59 ], [ 30, 28, f54*f56*f57 ], [ 31, 28, f55*f56*f58 ], [
gap> 32, 28, f54*f56*f57*f59 ], [ 33, 28, f54*f55*f56*f58 ], [ 34, 28,
gap> f54*f55*f59 ], [ 35, 28, f55*f56 ], [ 30, 29, f54*f57*f58 ], [ 31, 29,
gap> f54*f55*f57*f59 ], [ 32, 29, f54*f55*f56*f58 ], [ 33, 29,
gap> f54*f55*f56*f58*f59 ], [ 34, 29, f55*f56*f58*f59 ], [ 35, 29,
gap> f56*f57*f59 ], [ 42, 36, f61*f62*f64*f65 ], [ 43, 36, f61*f63*f64 ], [
gap> 44, 36, f60*f62*f64*f65 ], [ 45, 36, f60*f62*f63*f64 ], [ 46, 36,
gap> f60*f62*f63 ], [ 47, 36, f60*f61*f63*f64 ], [ 42, 37, f61*f62 ], [ 43,
gap> 37, f60*f61*f63 ], [ 44, 37, f61*f62*f64 ], [ 45, 37, f60*f61*f63*f65
gap> ], [ 46, 37, f60*f64 ], [ 47, 37, f60*f61*f65 ], [ 42, 38,
gap> f60*f61*f63*f64 ], [ 43, 38, f60*f62*f63*f65 ], [ 44, 38, f61*f63*f64
gap> ], [ 45, 38, f61*f62*f63*f65 ], [ 46, 38, f61*f62 ], [ 47, 38,
gap> f60*f62*f63 ], [ 42, 39, f62*f63*f65 ], [ 43, 39, f60*f62*f64*f65 ], [
gap> 44, 39, f60*f61*f63*f65 ], [ 45, 39, f60*f61*f63*f64*f65 ], [ 46, 39,
gap> f60*f61*f63*f64 ], [ 47, 39, f61*f62*f64*f65 ], [ 42, 40, f60*f62*f63
gap> ], [ 43, 40, f61*f62*f64 ], [ 44, 40, f60*f62*f63*f65 ], [ 45, 40,
gap> f60*f61*f62*f64 ], [ 46, 40, f60*f61*f65 ], [ 47, 40, f61*f62 ], [ 42,
gap> 41, f60*f63*f64 ], [ 43, 41, f60*f61*f63*f65 ], [ 44, 41,
gap> f60*f61*f62*f64 ], [ 45, 41, f60*f61*f62*f64*f65 ], [ 46, 41,
gap> f61*f62*f64*f65 ], [ 47, 41, f62*f63*f65 ], ];;

# create a group defined by a single collecotr
gap> rws := SingleCollector( f, [ 2, 3, 7, 3, 3, 3, 3, 3, 3, 7, 7, 2,
gap> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
gap> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
gap> 2, 2, 2, 2, 2, 2, 2, 2, 2 ] );;

gap> for x  in r  do
gap>     if 2 = Length(x)  then
gap>         SetPower( rws, x[1], x[2] );
gap>     else
gap>         SetCommutator( rws, x[1], x[2], x[3] );
gap>     fi;
gap> od;
gap> g := GroupByRws(rws);;
gap> n := GeneratorsOfGroup(g);;

gap> s := Subgroup( g, n{[1]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, false, false, false, false );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f2*f8, f3, f4*f8^2, f7*f8, f9, f10*f11^3, f12, f13, f14, f15, f16,
  f17, f18, f19, f20, f21, f22, f23, f24*f36, f25*f37, f26*f38, f27*f39,
  f28*f40, f29*f41, f30*f42, f31*f43, f32*f44, f33*f45, f34*f46, f35*f47,
  f48, f49, f50, f51, f52, f53, f54*f60, f55*f61, f56*f62, f57*f63, f58*f64,
  f59*f65 ])

gap> s := Subgroup( g, n{[1]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, false, false, true, false );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f2*f8, f3, f4*f8^2, f7*f8, f9, f10*f11^3, f12, f13, f14, f15, f16,
  f17, f18, f19, f20, f21, f22, f23, f24*f36, f25*f37, f26*f38, f27*f39,
  f28*f40, f29*f41, f30*f42, f31*f43, f32*f44, f33*f45, f34*f46, f35*f47,
  f48, f49, f50, f51, f52, f53, f54*f60, f55*f61, f56*f62, f57*f63, f58*f64,
  f59*f65 ])

gap> s := Subgroup( g, n{[1]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, true, true, false, false );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f2*f8, f3, f4*f8^2, f7*f8, f9, f10*f11^3, f12, f13, f14, f15, f16,
  f17, f18, f19, f20, f21, f22, f23, f24*f36, f25*f37, f26*f38, f27*f39,
  f28*f40, f29*f41, f30*f42, f31*f43, f32*f44, f33*f45, f34*f46, f35*f47,
  f48, f49, f50, f51, f52, f53, f54*f60, f55*f61, f56*f62, f57*f63, f58*f64,
  f59*f65 ])

gap> s := Subgroup( g, n{[1]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, true, false, true, true );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f2*f8, f3, f4*f8^2, f7*f8, f9, f10*f11^3, f12, f13, f14, f15, f16,
  f17, f18, f19, f20, f21, f22, f23, f24*f36, f25*f37, f26*f38, f27*f39,
  f28*f40, f29*f41, f30*f42, f31*f43, f32*f44, f33*f45, f34*f46, f35*f47,
  f48, f49, f50, f51, f52, f53, f54*f60, f55*f61, f56*f62, f57*f63, f58*f64,
  f59*f65 ])

gap> s := Subgroup( g, n{[1]} );;
gap> Print(CanonicalPcgsWrtHomePcgs( Normalizer( g, s ) ),"\n");
Pcgs([ f1, f2*f8, f3, f4*f8^2, f7*f8, f9, f10*f11^3, f12, f13, f14, f15, f16,
  f17, f18, f19, f20, f21, f22, f23, f24*f36, f25*f37, f26*f38, f27*f39,
  f28*f40, f29*f41, f30*f42, f31*f43, f32*f44, f33*f45, f34*f46, f35*f47,
  f48, f49, f50, f51, f52, f53, f54*f60, f55*f61, f56*f62, f57*f63, f58*f64,
  f59*f65 ])


gap> s := Subgroup( g, n{[1,20]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, false, false, false, false );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f2*f8, f3*f10^2*f11^6, f4*f8^2, f18, f19, f20, f21, f22, f23, 
  f24*f36, f25*f37, f26*f38, f27*f39, f28*f40, f29*f41, f30*f42, f31*f43,
  f32*f44, f33*f45, f34*f46, f35*f47, f48, f49, f50, f51, f52, f53, f54*f60,
  f55*f61, f56*f62, f57*f63, f58*f64, f59*f65 ])

gap> s := Subgroup( g, n{[1,20]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, false, false, false, true );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f2*f8, f3*f10^2*f11^6, f4*f8^2, f18, f19, f20, f21, f22, f23, 
  f24*f36, f25*f37, f26*f38, f27*f39, f28*f40, f29*f41, f30*f42, f31*f43,
  f32*f44, f33*f45, f34*f46, f35*f47, f48, f49, f50, f51, f52, f53, f54*f60,
  f55*f61, f56*f62, f57*f63, f58*f64, f59*f65 ])

gap> s := Subgroup( g, n{[1,20]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, false, false, true, false );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f2*f8, f3*f10^2*f11^6, f4*f8^2, f18, f19, f20, f21, f22, f23, 
  f24*f36, f25*f37, f26*f38, f27*f39, f28*f40, f29*f41, f30*f42, f31*f43,
  f32*f44, f33*f45, f34*f46, f35*f47, f48, f49, f50, f51, f52, f53, f54*f60,
  f55*f61, f56*f62, f57*f63, f58*f64, f59*f65 ])

gap> s := Subgroup( g, n{[1,20]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, true, true, false, false );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f2*f8, f3*f10^2*f11^6, f4*f8^2, f18, f19, f20, f21, f22, f23,
  f24*f36, f25*f37, f26*f38, f27*f39, f28*f40, f29*f41, f30*f42, f31*f43,
  f32*f44, f33*f45, f34*f46, f35*f47, f48, f49, f50, f51, f52, f53, f54*f60,
  f55*f61, f56*f62, f57*f63, f58*f64, f59*f65 ])

gap> s := Subgroup( g, n{[1,20]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, true, false, true, true );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f2*f8, f3*f10^2*f11^6, f4*f8^2, f18, f19, f20, f21, f22, f23,
  f24*f36, f25*f37, f26*f38, f27*f39, f28*f40, f29*f41, f30*f42, f31*f43,
  f32*f44, f33*f45, f34*f46, f35*f47, f48, f49, f50, f51, f52, f53, f54*f60,
  f55*f61, f56*f62, f57*f63, f58*f64, f59*f65 ])

gap> s := Subgroup( g, n{[1,20]} );;
gap> Print(CanonicalPcgsWrtHomePcgs( Normalizer( g, s ) ),"\n");
Pcgs([ f1, f2*f8, f3*f10^2*f11^6, f4*f8^2, f18, f19, f20, f21, f22, f23, 
  f24*f36, f25*f37, f26*f38, f27*f39, f28*f40, f29*f41, f30*f42, f31*f43,
  f32*f44, f33*f45, f34*f46, f35*f47, f48, f49, f50, f51, f52, f53, f54*f60,
  f55*f61, f56*f62, f57*f63, f58*f64, f59*f65 ])



gap> s := Subgroup( g, n{[1,20,65]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, false, false, false, false );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f18, f19, f20, f21, f22, f23, f24*f36, f25*f37, f26*f38, f27*f39,
  f28*f40, f29*f41, f30*f42, f31*f43, f32*f44, f33*f45, f34*f46, f35*f47,
  f48, f49, f50, f51, f52, f53, f54*f60, f55*f61, f56*f62, f57*f63, f58*f64,
  f59, f65 ])

gap> s := Subgroup( g, n{[1,20,65]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, false, false, false, true );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f18, f19, f20, f21, f22, f23, f24*f36, f25*f37, f26*f38, f27*f39,
  f28*f40, f29*f41, f30*f42, f31*f43, f32*f44, f33*f45, f34*f46, f35*f47,
  f48, f49, f50, f51, f52, f53, f54*f60, f55*f61, f56*f62, f57*f63, f58*f64,
  f59, f65 ])

gap> s := Subgroup( g, n{[1,20,65]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, false, false, true, false );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f18, f19, f20, f21, f22, f23, f24*f36, f25*f37, f26*f38, f27*f39,
  f28*f40, f29*f41, f30*f42, f31*f43, f32*f44, f33*f45, f34*f46, f35*f47,
  f48, f49, f50, f51, f52, f53, f54*f60, f55*f61, f56*f62, f57*f63, f58*f64,
  f59, f65 ])

gap> s := Subgroup( g, n{[1,20,65]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, true, true, false, false );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f18, f19, f20, f21, f22, f23, f24*f36, f25*f37, f26*f38, f27*f39,
  f28*f40, f29*f41, f30*f42, f31*f43, f32*f44, f33*f45, f34*f46, f35*f47,
  f48, f49, f50, f51, f52, f53, f54*f60, f55*f61, f56*f62, f57*f63, f58*f64,
  f59, f65 ])

gap> s := Subgroup( g, n{[1,20,65]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, true, false, true, true );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f18, f19, f20, f21, f22, f23, f24*f36, f25*f37, f26*f38, f27*f39,
  f28*f40, f29*f41, f30*f42, f31*f43, f32*f44, f33*f45, f34*f46, f35*f47,
  f48, f49, f50, f51, f52, f53, f54*f60, f55*f61, f56*f62, f57*f63, f58*f64,
  f59, f65 ])

gap> s := Subgroup( g, n{[1,20,65]} );;
gap> Print(CanonicalPcgsWrtHomePcgs( Normalizer( g, s ) ),"\n");
Pcgs([ f1, f18, f19, f20, f21, f22, f23, f24*f36, f25*f37, f26*f38, f27*f39,
  f28*f40, f29*f41, f30*f42, f31*f43, f32*f44, f33*f45, f34*f46, f35*f47,
  f48, f49, f50, f51, f52, f53, f54*f60, f55*f61, f56*f62, f57*f63, f58*f64,
  f59, f65 ])



gap> s := Subgroup( g, n{[1,10,11,12,16,18,20,21,24,26,65,30]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, false, false, false, false );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f2*f7*f8^2, f3, f4*f8^2*f9, f10, f11, f12, f13, f14, f15, f16,
  f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30,
  f31*f33*f34, f32, f36, f37, f38, f39, f40, f41, f42, f43*f45*f46, f44, f48,
  f49, f50, f51, f52, f53, f54, f55, f56, f57, f58, f59, f60, f61, f62, f63,
  f64, f65 ])

gap> s := Subgroup( g, n{[1,10,11,12,16,18,20,21,24,26,65,30]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, false, false, false, true );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f2*f7*f8^2, f3, f4*f8^2*f9, f10, f11, f12, f13, f14, f15, f16,
  f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30,
  f31*f33*f34, f32, f36, f37, f38, f39, f40, f41, f42, f43*f45*f46, f44, f48,
  f49, f50, f51, f52, f53, f54, f55, f56, f57, f58, f59, f60, f61, f62, f63,
  f64, f65 ])

gap> s := Subgroup( g, n{[1,10,11,12,16,18,20,21,24,26,65,30]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, false, false, true, false );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f2*f7*f8^2, f3, f4*f8^2*f9, f10, f11, f12, f13, f14, f15, f16, 
  f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30,
  f31*f33*f34, f32, f36, f37, f38, f39, f40, f41, f42, f43*f45*f46, f44, f48,
  f49, f50, f51, f52, f53, f54, f55, f56, f57, f58, f59, f60, f61, f62, f63,
  f64, f65 ])

gap> s := Subgroup( g, n{[1,10,11,12,16,18,20,21,24,26,65,30]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, true, true, false, false );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f2*f7*f8^2, f3, f4*f8^2*f9, f10, f11, f12, f13, f14, f15, f16,
  f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30,
  f31*f33*f34, f32, f36, f37, f38, f39, f40, f41, f42, f43*f45*f46, f44, f48,
  f49, f50, f51, f52, f53, f54, f55, f56, f57, f58, f59, f60, f61, f62, f63,
  f64, f65 ])

gap> s := Subgroup( g, n{[1,10,11,12,16,18,20,21,24,26,65,30]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, true, false, true, true );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f2*f7*f8^2, f3, f4*f8^2*f9, f10, f11, f12, f13, f14, f15, f16,
  f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30,
  f31*f33*f34, f32, f36, f37, f38, f39, f40, f41, f42, f43*f45*f46, f44, f48,
  f49, f50, f51, f52, f53, f54, f55, f56, f57, f58, f59, f60, f61, f62, f63,
  f64, f65 ])

gap> s := Subgroup( g, n{[1,10,11,12,16,18,20,21,24,26,65,30]} );;
gap> Print(CanonicalPcgsWrtHomePcgs( Normalizer( g, s ) ),"\n");
Pcgs([ f1, f2*f7*f8^2, f3, f4*f8^2*f9, f10, f11, f12, f13, f14, f15, f16,
  f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30,
  f31*f33*f34, f32, f36, f37, f38, f39, f40, f41, f42, f43*f45*f46, f44, f48,
  f49, f50, f51, f52, f53, f54, f55, f56, f57, f58, f59, f60, f61, f62, f63,
  f64, f65 ])



gap> s := Subgroup( g, n{[1,10,11,12,16,18,30,21,24,26,65]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, false, false, false, false );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f2*f7*f8^2, f3, f4*f8^2*f9, f10, f11, f12, f13, f14, f15, f16,
  f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30,
  f31*f33*f34, f32, f36, f37, f38, f39, f40, f41, f42, f43*f45*f46, f44, f48,
  f49, f50, f51, f52, f53, f54, f55, f56, f57, f58, f59, f60, f61, f62, f63,
  f64, f65 ])

gap> s := Subgroup( g, n{[1,10,11,12,16,18,30,21,24,26,65]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, false, false, false, true );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f2*f7*f8^2, f3, f4*f8^2*f9, f10, f11, f12, f13, f14, f15, f16,
  f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30,
  f31*f33*f34, f32, f36, f37, f38, f39, f40, f41, f42, f43*f45*f46, f44, f48,
  f49, f50, f51, f52, f53, f54, f55, f56, f57, f58, f59, f60, f61, f62, f63,
  f64, f65 ])

gap> s := Subgroup( g, n{[1,10,11,12,16,18,30,21,24,26,65]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, false, false, true, false );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f2*f7*f8^2, f3, f4*f8^2*f9, f10, f11, f12, f13, f14, f15, f16,
  f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30,
  f31*f33*f34, f32, f36, f37, f38, f39, f40, f41, f42, f43*f45*f46, f44, f48,
  f49, f50, f51, f52, f53, f54, f55, f56, f57, f58, f59, f60, f61, f62, f63,
  f64, f65 ])

gap> s := Subgroup( g, n{[1,10,11,12,16,18,30,21,24,26,65]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, true, true, false, false );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f2*f7*f8^2, f3, f4*f8^2*f9, f10, f11, f12, f13, f14, f15, f16,
  f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30,
  f31*f33*f34, f32, f36, f37, f38, f39, f40, f41, f42, f43*f45*f46, f44, f48,
  f49, f50, f51, f52, f53, f54, f55, f56, f57, f58, f59, f60, f61, f62, f63,
  f64, f65 ])

gap> s := Subgroup( g, n{[1,10,11,12,16,18,30,21,24,26,65]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, true, false, true, true );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f2*f7*f8^2, f3, f4*f8^2*f9, f10, f11, f12, f13, f14, f15, f16,
  f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30,
  f31*f33*f34, f32, f36, f37, f38, f39, f40, f41, f42, f43*f45*f46, f44, f48,
  f49, f50, f51, f52, f53, f54, f55, f56, f57, f58, f59, f60, f61, f62, f63,
  f64, f65 ])

gap> s := Subgroup( g, n{[1,10,11,12,16,18,30,21,24,26,65]} );;
gap> Print(CanonicalPcgsWrtHomePcgs( Normalizer( g, s ) ),"\n");
Pcgs([ f1, f2*f7*f8^2, f3, f4*f8^2*f9, f10, f11, f12, f13, f14, f15, f16,
  f17, f18, f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30,
  f31*f33*f34, f32, f36, f37, f38, f39, f40, f41, f42, f43*f45*f46, f44, f48,
  f49, f50, f51, f52, f53, f54, f55, f56, f57, f58, f59, f60, f61, f62, f63,
  f64, f65 ])



gap> s := Subgroup( g, n{[1,10,11,12,16,30,21,24,26,65]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, false, false, false, false );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f3, f10, f11, f12, f13, f14, f15, f16, f17, f19*f22*f23, f20*f22,
  f21, f24, f25, f26, f27, f28, f29, f30, f31*f33*f34, f32, f36, f37, f38,
  f39, f40, f41, f42, f43*f45*f46, f44, f48, f49, f50, f51, f52, f53, f54,
  f55, f56, f57, f58, f59, f60, f61, f62, f63, f64, f65 ])

gap> s := Subgroup( g, n{[1,10,11,12,16,30,21,24,26,65]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, false, false, false, true );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f3, f10, f11, f12, f13, f14, f15, f16, f17, f19*f22*f23, f20*f22,
  f21, f24, f25, f26, f27, f28, f29, f30, f31*f33*f34, f32, f36, f37, f38,
  f39, f40, f41, f42, f43*f45*f46, f44, f48, f49, f50, f51, f52, f53, f54,
  f55, f56, f57, f58, f59, f60, f61, f62, f63, f64, f65 ])

gap> s := Subgroup( g, n{[1,10,11,12,16,30,21,24,26,65]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, false, false, true, false );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f3, f10, f11, f12, f13, f14, f15, f16, f17, f19*f22*f23, f20*f22,
  f21, f24, f25, f26, f27, f28, f29, f30, f31*f33*f34, f32, f36, f37, f38,
  f39, f40, f41, f42, f43*f45*f46, f44, f48, f49, f50, f51, f52, f53, f54,
  f55, f56, f57, f58, f59, f60, f61, f62, f63, f64, f65 ])

gap> s := Subgroup( g, n{[1,10,11,12,16,30,21,24,26,65]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, true, true, false, false );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f3, f10, f11, f12, f13, f14, f15, f16, f17, f19*f22*f23, f20*f22,
  f21, f24, f25, f26, f27, f28, f29, f30, f31*f33*f34, f32, f36, f37, f38,
  f39, f40, f41, f42, f43*f45*f46, f44, f48, f49, f50, f51, f52, f53, f54,
  f55, f56, f57, f58, f59, f60, f61, f62, f63, f64, f65 ])

gap> s := Subgroup( g, n{[1,10,11,12,16,30,21,24,26,65]} );;
gap> w := PcGroup_NormalizerWrtHomePcgs( s, true, false, true, true );;
gap> Print(CanonicalPcgs(w),"\n");
Pcgs([ f1, f3, f10, f11, f12, f13, f14, f15, f16, f17, f19*f22*f23, f20*f22,
  f21, f24, f25, f26, f27, f28, f29, f30, f31*f33*f34, f32, f36, f37, f38,
  f39, f40, f41, f42, f43*f45*f46, f44, f48, f49, f50, f51, f52, f53, f54,
  f55, f56, f57, f58, f59, f60, f61, f62, f63, f64, f65 ])

gap> s := Subgroup( g, n{[1,10,11,12,16,30,21,24,26,65]} );;
gap> Print(CanonicalPcgsWrtHomePcgs( Normalizer( g, s ) ),"\n");
Pcgs([ f1, f3, f10, f11, f12, f13, f14, f15, f16, f17, f19*f22*f23, f20*f22,
  f21, f24, f25, f26, f27, f28, f29, f30, f31*f33*f34, f32, f36, f37, f38,
  f39, f40, f41, f42, f43*f45*f46, f44, f48, f49, f50, f51, f52, f53, f54,
  f55, f56, f57, f58, f59, f60, f61, f62, f63, f64, f65 ])


#############################################################################

gap> f := FreeGroup(IsSyllableWordsFamily,9);;
gap> g := GeneratorsOfGroup(f);;
gap> g1 := g[1];;  g2 := g[2];;  g3 := g[3];;  g4 := g[4];;  g5 := g[5];;
gap> g6 := g[6];;  g7 := g[7];;  g8 := g[8];;  g9 := g[9];;
gap> rws := SingleCollector(f,[ 2, 2, 2, 3, 3, 3, 3, 3, 3 ]);;
gap> r := [ [5,1,g6], [6,1,g6], [7,1,g7], [8,1,g8], [9,1,g9], [4,2,g4],
gap> [5,2,g5*g7^2], [6,2,g6*g7^2], [8,2,g8], [9,2,g8], [5,3,g6], [6,3,g6],
gap> [7,3,g7], [8,3,g8], [9,3,g9], [5,4,g6^2*g7], [6,4,g6^2*g7], 
gap> [7,4,g6^2*g7], [8,4,g8*g9^2], [9,4,g8*g9^2], [8,5,g7], [9,5,g6] ];;
gap> for x in r do SetCommutator(rws,x[1],x[2],x[3]); od;
gap> g := GroupByRwsNC(rws);;
gap> u := Subgroup( g, GeneratorsOfGroup(g){[4]} );;
gap> n := Normalizer( g, u );;
gap> Print(CanonicalPcgsWrtFamilyPcgs(n),"\n");
Pcgs([ f1, f2, f3, f4, f5*f7^2, f6*f7^2, f8*f9^2 ])

gap> G:=function() local g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,r,f,g,rws,x;
> f:=FreeGroup(IsSyllableWordsFamily,10); g:=GeneratorsOfGroup(f);
> g1:=g[1]; g2:=g[2]; g3:=g[3];
> g4:=g[4]; g5:=g[5]; g6:=g[6]; g7:=g[7]; g8:=g[8]; g9:=g[9]; g10:=g[10];
> rws:=SingleCollector(f,[ 2, 3, 2, 3, 2, 2, 2, 2, 2, 2 ]);
> r:=[ ];
> for x in r do SetPower(rws,x[1],x[2]);od;
> r:=[ [2,1,g2], [6,1,g5], [7,1,g5*g6*g9], [8,1,g5], [9,1,g5],
> [10,1,g8*g9], [5,2,g5*g9], [6,2,g5], [7,2,g9], [8,2,g9], [9,2,g5],
> [10,2,g5], [4,3,g4], [6,3,g5*g8*g9], [7,3,g5*g8*g10], [6,4,g5*g8*g9],
> [7,4,g5*g8*g10], [8,4,g5*g6*g8], [10,4,g5*g6*g7*g9*g10] ];
> for x in r do SetCommutator(rws,x[1],x[2],x[3]);od;
> return GroupByRwsNC(rws); end;; G:=G();;
gap> Size(Normalizer(G,Subgroup(G,[G.1,G.2])));
144

#############################################################################

gap> STOP_TEST( "grppcnrm.tst", 10376700000 );


#############################################################################
##
#E

