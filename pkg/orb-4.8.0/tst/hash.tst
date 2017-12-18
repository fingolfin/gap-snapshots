#############################################################################
##
#W  hash.tst
#Y  Copyright (C) 2016                                   James D. Mitchell
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##

#
gap> START_TEST("Orb package: hash.tst");

# test HASH_FUNC_FOR_BLIST and its distribution
gap> bl := BlistList([1 .. 10000], []);;
gap> HASH_FUNC_FOR_BLIST(bl, 101);
1
gap> li := Combinations([1 .. 5]);;
gap> Collected(List(li, x -> HASH_FUNC_FOR_BLIST(BlistList([1 .. 5], x), 101)));
[ [ 1, 1 ], [ 2, 1 ], [ 3, 1 ], [ 4, 1 ], [ 5, 1 ], [ 6, 1 ], [ 7, 1 ], 
  [ 8, 1 ], [ 9, 1 ], [ 10, 1 ], [ 11, 1 ], [ 12, 1 ], [ 13, 1 ], [ 14, 1 ], 
  [ 15, 1 ], [ 16, 1 ], [ 17, 1 ], [ 18, 1 ], [ 19, 1 ], [ 20, 1 ], 
  [ 21, 1 ], [ 22, 1 ], [ 23, 1 ], [ 24, 1 ], [ 25, 1 ], [ 26, 1 ], 
  [ 27, 1 ], [ 28, 1 ], [ 29, 1 ], [ 30, 1 ], [ 31, 1 ], [ 32, 1 ] ]
gap> Collected(List(li, x -> HASH_FUNC_FOR_BLIST(BlistList([1 .. 5], x), 37)));
[ [ 1, 1 ], [ 2, 1 ], [ 3, 1 ], [ 4, 1 ], [ 5, 1 ], [ 6, 1 ], [ 7, 1 ], 
  [ 8, 1 ], [ 9, 1 ], [ 10, 1 ], [ 11, 1 ], [ 12, 1 ], [ 13, 1 ], [ 14, 1 ], 
  [ 15, 1 ], [ 16, 1 ], [ 17, 1 ], [ 18, 1 ], [ 19, 1 ], [ 20, 1 ], 
  [ 21, 1 ], [ 22, 1 ], [ 23, 1 ], [ 24, 1 ], [ 25, 1 ], [ 26, 1 ], 
  [ 27, 1 ], [ 28, 1 ], [ 29, 1 ], [ 30, 1 ], [ 31, 1 ], [ 32, 1 ] ]
gap> Collected(List(li, x -> HASH_FUNC_FOR_BLIST(BlistList([1 .. 5], x), 17)));
[ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ], [ 4, 2 ], [ 5, 2 ], [ 6, 2 ], [ 7, 2 ], 
  [ 8, 2 ], [ 9, 2 ], [ 10, 2 ], [ 11, 2 ], [ 12, 2 ], [ 13, 2 ], [ 14, 2 ], 
  [ 15, 2 ], [ 16, 1 ], [ 17, 1 ] ]

# test ChooseHashFunction for a blist
gap> ht := HTCreate(bl);
<tree hash table len=100003 used=0 colls=0 accs=0>
gap> HTAdd(ht, bl, true);
1
gap> ht;
<tree hash table len=100003 used=1 colls=0 accs=1>
gap> ht!.hf = HASH_FUNC_FOR_BLIST;
true
gap> for x in Combinations([1 .. 5]) do 
>      HTAdd(ht, BlistList([1 .. 5], x), true);
>    od;
gap> ht;
<tree hash table len=100003 used=33 colls=1 accs=33>

# check for bugfix: if a very tiny table was created, then it
# could become 100% full (which for larger tables is prevented);
# when that happened, HTValue could run into an infinite loop.
gap> ht:=HTCreate(1,rec(hashlen:=3));;
gap> for i in [1,2,3] do
> HTAdd(ht,i,2^i); od;
gap> ht;
<hash table obj len=19 used=3 colls=0 accs=3 (can grow)>
gap> List([1..4], i -> HTValue(ht,i));
[ 2, 4, 8, fail ]

#
gap> STOP_TEST("Orb package: hash.tst", 0);
