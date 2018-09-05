# Basic test for the TransGrp package
#
gap> START_TEST("trans.tst");

# TransitiveGroupsAvailable (do *not* test for conditions that will change
# after update.
#
gap> TransitiveGroupsAvailable(1);
false
gap> TransitiveGroupsAvailable(33);
true

# NrTransitiveGroups
#
gap> List([1..18],NrTransitiveGroups);
[ 0, 1, 2, 5, 5, 16, 7, 50, 34, 45, 8, 301, 9, 63, 104, 1954, 10, 983 ]

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

#
gap> STOP_TEST("trans.tst");
