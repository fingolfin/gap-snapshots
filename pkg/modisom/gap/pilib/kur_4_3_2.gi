BindGlobal( "Kur_4_3_2", function() 
local A, i; 
A := rec(); 
A.rnk := 4; 
A.dim := 286; 
A.com := false; 
A.fld := GF(2); 
A.wgs := [ 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 
  3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 
  3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 
  4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 
  4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 
  4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 
  4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 
  5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 
  5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 
  5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 
  5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 
  6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6 ]; 
A.wds := [ ,,,, [ 1, 1 ], [ 2, 1 ], [ 3, 1 ], [ 4, 1 ], [ 1, 2 ], [ 2, 2 ], 
  [ 3, 2 ], [ 4, 2 ], [ 1, 3 ], [ 2, 3 ], [ 3, 3 ], [ 4, 3 ], [ 1, 4 ], 
  [ 2, 4 ], [ 3, 4 ], [ 4, 4 ], [ 2, 5 ], [ 3, 5 ], [ 4, 5 ], [ 1, 6 ], 
  [ 2, 6 ], [ 3, 6 ], [ 4, 6 ], [ 1, 7 ], [ 2, 7 ], [ 3, 7 ], [ 4, 7 ], 
  [ 1, 8 ], [ 2, 8 ], [ 3, 8 ], [ 4, 8 ], [ 1, 9 ], [ 2, 9 ], [ 3, 9 ], 
  [ 4, 9 ], [ 3, 10 ], [ 4, 10 ], [ 1, 11 ], [ 2, 11 ], [ 3, 11 ], [ 4, 11 ], 
  [ 1, 12 ], [ 2, 12 ], [ 3, 12 ], [ 4, 12 ], [ 1, 13 ], [ 2, 13 ], 
  [ 3, 13 ], [ 4, 13 ], [ 2, 14 ], [ 3, 14 ], [ 4, 14 ], [ 4, 15 ], 
  [ 1, 16 ], [ 2, 16 ], [ 3, 16 ], [ 4, 16 ], [ 1, 17 ], [ 2, 17 ], 
  [ 3, 17 ], [ 4, 17 ], [ 2, 18 ], [ 3, 18 ], [ 4, 18 ], [ 3, 19 ], 
  [ 4, 19 ], [ 1, 21 ], [ 2, 21 ], [ 3, 21 ], [ 4, 21 ], [ 1, 22 ], 
  [ 2, 22 ], [ 3, 22 ], [ 4, 22 ], [ 1, 23 ], [ 2, 23 ], [ 3, 23 ], 
  [ 4, 23 ], [ 2, 24 ], [ 3, 24 ], [ 4, 24 ], [ 3, 25 ], [ 4, 25 ], 
  [ 1, 26 ], [ 2, 26 ], [ 3, 26 ], [ 4, 26 ], [ 1, 27 ], [ 2, 27 ], 
  [ 3, 27 ], [ 4, 27 ], [ 2, 28 ], [ 3, 28 ], [ 4, 28 ], [ 3, 29 ], 
  [ 4, 29 ], [ 4, 30 ], [ 1, 31 ], [ 2, 31 ], [ 3, 31 ], [ 4, 31 ], 
  [ 2, 32 ], [ 3, 32 ], [ 4, 32 ], [ 3, 33 ], [ 4, 33 ], [ 4, 34 ], 
  [ 2, 37 ], [ 3, 37 ], [ 4, 37 ], [ 3, 38 ], [ 4, 38 ], [ 3, 39 ], 
  [ 4, 39 ], [ 1, 40 ], [ 2, 40 ], [ 3, 40 ], [ 4, 40 ], [ 1, 41 ], 
  [ 2, 41 ], [ 3, 41 ], [ 4, 41 ], [ 2, 42 ], [ 3, 42 ], [ 4, 42 ], 
  [ 3, 43 ], [ 4, 43 ], [ 4, 44 ], [ 1, 45 ], [ 2, 45 ], [ 3, 45 ], 
  [ 4, 45 ], [ 2, 46 ], [ 3, 46 ], [ 4, 46 ], [ 3, 47 ], [ 4, 47 ], 
  [ 4, 48 ], [ 3, 51 ], [ 4, 51 ], [ 3, 52 ], [ 4, 52 ], [ 4, 53 ], 
  [ 3, 55 ], [ 4, 55 ], [ 4, 56 ], [ 1, 57 ], [ 2, 57 ], [ 3, 57 ], 
  [ 4, 57 ], [ 3, 58 ], [ 4, 58 ], [ 3, 59 ], [ 4, 59 ], [ 4, 60 ], 
  [ 3, 63 ], [ 4, 63 ], [ 4, 64 ], [ 4, 65 ], [ 4, 67 ], [ 4, 68 ], 
  [ 4, 70 ], [ 2, 71 ], [ 3, 71 ], [ 4, 71 ], [ 3, 72 ], [ 4, 72 ], 
  [ 4, 73 ], [ 2, 75 ], [ 3, 75 ], [ 4, 75 ], [ 3, 76 ], [ 4, 76 ], 
  [ 4, 77 ], [ 2, 79 ], [ 3, 79 ], [ 4, 79 ], [ 3, 80 ], [ 4, 80 ], 
  [ 4, 81 ], [ 2, 83 ], [ 3, 83 ], [ 4, 83 ], [ 3, 84 ], [ 4, 84 ], 
  [ 3, 85 ], [ 4, 85 ], [ 2, 86 ], [ 3, 86 ], [ 4, 86 ], [ 2, 87 ], 
  [ 3, 87 ], [ 4, 87 ], [ 2, 88 ], [ 3, 88 ], [ 4, 88 ], [ 3, 89 ], 
  [ 4, 89 ], [ 4, 90 ], [ 1, 91 ], [ 2, 91 ], [ 3, 91 ], [ 4, 91 ], 
  [ 2, 92 ], [ 3, 92 ], [ 4, 92 ], [ 3, 93 ], [ 4, 93 ], [ 4, 94 ], 
  [ 3, 97 ], [ 4, 97 ], [ 4, 98 ], [ 3, 99 ], [ 4, 99 ], [ 4, 100 ], 
  [ 2, 101 ], [ 3, 101 ], [ 4, 101 ], [ 3, 102 ], [ 4, 102 ], [ 3, 103 ], 
  [ 4, 103 ], [ 4, 104 ], [ 4, 108 ], [ 4, 109 ], [ 4, 110 ], [ 4, 111 ], 
  [ 4, 113 ], [ 2, 119 ], [ 3, 119 ], [ 4, 119 ], [ 3, 120 ], [ 4, 120 ], 
  [ 4, 121 ], [ 2, 123 ], [ 3, 123 ], [ 4, 123 ], [ 3, 124 ], [ 4, 124 ], 
  [ 4, 125 ], [ 3, 128 ], [ 4, 128 ], [ 4, 129 ], [ 3, 130 ], [ 4, 130 ], 
  [ 4, 131 ], [ 3, 132 ], [ 4, 132 ], [ 3, 133 ], [ 4, 133 ], [ 3, 134 ], 
  [ 4, 134 ], [ 4, 135 ], [ 4, 139 ], [ 4, 141 ], [ 4, 142 ], [ 4, 143 ], 
  [ 3, 151 ], [ 4, 151 ], [ 3, 152 ], [ 4, 152 ], [ 4, 153 ], [ 4, 156 ], 
  [ 4, 158 ], [ 4, 159 ], [ 4, 160 ], [ 4, 168 ], [ 4, 170 ], [ 4, 176 ], 
  [ 4, 182 ], [ 4, 186 ], [ 4, 192 ], [ 4, 193 ], [ 4, 196 ], [ 4, 199 ], 
  [ 4, 201 ], [ 3, 203 ], [ 4, 203 ], [ 4, 204 ], [ 4, 205 ], [ 4, 206 ], 
  [ 4, 213 ] ]; 
A.tab := [  ]; 
A.tab[1] := [ [ 1, 5, 1 ], [ 2, 9, 1 ], [ 3, 13, 1 ], [ 4, 17, 1 ], 
  [ 6, 24, 1 ], [ 7, 28, 1 ], [ 8, 32, 1 ], [ 9, 36, 1 ], [ 10, 21, 1 ], 
  [ 10, 24, 1 ], [ 10, 25, 1 ], [ 10, 36, 1 ], [ 10, 37, 1 ], [ 11, 42, 1 ], 
  [ 12, 46, 1 ], [ 13, 50, 1 ], [ 14, 26, 1 ], [ 14, 29, 1 ], [ 14, 38, 1 ], 
  [ 14, 42, 1 ], [ 14, 51, 1 ], [ 15, 22, 1 ], [ 15, 28, 1 ], [ 15, 30, 1 ], 
  [ 15, 50, 1 ], [ 15, 52, 1 ], [ 16, 58, 1 ], [ 17, 62, 1 ], [ 18, 27, 1 ], 
  [ 18, 33, 1 ], [ 18, 39, 1 ], [ 18, 46, 1 ], [ 18, 63, 1 ], [ 19, 31, 1 ], 
  [ 19, 34, 1 ], [ 19, 53, 1 ], [ 19, 58, 1 ], [ 19, 64, 1 ], [ 20, 23, 1 ], 
  [ 20, 32, 1 ], [ 20, 35, 1 ], [ 20, 62, 1 ], [ 20, 65, 1 ], [ 21, 71, 1 ], 
  [ 22, 75, 1 ], [ 23, 79, 1 ], [ 24, 71, 1 ], [ 25, 72, 1 ], [ 25, 83, 1 ], 
  [ 26, 88, 1 ], [ 27, 92, 1 ], [ 28, 75, 1 ], [ 29, 73, 1 ], [ 29, 76, 1 ], 
  [ 29, 84, 1 ], [ 29, 88, 1 ], [ 29, 96, 1 ], [ 30, 77, 1 ], [ 30, 97, 1 ], 
  [ 31, 102, 1 ], [ 32, 79, 1 ], [ 33, 74, 1 ], [ 33, 80, 1 ], [ 33, 85, 1 ], 
  [ 33, 92, 1 ], [ 33, 106, 1 ], [ 34, 78, 1 ], [ 34, 81, 1 ], [ 34, 98, 1 ], 
  [ 34, 102, 1 ], [ 34, 107, 1 ], [ 35, 82, 1 ], [ 35, 108, 1 ], 
  [ 37, 72, 1 ], [ 38, 84, 1 ], [ 38, 88, 1 ], [ 39, 85, 1 ], [ 39, 92, 1 ], 
  [ 40, 119, 1 ], [ 41, 123, 1 ], [ 42, 73, 1 ], [ 42, 88, 1 ], 
  [ 43, 86, 1 ], [ 43, 89, 1 ], [ 43, 113, 1 ], [ 43, 119, 1 ], 
  [ 43, 127, 1 ], [ 44, 115, 1 ], [ 44, 128, 1 ], [ 45, 133, 1 ], 
  [ 46, 74, 1 ], [ 46, 92, 1 ], [ 47, 87, 1 ], [ 47, 93, 1 ], [ 47, 114, 1 ], 
  [ 47, 123, 1 ], [ 47, 137, 1 ], [ 48, 116, 1 ], [ 48, 117, 1 ], 
  [ 48, 129, 1 ], [ 48, 133, 1 ], [ 48, 138, 1 ], [ 49, 118, 1 ], 
  [ 49, 139, 1 ], [ 51, 73, 1 ], [ 51, 76, 1 ], [ 51, 84, 1 ], [ 51, 88, 1 ], 
  [ 52, 77, 1 ], [ 53, 98, 1 ], [ 53, 102, 1 ], [ 54, 86, 1 ], [ 54, 89, 1 ], 
  [ 54, 113, 1 ], [ 54, 127, 1 ], [ 55, 90, 1 ], [ 55, 99, 1 ], 
  [ 55, 115, 1 ], [ 55, 143, 1 ], [ 56, 94, 1 ], [ 56, 100, 1 ], 
  [ 56, 116, 1 ], [ 56, 117, 1 ], [ 56, 129, 1 ], [ 56, 133, 1 ], 
  [ 56, 144, 1 ], [ 57, 151, 1 ], [ 58, 78, 1 ], [ 58, 102, 1 ], 
  [ 59, 91, 1 ], [ 59, 109, 1 ], [ 59, 116, 1 ], [ 59, 129, 1 ], 
  [ 59, 133, 1 ], [ 59, 138, 1 ], [ 59, 144, 1 ], [ 60, 101, 1 ], 
  [ 60, 104, 1 ], [ 60, 146, 1 ], [ 60, 151, 1 ], [ 60, 155, 1 ], 
  [ 61, 147, 1 ], [ 61, 156, 1 ], [ 63, 74, 1 ], [ 63, 80, 1 ], 
  [ 63, 85, 1 ], [ 63, 92, 1 ], [ 64, 78, 1 ], [ 64, 81, 1 ], [ 64, 98, 1 ], 
  [ 64, 102, 1 ], [ 65, 82, 1 ], [ 66, 87, 1 ], [ 66, 93, 1 ], 
  [ 66, 114, 1 ], [ 66, 137, 1 ], [ 67, 91, 1 ], [ 67, 109, 1 ], 
  [ 67, 129, 1 ], [ 67, 133, 1 ], [ 67, 160, 1 ], [ 68, 95, 1 ], 
  [ 68, 110, 1 ], [ 68, 118, 1 ], [ 68, 161, 1 ], [ 69, 101, 1 ], 
  [ 69, 104, 1 ], [ 69, 146, 1 ], [ 69, 155, 1 ], [ 70, 105, 1 ], 
  [ 70, 111, 1 ], [ 70, 147, 1 ], [ 70, 162, 1 ], [ 72, 167, 1 ], 
  [ 73, 168, 1 ], [ 74, 169, 1 ], [ 76, 173, 1 ], [ 77, 174, 1 ], 
  [ 78, 175, 1 ], [ 80, 179, 1 ], [ 81, 180, 1 ], [ 82, 181, 1 ], 
  [ 86, 170, 1 ], [ 87, 171, 1 ], [ 88, 168, 1 ], [ 89, 170, 1 ], 
  [ 89, 186, 1 ], [ 89, 198, 1 ], [ 90, 188, 1 ], [ 90, 199, 1 ], 
  [ 91, 204, 1 ], [ 92, 169, 1 ], [ 93, 171, 1 ], [ 93, 187, 1 ], 
  [ 93, 208, 1 ], [ 94, 189, 1 ], [ 94, 190, 1 ], [ 94, 200, 1 ], 
  [ 94, 204, 1 ], [ 94, 209, 1 ], [ 95, 191, 1 ], [ 95, 210, 1 ], 
  [ 99, 176, 1 ], [ 99, 188, 1 ], [ 99, 199, 1 ], [ 100, 172, 1 ], 
  [ 100, 177, 1 ], [ 100, 204, 1 ], [ 101, 178, 1 ], [ 102, 175, 1 ], 
  [ 103, 172, 1 ], [ 103, 182, 1 ], [ 103, 190, 1 ], [ 103, 204, 1 ], 
  [ 103, 209, 1 ], [ 104, 178, 1 ], [ 104, 215, 1 ], [ 104, 223, 1 ], 
  [ 105, 216, 1 ], [ 105, 224, 1 ], [ 109, 172, 1 ], [ 109, 182, 1 ], 
  [ 109, 189, 1 ], [ 109, 190, 1 ], [ 109, 200, 1 ], [ 109, 204, 1 ], 
  [ 109, 209, 1 ], [ 110, 183, 1 ], [ 110, 191, 1 ], [ 110, 210, 1 ], 
  [ 111, 184, 1 ], [ 111, 216, 1 ], [ 111, 224, 1 ], [ 112, 185, 1 ], 
  [ 113, 170, 1 ], [ 113, 186, 1 ], [ 114, 171, 1 ], [ 114, 187, 1 ], 
  [ 115, 199, 1 ], [ 116, 189, 1 ], [ 116, 204, 1 ], [ 117, 189, 1 ], 
  [ 117, 200, 1 ], [ 117, 204, 1 ], [ 117, 209, 1 ], [ 118, 210, 1 ], 
  [ 120, 233, 1 ], [ 121, 234, 1 ], [ 122, 235, 1 ], [ 124, 239, 1 ], 
  [ 125, 240, 1 ], [ 126, 241, 1 ], [ 127, 170, 1 ], [ 127, 186, 1 ], 
  [ 128, 188, 1 ], [ 129, 200, 1 ], [ 129, 204, 1 ], [ 130, 193, 1 ], 
  [ 130, 201, 1 ], [ 130, 234, 1 ], [ 131, 194, 1 ], [ 131, 202, 1 ], 
  [ 131, 235, 1 ], [ 132, 203, 1 ], [ 133, 172, 1 ], [ 133, 204, 1 ], 
  [ 134, 211, 1 ], [ 134, 232, 1 ], [ 134, 235, 1 ], [ 134, 240, 1 ], 
  [ 135, 206, 1 ], [ 135, 246, 1 ], [ 135, 253, 1 ], [ 136, 247, 1 ], 
  [ 136, 254, 1 ], [ 137, 171, 1 ], [ 137, 187, 1 ], [ 138, 189, 1 ], 
  [ 138, 190, 1 ], [ 138, 200, 1 ], [ 138, 204, 1 ], [ 139, 191, 1 ], 
  [ 140, 196, 1 ], [ 140, 211, 1 ], [ 140, 240, 1 ], [ 141, 197, 1 ], 
  [ 141, 212, 1 ], [ 141, 241, 1 ], [ 142, 207, 1 ], [ 142, 213, 1 ], 
  [ 142, 247, 1 ], [ 142, 254, 1 ], [ 143, 176, 1 ], [ 143, 188, 1 ], 
  [ 144, 172, 1 ], [ 144, 177, 1 ], [ 144, 189, 1 ], [ 144, 190, 1 ], 
  [ 144, 200, 1 ], [ 144, 204, 1 ], [ 145, 214, 1 ], [ 146, 178, 1 ], 
  [ 146, 215, 1 ], [ 147, 224, 1 ], [ 148, 245, 1 ], [ 149, 218, 1 ], 
  [ 149, 246, 1 ], [ 149, 261, 1 ], [ 150, 207, 1 ], [ 150, 226, 1 ], 
  [ 150, 229, 1 ], [ 150, 254, 1 ], [ 152, 220, 1 ], [ 152, 225, 1 ], 
  [ 152, 246, 1 ], [ 152, 253, 1 ], [ 152, 261, 1 ], [ 153, 262, 1 ], 
  [ 154, 263, 1 ], [ 155, 178, 1 ], [ 155, 215, 1 ], [ 156, 216, 1 ], 
  [ 157, 225, 1 ], [ 157, 253, 1 ], [ 157, 261, 1 ], [ 158, 207, 1 ], 
  [ 158, 219, 1 ], [ 158, 229, 1 ], [ 158, 254, 1 ], [ 159, 222, 1 ], 
  [ 159, 227, 1 ], [ 159, 263, 1 ], [ 160, 172, 1 ], [ 160, 182, 1 ], 
  [ 160, 200, 1 ], [ 160, 204, 1 ], [ 161, 183, 1 ], [ 161, 191, 1 ], 
  [ 162, 184, 1 ], [ 162, 216, 1 ], [ 163, 228, 1 ], [ 164, 207, 1 ], 
  [ 164, 229, 1 ], [ 164, 247, 1 ], [ 164, 270, 1 ], [ 165, 258, 1 ], 
  [ 166, 267, 1 ], [ 172, 271, 1 ], [ 177, 271, 1 ], [ 182, 271, 1 ], 
  [ 194, 272, 1 ], [ 196, 272, 1 ], [ 202, 272, 1 ], [ 204, 271, 1 ], 
  [ 205, 272, 1 ], [ 205, 275, 1 ], [ 206, 273, 1 ], [ 206, 279, 1 ], 
  [ 207, 274, 1 ], [ 207, 283, 1 ], [ 211, 272, 1 ], [ 213, 274, 1 ], 
  [ 213, 283, 1 ], [ 218, 273, 1 ], [ 219, 274, 1 ], [ 219, 283, 1 ], 
  [ 220, 273, 1 ], [ 225, 279, 1 ], [ 226, 274, 1 ], [ 226, 283, 1 ], 
  [ 229, 283, 1 ], [ 232, 272, 1 ], [ 232, 275, 1 ], [ 237, 276, 1 ], 
  [ 238, 277, 1 ], [ 242, 276, 1 ], [ 244, 278, 1 ], [ 246, 279, 1 ], 
  [ 247, 283, 1 ], [ 249, 280, 1 ], [ 250, 278, 1 ], [ 251, 281, 1 ], 
  [ 252, 282, 1 ], [ 253, 279, 1 ], [ 254, 274, 1 ], [ 256, 284, 1 ], 
  [ 257, 285, 1 ], [ 260, 286, 1 ], [ 261, 273, 1 ], [ 261, 279, 1 ], 
  [ 264, 281, 1 ], [ 265, 282, 1 ], [ 268, 286, 1 ] ]; 
A.tab[2] := [ [ 1, 6, 1 ], [ 2, 10, 1 ], [ 3, 14, 1 ], [ 4, 18, 1 ], 
  [ 5, 21, 1 ], [ 6, 25, 1 ], [ 7, 29, 1 ], [ 8, 33, 1 ], [ 9, 37, 1 ], 
  [ 11, 43, 1 ], [ 12, 47, 1 ], [ 13, 51, 1 ], [ 14, 54, 1 ], [ 15, 40, 1 ], 
  [ 15, 43, 1 ], [ 15, 44, 1 ], [ 15, 54, 1 ], [ 15, 55, 1 ], [ 16, 59, 1 ], 
  [ 17, 63, 1 ], [ 18, 66, 1 ], [ 19, 45, 1 ], [ 19, 48, 1 ], [ 19, 56, 1 ], 
  [ 19, 59, 1 ], [ 19, 67, 1 ], [ 20, 41, 1 ], [ 20, 47, 1 ], [ 20, 49, 1 ], 
  [ 20, 66, 1 ], [ 20, 68, 1 ], [ 21, 72, 1 ], [ 22, 76, 1 ], [ 23, 80, 1 ], 
  [ 24, 83, 1 ], [ 26, 89, 1 ], [ 27, 93, 1 ], [ 28, 96, 1 ], [ 29, 86, 1 ], 
  [ 29, 89, 1 ], [ 30, 90, 1 ], [ 30, 99, 1 ], [ 31, 103, 1 ], 
  [ 32, 106, 1 ], [ 33, 87, 1 ], [ 33, 93, 1 ], [ 34, 91, 1 ], [ 34, 94, 1 ], 
  [ 34, 100, 1 ], [ 34, 103, 1 ], [ 34, 109, 1 ], [ 35, 95, 1 ], 
  [ 35, 110, 1 ], [ 36, 72, 1 ], [ 36, 83, 1 ], [ 37, 112, 1 ], 
  [ 38, 89, 1 ], [ 38, 113, 1 ], [ 39, 93, 1 ], [ 39, 114, 1 ], 
  [ 40, 120, 1 ], [ 41, 124, 1 ], [ 42, 127, 1 ], [ 43, 120, 1 ], 
  [ 44, 121, 1 ], [ 44, 130, 1 ], [ 45, 134, 1 ], [ 46, 137, 1 ], 
  [ 47, 124, 1 ], [ 48, 122, 1 ], [ 48, 125, 1 ], [ 48, 131, 1 ], 
  [ 48, 134, 1 ], [ 48, 140, 1 ], [ 49, 126, 1 ], [ 49, 141, 1 ], 
  [ 50, 76, 1 ], [ 50, 96, 1 ], [ 51, 119, 1 ], [ 51, 127, 1 ], 
  [ 52, 99, 1 ], [ 52, 143, 1 ], [ 53, 94, 1 ], [ 53, 103, 1 ], 
  [ 53, 116, 1 ], [ 53, 117, 1 ], [ 53, 144, 1 ], [ 55, 121, 1 ], 
  [ 56, 131, 1 ], [ 56, 134, 1 ], [ 57, 152, 1 ], [ 58, 103, 1 ], 
  [ 58, 109, 1 ], [ 58, 129, 1 ], [ 58, 138, 1 ], [ 58, 144, 1 ], 
  [ 59, 122, 1 ], [ 59, 134, 1 ], [ 60, 132, 1 ], [ 60, 135, 1 ], 
  [ 60, 149, 1 ], [ 60, 152, 1 ], [ 60, 157, 1 ], [ 61, 150, 1 ], 
  [ 61, 158, 1 ], [ 62, 80, 1 ], [ 62, 106, 1 ], [ 63, 123, 1 ], 
  [ 63, 137, 1 ], [ 64, 94, 1 ], [ 64, 100, 1 ], [ 64, 103, 1 ], 
  [ 64, 109, 1 ], [ 64, 116, 1 ], [ 64, 117, 1 ], [ 64, 160, 1 ], 
  [ 65, 110, 1 ], [ 65, 161, 1 ], [ 67, 122, 1 ], [ 67, 125, 1 ], 
  [ 67, 131, 1 ], [ 67, 134, 1 ], [ 68, 126, 1 ], [ 69, 132, 1 ], 
  [ 69, 135, 1 ], [ 69, 149, 1 ], [ 69, 157, 1 ], [ 70, 136, 1 ], 
  [ 70, 142, 1 ], [ 70, 150, 1 ], [ 70, 164, 1 ], [ 71, 167, 1 ], 
  [ 73, 170, 1 ], [ 74, 171, 1 ], [ 75, 173, 1 ], [ 77, 176, 1 ], 
  [ 78, 177, 1 ], [ 79, 179, 1 ], [ 81, 182, 1 ], [ 82, 183, 1 ], 
  [ 83, 185, 1 ], [ 84, 170, 1 ], [ 84, 186, 1 ], [ 85, 171, 1 ], 
  [ 85, 187, 1 ], [ 86, 192, 1 ], [ 87, 195, 1 ], [ 88, 198, 1 ], 
  [ 89, 192, 1 ], [ 90, 193, 1 ], [ 90, 201, 1 ], [ 91, 205, 1 ], 
  [ 92, 208, 1 ], [ 93, 195, 1 ], [ 94, 194, 1 ], [ 94, 196, 1 ], 
  [ 94, 202, 1 ], [ 94, 205, 1 ], [ 94, 211, 1 ], [ 95, 197, 1 ], 
  [ 95, 212, 1 ], [ 96, 170, 1 ], [ 96, 198, 1 ], [ 97, 176, 1 ], 
  [ 97, 199, 1 ], [ 98, 172, 1 ], [ 98, 177, 1 ], [ 98, 200, 1 ], 
  [ 99, 193, 1 ], [ 100, 202, 1 ], [ 100, 205, 1 ], [ 101, 220, 1 ], 
  [ 102, 177, 1 ], [ 102, 182, 1 ], [ 102, 189, 1 ], [ 102, 190, 1 ], 
  [ 102, 209, 1 ], [ 103, 194, 1 ], [ 103, 205, 1 ], [ 104, 203, 1 ], 
  [ 104, 206, 1 ], [ 104, 218, 1 ], [ 104, 220, 1 ], [ 104, 225, 1 ], 
  [ 105, 219, 1 ], [ 105, 226, 1 ], [ 106, 171, 1 ], [ 106, 208, 1 ], 
  [ 107, 172, 1 ], [ 107, 182, 1 ], [ 107, 209, 1 ], [ 108, 183, 1 ], 
  [ 108, 210, 1 ], [ 109, 194, 1 ], [ 109, 196, 1 ], [ 109, 202, 1 ], 
  [ 109, 205, 1 ], [ 110, 197, 1 ], [ 111, 207, 1 ], [ 111, 213, 1 ], 
  [ 111, 219, 1 ], [ 111, 229, 1 ], [ 115, 201, 1 ], [ 116, 205, 1 ], 
  [ 116, 232, 1 ], [ 117, 202, 1 ], [ 117, 205, 1 ], [ 117, 211, 1 ], 
  [ 117, 232, 1 ], [ 118, 212, 1 ], [ 119, 233, 1 ], [ 121, 236, 1 ], 
  [ 122, 237, 1 ], [ 123, 239, 1 ], [ 125, 242, 1 ], [ 126, 243, 1 ], 
  [ 127, 233, 1 ], [ 128, 201, 1 ], [ 128, 234, 1 ], [ 129, 194, 1 ], 
  [ 129, 205, 1 ], [ 129, 235, 1 ], [ 132, 238, 1 ], [ 133, 194, 1 ], 
  [ 133, 205, 1 ], [ 133, 211, 1 ], [ 133, 240, 1 ], [ 134, 237, 1 ], 
  [ 135, 238, 1 ], [ 135, 249, 1 ], [ 135, 255, 1 ], [ 136, 250, 1 ], 
  [ 136, 256, 1 ], [ 137, 239, 1 ], [ 138, 194, 1 ], [ 138, 202, 1 ], 
  [ 138, 205, 1 ], [ 138, 211, 1 ], [ 138, 240, 1 ], [ 139, 212, 1 ], 
  [ 139, 241, 1 ], [ 142, 244, 1 ], [ 142, 250, 1 ], [ 142, 256, 1 ], 
  [ 143, 193, 1 ], [ 143, 201, 1 ], [ 144, 194, 1 ], [ 144, 196, 1 ], 
  [ 144, 205, 1 ], [ 145, 217, 1 ], [ 146, 203, 1 ], [ 146, 220, 1 ], 
  [ 146, 261, 1 ], [ 147, 207, 1 ], [ 147, 229, 1 ], [ 148, 248, 1 ], 
  [ 149, 238, 1 ], [ 149, 249, 1 ], [ 150, 256, 1 ], [ 151, 220, 1 ], 
  [ 151, 225, 1 ], [ 151, 246, 1 ], [ 151, 253, 1 ], [ 151, 261, 1 ], 
  [ 153, 264, 1 ], [ 154, 265, 1 ], [ 155, 203, 1 ], [ 155, 218, 1 ], 
  [ 155, 220, 1 ], [ 155, 225, 1 ], [ 155, 246, 1 ], [ 155, 253, 1 ], 
  [ 155, 261, 1 ], [ 156, 207, 1 ], [ 156, 229, 1 ], [ 156, 247, 1 ], 
  [ 156, 254, 1 ], [ 157, 238, 1 ], [ 157, 249, 1 ], [ 158, 250, 1 ], 
  [ 159, 252, 1 ], [ 159, 257, 1 ], [ 159, 265, 1 ], [ 160, 202, 1 ], 
  [ 160, 205, 1 ], [ 160, 211, 1 ], [ 161, 197, 1 ], [ 161, 212, 1 ], 
  [ 162, 207, 1 ], [ 162, 219, 1 ], [ 162, 226, 1 ], [ 162, 270, 1 ], 
  [ 163, 230, 1 ], [ 164, 244, 1 ], [ 164, 250, 1 ], [ 165, 259, 1 ], 
  [ 166, 268, 1 ], [ 172, 272, 1 ], [ 175, 271, 1 ], [ 178, 273, 1 ], 
  [ 180, 271, 1 ], [ 184, 274, 1 ], [ 189, 272, 1 ], [ 189, 275, 1 ], 
  [ 190, 272, 1 ], [ 190, 275, 1 ], [ 194, 276, 1 ], [ 196, 276, 1 ], 
  [ 200, 272, 1 ], [ 203, 277, 1 ], [ 205, 276, 1 ], [ 206, 277, 1 ], 
  [ 206, 280, 1 ], [ 207, 278, 1 ], [ 207, 284, 1 ], [ 209, 272, 1 ], 
  [ 213, 284, 1 ], [ 215, 273, 1 ], [ 215, 279, 1 ], [ 216, 274, 1 ], 
  [ 218, 277, 1 ], [ 218, 280, 1 ], [ 219, 284, 1 ], [ 221, 281, 1 ], 
  [ 222, 282, 1 ], [ 224, 283, 1 ], [ 225, 277, 1 ], [ 225, 280, 1 ], 
  [ 226, 278, 1 ], [ 227, 285, 1 ], [ 231, 286, 1 ], [ 235, 276, 1 ], 
  [ 240, 276, 1 ], [ 246, 277, 1 ], [ 247, 278, 1 ], [ 247, 284, 1 ], 
  [ 253, 277, 1 ], [ 253, 280, 1 ], [ 254, 278, 1 ], [ 254, 284, 1 ], 
  [ 261, 277, 1 ], [ 262, 281, 1 ], [ 263, 282, 1 ], [ 267, 286, 1 ], 
  [ 270, 278, 1 ], [ 270, 284, 1 ] ]; 
A.tab[3] := [ [ 1, 7, 1 ], [ 2, 11, 1 ], [ 3, 15, 1 ], [ 4, 19, 1 ], 
  [ 5, 22, 1 ], [ 6, 26, 1 ], [ 7, 30, 1 ], [ 8, 34, 1 ], [ 9, 38, 1 ], 
  [ 10, 40, 1 ], [ 11, 44, 1 ], [ 12, 48, 1 ], [ 13, 52, 1 ], [ 14, 55, 1 ], 
  [ 16, 60, 1 ], [ 17, 64, 1 ], [ 18, 67, 1 ], [ 19, 69, 1 ], [ 20, 57, 1 ], 
  [ 20, 60, 1 ], [ 20, 61, 1 ], [ 20, 69, 1 ], [ 20, 70, 1 ], [ 21, 73, 1 ], 
  [ 22, 77, 1 ], [ 23, 81, 1 ], [ 24, 84, 1 ], [ 25, 86, 1 ], [ 26, 90, 1 ], 
  [ 27, 94, 1 ], [ 28, 97, 1 ], [ 29, 99, 1 ], [ 31, 104, 1 ], 
  [ 32, 107, 1 ], [ 33, 109, 1 ], [ 34, 101, 1 ], [ 34, 104, 1 ], 
  [ 35, 105, 1 ], [ 35, 111, 1 ], [ 36, 73, 1 ], [ 36, 84, 1 ], 
  [ 37, 113, 1 ], [ 38, 115, 1 ], [ 39, 117, 1 ], [ 40, 121, 1 ], 
  [ 41, 125, 1 ], [ 42, 128, 1 ], [ 43, 130, 1 ], [ 45, 135, 1 ], 
  [ 46, 138, 1 ], [ 47, 140, 1 ], [ 48, 132, 1 ], [ 48, 135, 1 ], 
  [ 49, 136, 1 ], [ 49, 142, 1 ], [ 50, 77, 1 ], [ 50, 97, 1 ], 
  [ 51, 143, 1 ], [ 52, 145, 1 ], [ 53, 104, 1 ], [ 53, 146, 1 ], 
  [ 54, 121, 1 ], [ 54, 130, 1 ], [ 55, 148, 1 ], [ 56, 135, 1 ], 
  [ 56, 149, 1 ], [ 57, 153, 1 ], [ 58, 155, 1 ], [ 59, 157, 1 ], 
  [ 60, 153, 1 ], [ 61, 154, 1 ], [ 61, 159, 1 ], [ 62, 81, 1 ], 
  [ 62, 107, 1 ], [ 63, 160, 1 ], [ 64, 151, 1 ], [ 64, 155, 1 ], 
  [ 65, 111, 1 ], [ 65, 162, 1 ], [ 66, 125, 1 ], [ 66, 140, 1 ], 
  [ 67, 152, 1 ], [ 67, 157, 1 ], [ 68, 142, 1 ], [ 68, 164, 1 ], 
  [ 70, 154, 1 ], [ 71, 168, 1 ], [ 72, 170, 1 ], [ 74, 172, 1 ], 
  [ 75, 174, 1 ], [ 76, 176, 1 ], [ 78, 178, 1 ], [ 79, 180, 1 ], 
  [ 80, 182, 1 ], [ 82, 184, 1 ], [ 83, 186, 1 ], [ 84, 188, 1 ], 
  [ 85, 190, 1 ], [ 86, 193, 1 ], [ 87, 196, 1 ], [ 88, 199, 1 ], 
  [ 89, 201, 1 ], [ 91, 206, 1 ], [ 92, 209, 1 ], [ 93, 211, 1 ], 
  [ 94, 203, 1 ], [ 94, 206, 1 ], [ 95, 207, 1 ], [ 95, 213, 1 ], 
  [ 96, 199, 1 ], [ 97, 214, 1 ], [ 98, 178, 1 ], [ 98, 215, 1 ], 
  [ 99, 217, 1 ], [ 100, 206, 1 ], [ 100, 218, 1 ], [ 101, 221, 1 ], 
  [ 102, 223, 1 ], [ 103, 225, 1 ], [ 104, 221, 1 ], [ 105, 222, 1 ], 
  [ 105, 227, 1 ], [ 106, 189, 1 ], [ 106, 190, 1 ], [ 106, 209, 1 ], 
  [ 107, 178, 1 ], [ 107, 223, 1 ], [ 108, 184, 1 ], [ 108, 224, 1 ], 
  [ 109, 220, 1 ], [ 109, 225, 1 ], [ 110, 213, 1 ], [ 110, 229, 1 ], 
  [ 111, 222, 1 ], [ 112, 192, 1 ], [ 113, 193, 1 ], [ 114, 194, 1 ], 
  [ 114, 196, 1 ], [ 114, 232, 1 ], [ 116, 203, 1 ], [ 116, 206, 1 ], 
  [ 116, 220, 1 ], [ 117, 203, 1 ], [ 117, 206, 1 ], [ 118, 207, 1 ], 
  [ 118, 213, 1 ], [ 118, 226, 1 ], [ 118, 229, 1 ], [ 119, 234, 1 ], 
  [ 120, 236, 1 ], [ 122, 238, 1 ], [ 123, 240, 1 ], [ 124, 242, 1 ], 
  [ 126, 244, 1 ], [ 127, 193, 1 ], [ 127, 234, 1 ], [ 128, 245, 1 ], 
  [ 129, 203, 1 ], [ 129, 206, 1 ], [ 129, 220, 1 ], [ 129, 246, 1 ], 
  [ 130, 248, 1 ], [ 131, 238, 1 ], [ 131, 249, 1 ], [ 132, 251, 1 ], 
  [ 133, 253, 1 ], [ 134, 255, 1 ], [ 135, 251, 1 ], [ 136, 252, 1 ], 
  [ 136, 257, 1 ], [ 137, 194, 1 ], [ 137, 240, 1 ], [ 138, 203, 1 ], 
  [ 138, 253, 1 ], [ 139, 213, 1 ], [ 139, 254, 1 ], [ 140, 238, 1 ], 
  [ 140, 255, 1 ], [ 141, 244, 1 ], [ 141, 256, 1 ], [ 142, 252, 1 ], 
  [ 143, 217, 1 ], [ 144, 206, 1 ], [ 144, 261, 1 ], [ 147, 227, 1 ], 
  [ 150, 257, 1 ], [ 151, 262, 1 ], [ 152, 264, 1 ], [ 154, 266, 1 ], 
  [ 155, 262, 1 ], [ 156, 227, 1 ], [ 156, 263, 1 ], [ 157, 264, 1 ], 
  [ 158, 257, 1 ], [ 158, 265, 1 ], [ 160, 220, 1 ], [ 160, 225, 1 ], 
  [ 161, 213, 1 ], [ 161, 270, 1 ], [ 162, 222, 1 ], [ 162, 227, 1 ], 
  [ 163, 231, 1 ], [ 164, 252, 1 ], [ 164, 257, 1 ], [ 165, 260, 1 ], 
  [ 166, 269, 1 ], [ 169, 271, 1 ], [ 171, 272, 1 ], [ 177, 273, 1 ], 
  [ 179, 271, 1 ], [ 183, 274, 1 ], [ 187, 275, 1 ], [ 189, 273, 1 ], 
  [ 191, 274, 1 ], [ 194, 277, 1 ], [ 195, 276, 1 ], [ 197, 278, 1 ], 
  [ 200, 273, 1 ], [ 200, 279, 1 ], [ 202, 277, 1 ], [ 202, 280, 1 ], 
  [ 203, 281, 1 ], [ 204, 273, 1 ], [ 206, 281, 1 ], [ 207, 282, 1 ], 
  [ 207, 285, 1 ], [ 209, 273, 1 ], [ 210, 283, 1 ], [ 211, 277, 1 ], 
  [ 212, 278, 1 ], [ 212, 284, 1 ], [ 213, 282, 1 ], [ 219, 285, 1 ], 
  [ 220, 281, 1 ], [ 225, 281, 1 ], [ 226, 282, 1 ], [ 226, 285, 1 ], 
  [ 229, 282, 1 ], [ 229, 285, 1 ], [ 230, 286, 1 ], [ 232, 277, 1 ], 
  [ 235, 277, 1 ], [ 239, 276, 1 ], [ 241, 278, 1 ], [ 247, 285, 1 ], 
  [ 253, 281, 1 ], [ 254, 282, 1 ], [ 254, 285, 1 ], [ 258, 286, 1 ], 
  [ 270, 282, 1 ], [ 270, 285, 1 ] ]; 
A.tab[4] := [ [ 1, 8, 1 ], [ 2, 12, 1 ], [ 3, 16, 1 ], [ 4, 20, 1 ], 
  [ 5, 23, 1 ], [ 6, 27, 1 ], [ 7, 31, 1 ], [ 8, 35, 1 ], [ 9, 39, 1 ], 
  [ 10, 41, 1 ], [ 11, 45, 1 ], [ 12, 49, 1 ], [ 13, 53, 1 ], [ 14, 56, 1 ], 
  [ 15, 57, 1 ], [ 16, 61, 1 ], [ 17, 65, 1 ], [ 18, 68, 1 ], [ 19, 70, 1 ], 
  [ 21, 74, 1 ], [ 22, 78, 1 ], [ 23, 82, 1 ], [ 24, 85, 1 ], [ 25, 87, 1 ], 
  [ 26, 91, 1 ], [ 27, 95, 1 ], [ 28, 98, 1 ], [ 29, 100, 1 ], 
  [ 30, 101, 1 ], [ 31, 105, 1 ], [ 32, 108, 1 ], [ 33, 110, 1 ], 
  [ 34, 111, 1 ], [ 36, 74, 1 ], [ 36, 85, 1 ], [ 37, 114, 1 ], 
  [ 38, 116, 1 ], [ 39, 118, 1 ], [ 40, 122, 1 ], [ 41, 126, 1 ], 
  [ 42, 129, 1 ], [ 43, 131, 1 ], [ 44, 132, 1 ], [ 45, 136, 1 ], 
  [ 46, 139, 1 ], [ 47, 141, 1 ], [ 48, 142, 1 ], [ 50, 78, 1 ], 
  [ 50, 98, 1 ], [ 51, 144, 1 ], [ 52, 146, 1 ], [ 53, 147, 1 ], 
  [ 54, 122, 1 ], [ 54, 131, 1 ], [ 55, 149, 1 ], [ 56, 150, 1 ], 
  [ 57, 154, 1 ], [ 58, 156, 1 ], [ 59, 158, 1 ], [ 60, 159, 1 ], 
  [ 62, 82, 1 ], [ 62, 108, 1 ], [ 63, 161, 1 ], [ 64, 162, 1 ], 
  [ 65, 163, 1 ], [ 66, 126, 1 ], [ 66, 141, 1 ], [ 67, 164, 1 ], 
  [ 68, 165, 1 ], [ 69, 154, 1 ], [ 69, 159, 1 ], [ 70, 166, 1 ], 
  [ 71, 169, 1 ], [ 72, 171, 1 ], [ 73, 172, 1 ], [ 75, 175, 1 ], 
  [ 76, 177, 1 ], [ 77, 178, 1 ], [ 79, 181, 1 ], [ 80, 183, 1 ], 
  [ 81, 184, 1 ], [ 83, 187, 1 ], [ 84, 189, 1 ], [ 85, 191, 1 ], 
  [ 86, 194, 1 ], [ 87, 197, 1 ], [ 88, 200, 1 ], [ 89, 202, 1 ], 
  [ 90, 203, 1 ], [ 91, 207, 1 ], [ 92, 210, 1 ], [ 93, 212, 1 ], 
  [ 94, 213, 1 ], [ 96, 189, 1 ], [ 96, 190, 1 ], [ 96, 200, 1 ], 
  [ 97, 215, 1 ], [ 98, 216, 1 ], [ 99, 218, 1 ], [ 100, 219, 1 ], 
  [ 101, 222, 1 ], [ 102, 224, 1 ], [ 103, 226, 1 ], [ 104, 227, 1 ], 
  [ 106, 210, 1 ], [ 107, 224, 1 ], [ 108, 228, 1 ], [ 109, 229, 1 ], 
  [ 110, 230, 1 ], [ 111, 231, 1 ], [ 112, 195, 1 ], [ 113, 232, 1 ], 
  [ 114, 197, 1 ], [ 115, 220, 1 ], [ 116, 207, 1 ], [ 117, 213, 1 ], 
  [ 117, 226, 1 ], [ 117, 229, 1 ], [ 119, 235, 1 ], [ 120, 237, 1 ], 
  [ 121, 238, 1 ], [ 123, 241, 1 ], [ 124, 243, 1 ], [ 125, 244, 1 ], 
  [ 127, 196, 1 ], [ 127, 235, 1 ], [ 128, 246, 1 ], [ 129, 247, 1 ], 
  [ 130, 249, 1 ], [ 131, 250, 1 ], [ 132, 252, 1 ], [ 133, 254, 1 ], 
  [ 134, 256, 1 ], [ 135, 257, 1 ], [ 137, 197, 1 ], [ 137, 241, 1 ], 
  [ 138, 226, 1 ], [ 138, 229, 1 ], [ 138, 254, 1 ], [ 139, 258, 1 ], 
  [ 140, 256, 1 ], [ 141, 259, 1 ], [ 142, 260, 1 ], [ 143, 261, 1 ], 
  [ 144, 219, 1 ], [ 145, 221, 1 ], [ 146, 222, 1 ], [ 148, 251, 1 ], 
  [ 149, 252, 1 ], [ 151, 263, 1 ], [ 152, 265, 1 ], [ 153, 266, 1 ], 
  [ 155, 222, 1 ], [ 155, 263, 1 ], [ 156, 267, 1 ], [ 157, 252, 1 ], 
  [ 157, 265, 1 ], [ 158, 268, 1 ], [ 159, 269, 1 ], [ 160, 270, 1 ], 
  [ 161, 230, 1 ], [ 162, 231, 1 ], [ 164, 260, 1 ], [ 168, 271, 1 ], 
  [ 170, 272, 1 ], [ 173, 271, 1 ], [ 176, 273, 1 ], [ 182, 274, 1 ], 
  [ 186, 275, 1 ], [ 188, 273, 1 ], [ 190, 274, 1 ], [ 192, 276, 1 ], 
  [ 193, 277, 1 ], [ 196, 278, 1 ], [ 199, 279, 1 ], [ 200, 274, 1 ], 
  [ 201, 280, 1 ], [ 202, 278, 1 ], [ 203, 282, 1 ], [ 204, 283, 1 ], 
  [ 205, 284, 1 ], [ 206, 285, 1 ], [ 209, 274, 1 ], [ 209, 283, 1 ], 
  [ 211, 284, 1 ], [ 213, 286, 1 ], [ 217, 281, 1 ], [ 218, 282, 1 ], 
  [ 220, 282, 1 ], [ 226, 286, 1 ], [ 229, 286, 1 ], [ 233, 276, 1 ], 
  [ 234, 277, 1 ], [ 240, 278, 1 ], [ 245, 281, 1 ], [ 246, 282, 1 ], 
  [ 254, 286, 1 ], [ 261, 282, 1 ], [ 270, 286, 1 ] ]; 
for i in [1..A.rnk] do 
    A.tab[i] := ListToMat(A.tab[i],A.dim,A.fld); 
od; 
return A; 
end ); 
