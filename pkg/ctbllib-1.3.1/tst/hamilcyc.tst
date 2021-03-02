# This file was created automatically, do not edit!
#############################################################################
##
#W  hamilcyc.tst            GAP 4 package CTblLib               Thomas Breuer
##
#Y  Copyright (C)  2020,   Lehrstuhl D für Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the GAP code of examples in the package
##  documentation files.
##  
##  In order to run the tests, one starts GAP from the 'tst' subdirectory
##  of the 'pkg/ctbllib' directory, and calls 'Test( "hamilcyc.tst" );'.
##  
gap> LoadPackage( "CTblLib", false );
true
gap> save:= SizeScreen();;
gap> SizeScreen( [ 72 ] );;
gap> START_TEST( "hamilcyc.tst" );

##
gap> if IsBound( BrowseData ) then
>      data:= BrowseData.defaults.dynamic.replayDefaults;
>      oldinterval:= data.replayInterval;
>      data.replayInterval:= 1;
>    fi;

##  ./hamilcyc.xml (103-111)
gap> if not CompareVersionNumbers( GAPInfo.Version, "4.5" ) then
>      Error( "need GAP in version at least 4.5" );
>    fi;
gap> LoadPackage( "ctbllib", "1.2", false );
true
gap> LoadPackage( "tomlib", "1.1.1", false );
true

##  ./hamilcyc.xml (549-561)
gap> IsGeneratorsOfTransPermGroup:= function( G, list )
>     local S;
> 
>     if not IsTransitive( G ) then
>       Error( "<G> must be transitive on its moved points" );
>     fi;
>     S:= SubgroupNC( G, list );
> 
>     return IsTransitive( S, MovedPoints( G ) )
>            and Size( S ) = Size( G );
> end;;

##  ./hamilcyc.xml (652-726)
gap> BindGlobal( "VertexDegreesGeneratingGraph",
>     function( G, classes, normalsubgroups )
>     local nccl, matrix, cents, powers, normalsubgroupspos, i, j, g_i,
>           nsg, g_j, gen, pair, d, pow;
> 
>     if not IsTransitive( G ) then
>       Error( "<G> must be transitive on its moved points" );
>     fi;
> 
>     classes:= Filtered( classes,
>                         C -> Order( Representative( C ) ) <> 1 );
>     nccl:= Length( classes );
>     matrix:= [];
>     cents:= [];
>     powers:= [];
>     normalsubgroupspos:= [];
>     for i in [ 1 .. nccl ] do
>       matrix[i]:= [];
>       if IsBound( powers[i] ) then
>         # The i-th row equals the earlier row 'powers[i]'.
>         for j in [ 1 .. i ] do
>           matrix[i][j]:= matrix[ powers[i] ][j];
>           matrix[j][i]:= matrix[j][ powers[i] ];
>         od;
>       else
>         # We have to compute the values.
>         g_i:= Representative( classes[i] );
>         nsg:= Filtered( [ 1 .. Length( normalsubgroups ) ],
>                         i -> g_i in normalsubgroups[i] );
>         normalsubgroupspos[i]:= nsg;
>         cents[i]:= Centralizer( G, g_i );
>         for j in [ 1 .. i ] do
>           g_j:= Representative( classes[j] );
>           if IsBound( powers[j] ) then
>             matrix[i][j]:= matrix[i][ powers[j] ];
>             matrix[j][i]:= matrix[ powers[j] ][i];
>           elif not IsEmpty( Intersection( nsg, normalsubgroupspos[j] ) )
>                or ( Order( g_i ) = 2 and Order( g_j ) = 2
>                     and not IsDihedralGroup( G ) ) then
>             matrix[i][j]:= 0;
>             matrix[j][i]:= 0;
>           else
>             # Compute $d(g_i, g_j^G)$.
>             gen:= 0;
>             for pair in DoubleCosetRepsAndSizes( G, cents[j],
>                             cents[i] ) do
>               if IsGeneratorsOfTransPermGroup( G,
>                      [ g_i, g_j^pair[1] ] ) then
>                 gen:= gen + pair[2];
>               fi;
>             od;
>             matrix[i][j]:= gen / Size( cents[j] );
>             if i <> j then
>               matrix[j][i]:= gen / Size( cents[i] );
>             fi;
>           fi;
>         od;
> 
>         # For later, provide information about algebraic conjugacy.
>         for d in Difference( PrimeResidues( Order( g_i ) ), [ 1 ] ) do
>           pow:= g_i^d;
>           for j in [ i+1 .. nccl ] do
>             if not IsBound( powers[j] ) and pow in classes[j] then
>               powers[j]:= i;
>               break;
>             fi;
>           od;
>         od;
>       fi;
>     od;
> 
>     return matrix;
> end );

##  ./hamilcyc.xml (806-846)
gap> DeclareAttribute( "PrimitivePermutationCharacters",
>                      IsCharacterTable );
gap> InstallOtherMethod( PrimitivePermutationCharacters,
>     [ IsCharacterTable ],
>     function( tbl )
>     local maxes, i, fus, poss, tom, G;
> 
>     if HasMaxes( tbl ) then
>       maxes:= List( Maxes( tbl ), CharacterTable );
>       for i in [ 1 .. Length( maxes ) ] do
>         fus:= GetFusionMap( maxes[i], tbl );
>         if fus = fail then
>           fus:= PossibleClassFusions( maxes[i], tbl );
>           poss:= Set( List( fus,
>             map -> InducedClassFunctionsByFusionMap(
>                        maxes[i], tbl,
>                        [ TrivialCharacter( maxes[i] ) ], map )[1] ) );
>           if Length( poss ) = 1 then
>             maxes[i]:= poss[1];
>           else
>             return fail;
>           fi;
>         else
>           maxes[i]:= TrivialCharacter( maxes[i] )^tbl;
>         fi;
>       od;
>       return maxes;
>     elif HasFusionToTom( tbl ) then
>       tom:= TableOfMarks( tbl );
>       maxes:= MaximalSubgroupsTom( tom );
>       return PermCharsTom( tbl, tom ){ maxes[1] };
>     elif HasUnderlyingGroup( tbl ) then
>       G:= UnderlyingGroup( tbl );
>       return List( MaximalSubgroupClassReps( G ),
>                    M -> TrivialCharacter( M )^tbl );
>     fi;
> 
>     return fail;
> end );

##  ./hamilcyc.xml (878-889)
gap> LowerBoundsVertexDegrees:= function( classlengths, prim )
>     local sizes, nccl;
> 
>     nccl:= Length( classlengths );
>     return List( [ 2 .. nccl ],
>              i -> List( [ 2 .. nccl ],
>                     j -> Maximum( 0, classlengths[j] - Sum( prim,
>                     pi -> classlengths[j] * pi[j] * pi[i]
>                               / pi[1] ) ) ) );
> end;;

##  ./hamilcyc.xml (937-954)
gap> LowerBoundsVertexDegreesOfClosure:= function( classlengths, bounds )
>     local delta, newbounds, size, i, j;
> 
>     delta:= List( bounds, Sum );
>     newbounds:= List( bounds, ShallowCopy );
>     size:= Sum( classlengths );
>     for i in [ 1 .. Length( bounds ) ] do
>       for j in [ 1 .. Length( bounds ) ] do
>         if delta[i] + delta[j] >= size - 1 then
>           newbounds[i][j]:= classlengths[ j+1 ];
>         fi;
>       od;
>     od;
> 
>     return newbounds;
> end;;

##  ./hamilcyc.xml (1029-1075)
gap> CheckCriteriaOfPosaAndChvatal:= function( classlengths, bounds )
>     local size, degs, addinterval, badForPosa, badForChvatal1, pos,
>           half, i, low1, upp2, upp1, low2, badForChvatal, interval1,
>           interval2;
> 
>     size:= Sum( classlengths );
>     degs:= List( [ 2 .. Length( classlengths ) ],
>                  i -> [ Sum( bounds[ i-1 ] ), classlengths[i], i ] );
>     Sort( degs );
> 
>     addinterval:= function( intervals, low, upp )
>       if low <= upp then
>         Add( intervals, [ low, upp ] );
>       fi;
>     end;
> 
>     badForPosa:= [];
>     badForChvatal1:= [];
>     pos:= 1;
>     half:= Int( size / 2 ) - 1;
>     for i in [ 1 .. Length( degs ) ] do
>       # We have pos = c_1 + c_2 + \cdots + c_{i-1} + 1
>       low1:= Maximum( pos, degs[i][1] );  # L_i
>       upp2:= Minimum( half, size-1-pos, size-1-degs[i][1] ); # U'_i
>       pos:= pos + degs[i][2];
>       upp1:= Minimum( half, pos-1 ); # U_i
>       low2:= Maximum( 1, size-pos ); # L'_i
>       addinterval( badForPosa, low1, upp1 );
>       addinterval( badForChvatal1, low2, upp2 );
>     od;
> 
>     # Intersect intervals.
>     badForChvatal:= [];
>     for interval1 in badForPosa do
>       for interval2 in badForChvatal1 do
>         addinterval( badForChvatal,
>                      Maximum( interval1[1], interval2[1] ),
>                      Minimum( interval1[2], interval2[2] ) );
>       od;
>     od;
> 
>     return rec( badForPosa:= badForPosa,
>                 badForChvatal:= Set( badForChvatal ),
>                 data:= degs );
> end;;

##  ./hamilcyc.xml (1107-1143)
gap> HamiltonianCycleInfo:= function( classlengths, bounds )
>     local i, result, res, oldbounds;
> 
>     i:= 0;
>     result:= rec( Posa:= fail, Chvatal:= fail );
>     repeat
>       res:= CheckCriteriaOfPosaAndChvatal( classlengths, bounds );
>       if result.Posa = fail and IsEmpty( res.badForPosa ) then
>         result.Posa:= i;
>       fi;
>       if result.Chvatal = fail and IsEmpty( res.badForChvatal ) then
>         result.Chvatal:= i;
>       fi;
>       i:= i+1;
>       oldbounds:= bounds;
>       bounds:= LowerBoundsVertexDegreesOfClosure( classlengths,
>                    bounds );
>     until oldbounds = bounds;
> 
>     if result.Posa <> fail then
>       if result.Posa <> result.Chvatal then
>         return Concatenation(
>             "Chvatal for ", Ordinal( result.Chvatal ), " closure, ",
>             "Posa for ", Ordinal( result.Posa ), " closure" );
>       else
>         return Concatenation( "Posa for ", Ordinal( result.Posa ),
>             " closure" );
>       fi;
>     elif result.Chvatal <> fail then
>       return Concatenation( "Chvatal for ", Ordinal( result.Chvatal ),
>                             " closure" );
>     else
>       return "no decision";
>     fi;
> end;;

##  ./hamilcyc.xml (1184-1196)
gap> HamiltonianCycleInfoFromCharacterTable:= function( tbl )
>     local prim, classlengths, bounds;
> 
>     prim:= PrimitivePermutationCharacters( tbl );
>     if prim = fail then
>       return "no prim. perm. characters";
>     fi;
>     classlengths:= SizesConjugacyClasses( tbl );
>     bounds:= LowerBoundsVertexDegrees( classlengths, prim );
>     return HamiltonianCycleInfo( classlengths, bounds );
> end;;

##  ./hamilcyc.xml (1218-1231)
gap> spornames:= AllCharacterTableNames( IsSporadicSimple, true,
>                    IsDuplicateTable, false );
[ "B", "Co1", "Co2", "Co3", "F3+", "Fi22", "Fi23", "HN", "HS", "He", 
  "J1", "J2", "J3", "J4", "Ly", "M", "M11", "M12", "M22", "M23", 
  "M24", "McL", "ON", "Ru", "Suz", "Th" ]
gap> for tbl in List( spornames, CharacterTable ) do
>      info:= HamiltonianCycleInfoFromCharacterTable( tbl );
>      if info <> "Posa for 0th closure" then
>        Print( Identifier( tbl ), ": ", info, "\n" );
>      fi;
>    od;
M: no prim. perm. characters

##  ./hamilcyc.xml (1291-1457)
gap> m:= CharacterTable( "M" );;
gap> primdata:= [
> [ "2.B" ],
> [ "2^1+24.Co1" ],
> [ "3.F3+.2" ],
> [ "2^2.2E6(2).3.2" ],
> [ "2^(10+16).O10+(2)",
>   Character( m, [ 512372707698741056749515292734375,
>     405589064025344574375, 29628786742129575, 658201521662685,
>     215448838605, 0, 121971774375, 28098354375, 335229607, 108472455,
>     164587500, 4921875, 2487507165, 2567565, 26157789, 6593805,
>     398925, 0, 437325, 0, 44983, 234399, 90675, 21391, 41111, 12915,
>     6561, 6561, 177100, 7660, 6875, 315, 275, 0, 113373, 17901, 57213,
>     0, 4957, 1197, 909, 301, 397, 0, 0, 0, 3885, 525, 0, 2835, 90, 45,
>     0, 103, 67, 43, 28, 81, 189, 9, 9, 9, 0, 540, 300, 175, 20, 15, 7,
>     420, 0, 0, 0, 0, 0, 0, 0, 165, 61, 37, 37, 0, 9, 9, 13, 5, 0, 0,
>     0, 0, 0, 0, 77, 45, 13, 0, 0, 45, 115, 19, 10, 0, 5, 5, 9, 9, 1,
>     1, 0, 0, 4, 0, 0, 9, 9, 3, 1, 0, 0, 0, 0, 0, 0, 4, 1, 1, 0, 24, 0,
>     0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 1, 0, 4, 0, 0, 0, 0, 1, 0, 0, 0,
>     0, 0, 3, 3, 1, 1, 2, 0, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>     2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ) ],
> [ "2^(2+11+22).(M24xS3)",
>   Character( m, [ 16009115629875684006343550944921875,
>     7774182899642733721875, 120168544413337875, 4436049512692980,
>     215448838605, 131873639625, 760550656275, 110042727795, 943894035,
>     568854195, 1851609375, 0, 4680311220, 405405, 78624756, 14467005,
>     178605, 248265, 874650, 0, 76995, 591163, 224055, 34955, 29539,
>     20727, 0, 0, 375375, 15775, 0, 0, 0, 495, 116532, 3645, 62316,
>     1017, 11268, 357, 1701, 45, 117, 705, 0, 0, 4410, 1498, 0, 3780,
>     810, 0, 0, 83, 135, 31, 0, 0, 0, 0, 0, 0, 0, 255, 195, 0, 215, 0,
>     0, 210, 0, 42, 0, 35, 15, 1, 1, 160, 48, 9, 92, 25, 9, 9, 5, 1,
>     21, 0, 0, 0, 0, 0, 98, 74, 42, 0, 0, 0, 120, 76, 10, 0, 0, 0, 0,
>     0, 1, 1, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 3, 0, 0, 0,
>     18, 0, 10, 0, 3, 3, 0, 1, 1, 1, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 2,
>     0, 0, 0, 0, 0, 6, 12, 0, 0, 2, 0, 0, 0, 2, 0, 0, 1, 1, 0, 0, 0, 0,
>     0, 0, 0, 2, 0, 2, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>     0, 0 ] ) ],
> [ "3^(1+12).2.Suz.2" ],
> [ "2^(5+10+20).(S3xL5(2))",
>   Character( m, [ 391965121389536908413379198941796875,
>     23914487292951376996875, 474163138042468875, 9500455925885925,
>     646346515815, 334363486275, 954161764875, 147339103275,
>     1481392395, 1313281515, 0, 8203125, 9827885925, 1216215, 91556325,
>     9388791, 115911, 587331, 874650, 0, 79515, 581955, 336375, 104371,
>     62331, 36855, 0, 0, 0, 0, 28125, 525, 1125, 0, 188325, 16767,
>     88965, 2403, 9477, 1155, 891, 207, 351, 627, 0, 0, 4410, 1498, 0,
>     0, 0, 30, 150, 91, 151, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 125, 0, 5,
>     5, 210, 0, 42, 0, 0, 0, 0, 0, 141, 45, 27, 61, 27, 9, 9, 7, 3, 15,
>     0, 0, 0, 0, 0, 98, 74, 42, 0, 0, 30, 0, 0, 0, 6, 6, 6, 3, 3, 1, 1,
>     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 18, 0,
>     10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0,
>     0, 0, 0, 0, 2, 2, 0, 2, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>     2, 0, 2, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ) ],
> [ "S3xTh" ],
> [ "[2^39].(L3(2)x3S6)",
>   Character( m, [ 4050306254358548053604918389065234375,
>     148844831270071996434375, 2815847622206994375, 14567365753025085,
>     3447181417680, 659368198125, 3520153823175, 548464353255,
>     5706077895, 3056566695, 264515625, 0, 19572895485, 6486480,
>     186109245, 61410960, 758160, 688365, 58310, 0, 172503, 1264351,
>     376155, 137935, 99127, 52731, 0, 0, 119625, 3625, 0, 0, 0, 0,
>     402813, 29160, 185301, 2781, 21069, 1932, 4212, 360, 576, 1125, 0,
>     0, 1302, 294, 0, 2160, 810, 0, 0, 111, 179, 43, 0, 0, 0, 0, 0, 0,
>     0, 185, 105, 0, 65, 0, 0, 224, 0, 14, 0, 0, 0, 0, 0, 337, 105, 36,
>     157, 37, 18, 18, 16, 4, 21, 0, 0, 0, 0, 0, 70, 38, 14, 0, 0, 0,
>     60, 40, 10, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0,
>     0, 0, 0, 5, 1, 0, 0, 0, 24, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3,
>     0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 6, 8, 0, 0, 2, 0, 0, 0, 0, 0,
>     0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 4, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>     0, 0, 0, 0, 0, 4, 0, 0, 0 ] ) ],
> [ "3^8.O8-(3).2_3",
>   Character( m, [ 6065553341050124859256025907200000000,
>     117457246944126566400000, 2373192769339392000, 4237313863946240,
>     1528370386400, 480247040000, 1485622476800, 207447654400,
>     3523215360, 1124597760, 2926000000, 0, 4720235520, 18601440,
>     49864704, 14602080, 1914720, 645120, 0, 168070, 0, 811008, 133120,
>     204800, 0, 8192, 3521, 4250, 308000, 28800, 0, 0, 0, 0, 53504,
>     1520, 68992, 3584, 2304, 672, 7216, 240, 192, 960, 156, 0, 0, 0,
>     70, 7840, 550, 0, 0, 0, 0, 0, 0, 48, 93, 57, 18, 24, 0, 160, 200,
>     0, 320, 0, 0, 0, 49, 0, 4, 0, 0, 0, 0, 144, 0, 0, 80, 0, 20, 64,
>     20, 0, 8, 0, 12, 0, 2, 2, 0, 0, 0, 6, 0, 0, 20, 24, 30, 0, 0, 0,
>     0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 2, 7, 0, 0, 12, 0, 0, 0, 20, 8, 0,
>     0, 5, 0, 4, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0,
>     0, 2, 2, 0, 0, 0, 2, 4, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>     0, 0, 0 ] ) ],
> [ "(D10xHN).2" ],
> [ "(3^2:2xO8+(3)).S4",
>   Character( m, [ 377694424605514962329798663208960000000,
>     2359667150587942666240000, 28756421759729664000,
>     377826645416419584, 16593035298840, 5193792576000, 14007297638400,
>     1715997638656, 5830082560, 2683699200, 5266800000, 0, 47782831360,
>     241801560, 626008320, 48633880, 9541080, 483840, 2332400, 0,
>     16384, 3964928, 926720, 102400, 16384, 32256, 51030, 7371, 800800,
>     41600, 0, 0, 0, 0, 248640, 120480, 200656, 13440, 13696, 1260,
>     4708, 1120, 1864, 0, 26, 0, 7840, 336, 0, 4284, 180, 0, 0, 0, 0,
>     0, 0, 265, 418, 270, 99, 81, 0, 480, 456, 0, 0, 0, 0, 455, 0, 56,
>     0, 0, 0, 0, 0, 680, 64, 4, 16, 32, 18, 26, 16, 4, 0, 0, 10, 0, 9,
>     0, 28, 24, 8, 0, 0, 0, 160, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>     0, 0, 18, 3, 4, 1, 0, 8, 2, 0, 0, 20, 8, 0, 0, 0, 19, 0, 0, 0, 0,
>     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 1, 0, 4, 0, 0, 0, 0, 0, 6,
>     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 1, 0, 0,
>     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0 ] ) ],
> [ "3^(2+5+10).(M11x2S4)",
>   Character( m, [ 16458603283969466072643078298009600000000,
>     20359256136981938176000000, 145987312780574720000,
>     724314893457326080, 21414300718720, 18249387520000, 540226355200,
>     1703254425600, 4697620480, 4771020800, 23408000000, 0,
>     43256012800, 98483840, 909246464, 213623680, 8362880, 4444160, 0,
>     0, 0, 475136, 998400, 81920, 0, 35840, 25312, 10597, 0, 128000, 0,
>     0, 0, 440, 93184, 160, 134400, 1792, 7168, 560, 15888, 160, 64,
>     320, 0, 0, 0, 0, 0, 19880, 2240, 0, 0, 0, 0, 0, 0, 301, 148, 200,
>     221, 53, 0, 640, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40, 0, 0, 224, 0,
>     0, 32, 32, 20, 156, 8, 0, 8, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0,
>     104, 80, 0, 0, 0, 0, 0, 0, 0, 8, 8, 0, 0, 0, 4, 1, 6, 1, 0, 0, 0,
>     0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 4, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0,
>     0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 4, 0,
>     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0,
>     0, 0, 0, 0, 0, 0, 0, 0 ] ) ],
> [ "3^(3+2+6+6):(L3(3)xSD16)",
>   Character( m, [ 69632552355255433384259177414656000000000,
>     10962676381451812864000000, 276872489756262400000,
>     816070626832384000, 52168426710400, 4994569216000, 29712449536000,
>     917136998400, 32883343360, 14313062400, 0, 0, 53947801600,
>     445244800, 995491840, 268777600, 8579200, 2007040, 0, 0, 0,
>     4505600, 588800, 245760, 0, 35840, 24760, 4105, 0, 0, 0, 0, 0, 0,
>     148480, 8800, 134400, 1792, 13312, 1680, 20784, 1120, 448, 960,
>     156, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 241, 304, 184, 121, 49,
>     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 416, 0, 0, 96, 32,
>     20, 92, 24, 0, 8, 0, 28, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1, 12, 1, 0, 12, 0, 0, 0, 0,
>     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0,
>     1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>     0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4,
>     4, 0, 0, 0, 0 ] ) ],
> [ "5^(1+6):2.J2.4" ],
> [ "(7:3xHe):2" ],
> [ "(A5xA12):2" ],
> [ "5^(3+3).(2xL3(5))" ],
> [ "(A6xA6xA6).(2xS4)" ],
> [ "(A5xU3(8):3):2" ],
> [ "5^(2+2+4):(S3xGL2(5))" ],
> [ "(L3(2)xS4(4):2).2" ],
> [ "7^(1+4):(3x2.S7)" ],
> [ "(5^2:[2^4]xU3(5)).S3" ],
> [ "(L2(11)xM12):2" ],
> [ "(A7x(A5xA5):2^2):2" ],
> [ "5^4:(3x2.L2(25)).2" ],
> [ "7^(2+1+2):GL2(7)" ],
> [ "M11xA6.2^2" ],
> [ "(S5xS5xS5):S3" ],
> [ "(L2(11)xL2(11)):4" ],
> [ "13^2:2.L2(13).4" ],
> [ "(7^2:(3x2A4)xL2(7)).2" ],
> [ "(13:6xL3(3)).2" ],
> [ "13^(1+2):(3x4S4)" ],
> [ "L2(71)" ],
> [ "L2(59)" ],
> [ "11^2:(5x2.A5)" ],
> [ "L2(41)" ],
> [ "L2(29).2" ],
> [ "7^2:2psl(2,7)" ],
> [ "L2(19).2" ],
> [ "41:40" ],
> ];;

##  ./hamilcyc.xml (1468-1480)
gap> for entry in primdata do
>      s:= CharacterTable( entry[1] );
>      if not IsBound( entry[2] ) then
>        fus:= PossibleClassFusions( s, m );
>        poss:= Set( List( fus,
>                          x -> InducedClassFunctionsByFusionMap( s, m,
>                                 [ TrivialCharacter( s ) ], x )[1] ) );
>        entry[2]:= List( [ 1 .. NrConjugacyClasses( m ) ],
>                         i -> Maximum( List( poss, x -> x[i] ) ) );
>      fi;
>    od;

##  ./hamilcyc.xml (1524-1562)
gap> PossibleClassFusions( CharacterTable( "U3(8).3_2" ), m );
[  ]
gap> badclasses:= [];;
gap> names:= [
>    [ "L2(13)", "L2(13).2" ],
>    [ "Sz(8)", "Sz(8).3" ],
>    [ "U3(4)", "U3(4).2", "U3(4).4" ],
>    [ "U3(8)", "U3(8).2", "U3(8).3_1", "U3(8).3_2", "U3(8).3_3",
>               "U3(8).6" ],
>    ];;
gap> for list in names do
>      t:= CharacterTable( list[1] );
>      tfusm:= PossibleClassFusions( t, m );
>      UniteSet( badclasses, Flat( tfusm ) );
>      for nam in list{ [ 2 .. Length( list ) ] } do
>        ext:= CharacterTable( nam );
>        for map1 in PossibleClassFusions( t, ext ) do
>          inv:= InverseMap( map1 );
>          for map2 in tfusm do
>            init:= CompositionMaps( map2, inv );
>            UniteSet( badclasses, Flat( PossibleClassFusions( ext, m,
>                rec( fusionmap:= init ) ) ) );
>          od;
>        od;
>      od;
>    od;
gap> badclasses;
[ 1, 3, 4, 5, 6, 7, 9, 10, 11, 12, 14, 15, 17, 18, 19, 20, 21, 22, 
  24, 25, 27, 28, 30, 32, 33, 35, 36, 38, 39, 40, 42, 43, 44, 45, 46, 
  48, 49, 50, 51, 52, 53, 54, 55, 56, 60, 61, 62, 63, 70, 72, 73, 78, 
  82, 85, 86 ]
gap> Length( badclasses );
55
gap> classlengths:= SizesConjugacyClasses( m );;
gap> bad:= Sum( classlengths{ badclasses } ) / Size( m );;
gap> Int( 10000 * bad ); 
97

##  ./hamilcyc.xml (1626-1635)
gap> prim:= List( primdata, x -> x[2] );;
gap> badpos:= Difference( badclasses, [ 1 ] ) - 1;;
gap> bounds:= LowerBoundsVertexDegrees( classlengths, prim );;
gap> for i in badpos do
>      for j in badpos do
>        bounds[i][j]:= 0;
>      od;
>    od;

##  ./hamilcyc.xml (1663-1671)
gap> degs:= List( bounds, Sum );;
gap> Int( 10000 * Minimum( degs ) / Size( m ) );
9902
gap> goodpos:= Difference( [ 1 .. NrConjugacyClasses( m ) - 1 ],
>                          badpos );;
gap> Int( 100000000 * Minimum( degs{ goodpos } ) / Size( m ) );
99999987

##  ./hamilcyc.xml (1688-1713)
gap> spornames:= AllCharacterTableNames( IsSporadicSimple, true,
>                    IsDuplicateTable, false );;
gap> sporautnames:= AllCharacterTableNames( IsSporadicSimple, true,
>                       IsDuplicateTable, false,
>                       OfThose, AutomorphismGroup );;
gap> sporautnames:= Difference( sporautnames, spornames );
[ "F3+.2", "Fi22.2", "HN.2", "HS.2", "He.2", "J2.2", "J3.2", "M12.2", 
  "M22.2", "McL.2", "ON.2", "Suz.2" ]
gap> for tbl in List( sporautnames, CharacterTable ) do
>      info:= HamiltonianCycleInfoFromCharacterTable( tbl );
>      Print( Identifier( tbl ), ": ", info, "\n" );
>    od;
F3+.2: Chvatal for 0th closure, Posa for 1st closure
Fi22.2: Chvatal for 0th closure, Posa for 1st closure
HN.2: Chvatal for 0th closure, Posa for 1st closure
HS.2: Chvatal for 1st closure, Posa for 2nd closure
He.2: Chvatal for 0th closure, Posa for 1st closure
J2.2: Chvatal for 0th closure, Posa for 1st closure
J3.2: Chvatal for 0th closure, Posa for 1st closure
M12.2: Chvatal for 0th closure, Posa for 1st closure
M22.2: Posa for 1st closure
McL.2: Chvatal for 0th closure, Posa for 1st closure
ON.2: Chvatal for 0th closure, Posa for 1st closure
Suz.2: Chvatal for 0th closure, Posa for 1st closure

##  ./hamilcyc.xml (1730-1738)
gap> for tbl in List( [ 5 .. 13 ], i -> CharacterTable(
>                 Concatenation( "A", String( i ) ) ) )  do
>      info:= HamiltonianCycleInfoFromCharacterTable( tbl );
>      if info <> "Posa for 0th closure" then
>        Print( Identifier( tbl ), ": ", info, "\n" );
>      fi;
>    od;

##  ./hamilcyc.xml (1747-1762)
gap> for tbl in List( [ 5 .. 13 ], i -> CharacterTable(
>                 Concatenation( "S", String( i ) ) ) )  do
>      info:= HamiltonianCycleInfoFromCharacterTable( tbl );
>      Print( Identifier( tbl ), ": ", info, "\n" );
>    od;
A5.2: no decision
A6.2_1: Chvatal for 4th closure, Posa for 5th closure
A7.2: Posa for 1st closure
A8.2: Chvatal for 2nd closure, Posa for 3rd closure
A9.2: Chvatal for 2nd closure, Posa for 3rd closure
A10.2: Chvatal for 2nd closure, Posa for 3rd closure
A11.2: Posa for 1st closure
A12.2: Chvatal for 2nd closure, Posa for 3rd closure
A13.2: Posa for 1st closure

##  ./hamilcyc.xml (1828-1843)
gap> HamiltonianCycleInfoFromGroup:= function( G )
>     local ccl, nsg, der, degrees, classlengths;
>     ccl:= ConjugacyClasses( G );
>     if IsPerfect( G ) then
>       nsg:= [];
>     else
>       der:= DerivedSubgroup( G );
>       nsg:= Concatenation( [ der ],
>                 IntermediateSubgroups( G, der ).subgroups );
>     fi;
>     degrees:= VertexDegreesGeneratingGraph( G, ccl, nsg );
>     classlengths:= List( ccl, Size );
>     return HamiltonianCycleInfo( classlengths, degrees );        
> end;;

##  ./hamilcyc.xml (1855-1877)
gap> grps:= AllSmallNonabelianSimpleGroups( [ 1 .. 10^6 ] );;         
gap> Length( grps );
56
gap> List( grps, StructureDescription );
[ "A5", "PSL(3,2)", "A6", "PSL(2,8)", "PSL(2,11)", "PSL(2,13)", 
  "PSL(2,17)", "A7", "PSL(2,19)", "PSL(2,16)", "PSL(3,3)", 
  "PSU(3,3)", "PSL(2,23)", "PSL(2,25)", "M11", "PSL(2,27)", 
  "PSL(2,29)", "PSL(2,31)", "A8", "PSL(3,4)", "PSL(2,37)", "O(5,3)", 
  "Sz(8)", "PSL(2,32)", "PSL(2,41)", "PSL(2,43)", "PSL(2,47)", 
  "PSL(2,49)", "PSU(3,4)", "PSL(2,53)", "M12", "PSL(2,59)", 
  "PSL(2,61)", "PSU(3,5)", "PSL(2,67)", "J1", "PSL(2,71)", "A9", 
  "PSL(2,73)", "PSL(2,79)", "PSL(2,64)", "PSL(2,81)", "PSL(2,83)", 
  "PSL(2,89)", "PSL(3,5)", "M22", "PSL(2,97)", "PSL(2,101)", 
  "PSL(2,103)", "HJ", "PSL(2,107)", "PSL(2,109)", "PSL(2,113)", 
  "PSL(2,121)", "PSL(2,125)", "O(5,4)" ]
gap> for g in grps do                                             
>      info:= HamiltonianCycleInfoFromGroup( g );
>      if info <> "Posa for 0th closure" then
>        Print( StructureDescription( g ), ": ", info, "\n" );
>      fi;
>    od;

##  ./hamilcyc.xml (2015-2030)
gap> orders:= Filtered( [ 10^6+4, 10^6+8 .. 10^7 ],
>      n -> IsomorphismTypeInfoFiniteSimpleGroup( n ) <> fail );
[ 1024128, 1123980, 1285608, 1342740, 1451520, 1653900, 1721400, 
  1814400, 1876896, 1934868, 2097024, 2165292, 2328648, 2413320, 
  2588772, 2867580, 2964780, 3265920, 3483840, 3594432, 3822588, 
  3940200, 4245696, 4680000, 4696860, 5515776, 5544672, 5663616, 
  5848428, 6004380, 6065280, 6324552, 6825840, 6998640, 7174332, 
  7906500, 8487168, 9095592, 9732420, 9951120, 9999360 ]
gap> Length( orders );
41
gap> info:= List( orders, IsomorphismTypeInfoFiniteSimpleGroup );;
gap> Number( info, x -> IsBound( x.series ) and x.series = "L"
>                       and x.parameter[1] = 2 );
31

##  ./hamilcyc.xml (2045-2076)
gap> info:= Filtered( info, x -> not IsBound( x.series ) or
>             x.series <> "L" or x.parameter[1] <> 2 );
[ rec( name := "B(3,2) = O(7,2) ~ C(3,2) = S(6,2)", 
      parameter := [ 3, 2 ], series := "B", shortname := "S6(2)" ), 
  rec( name := "A(10)", parameter := 10, series := "A", 
      shortname := "A10" ), 
  rec( name := "A(2,7) = L(3,7) ", parameter := [ 3, 7 ], 
      series := "L", shortname := "L3(7)" ), 
  rec( name := "2A(3,3) = U(4,3) ~ 2D(3,3) = O-(6,3)", 
      parameter := [ 3, 3 ], series := "2A", shortname := "U4(3)" ), 
  rec( name := "G(2,3)", parameter := 3, series := "G", 
      shortname := "G2(3)" ), 
  rec( name := "B(2,5) = O(5,5) ~ C(2,5) = S(4,5)", 
      parameter := [ 2, 5 ], series := "B", shortname := "S4(5)" ), 
  rec( name := "2A(2,8) = U(3,8)", parameter := [ 2, 8 ], 
      series := "2A", shortname := "U3(8)" ), 
  rec( name := "2A(2,7) = U(3,7)", parameter := [ 2, 7 ], 
      series := "2A", shortname := "U3(7)" ), 
  rec( name := "A(3,3) = L(4,3) ~ D(3,3) = O+(6,3) ", 
      parameter := [ 4, 3 ], series := "L", shortname := "L4(3)" ), 
  rec( name := "A(4,2) = L(5,2) ", parameter := [ 5, 2 ], 
      series := "L", shortname := "L5(2)" ) ]
gap> names:= [ "S6(2)", "A10", "L3(7)", "U4(3)", "G2(3)", "S4(5)",
>              "U3(8)", "U3(7)", "L4(3)", "L5(2)" ];;
gap> for tbl in List( names, CharacterTable ) do
>      info:= HamiltonianCycleInfoFromCharacterTable( tbl );
>      if info <> "Posa for 0th closure" then
>        Print( Identifier( tbl ), ": ", info, "\n" );
>      fi;
>    od;

##  ./hamilcyc.xml (2107-2238)
gap> grps:= AllSmallNonabelianSimpleGroups( [ 1 .. 10^6 ] );;         
gap> epi:= "dummy";;   #  Avoid a message about an unbound variable ...
gap> for simple in grps do
>      for n in [ 1 .. LogInt( 10^6, Size( simple ) ) ] do
>        # Compute the n-fold direct product S^n.
>        soc:= CallFuncList( DirectProduct,
>                            ListWithIdenticalEntries( n, simple ) );
>        # Compute Aut(S^n) as a permutation group.
>        aut:= Image( IsomorphismPermGroup( AutomorphismGroup( soc ) ) );
>        aut:= Image( SmallerDegreePermutationRepresentation( aut ) );
>        # Compute class representatives of subgroups of
>        # Aut(S^n)/Inn(S^n).
>        socle:= Socle( aut );
>        epi:= NaturalHomomorphismByNormalSubgroup( aut, socle );
>        # Compute the candidates for G.  (By the above computations,
>        # we need not consider simple groups.)
>        reps:= List( ConjugacyClassesSubgroups( Image( epi ) ),
>                     Representative );
>        reps:= Filtered( reps, x -> IsCyclic( x ) and Size( x ) <> 1 );
>        greps:= Filtered( List( reps, x -> PreImages( epi, x ) ),
>                      x -> Length( MinimalNormalSubgroups( x ) ) = 1 );
>        for g in greps do
>          # We have to deal with a *transitive* permutation group.
>          # (Each group in question acts faithfully on an orbit.)
>          if not IsTransitive( g ) then
>            g:= First( List( Orbits( g, MovedPoints( g ) ),
>                             x -> Action( g, x ) ),
>                       x -> Size( x ) = Size( g ) );
>          fi;
>          # Check this group G.
>          info:= HamiltonianCycleInfoFromGroup( g );
>          Print( Name( simple ), "^", n, ".", Size( g ) / Size( soc ),
>                 ": ", info, "\n" );
>        od;
>      od;
>    od;
A5^1.2: Posa for 2nd closure
A5^2.2: Posa for 0th closure
A5^2.4: Posa for 0th closure
A5^3.3: Posa for 0th closure
A5^3.6: Chvatal for 1st closure, Posa for 2nd closure
PSL(2,7)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,7)^2.2: Posa for 0th closure
PSL(2,7)^2.4: Posa for 0th closure
A6^1.2: Chvatal for 0th closure, Posa for 1st closure
A6^1.2: Chvatal for 4th closure, Posa for 5th closure
A6^1.2: Chvatal for 0th closure, Posa for 1st closure
A6^2.2: Posa for 0th closure
A6^2.4: Posa for 0th closure
A6^2.4: Posa for 0th closure
A6^2.4: Posa for 0th closure
PSL(2,8)^1.3: Posa for 0th closure
PSL(2,8)^2.2: Posa for 0th closure
PSL(2,8)^2.6: Chvatal for 0th closure, Posa for 1st closure
PSL(2,11)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,11)^2.2: Posa for 0th closure
PSL(2,11)^2.4: Posa for 0th closure
PSL(2,13)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,17)^1.2: Chvatal for 0th closure, Posa for 1st closure
A7^1.2: Posa for 1st closure
PSL(2,19)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,16)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,16)^1.4: Chvatal for 0th closure, Posa for 1st closure
PSL(3,3)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSU(3,3)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,23)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,25)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,25)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,25)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,27)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,27)^1.3: Posa for 0th closure
PSL(2,27)^1.6: Chvatal for 0th closure, Posa for 1st closure
PSL(2,29)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,31)^1.2: Chvatal for 0th closure, Posa for 1st closure
A8^1.2: Chvatal for 2nd closure, Posa for 3rd closure
PSL(3,4)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(3,4)^1.2: Chvatal for 1st closure, Posa for 2nd closure
PSL(3,4)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(3,4)^1.3: Posa for 0th closure
PSL(3,4)^1.6: Chvatal for 0th closure, Posa for 1st closure
PSL(2,37)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSp(4,3)^1.2: Chvatal for 1st closure, Posa for 2nd closure
Sz(8)^1.3: Posa for 0th closure
PSL(2,32)^1.5: Posa for 0th closure
PSL(2,41)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,43)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,47)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,49)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,49)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,49)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSU(3,4)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSU(3,4)^1.4: Chvatal for 0th closure, Posa for 1st closure
PSL(2,53)^1.2: Chvatal for 0th closure, Posa for 1st closure
M12^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,59)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,61)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSU(3,5)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSU(3,5)^1.3: Posa for 0th closure
PSL(2,67)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,71)^1.2: Chvatal for 0th closure, Posa for 1st closure
A9^1.2: Chvatal for 2nd closure, Posa for 3rd closure
PSL(2,73)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,79)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,64)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,64)^1.3: Posa for 0th closure
PSL(2,64)^1.6: Chvatal for 0th closure, Posa for 1st closure
PSL(2,81)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,81)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,81)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,81)^1.4: Chvatal for 0th closure, Posa for 1st closure
PSL(2,81)^1.4: Chvatal for 0th closure, Posa for 1st closure
PSL(2,83)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,89)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(3,5)^1.2: Chvatal for 0th closure, Posa for 1st closure
M22^1.2: Posa for 1st closure
PSL(2,97)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,101)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,103)^1.2: Chvatal for 0th closure, Posa for 1st closure
J_2^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,107)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,109)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,113)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,121)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,121)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,121)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,125)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSL(2,125)^1.3: Posa for 0th closure
PSL(2,125)^1.6: Chvatal for 0th closure, Posa for 1st closure
PSp(4,4)^1.2: Chvatal for 0th closure, Posa for 1st closure
PSp(4,4)^1.4: Posa for 0th closure

##  ./hamilcyc.xml (2604-2632)
gap> TestL2q:= function( t )
>    local name, orders, nccl, cl, prim, bds, n, ord;
> 
>    name:= Identifier( t );
>    orders:= OrdersClassRepresentatives( t );
>    nccl:= Length( orders );
>    cl:= SizesConjugacyClasses( t );
>    prim:= PrimitivePermutationCharacters( t );
>    bds:= List( LowerBoundsVertexDegrees( cl, prim ), Sum );
>    n:= List( [ 1 .. 5 ], i -> Sum( cl{ Filtered( [ 1 .. nccl ],
>                                        x -> orders[x] = i ) } ) );
>    if ForAny( Filtered( [ 1 .. nccl ], i -> orders[i] > 5 ),
>               i -> bds[i-1] <= Size( t ) / 2 ) then
>      Error( "problem with large orders for ", name );
>    elif ForAny( Filtered( [ 1 .. nccl ], i -> orders[i] = 2 ),
>                 i -> bds[i-1] <= n[2] ) then
>      Error( "problem with order 2 for ", name, "\n" );
>    elif ForAny( Filtered( [ 1 .. nccl ],
>                           i -> orders[i] in [ 3 .. 5 ] ),
>                 i -> bds[i-1] <= Sum( n{ [ 2 .. 5 ] } ) ) then
>      Error( "problem with order in [ 3 .. 5 ] for ", name );
>    fi;
> end;;
gap> for q in Filtered( [ 13 .. 59 ], IsPrimePowerInt ) do
>      TestL2q( CharacterTable(
>                   Concatenation( "L2(", String( q ), ")" ) ) );
>    od;

##  ./hamilcyc.xml (2642-2649)
gap> for q in Filtered( [ 2 .. 11 ], IsPrimePowerInt ) do
>      info:= HamiltonianCycleInfoFromGroup( PSL( 2, q ) );
>      if info <> "Posa for 0th closure" then
>        Print( q, ": ", info, "\n" );
>      fi;
>    od;

##
gap> if IsBound( BrowseData ) then
>      data:= BrowseData.defaults.dynamic.replayDefaults;
>      data.replayInterval:= oldinterval;
>    fi;

##
gap> STOP_TEST( "hamilcyc.tst" );
gap> SizeScreen( save );;

#############################################################################
##
#E
