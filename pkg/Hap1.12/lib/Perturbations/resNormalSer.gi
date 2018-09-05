#(C) Graham Ellis, 2005-2006

#####################################################################
InstallGlobalFunction(ResolutionNormalSeries,
function(arg)
local 
	GensSeries,n, tietze,
	G,				#G[i] is generated by GensSeries[i].
	Q, GensQ,  			#Q[i] is the group G[1]/G[i].
	GhomsQ,				#GhomsQ[i]:G[1]-->G[1]/G[i].
	L,				#L is the length of GensSeries
	Res,
	Charact,
        nohomotopy,
	i,j,g;
	
	############################ INPUT DATA #####################
if IsGroup(arg[1][1]) then
GensSeries:=List(arg[1],x->ReduceGenerators(GeneratorsOfGroup(x),x));
	if Length(GensSeries[Length(GensSeries)])=0 then
	GensSeries[Length(GensSeries)]:=[Identity(arg[1][1])]; fi;
else GensSeries:=StructuralCopy(arg[1]);
fi;

if not Order(Group(GensSeries[Length(GensSeries)]))=1 then
Add(GensSeries,[Identity(arg[1][1])]); fi;

n:=arg[2];
if Length(arg)>2 then tietze:=arg[3]; else tietze:=false; fi;
if Length(arg)>3 then Charact:=arg[4]; else Charact:=0; fi;
if Length(arg)>4 then nohomotopy:=true; else nohomotopy:=false; fi;
	########################### DATA INPUT ######################
G:=[]; 
Q:=[]; GensQ:=[]; 
GhomsQ:=[];
L:=Length(GensSeries);


for i in [1..L] do
  G[i]:=Group(GensSeries[i]);
  GhomsQ[i]:=NaturalHomomorphismByNormalSubgroup(G[1],G[i]);
  Q[i]:=Image(GhomsQ[i]);
  GensQ[i]:=[];
 	for g in GensSeries[1] do
	Append(GensQ[i],[Image(GhomsQ[i],g)]);
	od;
od;

GensQ[L]:=GensSeries[1];


Res:=[];
Res[2]:=ResolutionFiniteGroup(GensQ[2],n,tietze,Charact);
if nohomotopy then Res[2]!.homotopy:=fail; fi;

for i in [3..L] do
Res[i]:=ResolutionFiniteExtension(GensQ[i],GensQ[i-1],Res[i-1],n,tietze);
od;

return Res[Length(Res)];
end);
#####################################################################
