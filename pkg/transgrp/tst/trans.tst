# Basic test for the TransGrp package
#
gap> START_TEST("trans.tst");

# TransitiveGroupsAvailable (do *not* test for conditions that will change
# after update.
#
gap> TransitiveGroupsAvailable(1);
false
gap> TransitiveGroupsAvailable(45);
true

# NrTransitiveGroups
#
gap> List([2..47],NrTransitiveGroups);
[ 1, 2, 5, 5, 16, 7, 50, 34, 45, 8, 301, 9, 63, 104, 1954, 10, 983, 8, 1117,
  164, 59, 7, 25000, 211, 96, 2392, 1854, 8, 5712, 12, 2801324, 162, 115,
  407, 121279, 11, 76, 306, 315842, 10, 9491, 10, 2113, 10923, 56, 6 ]

# AllTransitiveGroups
# 
gap> l:= AllTransitiveGroups(NrMovedPoints,[10..15],
> Size, [1..100],
> IsAbelian, false );;
gap> l[17];
S_4(12d)
gap> Length(l);
97
gap> Sum(l,Size);
5733

# AllLibraryTransitiveGroups
# 
gap> l:= AllLibraryTransitiveGroups(NrMovedPoints,[10..23],
> Size,x->x<10000,IsPrimitive,false,IsSolvableGroup,false);;
gap> Length(l);
170
gap> Sum(l,Size);
382236

# OneTransitiveGroup
# 
gap> g:= OneTransitiveGroup(NrMovedPoints,[10..15],
> Size, [1..100],
> IsAbelian, false );
D(10)=5:2

# TransitiveGroup and TransitiveIdentification
#
gap> for n in [2..15] do
>   for i in [1..NrTransitiveGroups(n)] do
>      s := Random(SymmetricGroup(n));
>      if TransitiveIdentification(TransitiveGroup(n,i)^s) <> i then
>        Print("TransitiveIdentification error for TransitiveGroup(",
>              n,",",i,") and s=", s, "\n");
>      fi;
>   od;
> od;
gap> g:=List([10..47],x->TransitiveGroup(x,Int(2/3*NrTransitiveGroups(x))));;
gap> List(g,Size);
[ 720, 660, 1152, 156, 2688, 14580, 1536, 4080, 26244, 171, 80000, 222264,
  675840, 506, 93312, 750000, 53248, 354294, 1376256, 406, 39813120, 930,
  131072, 119750400, 8912896, 1306912320, 169869312, 444, 9961472, 6908733,
  200000000, 410, 7499695392, 602, 92274688, 55099802880, 4244635648, 2162 ]
gap> g:=Filtered(g,x->not NrMovedPoints(x) in [32,36,40]);;
gap> i:=List(g,TransitiveIdentification);;
gap> h:=List(g,x->Group(GeneratorsOfGroup(x)));;
gap> i=List(h,TransitiveIdentification);
true

#
gap> STOP_TEST("trans.tst");
