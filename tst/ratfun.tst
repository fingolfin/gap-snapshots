#############################################################################
##
#W  ratfun.tst                  GAP Tests                    Alexander Hulpke
##
#H  @(#)$Id: ratfun.tst,v 4.4 2002/04/15 10:08:41 sal Exp $
##
#Y  (C) 1998 School Math. and Comp. Sci., University of St Andrews, Scotland
##

gap> START_TEST("$Id: ratfun.tst,v 4.4 2002/04/15 10:08:41 sal Exp $");
gap> t:=Indeterminate(Rationals,100);;
gap> SetName(t,"t");;
gap> p0:=0*t^0;;
gap> p1:=p0+0*t^0;;
gap> p2:=p0+1*t^0;;
gap> q0:=0;;
gap> q1:=q0+0*t^0;;
gap> q2:=q0+1*t^0;;
gap> List([p1,p2,q1,q2],x->IsPolynomial(x));
[ true, true, true, true ]
gap> List([p1,p2,q1,q2],x->IsRat(x));
[ false, false, false, false ]
gap> Value(p1,1);
0
gap> Value(p2,1);
1
gap> Value(q1,1);
0
gap> Value(q2,-1);
1
gap> y1:=Indeterminate(Rationals,1);;
gap> y2:=Indeterminate(Rationals,2);;
gap> y3:=Indeterminate(Rationals,3);;
gap> mat:=[[y1,1,0],[y2,y1,1],[y3,y2,y1]];;
gap> det:=DeterminantMat(mat*y1^0);;
gap> Value(det,[y1,y2,y3],[1,-5,1]);
12

gap> 1/( y1*y2 );
1/(x_1*x_2)


gap> STOP_TEST( "ratfun.tst", 9000000 );

#############################################################################
##
#E  ratfun.tst  . . . . . . . . . . . . . . . . . . . . . . . . . ends here


