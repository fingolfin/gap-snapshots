BindGlobal( "Kur_4_3_4", function() 
local A, i; 
A := rec(); 
A.rnk := 4; 
A.dim := 280; 
A.com := false; 
A.fld := GF(2^2); 
A.wgs := [ 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 
  3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 
  3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 
  4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 
  4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 
  4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 
  4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 
  5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 
  5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 
  5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 
  5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 
  6, 6, 6, 6, 6, 6, 6, 6 ]; 
A.wds := [ ,,,, [ 1, 1 ], [ 2, 1 ], [ 3, 1 ], [ 4, 1 ], [ 1, 2 ], [ 2, 2 ], 
  [ 3, 2 ], [ 4, 2 ], [ 1, 3 ], [ 2, 3 ], [ 3, 3 ], [ 4, 3 ], [ 1, 4 ], 
  [ 2, 4 ], [ 3, 4 ], [ 4, 4 ], [ 2, 5 ], [ 3, 5 ], [ 4, 5 ], [ 1, 6 ], 
  [ 2, 6 ], [ 3, 6 ], [ 4, 6 ], [ 1, 7 ], [ 2, 7 ], [ 3, 7 ], [ 4, 7 ], 
  [ 1, 8 ], [ 2, 8 ], [ 3, 8 ], [ 4, 8 ], [ 2, 9 ], [ 3, 9 ], [ 4, 9 ], 
  [ 3, 10 ], [ 4, 10 ], [ 1, 11 ], [ 2, 11 ], [ 3, 11 ], [ 4, 11 ], 
  [ 1, 12 ], [ 2, 12 ], [ 3, 12 ], [ 4, 12 ], [ 2, 13 ], [ 3, 13 ], 
  [ 4, 13 ], [ 3, 14 ], [ 4, 14 ], [ 4, 15 ], [ 1, 16 ], [ 2, 16 ], 
  [ 3, 16 ], [ 4, 16 ], [ 2, 17 ], [ 3, 17 ], [ 4, 17 ], [ 3, 18 ], 
  [ 4, 18 ], [ 4, 19 ], [ 1, 21 ], [ 2, 21 ], [ 3, 21 ], [ 4, 21 ], 
  [ 1, 22 ], [ 2, 22 ], [ 3, 22 ], [ 4, 22 ], [ 1, 23 ], [ 2, 23 ], 
  [ 3, 23 ], [ 4, 23 ], [ 2, 24 ], [ 3, 24 ], [ 4, 24 ], [ 3, 25 ], 
  [ 4, 25 ], [ 1, 26 ], [ 2, 26 ], [ 3, 26 ], [ 4, 26 ], [ 1, 27 ], 
  [ 2, 27 ], [ 3, 27 ], [ 4, 27 ], [ 2, 28 ], [ 3, 28 ], [ 4, 28 ], 
  [ 3, 29 ], [ 4, 29 ], [ 4, 30 ], [ 1, 31 ], [ 2, 31 ], [ 3, 31 ], 
  [ 4, 31 ], [ 2, 32 ], [ 3, 32 ], [ 4, 32 ], [ 3, 33 ], [ 4, 33 ], 
  [ 4, 34 ], [ 2, 36 ], [ 3, 36 ], [ 4, 36 ], [ 3, 37 ], [ 4, 37 ], 
  [ 3, 38 ], [ 4, 38 ], [ 1, 39 ], [ 2, 39 ], [ 3, 39 ], [ 4, 39 ], 
  [ 1, 40 ], [ 2, 40 ], [ 3, 40 ], [ 4, 40 ], [ 2, 41 ], [ 3, 41 ], 
  [ 4, 41 ], [ 3, 42 ], [ 4, 42 ], [ 4, 43 ], [ 1, 44 ], [ 2, 44 ], 
  [ 3, 44 ], [ 4, 44 ], [ 2, 45 ], [ 3, 45 ], [ 4, 45 ], [ 3, 46 ], 
  [ 4, 46 ], [ 4, 47 ], [ 3, 49 ], [ 4, 49 ], [ 3, 50 ], [ 4, 50 ], 
  [ 4, 51 ], [ 3, 52 ], [ 4, 52 ], [ 4, 53 ], [ 1, 54 ], [ 2, 54 ], 
  [ 3, 54 ], [ 4, 54 ], [ 3, 55 ], [ 4, 55 ], [ 3, 56 ], [ 4, 56 ], 
  [ 4, 57 ], [ 3, 59 ], [ 4, 59 ], [ 4, 60 ], [ 4, 61 ], [ 4, 62 ], 
  [ 4, 63 ], [ 4, 64 ], [ 2, 65 ], [ 3, 65 ], [ 4, 65 ], [ 3, 66 ], 
  [ 4, 66 ], [ 4, 67 ], [ 2, 69 ], [ 3, 69 ], [ 4, 69 ], [ 3, 70 ], 
  [ 4, 70 ], [ 4, 71 ], [ 2, 73 ], [ 3, 73 ], [ 4, 73 ], [ 3, 74 ], 
  [ 4, 74 ], [ 4, 75 ], [ 2, 77 ], [ 3, 77 ], [ 4, 77 ], [ 3, 78 ], 
  [ 4, 78 ], [ 3, 79 ], [ 4, 79 ], [ 2, 80 ], [ 3, 80 ], [ 4, 80 ], 
  [ 2, 81 ], [ 3, 81 ], [ 4, 81 ], [ 2, 82 ], [ 3, 82 ], [ 4, 82 ], 
  [ 3, 83 ], [ 4, 83 ], [ 4, 84 ], [ 1, 85 ], [ 2, 85 ], [ 3, 85 ], 
  [ 4, 85 ], [ 2, 86 ], [ 3, 86 ], [ 4, 86 ], [ 3, 87 ], [ 4, 87 ], 
  [ 4, 88 ], [ 3, 91 ], [ 4, 91 ], [ 4, 92 ], [ 3, 93 ], [ 4, 93 ], 
  [ 4, 94 ], [ 2, 95 ], [ 3, 95 ], [ 4, 95 ], [ 3, 96 ], [ 4, 96 ], 
  [ 3, 97 ], [ 4, 97 ], [ 4, 98 ], [ 4, 102 ], [ 4, 103 ], [ 4, 104 ], 
  [ 4, 105 ], [ 4, 107 ], [ 2, 113 ], [ 3, 113 ], [ 4, 113 ], [ 3, 114 ], 
  [ 4, 114 ], [ 4, 115 ], [ 2, 117 ], [ 3, 117 ], [ 4, 117 ], [ 3, 118 ], 
  [ 4, 118 ], [ 4, 119 ], [ 3, 122 ], [ 4, 122 ], [ 4, 123 ], [ 3, 124 ], 
  [ 4, 124 ], [ 4, 125 ], [ 3, 126 ], [ 4, 126 ], [ 3, 127 ], [ 4, 127 ], 
  [ 3, 128 ], [ 4, 128 ], [ 4, 129 ], [ 4, 133 ], [ 4, 135 ], [ 4, 136 ], 
  [ 4, 137 ], [ 3, 145 ], [ 4, 145 ], [ 3, 146 ], [ 4, 146 ], [ 4, 147 ], 
  [ 4, 150 ], [ 4, 152 ], [ 4, 153 ], [ 4, 154 ], [ 4, 162 ], [ 4, 164 ], 
  [ 4, 170 ], [ 4, 176 ], [ 4, 180 ], [ 4, 186 ], [ 4, 187 ], [ 4, 190 ], 
  [ 4, 193 ], [ 4, 195 ], [ 3, 197 ], [ 4, 197 ], [ 4, 198 ], [ 4, 199 ], 
  [ 4, 200 ], [ 4, 207 ] ]; 
A.tab := [  ]; 
A.tab[1] := [ [ 1, 5, 1 ], [ 2, 9, 1 ], [ 3, 13, 1 ], [ 4, 17, 1 ], 
  [ 6, 24, 1 ], [ 7, 28, 1 ], [ 8, 32, 1 ], [ 9, 21, 1 ], [ 9, 24, 1 ], 
  [ 10, 25, 1 ], [ 10, 36, 1 ], [ 11, 41, 1 ], [ 12, 45, 1 ], [ 13, 22, 1 ], 
  [ 13, 28, 1 ], [ 14, 26, 1 ], [ 14, 29, 1 ], [ 14, 37, 1 ], [ 14, 41, 1 ], 
  [ 14, 49, 1 ], [ 15, 30, 1 ], [ 15, 50, 1 ], [ 16, 55, 1 ], [ 17, 23, 1 ], 
  [ 17, 32, 1 ], [ 18, 27, 1 ], [ 18, 33, 1 ], [ 18, 38, 1 ], [ 18, 45, 1 ], 
  [ 18, 59, 1 ], [ 19, 31, 1 ], [ 19, 34, 1 ], [ 19, 51, 1 ], [ 19, 55, 1 ], 
  [ 19, 60, 1 ], [ 20, 35, 1 ], [ 20, 61, 1 ], [ 21, 65, 1 ], [ 22, 69, 1 ], 
  [ 23, 73, 1 ], [ 24, 65, 1 ], [ 25, 66, 1 ], [ 25, 77, 1 ], [ 26, 82, 1 ], 
  [ 27, 86, 1 ], [ 28, 69, 1 ], [ 29, 67, 1 ], [ 29, 70, 1 ], [ 29, 78, 1 ], 
  [ 29, 82, 1 ], [ 29, 90, 1 ], [ 30, 71, 1 ], [ 30, 91, 1 ], [ 31, 96, 1 ], 
  [ 32, 73, 1 ], [ 33, 68, 1 ], [ 33, 74, 1 ], [ 33, 79, 1 ], [ 33, 86, 1 ], 
  [ 33, 100, 1 ], [ 34, 72, 1 ], [ 34, 75, 1 ], [ 34, 92, 1 ], [ 34, 96, 1 ], 
  [ 34, 101, 1 ], [ 35, 76, 1 ], [ 35, 102, 1 ], [ 36, 66, 1 ], 
  [ 37, 78, 1 ], [ 37, 82, 1 ], [ 38, 79, 1 ], [ 38, 86, 1 ], [ 39, 113, 1 ], 
  [ 40, 117, 1 ], [ 41, 67, 1 ], [ 41, 82, 1 ], [ 42, 80, 1 ], [ 42, 83, 1 ], 
  [ 42, 107, 1 ], [ 42, 113, 1 ], [ 42, 121, 1 ], [ 43, 109, 1 ], 
  [ 43, 122, 1 ], [ 44, 127, 1 ], [ 45, 68, 1 ], [ 45, 86, 1 ], 
  [ 46, 81, 1 ], [ 46, 87, 1 ], [ 46, 108, 1 ], [ 46, 117, 1 ], 
  [ 46, 131, 1 ], [ 47, 110, 1 ], [ 47, 111, 1 ], [ 47, 123, 1 ], 
  [ 47, 127, 1 ], [ 47, 132, 1 ], [ 48, 112, 1 ], [ 48, 133, 1 ], 
  [ 49, 67, 1 ], [ 49, 70, 1 ], [ 49, 78, 1 ], [ 49, 82, 1 ], [ 50, 71, 1 ], 
  [ 51, 92, 1 ], [ 51, 96, 1 ], [ 52, 84, 1 ], [ 52, 93, 1 ], [ 52, 109, 1 ], 
  [ 52, 137, 1 ], [ 53, 88, 1 ], [ 53, 94, 1 ], [ 53, 110, 1 ], 
  [ 53, 111, 1 ], [ 53, 123, 1 ], [ 53, 127, 1 ], [ 53, 138, 1 ], 
  [ 54, 145, 1 ], [ 55, 72, 1 ], [ 55, 96, 1 ], [ 56, 85, 1 ], 
  [ 56, 103, 1 ], [ 56, 110, 1 ], [ 56, 123, 1 ], [ 56, 127, 1 ], 
  [ 56, 132, 1 ], [ 56, 138, 1 ], [ 57, 95, 1 ], [ 57, 98, 1 ], 
  [ 57, 140, 1 ], [ 57, 145, 1 ], [ 57, 149, 1 ], [ 58, 141, 1 ], 
  [ 58, 150, 1 ], [ 59, 68, 1 ], [ 59, 74, 1 ], [ 59, 79, 1 ], [ 59, 86, 1 ], 
  [ 60, 72, 1 ], [ 60, 75, 1 ], [ 60, 92, 1 ], [ 60, 96, 1 ], [ 61, 76, 1 ], 
  [ 62, 85, 1 ], [ 62, 103, 1 ], [ 62, 123, 1 ], [ 62, 127, 1 ], 
  [ 62, 154, 1 ], [ 63, 89, 1 ], [ 63, 104, 1 ], [ 63, 112, 1 ], 
  [ 63, 155, 1 ], [ 64, 99, 1 ], [ 64, 105, 1 ], [ 64, 141, 1 ], 
  [ 64, 156, 1 ], [ 66, 161, 1 ], [ 67, 162, 1 ], [ 68, 163, 1 ], 
  [ 70, 167, 1 ], [ 71, 168, 1 ], [ 72, 169, 1 ], [ 74, 173, 1 ], 
  [ 75, 174, 1 ], [ 76, 175, 1 ], [ 80, 164, 1 ], [ 81, 165, 1 ], 
  [ 82, 162, 1 ], [ 83, 164, 1 ], [ 83, 180, 1 ], [ 83, 192, 1 ], 
  [ 84, 182, 1 ], [ 84, 193, 1 ], [ 85, 198, 1 ], [ 86, 163, 1 ], 
  [ 87, 165, 1 ], [ 87, 181, 1 ], [ 87, 202, 1 ], [ 88, 183, 1 ], 
  [ 88, 184, 1 ], [ 88, 194, 1 ], [ 88, 198, 1 ], [ 88, 203, 1 ], 
  [ 89, 185, 1 ], [ 89, 204, 1 ], [ 93, 170, 1 ], [ 93, 182, 1 ], 
  [ 93, 193, 1 ], [ 94, 166, 1 ], [ 94, 171, 1 ], [ 94, 198, 1 ], 
  [ 95, 172, 1 ], [ 96, 169, 1 ], [ 97, 166, 1 ], [ 97, 176, 1 ], 
  [ 97, 184, 1 ], [ 97, 198, 1 ], [ 97, 203, 1 ], [ 98, 172, 1 ], 
  [ 98, 209, 1 ], [ 98, 217, 1 ], [ 99, 210, 1 ], [ 99, 218, 1 ], 
  [ 103, 166, 1 ], [ 103, 176, 1 ], [ 103, 183, 1 ], [ 103, 184, 1 ], 
  [ 103, 194, 1 ], [ 103, 198, 1 ], [ 103, 203, 1 ], [ 104, 177, 1 ], 
  [ 104, 185, 1 ], [ 104, 204, 1 ], [ 105, 178, 1 ], [ 105, 210, 1 ], 
  [ 105, 218, 1 ], [ 106, 179, 1 ], [ 107, 164, 1 ], [ 107, 180, 1 ], 
  [ 108, 165, 1 ], [ 108, 181, 1 ], [ 109, 193, 1 ], [ 110, 183, 1 ], 
  [ 110, 198, 1 ], [ 111, 183, 1 ], [ 111, 194, 1 ], [ 111, 198, 1 ], 
  [ 111, 203, 1 ], [ 112, 204, 1 ], [ 114, 227, 1 ], [ 115, 228, 1 ], 
  [ 116, 229, 1 ], [ 118, 233, 1 ], [ 119, 234, 1 ], [ 120, 235, 1 ], 
  [ 121, 164, 1 ], [ 121, 180, 1 ], [ 122, 182, 1 ], [ 123, 194, 1 ], 
  [ 123, 198, 1 ], [ 124, 187, 1 ], [ 124, 195, 1 ], [ 124, 228, 1 ], 
  [ 125, 188, 1 ], [ 125, 196, 1 ], [ 125, 229, 1 ], [ 126, 197, 1 ], 
  [ 127, 166, 1 ], [ 127, 198, 1 ], [ 128, 205, 1 ], [ 128, 226, 1 ], 
  [ 128, 229, 1 ], [ 128, 234, 1 ], [ 129, 200, 1 ], [ 129, 240, 1 ], 
  [ 129, 247, 1 ], [ 130, 241, 1 ], [ 130, 248, 1 ], [ 131, 165, 1 ], 
  [ 131, 181, 1 ], [ 132, 183, 1 ], [ 132, 184, 1 ], [ 132, 194, 1 ], 
  [ 132, 198, 1 ], [ 133, 185, 1 ], [ 134, 190, 1 ], [ 134, 205, 1 ], 
  [ 134, 234, 1 ], [ 135, 191, 1 ], [ 135, 206, 1 ], [ 135, 235, 1 ], 
  [ 136, 201, 1 ], [ 136, 207, 1 ], [ 136, 241, 1 ], [ 136, 248, 1 ], 
  [ 137, 170, 1 ], [ 137, 182, 1 ], [ 138, 166, 1 ], [ 138, 171, 1 ], 
  [ 138, 183, 1 ], [ 138, 184, 1 ], [ 138, 194, 1 ], [ 138, 198, 1 ], 
  [ 139, 208, 1 ], [ 140, 172, 1 ], [ 140, 209, 1 ], [ 141, 218, 1 ], 
  [ 142, 239, 1 ], [ 143, 212, 1 ], [ 143, 240, 1 ], [ 143, 255, 1 ], 
  [ 144, 201, 1 ], [ 144, 220, 1 ], [ 144, 223, 1 ], [ 144, 248, 1 ], 
  [ 146, 214, 1 ], [ 146, 219, 1 ], [ 146, 240, 1 ], [ 146, 247, 1 ], 
  [ 146, 255, 1 ], [ 147, 256, 1 ], [ 148, 257, 1 ], [ 149, 172, 1 ], 
  [ 149, 209, 1 ], [ 150, 210, 1 ], [ 151, 219, 1 ], [ 151, 247, 1 ], 
  [ 151, 255, 1 ], [ 152, 201, 1 ], [ 152, 213, 1 ], [ 152, 223, 1 ], 
  [ 152, 248, 1 ], [ 153, 216, 1 ], [ 153, 221, 1 ], [ 153, 257, 1 ], 
  [ 154, 166, 1 ], [ 154, 176, 1 ], [ 154, 194, 1 ], [ 154, 198, 1 ], 
  [ 155, 177, 1 ], [ 155, 185, 1 ], [ 156, 178, 1 ], [ 156, 210, 1 ], 
  [ 157, 222, 1 ], [ 158, 201, 1 ], [ 158, 223, 1 ], [ 158, 241, 1 ], 
  [ 158, 264, 1 ], [ 159, 252, 1 ], [ 160, 261, 1 ], [ 166, 265, 1 ], 
  [ 171, 265, 1 ], [ 176, 265, 1 ], [ 188, 266, 1 ], [ 190, 266, 1 ], 
  [ 196, 266, 1 ], [ 198, 265, 1 ], [ 199, 266, 1 ], [ 199, 269, 1 ], 
  [ 200, 267, 1 ], [ 200, 273, 1 ], [ 201, 268, 1 ], [ 201, 277, 1 ], 
  [ 205, 266, 1 ], [ 207, 268, 1 ], [ 207, 277, 1 ], [ 212, 267, 1 ], 
  [ 213, 268, 1 ], [ 213, 277, 1 ], [ 214, 267, 1 ], [ 219, 273, 1 ], 
  [ 220, 268, 1 ], [ 220, 277, 1 ], [ 223, 277, 1 ], [ 226, 266, 1 ], 
  [ 226, 269, 1 ], [ 231, 270, 1 ], [ 232, 271, 1 ], [ 236, 270, 1 ], 
  [ 238, 272, 1 ], [ 240, 273, 1 ], [ 241, 277, 1 ], [ 243, 274, 1 ], 
  [ 244, 272, 1 ], [ 245, 275, 1 ], [ 246, 276, 1 ], [ 247, 273, 1 ], 
  [ 248, 268, 1 ], [ 250, 278, 1 ], [ 251, 279, 1 ], [ 254, 280, 1 ], 
  [ 255, 267, 1 ], [ 255, 273, 1 ], [ 258, 275, 1 ], [ 259, 276, 1 ], 
  [ 262, 280, 1 ] ]; 
A.tab[2] := [ [ 1, 6, 1 ], [ 2, 10, 1 ], [ 3, 14, 1 ], [ 4, 18, 1 ], 
  [ 5, 21, 1 ], [ 6, 25, 1 ], [ 7, 29, 1 ], [ 8, 33, 1 ], [ 9, 36, 1 ], 
  [ 11, 42, 1 ], [ 12, 46, 1 ], [ 13, 49, 1 ], [ 14, 39, 1 ], [ 14, 42, 1 ], 
  [ 15, 43, 1 ], [ 15, 52, 1 ], [ 16, 56, 1 ], [ 17, 59, 1 ], [ 18, 40, 1 ], 
  [ 18, 46, 1 ], [ 19, 44, 1 ], [ 19, 47, 1 ], [ 19, 53, 1 ], [ 19, 56, 1 ], 
  [ 19, 62, 1 ], [ 20, 48, 1 ], [ 20, 63, 1 ], [ 21, 66, 1 ], [ 22, 70, 1 ], 
  [ 23, 74, 1 ], [ 24, 77, 1 ], [ 26, 83, 1 ], [ 27, 87, 1 ], [ 28, 90, 1 ], 
  [ 29, 80, 1 ], [ 29, 83, 1 ], [ 30, 84, 1 ], [ 30, 93, 1 ], [ 31, 97, 1 ], 
  [ 32, 100, 1 ], [ 33, 81, 1 ], [ 33, 87, 1 ], [ 34, 85, 1 ], [ 34, 88, 1 ], 
  [ 34, 94, 1 ], [ 34, 97, 1 ], [ 34, 103, 1 ], [ 35, 89, 1 ], 
  [ 35, 104, 1 ], [ 36, 106, 1 ], [ 37, 83, 1 ], [ 37, 107, 1 ], 
  [ 38, 87, 1 ], [ 38, 108, 1 ], [ 39, 114, 1 ], [ 40, 118, 1 ], 
  [ 41, 121, 1 ], [ 42, 114, 1 ], [ 43, 115, 1 ], [ 43, 124, 1 ], 
  [ 44, 128, 1 ], [ 45, 131, 1 ], [ 46, 118, 1 ], [ 47, 116, 1 ], 
  [ 47, 119, 1 ], [ 47, 125, 1 ], [ 47, 128, 1 ], [ 47, 134, 1 ], 
  [ 48, 120, 1 ], [ 48, 135, 1 ], [ 49, 113, 1 ], [ 49, 121, 1 ], 
  [ 50, 93, 1 ], [ 50, 137, 1 ], [ 51, 88, 1 ], [ 51, 97, 1 ], 
  [ 51, 110, 1 ], [ 51, 111, 1 ], [ 51, 138, 1 ], [ 52, 115, 1 ], 
  [ 53, 125, 1 ], [ 53, 128, 1 ], [ 54, 146, 1 ], [ 55, 97, 1 ], 
  [ 55, 103, 1 ], [ 55, 123, 1 ], [ 55, 132, 1 ], [ 55, 138, 1 ], 
  [ 56, 116, 1 ], [ 56, 128, 1 ], [ 57, 126, 1 ], [ 57, 129, 1 ], 
  [ 57, 143, 1 ], [ 57, 146, 1 ], [ 57, 151, 1 ], [ 58, 144, 1 ], 
  [ 58, 152, 1 ], [ 59, 117, 1 ], [ 59, 131, 1 ], [ 60, 88, 1 ], 
  [ 60, 94, 1 ], [ 60, 97, 1 ], [ 60, 103, 1 ], [ 60, 110, 1 ], 
  [ 60, 111, 1 ], [ 60, 154, 1 ], [ 61, 104, 1 ], [ 61, 155, 1 ], 
  [ 62, 116, 1 ], [ 62, 119, 1 ], [ 62, 125, 1 ], [ 62, 128, 1 ], 
  [ 63, 120, 1 ], [ 64, 130, 1 ], [ 64, 136, 1 ], [ 64, 144, 1 ], 
  [ 64, 158, 1 ], [ 65, 161, 1 ], [ 67, 164, 1 ], [ 68, 165, 1 ], 
  [ 69, 167, 1 ], [ 71, 170, 1 ], [ 72, 171, 1 ], [ 73, 173, 1 ], 
  [ 75, 176, 1 ], [ 76, 177, 1 ], [ 77, 179, 1 ], [ 78, 164, 1 ], 
  [ 78, 180, 1 ], [ 79, 165, 1 ], [ 79, 181, 1 ], [ 80, 186, 1 ], 
  [ 81, 189, 1 ], [ 82, 192, 1 ], [ 83, 186, 1 ], [ 84, 187, 1 ], 
  [ 84, 195, 1 ], [ 85, 199, 1 ], [ 86, 202, 1 ], [ 87, 189, 1 ], 
  [ 88, 188, 1 ], [ 88, 190, 1 ], [ 88, 196, 1 ], [ 88, 199, 1 ], 
  [ 88, 205, 1 ], [ 89, 191, 1 ], [ 89, 206, 1 ], [ 90, 164, 1 ], 
  [ 90, 192, 1 ], [ 91, 170, 1 ], [ 91, 193, 1 ], [ 92, 166, 1 ], 
  [ 92, 171, 1 ], [ 92, 194, 1 ], [ 93, 187, 1 ], [ 94, 196, 1 ], 
  [ 94, 199, 1 ], [ 95, 214, 1 ], [ 96, 171, 1 ], [ 96, 176, 1 ], 
  [ 96, 183, 1 ], [ 96, 184, 1 ], [ 96, 203, 1 ], [ 97, 188, 1 ], 
  [ 97, 199, 1 ], [ 98, 197, 1 ], [ 98, 200, 1 ], [ 98, 212, 1 ], 
  [ 98, 214, 1 ], [ 98, 219, 1 ], [ 99, 213, 1 ], [ 99, 220, 1 ], 
  [ 100, 165, 1 ], [ 100, 202, 1 ], [ 101, 166, 1 ], [ 101, 176, 1 ], 
  [ 101, 203, 1 ], [ 102, 177, 1 ], [ 102, 204, 1 ], [ 103, 188, 1 ], 
  [ 103, 190, 1 ], [ 103, 196, 1 ], [ 103, 199, 1 ], [ 104, 191, 1 ], 
  [ 105, 201, 1 ], [ 105, 207, 1 ], [ 105, 213, 1 ], [ 105, 223, 1 ], 
  [ 109, 195, 1 ], [ 110, 199, 1 ], [ 110, 226, 1 ], [ 111, 196, 1 ], 
  [ 111, 199, 1 ], [ 111, 205, 1 ], [ 111, 226, 1 ], [ 112, 206, 1 ], 
  [ 113, 227, 1 ], [ 115, 230, 1 ], [ 116, 231, 1 ], [ 117, 233, 1 ], 
  [ 119, 236, 1 ], [ 120, 237, 1 ], [ 121, 227, 1 ], [ 122, 195, 1 ], 
  [ 122, 228, 1 ], [ 123, 188, 1 ], [ 123, 199, 1 ], [ 123, 229, 1 ], 
  [ 126, 232, 1 ], [ 127, 188, 1 ], [ 127, 199, 1 ], [ 127, 205, 1 ], 
  [ 127, 234, 1 ], [ 128, 231, 1 ], [ 129, 232, 1 ], [ 129, 243, 1 ], 
  [ 129, 249, 1 ], [ 130, 244, 1 ], [ 130, 250, 1 ], [ 131, 233, 1 ], 
  [ 132, 188, 1 ], [ 132, 196, 1 ], [ 132, 199, 1 ], [ 132, 205, 1 ], 
  [ 132, 234, 1 ], [ 133, 206, 1 ], [ 133, 235, 1 ], [ 136, 238, 1 ], 
  [ 136, 244, 1 ], [ 136, 250, 1 ], [ 137, 187, 1 ], [ 137, 195, 1 ], 
  [ 138, 188, 1 ], [ 138, 190, 1 ], [ 138, 199, 1 ], [ 139, 211, 1 ], 
  [ 140, 197, 1 ], [ 140, 214, 1 ], [ 140, 255, 1 ], [ 141, 201, 1 ], 
  [ 141, 223, 1 ], [ 142, 242, 1 ], [ 143, 232, 1 ], [ 143, 243, 1 ], 
  [ 144, 250, 1 ], [ 145, 214, 1 ], [ 145, 219, 1 ], [ 145, 240, 1 ], 
  [ 145, 247, 1 ], [ 145, 255, 1 ], [ 147, 258, 1 ], [ 148, 259, 1 ], 
  [ 149, 197, 1 ], [ 149, 212, 1 ], [ 149, 214, 1 ], [ 149, 219, 1 ], 
  [ 149, 240, 1 ], [ 149, 247, 1 ], [ 149, 255, 1 ], [ 150, 201, 1 ], 
  [ 150, 223, 1 ], [ 150, 241, 1 ], [ 150, 248, 1 ], [ 151, 232, 1 ], 
  [ 151, 243, 1 ], [ 152, 244, 1 ], [ 153, 246, 1 ], [ 153, 251, 1 ], 
  [ 153, 259, 1 ], [ 154, 196, 1 ], [ 154, 199, 1 ], [ 154, 205, 1 ], 
  [ 155, 191, 1 ], [ 155, 206, 1 ], [ 156, 201, 1 ], [ 156, 213, 1 ], 
  [ 156, 220, 1 ], [ 156, 264, 1 ], [ 157, 224, 1 ], [ 158, 238, 1 ], 
  [ 158, 244, 1 ], [ 159, 253, 1 ], [ 160, 262, 1 ], [ 166, 266, 1 ], 
  [ 169, 265, 1 ], [ 172, 267, 1 ], [ 174, 265, 1 ], [ 178, 268, 1 ], 
  [ 183, 266, 1 ], [ 183, 269, 1 ], [ 184, 266, 1 ], [ 184, 269, 1 ], 
  [ 188, 270, 1 ], [ 190, 270, 1 ], [ 194, 266, 1 ], [ 197, 271, 1 ], 
  [ 199, 270, 1 ], [ 200, 271, 1 ], [ 200, 274, 1 ], [ 201, 272, 1 ], 
  [ 201, 278, 1 ], [ 203, 266, 1 ], [ 207, 278, 1 ], [ 209, 267, 1 ], 
  [ 209, 273, 1 ], [ 210, 268, 1 ], [ 212, 271, 1 ], [ 212, 274, 1 ], 
  [ 213, 278, 1 ], [ 215, 275, 1 ], [ 216, 276, 1 ], [ 218, 277, 1 ], 
  [ 219, 271, 1 ], [ 219, 274, 1 ], [ 220, 272, 1 ], [ 221, 279, 1 ], 
  [ 225, 280, 1 ], [ 229, 270, 1 ], [ 234, 270, 1 ], [ 240, 271, 1 ], 
  [ 241, 272, 1 ], [ 241, 278, 1 ], [ 247, 271, 1 ], [ 247, 274, 1 ], 
  [ 248, 272, 1 ], [ 248, 278, 1 ], [ 255, 271, 1 ], [ 256, 275, 1 ], 
  [ 257, 276, 1 ], [ 261, 280, 1 ], [ 264, 272, 1 ], [ 264, 278, 1 ] ]; 
A.tab[3] := [ [ 1, 7, 1 ], [ 2, 11, 1 ], [ 3, 15, 1 ], [ 4, 19, 1 ], 
  [ 5, 22, 1 ], [ 6, 26, 1 ], [ 7, 30, 1 ], [ 8, 34, 1 ], [ 9, 37, 1 ], 
  [ 10, 39, 1 ], [ 11, 43, 1 ], [ 12, 47, 1 ], [ 13, 50, 1 ], [ 14, 52, 1 ], 
  [ 16, 57, 1 ], [ 17, 60, 1 ], [ 18, 62, 1 ], [ 19, 54, 1 ], [ 19, 57, 1 ], 
  [ 20, 58, 1 ], [ 20, 64, 1 ], [ 21, 67, 1 ], [ 22, 71, 1 ], [ 23, 75, 1 ], 
  [ 24, 78, 1 ], [ 25, 80, 1 ], [ 26, 84, 1 ], [ 27, 88, 1 ], [ 28, 91, 1 ], 
  [ 29, 93, 1 ], [ 31, 98, 1 ], [ 32, 101, 1 ], [ 33, 103, 1 ], 
  [ 34, 95, 1 ], [ 34, 98, 1 ], [ 35, 99, 1 ], [ 35, 105, 1 ], 
  [ 36, 107, 1 ], [ 37, 109, 1 ], [ 38, 111, 1 ], [ 39, 115, 1 ], 
  [ 40, 119, 1 ], [ 41, 122, 1 ], [ 42, 124, 1 ], [ 44, 129, 1 ], 
  [ 45, 132, 1 ], [ 46, 134, 1 ], [ 47, 126, 1 ], [ 47, 129, 1 ], 
  [ 48, 130, 1 ], [ 48, 136, 1 ], [ 49, 137, 1 ], [ 50, 139, 1 ], 
  [ 51, 98, 1 ], [ 51, 140, 1 ], [ 52, 142, 1 ], [ 53, 129, 1 ], 
  [ 53, 143, 1 ], [ 54, 147, 1 ], [ 55, 149, 1 ], [ 56, 151, 1 ], 
  [ 57, 147, 1 ], [ 58, 148, 1 ], [ 58, 153, 1 ], [ 59, 154, 1 ], 
  [ 60, 145, 1 ], [ 60, 149, 1 ], [ 61, 105, 1 ], [ 61, 156, 1 ], 
  [ 62, 146, 1 ], [ 62, 151, 1 ], [ 63, 136, 1 ], [ 63, 158, 1 ], 
  [ 64, 148, 1 ], [ 65, 162, 1 ], [ 66, 164, 1 ], [ 68, 166, 1 ], 
  [ 69, 168, 1 ], [ 70, 170, 1 ], [ 72, 172, 1 ], [ 73, 174, 1 ], 
  [ 74, 176, 1 ], [ 76, 178, 1 ], [ 77, 180, 1 ], [ 78, 182, 1 ], 
  [ 79, 184, 1 ], [ 80, 187, 1 ], [ 81, 190, 1 ], [ 82, 193, 1 ], 
  [ 83, 195, 1 ], [ 85, 200, 1 ], [ 86, 203, 1 ], [ 87, 205, 1 ], 
  [ 88, 197, 1 ], [ 88, 200, 1 ], [ 89, 201, 1 ], [ 89, 207, 1 ], 
  [ 90, 193, 1 ], [ 91, 208, 1 ], [ 92, 172, 1 ], [ 92, 209, 1 ], 
  [ 93, 211, 1 ], [ 94, 200, 1 ], [ 94, 212, 1 ], [ 95, 215, 1 ], 
  [ 96, 217, 1 ], [ 97, 219, 1 ], [ 98, 215, 1 ], [ 99, 216, 1 ], 
  [ 99, 221, 1 ], [ 100, 183, 1 ], [ 100, 184, 1 ], [ 100, 203, 1 ], 
  [ 101, 172, 1 ], [ 101, 217, 1 ], [ 102, 178, 1 ], [ 102, 218, 1 ], 
  [ 103, 214, 1 ], [ 103, 219, 1 ], [ 104, 207, 1 ], [ 104, 223, 1 ], 
  [ 105, 216, 1 ], [ 106, 186, 1 ], [ 107, 187, 1 ], [ 108, 188, 1 ], 
  [ 108, 190, 1 ], [ 108, 226, 1 ], [ 110, 197, 1 ], [ 110, 200, 1 ], 
  [ 110, 214, 1 ], [ 111, 197, 1 ], [ 111, 200, 1 ], [ 112, 201, 1 ], 
  [ 112, 207, 1 ], [ 112, 220, 1 ], [ 112, 223, 1 ], [ 113, 228, 1 ], 
  [ 114, 230, 1 ], [ 116, 232, 1 ], [ 117, 234, 1 ], [ 118, 236, 1 ], 
  [ 120, 238, 1 ], [ 121, 187, 1 ], [ 121, 228, 1 ], [ 122, 239, 1 ], 
  [ 123, 197, 1 ], [ 123, 200, 1 ], [ 123, 214, 1 ], [ 123, 240, 1 ], 
  [ 124, 242, 1 ], [ 125, 232, 1 ], [ 125, 243, 1 ], [ 126, 245, 1 ], 
  [ 127, 247, 1 ], [ 128, 249, 1 ], [ 129, 245, 1 ], [ 130, 246, 1 ], 
  [ 130, 251, 1 ], [ 131, 188, 1 ], [ 131, 234, 1 ], [ 132, 197, 1 ], 
  [ 132, 247, 1 ], [ 133, 207, 1 ], [ 133, 248, 1 ], [ 134, 232, 1 ], 
  [ 134, 249, 1 ], [ 135, 238, 1 ], [ 135, 250, 1 ], [ 136, 246, 1 ], 
  [ 137, 211, 1 ], [ 138, 200, 1 ], [ 138, 255, 1 ], [ 141, 221, 1 ], 
  [ 144, 251, 1 ], [ 145, 256, 1 ], [ 146, 258, 1 ], [ 148, 260, 1 ], 
  [ 149, 256, 1 ], [ 150, 221, 1 ], [ 150, 257, 1 ], [ 151, 258, 1 ], 
  [ 152, 251, 1 ], [ 152, 259, 1 ], [ 154, 214, 1 ], [ 154, 219, 1 ], 
  [ 155, 207, 1 ], [ 155, 264, 1 ], [ 156, 216, 1 ], [ 156, 221, 1 ], 
  [ 157, 225, 1 ], [ 158, 246, 1 ], [ 158, 251, 1 ], [ 159, 254, 1 ], 
  [ 160, 263, 1 ], [ 163, 265, 1 ], [ 165, 266, 1 ], [ 171, 267, 1 ], 
  [ 173, 265, 1 ], [ 177, 268, 1 ], [ 181, 269, 1 ], [ 183, 267, 1 ], 
  [ 185, 268, 1 ], [ 188, 271, 1 ], [ 189, 270, 1 ], [ 191, 272, 1 ], 
  [ 194, 267, 1 ], [ 194, 273, 1 ], [ 196, 271, 1 ], [ 196, 274, 1 ], 
  [ 197, 275, 1 ], [ 198, 267, 1 ], [ 200, 275, 1 ], [ 201, 276, 1 ], 
  [ 201, 279, 1 ], [ 203, 267, 1 ], [ 204, 277, 1 ], [ 205, 271, 1 ], 
  [ 206, 272, 1 ], [ 206, 278, 1 ], [ 207, 276, 1 ], [ 213, 279, 1 ], 
  [ 214, 275, 1 ], [ 219, 275, 1 ], [ 220, 276, 1 ], [ 220, 279, 1 ], 
  [ 223, 276, 1 ], [ 223, 279, 1 ], [ 224, 280, 1 ], [ 226, 271, 1 ], 
  [ 229, 271, 1 ], [ 233, 270, 1 ], [ 235, 272, 1 ], [ 241, 279, 1 ], 
  [ 247, 275, 1 ], [ 248, 276, 1 ], [ 248, 279, 1 ], [ 252, 280, 1 ], 
  [ 264, 276, 1 ], [ 264, 279, 1 ] ]; 
A.tab[4] := [ [ 1, 8, 1 ], [ 2, 12, 1 ], [ 3, 16, 1 ], [ 4, 20, 1 ], 
  [ 5, 23, 1 ], [ 6, 27, 1 ], [ 7, 31, 1 ], [ 8, 35, 1 ], [ 9, 38, 1 ], 
  [ 10, 40, 1 ], [ 11, 44, 1 ], [ 12, 48, 1 ], [ 13, 51, 1 ], [ 14, 53, 1 ], 
  [ 15, 54, 1 ], [ 16, 58, 1 ], [ 17, 61, 1 ], [ 18, 63, 1 ], [ 19, 64, 1 ], 
  [ 21, 68, 1 ], [ 22, 72, 1 ], [ 23, 76, 1 ], [ 24, 79, 1 ], [ 25, 81, 1 ], 
  [ 26, 85, 1 ], [ 27, 89, 1 ], [ 28, 92, 1 ], [ 29, 94, 1 ], [ 30, 95, 1 ], 
  [ 31, 99, 1 ], [ 32, 102, 1 ], [ 33, 104, 1 ], [ 34, 105, 1 ], 
  [ 36, 108, 1 ], [ 37, 110, 1 ], [ 38, 112, 1 ], [ 39, 116, 1 ], 
  [ 40, 120, 1 ], [ 41, 123, 1 ], [ 42, 125, 1 ], [ 43, 126, 1 ], 
  [ 44, 130, 1 ], [ 45, 133, 1 ], [ 46, 135, 1 ], [ 47, 136, 1 ], 
  [ 49, 138, 1 ], [ 50, 140, 1 ], [ 51, 141, 1 ], [ 52, 143, 1 ], 
  [ 53, 144, 1 ], [ 54, 148, 1 ], [ 55, 150, 1 ], [ 56, 152, 1 ], 
  [ 57, 153, 1 ], [ 59, 155, 1 ], [ 60, 156, 1 ], [ 61, 157, 1 ], 
  [ 62, 158, 1 ], [ 63, 159, 1 ], [ 64, 160, 1 ], [ 65, 163, 1 ], 
  [ 66, 165, 1 ], [ 67, 166, 1 ], [ 69, 169, 1 ], [ 70, 171, 1 ], 
  [ 71, 172, 1 ], [ 73, 175, 1 ], [ 74, 177, 1 ], [ 75, 178, 1 ], 
  [ 77, 181, 1 ], [ 78, 183, 1 ], [ 79, 185, 1 ], [ 80, 188, 1 ], 
  [ 81, 191, 1 ], [ 82, 194, 1 ], [ 83, 196, 1 ], [ 84, 197, 1 ], 
  [ 85, 201, 1 ], [ 86, 204, 1 ], [ 87, 206, 1 ], [ 88, 207, 1 ], 
  [ 90, 183, 1 ], [ 90, 184, 1 ], [ 90, 194, 1 ], [ 91, 209, 1 ], 
  [ 92, 210, 1 ], [ 93, 212, 1 ], [ 94, 213, 1 ], [ 95, 216, 1 ], 
  [ 96, 218, 1 ], [ 97, 220, 1 ], [ 98, 221, 1 ], [ 100, 204, 1 ], 
  [ 101, 218, 1 ], [ 102, 222, 1 ], [ 103, 223, 1 ], [ 104, 224, 1 ], 
  [ 105, 225, 1 ], [ 106, 189, 1 ], [ 107, 226, 1 ], [ 108, 191, 1 ], 
  [ 109, 214, 1 ], [ 110, 201, 1 ], [ 111, 207, 1 ], [ 111, 220, 1 ], 
  [ 111, 223, 1 ], [ 113, 229, 1 ], [ 114, 231, 1 ], [ 115, 232, 1 ], 
  [ 117, 235, 1 ], [ 118, 237, 1 ], [ 119, 238, 1 ], [ 121, 190, 1 ], 
  [ 121, 229, 1 ], [ 122, 240, 1 ], [ 123, 241, 1 ], [ 124, 243, 1 ], 
  [ 125, 244, 1 ], [ 126, 246, 1 ], [ 127, 248, 1 ], [ 128, 250, 1 ], 
  [ 129, 251, 1 ], [ 131, 191, 1 ], [ 131, 235, 1 ], [ 132, 220, 1 ], 
  [ 132, 223, 1 ], [ 132, 248, 1 ], [ 133, 252, 1 ], [ 134, 250, 1 ], 
  [ 135, 253, 1 ], [ 136, 254, 1 ], [ 137, 255, 1 ], [ 138, 213, 1 ], 
  [ 139, 215, 1 ], [ 140, 216, 1 ], [ 142, 245, 1 ], [ 143, 246, 1 ], 
  [ 145, 257, 1 ], [ 146, 259, 1 ], [ 147, 260, 1 ], [ 149, 216, 1 ], 
  [ 149, 257, 1 ], [ 150, 261, 1 ], [ 151, 246, 1 ], [ 151, 259, 1 ], 
  [ 152, 262, 1 ], [ 153, 263, 1 ], [ 154, 264, 1 ], [ 155, 224, 1 ], 
  [ 156, 225, 1 ], [ 158, 254, 1 ], [ 162, 265, 1 ], [ 164, 266, 1 ], 
  [ 167, 265, 1 ], [ 170, 267, 1 ], [ 176, 268, 1 ], [ 180, 269, 1 ], 
  [ 182, 267, 1 ], [ 184, 268, 1 ], [ 186, 270, 1 ], [ 187, 271, 1 ], 
  [ 190, 272, 1 ], [ 193, 273, 1 ], [ 194, 268, 1 ], [ 195, 274, 1 ], 
  [ 196, 272, 1 ], [ 197, 276, 1 ], [ 198, 277, 1 ], [ 199, 278, 1 ], 
  [ 200, 279, 1 ], [ 203, 268, 1 ], [ 203, 277, 1 ], [ 205, 278, 1 ], 
  [ 207, 280, 1 ], [ 211, 275, 1 ], [ 212, 276, 1 ], [ 214, 276, 1 ], 
  [ 220, 280, 1 ], [ 223, 280, 1 ], [ 227, 270, 1 ], [ 228, 271, 1 ], 
  [ 234, 272, 1 ], [ 239, 275, 1 ], [ 240, 276, 1 ], [ 248, 280, 1 ], 
  [ 255, 276, 1 ], [ 264, 280, 1 ] ]; 
for i in [1..A.rnk] do 
    A.tab[i] := ListToMat(A.tab[i],A.dim,A.fld); 
od; 
return A; 
end ); 
