############################################################################
##
##  gl_3_31_1.fp                 IRREDSOL                  Burkhard Hoefling
##
##  @(#)$Id: gl_3_31_1.fp,v 1.1 2005/06/28 10:53:42 gap Exp $
##
##  Copyright (C) 2003-2005 by Burkhard Hoefling, 
##  Institut fuer Geometrie, Algebra und Diskrete Mathematik
##  Technische Universitaet Braunschweig, Germany
##


############################################################################
##
#V  IRREDSOL_DATA.FP
##
IRREDSOL_DATA.FP[3][31]{[ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 
  24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 
  51, 52, 53, 54, 55, 56 ]} := [
[ [ [ 1, 2, 31776, 1 ], [ 6, 2, 45664, 1 ] ], [ [  ], [ 1 ], [ 2 ] ], [ [ 150 ], [ 92 ], [ 142 ] ] ],
[ [ [ 3, 3, 476657, 2 ] ], [ [  ], [ 1 ] ], [ [ 121 ], [ 125 ] ] ],
[ [ [ 4, 3, 476657, 6 ] ], [ [  ], [ 1 ] ], [ [ 108 ], [ 102 ] ] ],
[ [ [ 3, 3, 476657, 8 ], [ 9, 2, 45664, 1 ], [ 9, 2, 492064, 1 ] ], [ [  ], [ 1 ], [ 2 ], [ 3 ] ], 
  [ [ 116 ], [ 112 ], [ 160 ], [ 166 ] ] ],
[ [ [ 4, 3, 476657, 6 ], [ 4, 9, 178747, 3 ], [ 6, 2, 45664, 1 ] ], [ [  ], [ 1 ], [ 2 ], [ 3 ] ], 
  [ [ 148 ], [ 90 ], [ 96 ], [ 140 ] ] ],
[ [ [ 3, 2, 492064, 1 ], [ 9, 4, 30784, 2 ], [ 9, 4, 478114, 2 ], [ 12, 9, 178747, 3 ] ], 
  [ [  ], [ 1 ], [ 1, 4 ], [ 2 ], [ 3 ] ], [ [ 154 ], [ 100 ], [ 106 ], [ 199 ], [ 198 ] ] ],
[ [ [ 6, 2, 492064, 1 ], [ 8, 3, 476657, 1 ] ], [ [  ], [ 1, 2 ], [ 2 ] ], [ [ 52 ], [ 78 ], [ 74 ] ] ],
[ [ [ 3, 3, 476657, 2 ] ], [ [  ], [ 1 ] ], [ [ 65 ], [ 66 ] ] ],
[ [ [ 1, 2, 31776, 1 ], [ 15, 2, 492064, 1 ] ], [ [  ], [ 1 ], [ 2 ] ], [ [ 162 ], [ 114 ], [ 168 ] ] ],
[ [ [ 1, 2, 31776, 1 ], [ 9, 2, 45664, 1 ] ], [ [  ], [ 1 ], [ 2 ] ], [ [ 164 ], [ 110 ], [ 158 ] ] ],
[ [ [ 4, 9, 178747, 3 ] ], [ [  ], [ 1 ] ], [ [ 57 ], [ 60 ] ] ],
[ [ [ 1, 2, 31776, 1 ], [ 3, 2, 492064, 1 ], [ 12, 3, 476657, 6 ], [ 18, 4, 478114, 1 ] ], 
  [ [  ], [ 1 ], [ 1, 2 ], [ 1, 2, 3 ], [ 2 ], [ 2, 4 ], [ 4 ] ], 
  [ [ 201 ], [ 197 ], [ 94 ], [ 88 ], [ 138 ], [ 146 ], [ 202 ] ] ],
[ [ [ 25, 9, 178747, 3 ] ], [ [  ], [ 1 ] ], [ [ 122 ], [ 126 ] ] ],
[ [ [ 3, 3, 476657, 2 ], [ 3, 3, 476657, 8 ], [ 9, 2, 492064, 1 ] ], [ [  ], [ 1 ], [ 2 ], [ 3 ] ], 
  [ [ 82 ], [ 63 ], [ 62 ], [ 84 ] ] ],
[ [ [ 3, 2, 492064, 1 ] ], [ [  ], [ 1 ] ], [ [ 156 ], [ 103 ] ] ],
[ [ [ 3, 2, 492064, 1 ] ], [ [  ], [ 1 ] ], [ [ 152 ], [ 98 ] ] ],
[ [ [ 4, 9, 178747, 3 ], [ 6, 2, 45664, 1 ], [ 8, 3, 476657, 3 ] ], [ [  ], [ 1 ], [ 2, 3 ], [ 3 ] ], 
  [ [ 51 ], [ 54 ], [ 73 ], [ 77 ] ] ],
[ [ [ 9, 2, 45664, 1 ] ], [ [  ], [ 1 ] ], [ [ 130 ], [ 200 ] ] ],
[ [ [ 1, 2, 31776, 1 ], [ 15, 2, 492064, 1 ], [ 25, 3, 476657, 6 ] ], [ [  ], [ 1 ], [ 1, 3 ], [ 2 ] ], 
  [ [ 161 ], [ 117 ], [ 113 ], [ 167 ] ] ],
[ [ [ 1, 2, 31776, 1 ], [ 3, 2, 492064, 1 ], [ 9, 4, 30784, 2 ], [ 12, 9, 178747, 3 ] ], 
  [ [  ], [ 1 ], [ 2 ], [ 2, 4 ], [ 3 ] ], [ [ 192 ], [ 80 ], [ 56 ], [ 59 ], [ 193 ] ] ],
[ [ [ 1, 2, 31776, 1 ], [ 30, 2, 492064, 1 ] ], [ [  ], [ 1 ], [ 2 ] ], [ [ 141 ], [ 91 ], [ 149 ] ] ],
[ [ [ 6, 3, 476657, 1 ], [ 18, 2, 45664, 1 ], [ 72, 9, 178747, 1 ] ], [ [  ], [ 1, 2, 3 ], [ 1, 3 ], [ 3 ] ], 
  [ [ 86 ], [ 136 ], [ 144 ], [ 204 ] ] ],
[ [ [ 75, 9, 178747, 3 ] ], [ [  ], [ 1 ] ], [ [ 120 ], [ 124 ] ] ],
[ [ [ 1, 2, 31776, 1 ], [ 15, 2, 492064, 1 ] ], [ [  ], [ 1 ], [ 2 ] ], [ [ 47 ], [ 41 ], [ 48 ] ] ],
[ [ [ 1, 2, 31776, 1 ], [ 9, 2, 45664, 1 ] ], [ [  ], [ 1 ], [ 2 ] ], [ [ 83 ], [ 61 ], [ 81 ] ] ],
[ [ [ 3, 2, 492064, 1 ], [ 100, 9, 178747, 3 ] ], [ [  ], [ 1 ], [ 1, 2 ] ], [ [ 155 ], [ 101 ], [ 107 ] ] ],
[ [ [ 1, 2, 31776, 1 ], [ 9, 2, 492064, 1 ], [ 12, 3, 476657, 6 ], [ 18, 4, 478114, 1 ] ], 
  [ [  ], [ 1 ], [ 1, 2 ], [ 1, 3 ], [ 2 ], [ 2, 4 ], [ 4 ] ], 
  [ [ 72 ], [ 53 ], [ 190 ], [ 50 ], [ 194 ], [ 195 ], [ 76 ] ] ],
[ [ [ 25, 9, 178747, 3 ] ], [ [  ], [ 1 ] ], [ [ 31 ], [ 32 ] ] ],
[ [ [ 9, 2, 45664, 1 ] ], [ [  ], [ 1 ] ], [ [ 128 ], [ 203 ] ] ],
[ [ [ 45, 2, 45664, 1 ], [ 45, 2, 492064, 1 ], [ 75, 9, 178747, 3 ] ], [ [  ], [ 1 ], [ 2 ], [ 3 ] ], 
  [ [ 111 ], [ 159 ], [ 165 ], [ 115 ] ] ],
[ [ [ 1, 2, 31776, 1 ] ], [ [  ], [ 1 ] ], [ [ 40 ], [ 46 ] ] ],
[ [ [ 1, 2, 31776, 1 ] ], [ [  ], [ 1 ] ], [ [ 55 ], [ 79 ] ] ],
[ [ [ 30, 2, 45664, 1 ], [ 100, 3, 476657, 6 ], [ 100, 9, 178747, 3 ] ], [ [  ], [ 1 ], [ 2 ], [ 3 ] ], 
  [ [ 147 ], [ 139 ], [ 89 ], [ 95 ] ] ],
[ [ [ 9, 2, 45664, 1 ] ], [ [  ], [ 1 ] ], [ [ 68 ], [ 191 ] ] ],
[ [ [ 1, 2, 31776, 1 ], [ 15, 2, 492064, 1 ], [ 25, 3, 476657, 6 ] ], [ [  ], [ 1 ], [ 1, 3 ], [ 2 ] ], 
  [ [ 37 ], [ 30 ], [ 29 ], [ 38 ] ] ],
[ [ [ 1, 2, 31776, 1 ], [ 300, 9, 178747, 3 ] ], [ [  ], [ 1 ], [ 2 ] ], [ [ 99 ], [ 153 ], [ 105 ] ] ],
[ [ [ 331, 3, 476657, 6 ] ], [ [  ], [ 1 ] ], [ [ 187, 188 ], [ 185 ] ] ],
[ [ [ 1, 2, 31776, 1 ], [ 30, 2, 492064, 1 ] ], [ [  ], [ 1 ], [ 2 ] ], [ [ 44 ], [ 39 ], [ 45 ] ] ],
[ [ [ 3, 2, 492064, 1 ], [ 18, 2, 492064, 1 ], [ 72, 9, 178747, 1 ] ], [ [ 1 ], [ 1, 2, 3 ], [ 1, 3 ], [ 3 ] ], 
  [ [ 49 ], [ 75 ], [ 71 ], [ 196 ] ] ],
[ [ [ 75, 3, 476657, 6 ] ], [ [  ], [ 1 ] ], [ [ 18 ], [ 17 ] ] ],
[ [ [ 45, 2, 45664, 1 ], [ 45, 2, 492064, 1 ] ], [ [  ], [ 1 ], [ 2 ] ], [ [ 109 ], [ 157 ], [ 163 ] ] ],
[ [ [ 3, 2, 492064, 1 ], [ 100, 3, 476657, 6 ] ], [ [  ], [ 1 ], [ 1, 2 ] ], [ [ 36 ], [ 28 ], [ 27 ] ] ],
[ [ [ 6, 3, 476657, 1 ], [ 90, 2, 45664, 1 ], [ 300, 9, 178747, 3 ] ], [ [  ], [ 1 ], [ 1, 2 ], [ 3 ] ], 
  [ [ 87 ], [ 145 ], [ 137 ], [ 93 ] ] ],
[ [ [ 331, 9, 178747, 3 ] ], [ [  ], [ 1 ] ], [ [ 180 ], [ 182, 183 ] ] ],
[ [ [ 9, 2, 45664, 1 ] ], [ [  ], [ 1 ] ], [ [ 67 ], [ 189 ] ] ],
[ [ [ 6, 3, 476657, 1 ], [ 45, 2, 45664, 1 ], [ 75, 3, 476657, 6 ] ], [ [  ], [ 1 ], [ 1, 2 ], [ 3 ] ], 
  [ [ 16 ], [ 24 ], [ 23 ], [ 15 ] ] ],
[ [ [ 1, 2, 31776, 1 ] ], [ [  ], [ 1 ] ], [ [ 97 ], [ 151 ] ] ],
[ [ [ 6, 5, 136308, 1 ], [ 30, 2, 45664, 1 ], [ 100, 9, 178747, 3 ] ], [ [  ], [ 1 ], [ 1, 2 ], [ 3 ] ], 
  [ [ 25 ], [ 35 ], [ 34 ], [ 26 ] ] ],
[ [ [ 3, 2, 492064, 1 ], [ 300, 3, 476657, 6 ] ], [ [  ], [ 1 ], [ 1, 2 ] ], [ [ 22 ], [ 14 ], [ 13 ] ] ],
[ [ [ 331, 3, 476657, 6 ] ], [ [  ], [ 1 ] ], [ [ 175, 176 ], [ 174 ] ] ],
[ [ [ 1, 2, 31776, 1 ], [ 90, 2, 45664, 1 ] ], [ [  ], [ 1 ], [ 2 ] ], [ [ 143 ], [ 85 ], [ 135 ] ] ],
[ [ [ 6, 3, 476657, 1 ], [ 45, 2, 45664, 1 ] ], [ [  ], [ 1 ], [ 1, 2 ] ], [ [ 3 ], [ 10 ], [ 9 ] ] ],
[ [ [ 90, 2, 45664, 1 ], [ 90, 2, 492064, 1 ], [ 300, 3, 476657, 6 ] ], [ [  ], [ 1 ], [ 2 ], [ 3 ] ], 
  [ [ 12 ], [ 20 ], [ 21 ], [ 11 ] ] ],
[ [ [ 331, 3, 476657, 6 ] ], [ [  ], [ 1 ] ], [ [ 172, 173 ], [ 171 ] ] ],
[ [ [ 3, 2, 492064, 1 ] ], [ [  ], [ 1 ] ], [ [ 4 ], [ 5 ] ] ],
[ [ [ 1, 2, 31776, 1 ], [ 90, 2, 492064, 1 ] ], [ [  ], [ 1 ], [ 2 ] ], [ [ 7 ], [ 2 ], [ 8 ] ] ],
];


############################################################################
##
#E
##
