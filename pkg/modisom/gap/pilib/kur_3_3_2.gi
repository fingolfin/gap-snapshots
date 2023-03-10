BindGlobal( "Kur_3_3_2", function() 
local A, i; 
A := rec(); 
A.rnk := 3; 
A.dim := 80; 
A.com := false; 
A.fld := GF(2); 
A.wgs := [ 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 
  3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 
  4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 
  5, 5, 5, 5, 5, 5, 5, 5 ]; 
A.wds := [ ,,, [ 1, 1 ], [ 2, 1 ], [ 3, 1 ], [ 1, 2 ], [ 2, 2 ], [ 3, 2 ], 
  [ 1, 3 ], [ 2, 3 ], [ 3, 3 ], [ 2, 4 ], [ 3, 4 ], [ 1, 5 ], [ 2, 5 ], 
  [ 3, 5 ], [ 1, 6 ], [ 2, 6 ], [ 3, 6 ], [ 1, 7 ], [ 2, 7 ], [ 3, 7 ], 
  [ 3, 8 ], [ 1, 9 ], [ 2, 9 ], [ 3, 9 ], [ 1, 10 ], [ 2, 10 ], [ 3, 10 ], 
  [ 2, 11 ], [ 3, 11 ], [ 1, 13 ], [ 2, 13 ], [ 3, 13 ], [ 1, 14 ], 
  [ 2, 14 ], [ 3, 14 ], [ 2, 15 ], [ 3, 15 ], [ 3, 16 ], [ 1, 17 ], 
  [ 2, 17 ], [ 3, 17 ], [ 2, 18 ], [ 3, 18 ], [ 3, 19 ], [ 2, 22 ], 
  [ 3, 22 ], [ 3, 23 ], [ 1, 24 ], [ 2, 24 ], [ 3, 24 ], [ 2, 25 ], 
  [ 3, 25 ], [ 3, 26 ], [ 3, 29 ], [ 3, 30 ], [ 3, 32 ], [ 2, 33 ], 
  [ 3, 33 ], [ 3, 34 ], [ 2, 36 ], [ 3, 36 ], [ 3, 37 ], [ 2, 39 ], 
  [ 3, 39 ], [ 3, 40 ], [ 2, 41 ], [ 3, 41 ], [ 2, 42 ], [ 3, 42 ], 
  [ 3, 43 ], [ 3, 46 ], [ 3, 47 ], [ 2, 51 ], [ 3, 51 ], [ 3, 52 ], 
  [ 3, 55 ], [ 3, 56 ] ]; 
A.tab := [  ]; 
A.tab[1] := [ [ 1, 4, 1 ], [ 2, 7, 1 ], [ 3, 10, 1 ], [ 5, 15, 1 ], 
  [ 6, 18, 1 ], [ 7, 21, 1 ], [ 8, 13, 1 ], [ 8, 15, 1 ], [ 8, 16, 1 ], 
  [ 8, 21, 1 ], [ 8, 22, 1 ], [ 9, 25, 1 ], [ 10, 28, 1 ], [ 11, 17, 1 ], 
  [ 11, 19, 1 ], [ 11, 23, 1 ], [ 11, 25, 1 ], [ 11, 29, 1 ], [ 12, 14, 1 ], 
  [ 12, 18, 1 ], [ 12, 20, 1 ], [ 12, 28, 1 ], [ 12, 30, 1 ], [ 13, 33, 1 ], 
  [ 14, 36, 1 ], [ 15, 33, 1 ], [ 16, 34, 1 ], [ 16, 39, 1 ], [ 17, 42, 1 ], 
  [ 18, 36, 1 ], [ 19, 35, 1 ], [ 19, 37, 1 ], [ 19, 40, 1 ], [ 19, 42, 1 ], 
  [ 19, 45, 1 ], [ 20, 38, 1 ], [ 20, 46, 1 ], [ 22, 34, 1 ], [ 23, 40, 1 ], 
  [ 23, 42, 1 ], [ 24, 51, 1 ], [ 25, 35, 1 ], [ 25, 42, 1 ], [ 26, 41, 1 ], 
  [ 26, 43, 1 ], [ 26, 49, 1 ], [ 26, 51, 1 ], [ 26, 54, 1 ], [ 27, 50, 1 ], 
  [ 27, 55, 1 ], [ 29, 35, 1 ], [ 29, 37, 1 ], [ 29, 40, 1 ], [ 29, 42, 1 ], 
  [ 30, 38, 1 ], [ 31, 41, 1 ], [ 31, 43, 1 ], [ 31, 49, 1 ], [ 31, 54, 1 ], 
  [ 32, 44, 1 ], [ 32, 47, 1 ], [ 32, 50, 1 ], [ 32, 57, 1 ], [ 34, 60, 1 ], 
  [ 35, 61, 1 ], [ 37, 63, 1 ], [ 38, 64, 1 ], [ 41, 62, 1 ], [ 42, 61, 1 ], 
  [ 43, 62, 1 ], [ 43, 67, 1 ], [ 43, 71, 1 ], [ 44, 68, 1 ], [ 44, 72, 1 ], 
  [ 47, 65, 1 ], [ 47, 68, 1 ], [ 47, 72, 1 ], [ 48, 66, 1 ], [ 49, 62, 1 ], 
  [ 49, 67, 1 ], [ 50, 72, 1 ], [ 52, 76, 1 ], [ 53, 77, 1 ], [ 54, 62, 1 ], 
  [ 54, 67, 1 ], [ 55, 68, 1 ], [ 56, 70, 1 ], [ 56, 73, 1 ], [ 56, 77, 1 ], 
  [ 57, 65, 1 ], [ 57, 68, 1 ], [ 58, 74, 1 ], [ 59, 79, 1 ] ]; 
A.tab[2] := [ [ 1, 5, 1 ], [ 2, 8, 1 ], [ 3, 11, 1 ], [ 4, 13, 1 ], 
  [ 5, 16, 1 ], [ 6, 19, 1 ], [ 7, 22, 1 ], [ 9, 26, 1 ], [ 10, 29, 1 ], 
  [ 11, 31, 1 ], [ 12, 24, 1 ], [ 12, 26, 1 ], [ 12, 27, 1 ], [ 12, 31, 1 ], 
  [ 12, 32, 1 ], [ 13, 34, 1 ], [ 14, 37, 1 ], [ 15, 39, 1 ], [ 17, 43, 1 ], 
  [ 18, 45, 1 ], [ 19, 41, 1 ], [ 19, 43, 1 ], [ 20, 44, 1 ], [ 20, 47, 1 ], 
  [ 21, 34, 1 ], [ 21, 39, 1 ], [ 22, 48, 1 ], [ 23, 43, 1 ], [ 23, 49, 1 ], 
  [ 24, 52, 1 ], [ 25, 54, 1 ], [ 26, 52, 1 ], [ 27, 53, 1 ], [ 27, 56, 1 ], 
  [ 28, 37, 1 ], [ 28, 45, 1 ], [ 29, 51, 1 ], [ 29, 54, 1 ], [ 30, 47, 1 ], 
  [ 30, 57, 1 ], [ 32, 53, 1 ], [ 33, 60, 1 ], [ 35, 62, 1 ], [ 36, 63, 1 ], 
  [ 38, 65, 1 ], [ 39, 66, 1 ], [ 40, 62, 1 ], [ 40, 67, 1 ], [ 41, 69, 1 ], 
  [ 42, 71, 1 ], [ 43, 69, 1 ], [ 44, 70, 1 ], [ 44, 73, 1 ], [ 45, 62, 1 ], 
  [ 45, 71, 1 ], [ 46, 65, 1 ], [ 46, 72, 1 ], [ 47, 70, 1 ], [ 50, 73, 1 ], 
  [ 51, 76, 1 ], [ 53, 78, 1 ], [ 54, 76, 1 ], [ 55, 73, 1 ], [ 55, 77, 1 ], 
  [ 57, 70, 1 ], [ 57, 73, 1 ], [ 58, 75, 1 ], [ 59, 80, 1 ] ]; 
A.tab[3] := [ [ 1, 6, 1 ], [ 2, 9, 1 ], [ 3, 12, 1 ], [ 4, 14, 1 ], 
  [ 5, 17, 1 ], [ 6, 20, 1 ], [ 7, 23, 1 ], [ 8, 24, 1 ], [ 9, 27, 1 ], 
  [ 10, 30, 1 ], [ 11, 32, 1 ], [ 13, 35, 1 ], [ 14, 38, 1 ], [ 15, 40, 1 ], 
  [ 16, 41, 1 ], [ 17, 44, 1 ], [ 18, 46, 1 ], [ 19, 47, 1 ], [ 21, 35, 1 ], 
  [ 21, 40, 1 ], [ 22, 49, 1 ], [ 23, 50, 1 ], [ 24, 53, 1 ], [ 25, 55, 1 ], 
  [ 26, 56, 1 ], [ 28, 38, 1 ], [ 28, 46, 1 ], [ 29, 57, 1 ], [ 30, 58, 1 ], 
  [ 31, 53, 1 ], [ 31, 56, 1 ], [ 32, 59, 1 ], [ 33, 61, 1 ], [ 34, 62, 1 ], 
  [ 36, 64, 1 ], [ 37, 65, 1 ], [ 39, 67, 1 ], [ 40, 68, 1 ], [ 41, 70, 1 ], 
  [ 42, 72, 1 ], [ 43, 73, 1 ], [ 45, 72, 1 ], [ 46, 74, 1 ], [ 47, 75, 1 ], 
  [ 48, 69, 1 ], [ 49, 70, 1 ], [ 51, 77, 1 ], [ 52, 78, 1 ], [ 54, 70, 1 ], 
  [ 54, 77, 1 ], [ 55, 79, 1 ], [ 56, 80, 1 ], [ 57, 75, 1 ] ]; 
for i in [1..A.rnk] do 
    A.tab[i] := ListToMat(A.tab[i],A.dim,A.fld); 
od; 
return A; 
end ); 
