LUX2_12:=function()
local g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,g11,g12,g13,g14,g15,g16,g17,g18,g19,\
g20,g21,r,f,g,rws,x;
f:=FreeGroup(21);
g:=GeneratorsOfGroup(f);
g1:=g[1];
g2:=g[2];
g3:=g[3];
g4:=g[4];
g5:=g[5];
g6:=g[6];
g7:=g[7];
g8:=g[8];
g9:=g[9];
g10:=g[10];
g11:=g[11];
g12:=g[12];
g13:=g[13];
g14:=g[14];
g15:=g[15];
g16:=g[16];
g17:=g[17];
g18:=g[18];
g19:=g[19];
g20:=g[20];
g21:=g[21];
rws:=SingleCollector(f,[ 7, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, \
2, 2, 2, 2, 2 ]);
r:=[
[1,g2],
[2,g3],
];
for x in r do SetPower(rws,x[1],x[2]);od;
r:=[
[4,1,g4*g7],
[5,1,g5*g8],
[6,1,g4*g6],
[7,1,g7*g9],
[8,1,g6*g8],
[9,1,g4*g5*g6],
[10,1,g10*g15],
[11,1,g10*g11*g15],
[12,1,g11*g12],
[13,1,g12*g13*g15],
[14,1,g13*g14*g15],
[15,1,g14*g15],
[16,1,g15*g16*g20],
[17,1,g10*g15*g17*g20*g21],
[18,1,g11*g16*g18*g21],
[19,1,g12*g15*g17*g19*g20],
[20,1,g13*g15*g18*g21],
[21,1,g14*g19],
[4,2,g6],
[5,2,g6*g7*g8*g9],
[6,2,g8],
[7,2,g4],
[8,2,g5],
[9,2,g7],
[10,2,g10*g11*g12*g13*g14*g15],
[11,2,g10],
[12,2,g10*g11],
[13,2,g13*g14*g15],
[14,2,g10*g11*g12*g13],
[15,2,g10*g11*g12*g13*g14],
[16,2,g12*g13*g16*g18*g20],
[17,2,g12*g14*g16*g17*g18*g19*g20*g21],
[18,2,g10*g13*g15*g17*g18*g19*g20*g21],
[19,2,g10*g11*g12*g13*g14*g19*g21],
[20,2,g10*g11*g14*g15*g16*g18],
[21,2,g11*g12*g15*g17*g19],
[4,3,g5*g6*g8],
[5,3,g6*g7*g8],
[6,3,g5*g6*g7*g9],
[7,3,g4*g6*g8],
[8,3,g4*g6*g9],
[9,3,g4*g6*g7],
[10,3,g10*g13*g14],
[11,3,g10*g11*g13*g15],
[12,3,g10*g11*g12*g14],
[13,3,g10*g11*g12*g14*g15],
[14,3,g11*g12*g14*g15],
[15,3,g12*g13*g15],
[16,3,g11*g12*g13*g14*g15*g19*g20],
[17,3,g10*g11*g16*g19*g21],
[18,3,g10*g11*g12*g16*g17*g20],
[19,3,g14*g15*g16*g17*g18*g19*g20*g21],
[20,3,g10*g11*g12*g13*g14*g17*g18*g21],
[21,3,g10*g11*g12*g13*g14*g15*g18*g19],
[16,4,g11*g12*g14*g15],
[17,4,g11*g13*g14],
[18,4,g10*g12*g14*g15],
[19,4,g10*g12*g13*g14],
[20,4,g10*g12*g13],
[21,4,g10*g11*g13*g14],
[16,5,g11*g12],
[17,5,g10*g11*g13],
[18,5,g11*g12*g14],
[19,5,g10*g11*g13*g15],
[20,5,g10*g14],
[21,5,g10*g11*g15],
[16,6,g10*g11*g13*g14],
[17,6,g10*g12*g13*g15],
[18,6,g11*g13*g14],
[19,6,g11*g12*g13*g15],
[20,6,g11*g12],
[21,6,g10*g12*g13],
[16,7,g12*g13*g15],
[17,7,g10*g12*g14*g15],
[18,7,g10*g11*g13*g15],
[19,7,g10*g11*g13*g14*g15],
[20,7,g10*g11*g13*g14],
[21,7,g11*g12*g14*g15],
[16,8,g10*g12*g13],
[17,8,g11*g12*g14],
[18,8,g10*g12*g13*g15],
[19,8,g10*g11*g12*g14],
[20,8,g10*g11*g15],
[21,8,g11*g12],
[16,9,g10*g13*g14],
[17,9,g10*g11*g13*g15],
[18,9,g10*g11*g12*g14],
[19,9,g10*g11*g12*g14*g15],
[20,9,g11*g12*g14*g15],
[21,9,g12*g13*g15],
];
for x in r do SetCommutator(rws,x[1],x[2],x[3]);od;
return GroupByRwsNC(rws);
end;
LUX2_12:=LUX2_12();
Print("#I A group of order ",Size(LUX2_12)," has been defined.\n");
Print("#I It is called LUX2_12\n");
Print("#I It is the split extension of 2^12 by Aff(1, 2^6) acting\n");
Print("#I to try to cause trouble for the Meataxe. Its size is\n");
Print("#I", Collected(FactorsInt(Size(LUX2_12))),"\n\n");
# This group was provided to us by Klaus Lux.

