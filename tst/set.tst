#############################################################################
##
#W  set.tst                   GAP Library                    Alexander Hulpke
##
#H  @(#)$Id: set.tst,v 4.6 2002/04/15 10:08:41 sal Exp $
##
#Y  Copyright (C)  1996,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##

gap> START_TEST("$Id: set.tst,v 4.6 2002/04/15 10:08:41 sal Exp $");
gap> a:=Set([(1,3,2),(4,5)]);;
gap> b:=[(1,2),(5,9,7)];;
gap> UniteSet(a,b);
gap> a;  
[ (5,9,7), (4,5), (1,2), (1,3,2) ]
gap> HasIsSSortedList(a);
true
gap> IsSSortedList(a);
true
gap> c:=Union(a,[(5,3,7),(1,2)]);
[ (5,9,7), (4,5), (3,7,5), (1,2), (1,3,2) ]
gap> HasIsSSortedList(c) and IsSSortedList(c);
true
gap> SubtractSet(c,[(1,2),(1,2,3)]);
gap> c;
[ (5,9,7), (4,5), (3,7,5), (1,3,2) ]
gap> HasIsSSortedList(c) and IsSSortedList(c);
true
gap> AddSet(c,5);  
gap> c;
[ 5, (5,9,7), (4,5), (3,7,5), (1,3,2) ]
gap> HasIsSSortedList(c) and IsSSortedList(c);
true
gap> AddSet(a,(5,6));
#gap> HasIsSSortedList(a) and IsSSortedList(a);
#true
gap> c:=Union(a,[(1,2),(1,2,3)]);
[ (5,6), (5,9,7), (4,5), (1,2), (1,2,3), (1,3,2) ]
gap> HasIsSSortedList(c) and IsSSortedList(c);
true
gap> g:=Group((3,11)(4,7)(6,8)(9,10),(1,3)(2,8,10,12)(4,5,6,7)(9,11));;        
gap> l:=AsSortedList(g);;
gap> HasIsSSortedList(l) and IsSSortedList(l);
true
gap> c:=Difference(l,[(3,11)( 4, 7)( 6, 8)( 9,10)]);;
gap> HasIsSSortedList(c) and IsSSortedList(c);
true
gap> Length(c);
7919
gap> c:=Difference(l,a);;                            
gap> c=l;
true

gap> STOP_TEST( "set.tst", 21000000 );

#############################################################################
##
#E  set.tst . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
##



