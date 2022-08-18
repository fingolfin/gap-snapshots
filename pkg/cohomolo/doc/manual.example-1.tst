gap> G:=AlternatingGroup(16);;
gap> chr:=CHR(G,2);;
gap> SetInfoLevel(InfoCohomolo,1);;
gap> SchurMultiplier(chr);
#Indices in the subgroup chain are:  2027025 315
#WARNING: An index in the subgroup chain found is larger than 50000.
#This calculation may fail. See manual for possible remedies.
#I   Cohomolo package: Calling external program.
Out of tree space. Increase TRSP.
#I   External program complete.
Error 'Cohomolo' failed for some reason.
 at
Error( "'Cohomolo' failed for some reason.\n" );
Cohomology( chr, true, false, false, TmpName(  ) ); called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop, you can 'quit;' to quit to outer loop,
or you can return to continue
brk> quit;

#The first index in the chain found by GAP was hopelessly large.
#Let's try and do better.

gap> P:=chr.sylow;;
gap> H1:=Subgroup(G, [(1,2)(9,10), (2,3,4,5,6,7,8),
>                     (1,9)(2,10)(3,11)(4,12)(5,13)(6,14)(7,15)(8,16)]);;
gap> Index(G,H1);
6435
gap> H2:=Subgroup(H1, [(1,2)(5,6),(1,2)(9,10), (2,3,4),
>    (1,5)(2,6)(3,7)(4,8),  (1,9)(2,10)(3,11)(4,12)(5,13)(6,14)(7,15)(8,16)]);;
gap> Index(H1,H2);
1225
gap> IsSubgroup(H2,P);
true
#If that had been false, we could have replaced chr.sylow by
#a Sylow 2-subgroup of H2.
gap> Index(H2,P);
81
gap> chr.chain := [G,H1,H2,P];;
gap> SchurMultiplier(chr);
#Calling external program.
#External program complete.
#Removing temporary files.
[ 2 ]
gap> quit;
