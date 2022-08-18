#
gap> START_TEST("cube-incidence.tst");

# enter cube inequalities (TODO: make this more convenient)
gap> d:=5;;
gap> cube:=function(d)
>   local M;
>   M:=NullMat(2*d,d+1);;
>   M{[1..d]}{[1..d]}:=IdentityMat(d);;
>   M{[1..d]+d}{[1..d]}:=-IdentityMat(d);;
>   M{[1..d]+d}[1+d] := ListWithIdenticalEntries(d,1);;
>   return NmzCone(["inhom_inequalities", M]);
> end;;
gap> printIncidence:=function(cone)
>   local tmp;
>   tmp := NmzIncidence(cone);
>   tmp := List(tmp,r->List(r,function(x) if x then return '1'; fi; return '0'; end));
>   Display(JoinStringsWithSeparator(tmp, "\n"));
> end;;

#
gap> cone := cube(5);
<a Normaliz cone>
gap> Length(NmzVerticesOfPolyhedron(cone)) = 32;
true
gap> NmzVolume(cone);
120
gap> printIncidence(cone);
00000000000000001111111111111111
00000000111111110000000011111111
00001111000011110000111100001111
00110011001100110011001100110011
01010101010101010101010101010101
10101010101010101010101010101010
11001100110011001100110011001100
11110000111100001111000011110000
11111111000000001111111100000000
11111111111111110000000000000000

#
gap> cone := cube(6);
<a Normaliz cone>
gap> Length(NmzVerticesOfPolyhedron(cone)) = 64;
true
gap> NmzVolume(cone);
720
gap> printIncidence(cone);
0000000000000000000000000000000011111111111111111111111111111111
0000000000000000111111111111111100000000000000001111111111111111
0000000011111111000000001111111100000000111111110000000011111111
0000111100001111000011110000111100001111000011110000111100001111
0011001100110011001100110011001100110011001100110011001100110011
0101010101010101010101010101010101010101010101010101010101010101
1010101010101010101010101010101010101010101010101010101010101010
1100110011001100110011001100110011001100110011001100110011001100
1111000011110000111100001111000011110000111100001111000011110000
1111111100000000111111110000000011111111000000001111111100000000
1111111111111111000000000000000011111111111111110000000000000000
1111111111111111111111111111111100000000000000000000000000000000

#
gap> STOP_TEST("cube-incidence.tst", 0);