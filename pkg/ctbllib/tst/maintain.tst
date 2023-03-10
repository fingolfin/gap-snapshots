# This file was created automatically, do not edit!
#############################################################################
##
#W  maintain.tst            GAP 4 package CTblLib               Thomas Breuer
##
#Y  Copyright (C)  2022,   Lehrstuhl D für Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the GAP code of examples in the package
##  documentation files.
##  
##  In order to run the tests, one starts GAP from the 'tst' subdirectory
##  of the 'pkg/ctbllib' directory, and calls 'Test( "maintain.tst" );'.
##  
gap> LoadPackage( "CTblLib", false );
true
gap> save:= SizeScreen();;
gap> SizeScreen( [ 72 ] );;
gap> START_TEST( "maintain.tst" );

##
gap> if IsBound( BrowseData ) then
>      data:= BrowseData.defaults.dynamic.replayDefaults;
>      oldinterval:= data.replayInterval;
>      data.replayInterval:= 1;
>    fi;

##  doc2/maintain.xml (72-100)
gap> tbl:= rec(
>   Identifier:= "P41/G1/L1/V4/ext2",
>   InfoText:= Concatenation( [
>     "origin: Hanrath library,\n",
>     "structure is 2^7.L2(8),\n",
>     "characters sorted with permutation (12,14,15,13)(19,20)" ] ),
>   UnderlyingCharacteristic:= 0,
>   SizesCentralizers:= [64512,1024,1024,64512,64,64,64,64,128,128,64,
>     64,128,128,18,18,14,14,14,14,14,14,18,18,18,18,18,18],
>   ComputedPowerMaps:= [,[1,1,1,1,2,3,3,2,3,2,2,1,3,2,16,16,20,20,22,
>     22,18,18,26,26,27,27,23,23],[1,2,3,4,5,6,7,8,9,10,11,12,13,14,4,
>     1,21,22,17,18,19,20,16,15,15,16,16,15],,,,[1,2,3,4,5,6,7,8,9,10,
>     11,12,13,14,15,16,4,1,4,1,4,1,26,25,28,27,23,24]],
>   Irr:= 0,
>   AutomorphismsOfTable:= Group( [(23,26,27)(24,25,28),(9,13)(10,14),
>     (17,19,21)(18,20,22)] ),
>   ConstructionInfoCharacterTable:= ["ConstructClifford",[[[1,2,3,4,
>     5,6,7,8,9],[1,7,8,3,9,2],[1,4,5,6,2],[1,2,2,2,2,2,2,2]],
>     [["L2(8)"],["Dihedral",18],["Dihedral",14],["2^3"]],[[[1,2,3,4],
>     [1,1,1,1],["elab",4,25]],[[1,2,3,4,4,4,4,4,4,4],[2,6,5,2,3,4,5,
>     6,7,8],["elab",10,17]],[[1,2],[3,4],[[1,1],[-1,1]]],[[1,3],[4,
>     2],[[1,1],[-1,1]]],[[1,3],[5,3],[[1,1],[-1,1]]],[[1,3],[6,4],
>     [[1,1],[-1,1]]],[[1,2],[7,2],[[1,1],[1,-1]]],[[1,2],[8,3],[[1,
>     1],[-1,1]]],[[1,2],[9,5],[[1,1],[1,-1]]]]]],
>   );;
gap> ConstructClifford( tbl, tbl.ConstructionInfoCharacterTable[2] );
gap> ConvertToLibraryCharacterTableNC( tbl );;

##  doc2/maintain.xml (109-114)
gap> Length( LinearCharacters( tbl ) );
1
gap> IsPerfectCharacterTable( tbl );
true

##  doc2/maintain.xml (125-139)
gap> IsInternallyConsistent( tbl );
true
gap> irr:= Irr( tbl );;
gap> test:= Concatenation( List( [ 2 .. 7 ],
>               n -> Symmetrizations( tbl, irr, n ) ) );;
gap> Append( test, Set( Tensored( irr, irr ) ) );
gap> fail in Decomposition( irr, test, "nonnegative" );
false
gap> if ForAny( Tuples( [ 1 .. NrConjugacyClasses( tbl ) ], 3 ),
>      t -> not ClassMultiplicationCoefficient( tbl, t[1], t[2], t[3] )
>               in NonnegativeIntegers ) then
>      Error( "contradiction" );
> fi;

##  doc2/maintain.xml (148-156)
gap> n:= Size( tbl );
64512
gap> NumberPerfectGroups( n );
4
gap> grps:= List( [ 1 .. 4 ], i -> PerfectGroup( IsPermGroup, n, i ) );
[ L2(8) 2^6 E 2^1, L2(8) N 2^6 E 2^1 I, L2(8) N 2^6 E 2^1 II, 
  L2(8) N 2^6 E 2^1 III ]

##  doc2/maintain.xml (166-171)
gap> tbls:= List( grps, CharacterTable );;
gap> List( tbls,
>          x -> TransformingPermutationsCharacterTables( x, tbl ) );
[ fail, fail, fail, fail ]

##  doc2/maintain.xml (180-184)
gap> List( tbls,
>          t -> TransformingPermutations( Irr( t ), Irr( tbl ) ) );
[ fail, fail, fail, fail ]

##  doc2/maintain.xml (196-204)
gap> testchars:= List( tbls,
>   t -> Filtered( Irr( t ),
>          x -> x[1] = 63 and Set( x ) = [ -1, 0, 7, 63 ] ) );;
gap> List( testchars, Length );
[ 1, 1, 1, 1 ]
gap> List( testchars, l -> Number( l[1], x -> x = 7 ) );
[ 2, 2, 2, 2 ]

##  doc2/maintain.xml (224-232)
gap> testchars:= List( [ tbl ],
>   t -> Filtered( Irr( t ),
>          x -> x[1] = 63 and Set( x ) = [ -1, 0, 7, 63 ] ) );;
gap> List( testchars, Length );
[ 1 ]
gap> List( testchars, l -> Number( l[1], x -> x = 7 ) );
[ 1 ]

##  doc2/maintain.xml (257-268)
gap> Filtered( [ 1 .. 4 ], i ->
>        TransformingPermutationsCharacterTables( tbls[i],
>            CharacterTable( "P41/G1/L1/V1/ext2" ) ) <> fail );
[ 1 ]
gap> Filtered( [ 1 .. 4 ], i ->
>        TransformingPermutationsCharacterTables( tbls[i],
>            CharacterTable( "P41/G1/L1/V2/ext2" ) ) <> fail );
[ 3 ]
gap> TransformingPermutations( Irr( tbls[1] ), Irr( tbls[3] ) ) <> fail;
true

##  doc2/maintain.xml (284-291)
gap> Filtered( [ 1 .. 4 ], i ->
>        TransformingPermutationsCharacterTables( tbls[i],
>            CharacterTable( "P41/G1/L1/V4/ext2" ) ) <> fail );
[ 4 ]
gap> TransformingPermutations( Irr( tbls[2] ), Irr( tbls[4] ) ) <> fail;
true

##  doc2/maintain.xml (433-438)
gap> g:= AtlasGroup( "E6(2)" );;
gap> repeat x:= PseudoRandom( g ); until Order( x ) = 91;
gap> CharacteristicPolynomial( x ) = CharacteristicPolynomial( x^11 );
false

##  doc2/maintain.xml (447-453)
gap> t:= CharacterTable( "E6(2)" );;
gap> ord91:= Positions( OrdersClassRepresentatives( t ), 91 );
[ 163, 164, 165, 166, 167, 168 ]
gap> PowerMap( t, 11 ){ ord91 };
[ 167, 168, 163, 164, 165, 166 ]

##  doc2/maintain.xml (491-526)
gap> t:= CharacterTable( "2.F4(2).2" );;
gap> f:= CharacterTable( "F4(2).2" );;
gap> map:= PowerMap( t, 2 );
[ 1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 11, 11, 3, 3, 3, 5, 5, 5, 3, 6, 6, 5, 
  5, 7, 7, 5, 8, 7, 29, 29, 9, 9, 9, 9, 11, 11, 9, 9, 9, 9, 11, 11, 
  43, 43, 20, 20, 20, 14, 14, 13, 13, 20, 21, 24, 28, 28, 57, 57, 29, 
  29, 29, 29, 33, 33, 35, 37, 37, 37, 37, 33, 33, 37, 37, 35, 41, 41, 
  42, 42, 79, 79, 43, 43, 83, 83, 45, 45, 47, 47, 53, 53, 91, 91, 57, 
  57, 61, 61, 61, 98, 98, 70, 70, 63, 63, 81, 81, 83, 83, 1, 6, 7, 
  11, 16, 17, 24, 24, 21, 27, 27, 25, 26, 29, 41, 53, 53, 53, 46, 56, 
  56, 56, 56, 62, 75, 75, 78, 78, 77, 77, 79, 79, 86, 86, 85, 85, 88, 
  88, 88, 88, 95, 95, 96, 96 ]
gap> PositionSublist( map, [ 86, 86, 85, 85 ] );
140
gap> OrdersClassRepresentatives( t ){ [ 140 .. 143 ] };
[ 32, 32, 32, 32 ]
gap> SizesCentralizers( t ){ [ 140 .. 143 ] };
[ 64, 64, 64, 64 ]
gap> GetFusionMap( t, f ){ [ 140 ..143 ] };
[ 86, 86, 87, 87 ]
gap> PowerMap( f, 2 ){ [ 86, 87 ] };
[ 50, 50 ]
gap> pos:= PositionsProperty( Irr( t ),
>    x -> x[1] <> x[2] and Length( Set( x{ [ 140 .. 143 ] } ) ) > 1 );
[ 144, 145, 146, 147 ]
gap> List( pos, i -> Irr(t)[i]{ [ 140 .. 143 ] } );
[ [ 2*E(16)-2*E(16)^7, -2*E(16)+2*E(16)^7, 2*E(16)^3-2*E(16)^5, 
      -2*E(16)^3+2*E(16)^5 ], 
  [ -2*E(16)+2*E(16)^7, 2*E(16)-2*E(16)^7, -2*E(16)^3+2*E(16)^5, 
      2*E(16)^3-2*E(16)^5 ], 
  [ -2*E(16)^3+2*E(16)^5, 2*E(16)^3-2*E(16)^5, 2*E(16)-2*E(16)^7, 
      -2*E(16)+2*E(16)^7 ], 
  [ 2*E(16)^3-2*E(16)^5, -2*E(16)^3+2*E(16)^5, -2*E(16)+2*E(16)^7, 
      2*E(16)-2*E(16)^7 ] ]

##  doc2/maintain.xml (562-569)
gap> tbl:= CharacterTable( "Ly" );;
gap> orders:= OrdersClassRepresentatives( tbl );;
gap> order8:= Filtered( [ 1 .. Length( orders ) ], x -> orders[x] = 8 );
[ 12, 13 ]
gap> SizesCentralizers( tbl ){ order8 } / 2^6;
[ 15/2, 3/2 ]

##  doc2/maintain.xml (587-594)
gap> g:= AtlasGroup( "McL.2" );;
gap> NrMovedPoints( g );
275
gap> syl:= SylowSubgroup( g, 2 );;
gap> pc:= Image( IsomorphismPcGroup( syl ) );;
gap> t:= CharacterTable( pc );;

##  doc2/maintain.xml (603-607)
gap> IsRecord( TransformingPermutationsCharacterTables( t,
>                  CharacterTable( "LyN2" ) ) );
true

##  doc2/maintain.xml (647-651)
gap> GroupInfoForCharacterTable( "A5" );;
gap> IsBound( CTblLib.FactorGroupOfPerfectSpaceGroup );
true

##  doc2/maintain.xml (837-853)
gap> generatorsOfPerfectSpaceGroup:= function( Pgens, V, t )
>     local d, result, i, m;
>     d:= Length( Pgens[1] );
>     result:= [];
>     for i in [ 1 .. Length( Pgens ) ] do
>       m:= IdentityMat( d+1 );
>       m{ [ 1 .. d ] }{ [ 1 .. d ] }:= Pgens[i];
>       m[ d+1 ]{ [ 1 .. d ] }:= V[i];
>       result[i]:= m;
>     od;
>     m:= IdentityMat( d+1 );
>     m[ d+1 ]{ [ 1 .. d ] }:= t;
>     Add( result, m );
>     return result;
> end;;

##  doc2/maintain.xml (877-880)
gap> multiplicationModulo:= n -> function( v, g )
>        return List( v * g, x -> x mod n ); end;;

##  doc2/maintain.xml (893-906)
gap> deletedPermutationMat:= function( pi, n )
>     local mat, j, i;
>     mat:= PermutationMat( pi, n );
>     mat:= mat{ [ 1 .. n-1 ] }{ [ 1 .. n-1 ] };
>     j:= n ^ pi;
>     if j <> n then
>       for i in [ 1 .. n-1 ] do
>         mat[i][j]:= -1;
>       od;
>     fi;
>     return mat;
> end;;

##  doc2/maintain.xml (963-983)
gap> verifyFactorGroup:= function( gens, id )
>     local sm, act, stored, hom;
>     sm:= SmallerDegreePermutationRepresentation( Group( gens ) );
>     gens:= List( gens, x -> x^sm );
>     act:= Images( sm );
>     if not IsRecord( TransformingPermutationsCharacterTables(
>                          CharacterTable( act ),
>                          CharacterTable( id ) ) ) then
>       return "wrong character table";
>     fi;
>     GroupInfoForCharacterTable( id );
>     stored:= CTblLib.FactorGroupOfPerfectSpaceGroup( id );
>     hom:= GroupHomomorphismByImages( stored, act,
>               GeneratorsOfGroup( stored ), gens );
>     if hom = fail or not IsBijective( hom ) then
>       return "wrong group";
>     fi;
>     return true;
> end;;

##  doc2/maintain.xml (998-1001)
gap> a:= deletedPermutationMat( (1,3)(2,4), 6 );;
gap> b:= deletedPermutationMat( (1,2,3)(4,5,6), 6 );;

##  doc2/maintain.xml (1009-1011)
gap> v:= [ [ 2, 2, 0, 0, 1 ], 0 * b[1] ];;

##  doc2/maintain.xml (1021-1023)
gap> t:= [ 2, 0, 0, 0, 0 ];;

##  doc2/maintain.xml (1033-1041)
gap> sgens:= generatorsOfPerfectSpaceGroup( [ a, b ], v, t );;
gap> g:= Group( sgens );;
gap> fun:= multiplicationModulo( 8 );;
gap> orb:= Orbit( g, [ 1, 0, 0, 0, 0, 1 ], fun );;
gap> permgens:= List( sgens, x -> Permutation( x, orb, fun ) );;
gap> verifyFactorGroup( permgens, "P1/G2/L1/V2/ext4" );
true

##  doc2/maintain.xml (1051-1057)
gap> bas:= [ [-1,-1, 1, 1, 1 ],
>            [-1, 1,-1, 1, 1 ],
>            [ 1, 1, 1,-1,-1 ],
>            [ 1, 1,-1,-1, 1 ],
>            [-1, 1, 1,-1, 1 ] ];;

##  doc2/maintain.xml (1066-1072)
gap> B:= Basis( Rationals^Length( bas ), bas );;
gap> abas:= List( bas, x -> Coefficients( B, x * a ) );;
gap> bbas:= List( bas, x -> Coefficients( B, x * b ) );;
gap> vbas:= List( v, x -> Coefficients( B, x ) );
[ [ 3/2, 1, 2, 3/2, -1 ], [ 0, 0, 0, 0, 0 ] ]

##  doc2/maintain.xml (1082-1087)
gap> vbas:= vbas * 2;
[ [ 3, 2, 4, 3, -2 ], [ 0, 0, 0, 0, 0 ] ]
gap> t:= 2 * t;
[ 4, 0, 0, 0, 0 ]

##  doc2/maintain.xml (1099-1107)
gap> sgens:= generatorsOfPerfectSpaceGroup( [ abas, bbas ], vbas, t );;
gap> g:= Group( sgens );;
gap> fun:= multiplicationModulo( 16 );;
gap> orb:= Orbit( g, [ 0, 0, 0, 0, 0, 1 ], fun );;
gap> permgens:= List( sgens, x -> Permutation( x, orb, fun ) );;
gap> verifyFactorGroup( permgens, "P1/G2/L2/V2/ext4" );
true

##  doc2/maintain.xml (1123-1136)
gap> a:= [ [ 0, 1, 0, 1, 0, 0 ],
>          [ 1, 0, 1, 1, 1, 1 ],
>          [-1,-1,-1,-1, 0, 0 ],
>          [ 0, 0,-1,-1,-1,-1 ],
>          [ 1, 1, 1, 1, 0, 1 ],
>          [ 0, 0, 1, 0, 1, 0 ] ];;
gap> b:= [ [-1, 0, 0, 0, 0,-1 ],
>          [ 0, 0,-1, 0,-1, 0 ],
>          [ 1, 1, 1, 1, 1, 1 ],
>          [ 0, 0, 1, 0, 0, 0 ],
>          [-1,-1,-1, 0, 0, 0 ],
>          [ 1, 0, 0, 0, 0, 0 ] ];;

##  doc2/maintain.xml (1153-1164)
gap> v:= List( [ 1, 2 ], i -> 0 * a[1] );;
gap> t:= [ 1, 0, 0, 0, 0, 0 ];;
gap> sgens:= generatorsOfPerfectSpaceGroup( [ a, b ], v, t );;
gap> g:= Group( sgens );;
gap> fun:= multiplicationModulo( 4 );;
gap> seed:= [ 1, 0, 0, 0, 0, 0, 1 ];;
gap> orb:= Orbit( g, seed, fun );;
gap> permgens:= List( sgens, x -> Permutation( x, orb, fun ) );;
gap> verifyFactorGroup( permgens, "P11/G1/L1/V1/ext4" );
true

##  doc2/maintain.xml (1179-1189)
gap> v:= [ [ 1, 0, 1, 0, 0, 0 ], 0 * a[1] ];;
gap> t:= [ 2, 0, 0, 0, 0, 0 ];;
gap> sgens:= generatorsOfPerfectSpaceGroup( [ a, b ], v, t );;
gap> g:= Group( sgens );;
gap> fun:= multiplicationModulo( 8 );;
gap> orb:= Orbit( g, [ 1, 0, 0, 0, 0, 0, 1 ], fun );;
gap> permgens:= List( sgens, x -> Permutation( x, orb, fun ) );;
gap> verifyFactorGroup( permgens, "P11/G1/L1/V2/ext4" );
true

##  doc2/maintain.xml (1204-1214)
gap> v:= [ [ 0, 1, 0, 0, 1, 0 ], 0 * a[1] ];;
gap> t:= [ 2, 0, 0, 0, 0, 0 ];;
gap> sgens:= generatorsOfPerfectSpaceGroup( [ a, b ], v, t );;
gap> g:= Group( sgens );;
gap> fun:= multiplicationModulo( 8 );;
gap> orb:= Orbit( g, [ 1, 0, 0, 0, 0, 0, 1 ], fun );;
gap> permgens:= List( sgens, x -> Permutation( x, orb, fun ) );;
gap> verifyFactorGroup( permgens, "P11/G1/L1/V3/ext4" );
true

##  doc2/maintain.xml (1223-1240)
gap> a:= [ [ 1, 0, 0, 1, 0,-1, 0, 1 ],
>          [ 0,-1, 1, 0,-1, 0, 0, 0 ],
>          [ 1, 0, 0, 1, 0,-1, 0, 0 ],
>          [ 0,-1, 0,-1, 0, 1, 1,-1 ],
>          [ 1, 0,-1, 1, 1,-1, 0, 0 ],
>          [ 1,-1,-1, 0, 0, 0, 1, 0 ],
>          [ 0,-1, 1, 0,-1, 1, 0,-1 ],
>          [ 1, 0,-1, 0, 0, 0, 0, 0 ] ];;
gap> b:= [ [ 1, 0,-2, 0, 1,-1, 1, 0 ],
>          [ 0,-1, 0, 0, 0, 0, 1,-1 ],
>          [ 1, 0,-1, 0, 1,-1, 0, 0 ],
>          [-1,-1, 1,-1,-1, 2, 0,-1 ],
>          [ 0, 0, 0,-1, 0, 0, 0, 0 ],
>          [ 0,-1, 0,-1,-1, 1, 1,-1 ],
>          [ 1,-1, 0, 0, 0, 0, 0, 0 ],
>          [ 1, 0, 0, 0, 0, 0, 0, 0 ] ];;

##  doc2/maintain.xml (1255-1266)
gap> v:= List( [ 1, 2 ], i -> 0 * a[1] );;
gap> t:= [ 1, 0, 0, 0, 0, 0, 0, 0 ];;
gap> sgens:= generatorsOfPerfectSpaceGroup( [ a, b ], v, t );;
gap> g:= Group( sgens );;
gap> fun:= multiplicationModulo( 3 );;
gap> seed:= [ 1, 0, 0, 0, 0, 0, 0, 0, 1 ];;
gap> orb:= Orbit( g, seed, fun );;
gap> permgens:= List( sgens, x -> Permutation( x, orb, fun ) );;
gap> verifyFactorGroup( permgens, "P11/G4/L1/V1/ext3" );
true

##  doc2/maintain.xml (1281-1291)
gap> a:= KroneckerProduct( IdentityMat( 4 ), [ [ 0, 1 ], [ -1, 0 ] ] );;
gap> b:= [ [ 0,-1, 0, 0, 0, 0, 0, 0 ],
>          [ 0, 0, 1, 0, 0, 0, 0, 0 ],
>          [-1, 0, 0, 0, 0, 0, 0, 0 ],
>          [ 0, 0, 0, 0, 0, 0,-1, 0 ],
>          [ 0, 0, 0,-1, 0, 0, 0, 0 ],
>          [ 0, 0, 0, 0, 0, 1, 0, 0 ],
>          [ 0, 0, 0, 0, 1, 0, 0, 0 ],
>          [ 0, 0, 0, 0, 0, 0, 0, 1 ] ];;

##  doc2/maintain.xml (1302-1311)
gap> bas:= [ [ 1, 1, 0, 0, 0, 0, 0, 0 ],
>            [ 0, 1, 1, 0, 0, 0, 0, 0 ],
>            [ 0, 0, 1, 1, 0, 0, 0, 0 ],
>            [ 0, 0, 0, 1, 1, 0, 0, 0 ],
>            [ 0, 0, 0, 0, 1, 1, 0, 0 ],
>            [ 0, 0, 0, 0, 0, 1, 1, 0 ],
>            [ 0, 0, 0, 0, 0, 0, 1, 1 ],
>            [ 0, 0, 0, 0, 0, 0,-1, 1 ] ];;

##  doc2/maintain.xml (1319-1323)
gap> B:= Basis( Rationals^Length( bas ), bas );;
gap> abas:= List( bas, x -> Coefficients( B, x * a ) );;
gap> bbas:= List( bas, x -> Coefficients( B, x * b ) );;

##  doc2/maintain.xml (1338-1353)
gap> v:= List( [ 1, 2 ], i -> 0 * a[1] );;
gap> t:= [ 1, 0, 0, 0, 0, 0, 0, 0 ];;
gap> sgens:= generatorsOfPerfectSpaceGroup( [ abas, bbas ], v, t );;
gap> g:= Group( sgens );;
gap> fun:= multiplicationModulo( 2 );;
gap> funpairs:= function( pair, g )
>    return [ fun( pair[1], g ), pair[2] * g ];
>    end;;
gap> seed:= [ [ 1, 0, 0, 0, 0, 0, 0, 0, 1 ],
>             [ 1, 0, 0, 0, 0, 0, 0, 0, 0 ] ];;
gap> orb:= Orbit( g, seed, funpairs );;
gap> permgens:= List( sgens, x -> Permutation( x, orb, funpairs ) );;
gap> verifyFactorGroup( permgens, "P12/G1/L2/V1/ext2" );
true

##  doc2/maintain.xml (1368-1372)
gap> a:= PermutationMat( (2,4)(5,7), 7 );;
gap> b:= PermutationMat( (1,3,2)(4,6,5), 7 );;
gap> c:= DiagonalMat( [ -1, -1, 1, 1, -1, -1, 1 ] );;

##  doc2/maintain.xml (1383-1391)
gap> bas:= [ [ 1, 1, 0, 0, 0, 0, 0 ],
>            [ 0, 1, 1, 0, 0, 0, 0 ],
>            [ 0, 0, 1, 1, 0, 0, 0 ],
>            [ 0, 0, 0, 1, 1, 0, 0 ],
>            [ 0, 0, 0, 0, 1, 1, 0 ],
>            [ 0, 0, 0, 0, 0, 1, 1 ],
>            [ 0, 0, 0, 0, 0,-1, 1 ] ];;

##  doc2/maintain.xml (1399-1404)
gap> B:= Basis( Rationals^Length( bas ), bas );;
gap> abas:= List( bas, x -> Coefficients( B, x * a ) );;
gap> bbas:= List( bas, x -> Coefficients( B, x * b ) );;
gap> cbas:= List( bas, x -> Coefficients( B, x * c ) );;

##  doc2/maintain.xml (1414-1425)
gap> v:= List( [ 1 .. 3 ], i -> 0 * a[1] );;
gap> t:= [ 1, 0, 0, 0, 0, 0, 0 ];;
gap> sgens:= generatorsOfPerfectSpaceGroup( [ abas,bbas,cbas ], v, t );;
gap> g:= Group( sgens );;
gap> fun:= multiplicationModulo( 2 );;
gap> orb:= Orbit( g, [ 1, 0, 0, 0, 0, 0, 0, 1 ], fun );;
gap> act:= Action( g, orb, fun );;
gap> permgens:= List( sgens, x -> Permutation( x, orb, fun ) );;
gap> verifyFactorGroup( permgens, "P13/G1/L2/V1/ext2" );
true

##  doc2/maintain.xml (1440-1461)
gap> b:= [ [ 0,-1, 0, 0, 0, 0, 0, 0, 0, 0 ], 
>          [ 0, 0, 0, 0,-1, 0, 0, 0, 0, 0 ], 
>          [ 0, 0, 0, 0, 0, 0, 0, 1, 0, 0 ], 
>          [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 0 ], 
>          [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
>          [ 0, 0, 1, 0, 0, 0, 0, 0, 0, 0 ], 
>          [ 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 ], 
>          [ 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 ], 
>          [ 0, 0, 0, 0, 0, 0, 1, 0, 0, 0 ], 
>          [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ] ];;
gap> c:= [ [ 0, 0, 0, 0, 0, 0, 0,-1, 0, 0 ], 
>          [ 0, 0, 0, 0, 0, 0, 0,-1, 1,-1 ], 
>          [ 0, 0, 0, 0,-1, 1, 0,-1, 0, 0 ], 
>          [ 0,-1, 1, 0, 0, 0, 0,-1, 0, 0 ], 
>          [ 0, 0, 0, 0, 0, 0, 0, 0, 0,-1 ], 
>          [ 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 ], 
>          [ 0, 0, 1, 0, 0, 0, 0, 0, 0, 0 ], 
>          [ 0, 0, 0, 0, 0, 1,-1, 0, 0, 1 ], 
>          [ 0, 0, 1,-1, 0, 0, 0, 0, 0, 1 ], 
>          [-1, 0, 1, 0, 0,-1, 0, 0, 0, 0 ] ];;

##  doc2/maintain.xml (1471-1492)
gap> bas2:= [ [ 0, 1,-1, 0, 0, 0, 0, 0, 0, 0 ],
>             [ 0, 0, 1,-1, 0, 0, 0, 0, 0, 0 ],
>             [ 0, 0, 0, 0, 1,-1, 0, 0, 0, 0 ],
>             [ 0, 0, 0, 0, 0, 1,-1, 0, 0, 0 ],
>             [ 0, 0, 0, 0, 0, 1, 0,-1, 0, 0 ],
>             [ 0, 0, 0, 0, 0, 0, 0, 1,-1, 0 ],
>             [ 0, 0, 0, 0, 0, 0, 0, 0, 1,-1 ],
>             [ 0, 0, 0, 1, 0, 0, 0, 0, 0,-1 ],
>             [ 0, 1, 0, 0, 0, 0, 0, 1, 0, 0 ],
>             [ 1, 0, 0, 0, 1, 0, 0, 0, 0, 0 ] ];;
gap> bas5:= [ [ 0,-1, 1, 1,-1, 1, 1,-1,-1, 0 ],
>             [ 1, 0,-1,-1,-1, 1, 1,-1,-1, 0 ],
>             [ 0, 1, 1,-1, 1, 1,-1, 0, 1, 1 ],
>             [ 1, 1, 0,-1, 0,-1, 1,-1, 1,-1 ],
>             [-1, 0,-1, 1, 1, 0,-1,-1, 1,-1 ],
>             [ 0, 1,-1, 1, 1,-1, 1, 1, 0,-1 ],
>             [-1,-1, 1, 1, 0,-1,-1,-1,-1, 0 ],
>             [ 1,-1, 0,-1, 1,-1, 1, 1, 0,-1 ],
>             [-1, 1,-1, 1,-1, 0,-1, 1, 0,-1 ],
>             [ 1,-1,-1, 1, 1, 1, 0, 0,-1,-1 ] ];;

##  doc2/maintain.xml (1501-1508)
gap> B2:= Basis( Rationals^Length( bas2 ), bas2 );;
gap> bbas2:= List( bas2, x -> Coefficients( B2, x * b ) );;
gap> cbas2:= List( bas2, x -> Coefficients( B2, x * c ) );;
gap> B5:= Basis( Rationals^Length( bas5 ), bas5 );;
gap> bbas5:= List( bas5, x -> Coefficients( B5, x * b ) );;
gap> cbas5:= List( bas5, x -> Coefficients( B5, x * c ) );;

##  doc2/maintain.xml (1518-1529)
gap> v:= List( [ 1, 2 ], i -> 0 * bbas2[1] );;
gap> t:= [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];;
gap> sgens:= generatorsOfPerfectSpaceGroup( [ bbas2, cbas2 ], v, t );;
gap> g:= Group( sgens );;
gap> fun:= multiplicationModulo( 2 );;
gap> seed:= [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ];;
gap> orb:= Orbit( g, seed, fun );;
gap> permgens:= List( sgens, x -> Permutation( x, orb, fun ) );;
gap> verifyFactorGroup( permgens, "P21/G3/L2/V1/ext2" );
true

##  doc2/maintain.xml (1539-1546)
gap> sgens:= generatorsOfPerfectSpaceGroup( [ bbas5, cbas5 ], v, t );;
gap> g:= Group( sgens );;
gap> orb:= Orbit( g, seed, fun );;
gap> permgens:= List( sgens, x -> Permutation( x, orb, fun ) );;
gap> verifyFactorGroup( permgens, "P21/G3/L5/V1/ext2" );
true

##  doc2/maintain.xml (1561-1576)
gap> a:= [ [ 0,-1, 0, 1, 0,-1, 1],
>          [ 0, 0,-1, 0, 1,-1, 0],
>          [ 0, 0, 0,-1, 1, 0, 0],
>          [ 0, 0, 0,-1, 0, 0, 0],
>          [ 0, 0, 1,-1, 0, 0, 0],
>          [ 0,-1, 1, 0,-1, 0, 0],
>          [ 1,-1, 0, 1, 0,-1, 0] ];;
gap> b:= [ [-1, 0, 1, 0,-1, 1, 0],
>          [ 0,-1, 0, 1,-1, 0, 0],
>          [ 0, 0,-1, 1, 0, 0, 0],
>          [ 0, 0,-1, 0, 0, 0, 0],
>          [ 0, 1,-1, 0, 0, 0, 0],
>          [-1, 1, 0,-1, 0, 0, 0],
>          [-1, 0, 1, 0,-1, 0, 1] ];;

##  doc2/maintain.xml (1585-1589)
gap> v:= [ [ 2, 1, 0, 0, 0, 1, 4 ],
>          [ 2, 0, 0, 0, 0, 0, 0 ] ];;
gap> t:= [ 3, 0, 0, 0, 0, 0, 0 ];;

##  doc2/maintain.xml (1604-1621)
gap> sgens:= generatorsOfPerfectSpaceGroup( [ a, b ], v, t );;
gap> g:= Group( sgens );;
gap> aa:= sgens[1];;
gap> bb:= sgens[2];;
gap> elm:= aa*bb;;
gap> Order( elm );
7
gap> fixed:= NullspaceMat( elm - aa^0 );
[ [ 1, 1, 1, 1, 1, 1, 1, 0 ], [ -4, 1, 1, -5, -5, 2, 0, 1 ] ]
gap> fun:= multiplicationModulo( 9 );;
gap> seed:= fun( fixed[2], aa^0 );
[ 5, 1, 1, 4, 4, 2, 0, 1 ]
gap> orb:= Orbit( g, seed, fun );;
gap> permgens:= List( sgens, x -> Permutation( x, orb, fun ) );;
gap> verifyFactorGroup( permgens, "P41/G1/L1/V3/ext3" );
true

##  doc2/maintain.xml (1630-1632)
gap> t:= [ 6, 0, 0, 0, 0, 0, 0 ];;

##  doc2/maintain.xml (1642-1652)
gap> fun:= multiplicationModulo( 18 );;
gap> sgens:= generatorsOfPerfectSpaceGroup( [ a, b ], v, t );;
gap> g:= Group( sgens );;
gap> seed:= fun( fixed[2], aa^0 );
[ 14, 1, 1, 13, 13, 2, 0, 1 ]
gap> orb:= Orbit( g, seed, fun );;
gap> permgens:= List( sgens, x -> Permutation( x, orb, fun ) );;
gap> verifyFactorGroup( permgens, "P41/G1/L1/V4/ext3" );
true

##  doc2/maintain.xml (1667-1670)
gap> a:= deletedPermutationMat( (1,9)(3,5)(7,11)(8,10), 11 );;
gap> b:= deletedPermutationMat( (1,4,3,2)(5,8,7,6), 11 );;

##  doc2/maintain.xml (1679-1683)
gap> v:= [ 0 * a[1],
>          [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 1 ] ];;
gap> t:= [ 2, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];;

##  doc2/maintain.xml (1693-1701)
gap> sgens:= generatorsOfPerfectSpaceGroup( [ a, b ], v, t );;
gap> g:= Group( sgens );;
gap> fun:= multiplicationModulo( 4 );;
gap> orb:= Orbit( g, [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ], fun );;
gap> permgens:= List( sgens, x -> Permutation( x, orb, fun ) );;
gap> verifyFactorGroup( permgens, "P48/G1/L1/V2/ext2" );
true

##  doc2/maintain.xml (1716-1731)
gap> a:= [ [ 0, 0,-1, 1, 0,-1, 1 ],
>          [ 1, 0,-1, 1, 1,-1, 0 ],
>          [ 0, 1,-1, 0, 1, 0,-1 ],
>          [ 0, 1, 0,-1, 1, 0,-1 ],
>          [-1, 1, 1,-1, 0, 1, 0 ],
>          [-1, 0, 1,-1, 0, 0, 1 ],
>          [ 0, 0, 0, 0, 0, 0, 1 ] ];;
gap> b:= [ [ 0, 0, 0, 0, 0, 0, 1 ],
>          [ 0, 0,-1, 1, 0,-1, 1 ],
>          [ 1, 0,-1, 1, 1,-1, 0 ],
>          [ 0, 1,-1, 0, 1, 0,-1 ],
>          [ 0, 1, 0,-1, 1, 0,-1 ],
>          [-1, 1, 1,-1, 0, 1, 0 ],
>          [-1, 0, 1,-1, 0, 0, 1 ] ];;

##  doc2/maintain.xml (1740-1744)
gap> v:= [ [ 2, 1, 0, 0, 2, 1, 0 ],
>          0 * b[1] ];;
gap> t:= [ 3, 0, 0, 0, 0, 0, 0 ];;

##  doc2/maintain.xml (1754-1758)
gap> sgens:= generatorsOfPerfectSpaceGroup( [ a, b ], v, t );;
gap> g:= Group( sgens );;
gap> fun:= multiplicationModulo( 9 );;

##  doc2/maintain.xml (1767-1781)
gap> aa:= sgens[1];;
gap> bb:= sgens[2];;
gap> elm:= aa*bb^4;;
gap> Order( elm );
12
gap> fixed:= NullspaceMat( elm - aa^0 );
[ [ -1, -1, 1, 1, -1, -1, 1, 0 ], [ 0, -3, 1, 1, -1, -2, 0, 1 ] ]
gap> seed:= fun( fixed[2], aa^0 );
[ 0, 6, 1, 1, 8, 7, 0, 1 ]
gap> orb:= Orbit( g, seed, fun );;
gap> permgens:= List( sgens, x -> Permutation( x, orb, fun ) );;
gap> verifyFactorGroup( permgens, "P49/G1/L1/V2/ext3" );
true

##  doc2/maintain.xml (1796-1809)
gap> a:= [ [ 0, 1, 0,-1,-1, 1 ],
>          [ 1, 0,-1, 0, 1, 0 ],
>          [ 0, 0, 0,-1, 0, 1 ],
>          [ 0, 0,-1, 0, 0, 1 ],
>          [ 0, 0, 0, 0, 1, 0 ],
>          [ 0, 0, 0, 0, 0, 1 ] ];;
gap> b:= [ [ 0,-1, 0, 1, 0,-1 ],
>          [ 0, 1, 0,-1,-1, 0 ],
>          [ 0, 0, 1, 1, 0,-1 ],
>          [ 0, 0, 0, 0,-1, 0 ],
>          [ 0, 1, 0, 0, 0, 0 ],
>          [ 1, 0, 0, 0, 0, 0 ] ];;

##  doc2/maintain.xml (1818-1821)
gap> v:= List( [ 1, 2 ], i -> 0 * a[1] );;
gap> t:= [ 1, 0, 0, 0, 0, 0 ];;

##  doc2/maintain.xml (1831-1839)
gap> sgens:= generatorsOfPerfectSpaceGroup( [ a, b ], v, t );;
gap> g:= Group( sgens );;
gap> fun:= multiplicationModulo( 3 );;
gap> orb:= Orbit( g, [ 1, 0, 0, 0, 0, 0, 1 ], fun );;
gap> permgens:= List( sgens, x -> Permutation( x, orb, fun ) );;
gap> verifyFactorGroup( permgens, "P50/G1/L1/V1/ext3" );
true

##  doc2/maintain.xml (1849-1857)
gap> sgens:= generatorsOfPerfectSpaceGroup( [ a, b ], v, t );;
gap> g:= Group( sgens );;
gap> fun:= multiplicationModulo( 4 );;
gap> orb:= Orbit( g, [ 1, 0, 0, 0, 0, 0, 1 ], fun );;
gap> permgens:= List( sgens, x -> Permutation( x, orb, fun ) );;
gap> verifyFactorGroup( permgens, "P50/G1/L1/V1/ext4" );
true

##  doc2/maintain.xml (1872-1878)
gap> degrees:= CharacterDegrees( CharacterTable( "P1/G2/L2/V2/ext4" ) );
[ [ 1, 1 ], [ 2, 2 ], [ 3, 2 ], [ 4, 2 ], [ 5, 1 ], [ 6, 5 ], 
  [ 10, 4 ], [ 12, 4 ], [ 15, 20 ], [ 20, 2 ], [ 30, 29 ], [ 60, 8 ] ]
gap> List( degrees, x -> x[1] ) = DivisorsInt( 60 );
true

##  doc2/maintain.xml (1950-1962)
gap> BrokenSymmetries:= function( ordtbl, modtbl )
>     local taut, maut, triv, fus, orb;
>     taut:= AutomorphismsOfTable( ordtbl );
>     maut:= AutomorphismsOfTable( modtbl );
>     triv:= TrivialSubgroup( taut );
>     fus:= GetFusionMap( modtbl, ordtbl );
>     orb:= MakeImmutable( Set( OrbitFusions( maut, fus, triv ) ) );
>     return ForAny( GeneratorsOfGroup( taut ),
>                x -> ForAny( orb,
>                         fus -> not OnTuples( fus, x ) in orb ) );
> end;;

##  doc2/maintain.xml (1995-2054)
gap> t:= CharacterTable( "2.A6.2_1" );;
gap> m:= t mod 2;;
gap> GetFusionMap( m, t );
[ 1, 4, 6, 9 ]
gap> AutomorphismsOfTable( t );
Group([ (16,17), (14,15), (14,15)(16,17) ])
gap> AutomorphismsOfTable( m );
Group([ (2,3) ])
gap> Display( m );
2.A6.2_1mod2

     2  5  2  2  1
     3  2  2  2  .
     5  1  .  .  1

       1a 3a 3b 5a
    2P 1a 3a 3b 5a
    3P 1a 1a 1a 5a
    5P 1a 3a 3b 1a

X.1     1  1  1  1
X.2     4  1 -2 -1
X.3     4 -2  1 -1
X.4    16 -2 -2  1
gap> Display( t );
2.A6.2_1

      2  5   5  4  2  2  2  2  3  1   1  4  4  3  2  2   2   2
      3  2   2  .  2  2  2  2  .  .   .  1  1  .  1  1   1   1
      5  1   1  .  .  .  .  .  .  1   1  .  .  .  .  .   .   .

        1a  2a 4a 3a 6a 3b 6b 8a 5a 10a 2b 4b 8b 6c 6d 12a 12b
     2P 1a  1a 2a 3a 3a 3b 3b 4a 5a  5a 1a 2a 4a 3a 3a  6b  6b
     3P 1a  2a 4a 1a 2a 1a 2a 8a 5a 10a 2b 4b 8b 2b 2b  4b  4b
     5P 1a  2a 4a 3a 6a 3b 6b 8a 1a  2a 2b 4b 8b 6d 6c 12b 12a

X.1      1   1  1  1  1  1  1  1  1   1  1  1  1  1  1   1   1
X.2      1   1  1  1  1  1  1  1  1   1 -1 -1 -1 -1 -1  -1  -1
X.3      5   5  1  2  2 -1 -1 -1  .   .  3 -1  1  .  .  -1  -1
X.4      5   5  1  2  2 -1 -1 -1  .   . -3  1 -1  .  .   1   1
X.5      5   5  1 -1 -1  2  2 -1  .   . -1  3  1 -1 -1   .   .
X.6      5   5  1 -1 -1  2  2 -1  .   .  1 -3 -1  1  1   .   .
X.7     16  16  . -2 -2 -2 -2  .  1   1  .  .  .  .  .   .   .
X.8      9   9  1  .  .  .  .  1 -1  -1  3  3 -1  .  .   .   .
X.9      9   9  1  .  .  .  .  1 -1  -1 -3 -3  1  .  .   .   .
X.10    10  10 -2  1  1  1  1  .  .   .  2 -2  . -1 -1   1   1
X.11    10  10 -2  1  1  1  1  .  .   . -2  2  .  1  1  -1  -1
X.12     4  -4  . -2  2  1 -1  . -1   1  .  .  .  .  .   B  -B
X.13     4  -4  . -2  2  1 -1  . -1   1  .  .  .  .  .  -B   B
X.14     4  -4  .  1 -1 -2  2  . -1   1  .  .  .  A -A   .   .
X.15     4  -4  .  1 -1 -2  2  . -1   1  .  .  . -A  A   .   .
X.16    16 -16  . -2  2 -2  2  .  1  -1  .  .  .  .  .   .   .
X.17    20 -20  .  2 -2  2 -2  .  .   .  .  .  .  .  .   .   .

A = E(3)-E(3)^2
  = Sqrt(-3) = i3
B = -E(12)^7+E(12)^11
  = Sqrt(3) = r3

##  doc2/maintain.xml (2093-2145)
gap> PrimesOfGeneralityProblems:= function( ordtbl )
>     local consider, p, modtbl, taut, triv, admiss, fusion, maut,
>           allfusions, orbits, orbit, reps;
>     # Find the primes for which symmetries are broken.
>     consider:= [];
>     for p in Filtered( PrimeDivisors( Size( ordtbl ) ), IsPrimeInt ) do
>       modtbl:= ordtbl mod p;
>       if modtbl <> fail and BrokenSymmetries( ordtbl, modtbl ) then
>         Add( consider, p );
>       fi;
>     od;
>     # Compute the choices and detect generality problems.
>     taut:= AutomorphismsOfTable( ordtbl );
>     triv:= TrivialSubgroup( taut );
>     admiss:= taut;
>     for p in consider do
>       modtbl:= ordtbl mod p;
>       fusion:= GetFusionMap( modtbl, ordtbl );
>       maut:= AutomorphismsOfTable( modtbl );
>       # - We need not apply the action of 'maut' here,
>       #   since 'maut' will later be used to get representatives.
>       # - We need not apply all elements in 'taut' but only
>       #   representatives of left cosets of 'admiss' in 'taut',
>       #   since 'admiss' will later be used to get representatives.
>       # allfusions:= OrbitFusions( maut, fusion, taut );
>       allfusions:= Set( RightTransversal( taut, admiss ),
>                         x -> OnTuples( fusion, x^-1 ) );
>       # For computing representatives, 'RepresentativesFusions' is not
>       # suitable because 'allfusions' is in generally not closed
>       # under the actions.
>       # reps:= RepresentativesFusions( maut, allfusions, admiss );
>       orbits:= [];
>       while not IsEmpty( allfusions ) do
>         orbit:= OrbitFusions( maut, allfusions[1], admiss );
>         Add( orbits, orbit );
>         SubtractSet( allfusions, orbit );
>       od;
>       reps:= List( orbits, x -> x[1] );
>       if Length( reps ) = 1 then
>         # Reduce the symmetries that are still available.
>         admiss:= Stabilizer( admiss,
>                              Set( OrbitFusions( maut, fusion, triv ) ),
>                              OnSetsTuples );
>       else
>         # We have found a generality problem.
>         return consider;
>       fi;
>     od;
>     # There is no generality problem for this table.
>     return [];
> end;;

##  doc2/maintain.xml (2162-2206)
gap> t:= CharacterTable( "2.A5.2" );;
gap> m:= t mod 5;;
gap> Display( m );
2.A5.2mod5

      2  4  4  3  2  2  2  3  3  2  2
      3  1  1  .  1  1  1  .  .  1  1
      5  1  1  .  .  .  .  .  .  .  .

        1a 2a 4a 3a 6a 2b 8a 8b 6b 6c
     2P 1a 1a 2a 3a 3a 1a 4a 4a 3a 3a
     3P 1a 2a 4a 1a 2a 2b 8a 8b 2b 2b
     5P 1a 2a 4a 3a 6a 2b 8b 8a 6c 6b

X.1      1  1  1  1  1  1  1  1  1  1
X.2      1  1  1  1  1 -1 -1 -1 -1 -1
X.3      3  3 -1  .  .  1 -1 -1 -2 -2
X.4      3  3 -1  .  . -1  1  1  2  2
X.5      5  5  1 -1 -1  1 -1 -1  1  1
X.6      5  5  1 -1 -1 -1  1  1 -1 -1
X.7      2 -2  . -1  1  .  A -A  B -B
X.8      2 -2  . -1  1  . -A  A -B  B
X.9      4 -4  .  1 -1  .  .  .  B -B
X.10     4 -4  .  1 -1  .  .  . -B  B

A = E(8)+E(8)^3
  = Sqrt(-2) = i2
B = E(3)-E(3)^2
  = Sqrt(-3) = i3
gap> AutomorphismsOfTable( t );
Group([ (11,12), (9,10) ])
gap> AutomorphismsOfTable( m );
Group([ (7,8)(9,10) ])
gap> GetFusionMap( m, t );
[ 1, 2, 3, 4, 5, 8, 9, 10, 11, 12 ]
gap> BrokenSymmetries( t, m );
true
gap> BrokenSymmetries( t, t mod 2 );
false
gap> BrokenSymmetries( t, t mod 3 );
false
gap> PrimesOfGeneralityProblems( t );
[  ]

##  doc2/maintain.xml (2228-2288)
gap> t:= CharacterTable( "J1" );;
gap> m:= t mod 11;;
gap> Display( m, rec( chars:= Filtered( Irr( m ), x -> x[1] = 7 ) ) );
J1mod11

     2  3  3  1  1  1  1  .   1   1   .   .   .   .   .
     3  1  1  1  1  1  1  .   .   .   1   1   .   .   .
     5  1  1  1  1  1  .  .   1   1   1   1   .   .   .
     7  1  .  .  .  .  .  1   .   .   .   .   .   .   .
    11  1  .  .  .  .  .  .   .   .   .   .   .   .   .
    19  1  .  .  .  .  .  .   .   .   .   .   1   1   1

       1a 2a 3a 5a 5b 6a 7a 10a 10b 15a 15b 19a 19b 19c
    2P 1a 1a 3a 5b 5a 3a 7a  5b  5a 15b 15a 19b 19c 19a
    3P 1a 2a 1a 5b 5a 2a 7a 10b 10a  5b  5a 19b 19c 19a
    5P 1a 2a 3a 1a 1a 6a 7a  2a  2a  3a  3a 19b 19c 19a
    7P 1a 2a 3a 5b 5a 6a 1a 10b 10a 15b 15a 19a 19b 19c
   11P 1a 2a 3a 5a 5b 6a 7a 10a 10b 15a 15b 19a 19b 19c
   19P 1a 2a 3a 5a 5b 6a 7a 10a 10b 15a 15b  1a  1a  1a

Y.1     7 -1  1  A *A -1  .   B  *B   C  *C   D   E   F

A = E(5)+E(5)^4
  = (-1+Sqrt(5))/2 = b5
B = -E(5)-2*E(5)^2-2*E(5)^3-E(5)^4
  = (3+Sqrt(5))/2 = 2+b5
C = -2*E(5)-2*E(5)^4
  = 1-Sqrt(5) = 1-r5
D = -E(19)-E(19)^2-E(19)^3-E(19)^5-E(19)^7-E(19)^8-E(19)^11-E(19)^12-E\
(19)^14-E(19)^16-E(19)^17-E(19)^18
E = -E(19)^2-E(19)^3-E(19)^4-E(19)^5-E(19)^6-E(19)^9-E(19)^10-E(19)^13\
-E(19)^14-E(19)^15-E(19)^16-E(19)^17
F = -E(19)-E(19)^4-E(19)^6-E(19)^7-E(19)^8-E(19)^9-E(19)^10-E(19)^11-E\
(19)^12-E(19)^13-E(19)^15-E(19)^18
gap> m:= t mod 19;;
gap> Display( m, rec( chars:= Filtered( Irr( m ), x -> x[1] = 22 ) ) );
J1mod19

     2  3  3  1  1  1  1  .   1   1   .   .   .
     3  1  1  1  1  1  1  .   .   .   .   1   1
     5  1  1  1  1  1  .  .   1   1   .   1   1
     7  1  .  .  .  .  .  1   .   .   .   .   .
    11  1  .  .  .  .  .  .   .   .   1   .   .
    19  1  .  .  .  .  .  .   .   .   .   .   .

       1a 2a 3a 5a 5b 6a 7a 10a 10b 11a 15a 15b
    2P 1a 1a 3a 5b 5a 3a 7a  5b  5a 11a 15b 15a
    3P 1a 2a 1a 5b 5a 2a 7a 10b 10a 11a  5b  5a
    5P 1a 2a 3a 1a 1a 6a 7a  2a  2a 11a  3a  3a
    7P 1a 2a 3a 5b 5a 6a 1a 10b 10a 11a 15b 15a
   11P 1a 2a 3a 5a 5b 6a 7a 10a 10b  1a 15a 15b
   19P 1a 2a 3a 5a 5b 6a 7a 10a 10b 11a 15a 15b

Y.1    22 -2  1  A *A  1  1  -A -*A   .   B  *B

A = E(5)+E(5)^4
  = (-1+Sqrt(5))/2 = b5
B = -2*E(5)-2*E(5)^4
  = 1-Sqrt(5) = 1-r5

##  doc2/maintain.xml (2301-2304)
gap> PrimesOfGeneralityProblems( t );
[ 7, 11, 19 ]

##  doc2/maintain.xml (2313-2462)
gap> list:= [];;
gap> isGeneralityProblem:= function( ordtbl )
>     local res;
>     res:= PrimesOfGeneralityProblems( ordtbl );
>     if res = [] then
>       return false;
>     fi;
>     Add( list, [ Identifier( ordtbl ), res ] );
>     return true;
> end;;
gap> AllCharacterTableNames( IsDuplicateTable, false,
>        isGeneralityProblem, true );;
gap> PrintArray( SortedList( list ) );
[ [          (2.A4x2.G2(4)).2,           [ 2, 5, 7, 13 ] ],
  [         (2^2x3).L3(4).2_1,                  [ 5, 7 ] ],
  [              (2x12).L3(4),               [ 2, 3, 7 ] ],
  [             (4^2x3).L3(4),               [ 2, 3, 7 ] ],
  [                (7:3xHe):2,              [ 5, 7, 17 ] ],
  [                (A5xA12):2,                  [ 2, 3 ] ],
  [                (D10xHN).2,    [ 2, 3, 5, 7, 11, 19 ] ],
  [             (S3x2.Fi22).2,             [ 3, 11, 13 ] ],
  [                    12.M22,           [ 2, 5, 7, 11 ] ],
  [                  12.M22.2,           [ 2, 5, 7, 11 ] ],
  [            12_1.L3(4).2_1,                  [ 5, 7 ] ],
  [                12_2.L3(4),               [ 2, 3, 7 ] ],
  [            12_2.L3(4).2_1,               [ 3, 5, 7 ] ],
  [            12_2.L3(4).2_2,               [ 2, 3, 7 ] ],
  [            12_2.L3(4).2_3,               [ 2, 3, 7 ] ],
  [            2.(A4xG2(4)).2,           [ 2, 5, 7, 13 ] ],
  [                  2.2E6(2),                [ 13, 19 ] ],
  [                2.2E6(2).2,                [ 13, 19 ] ],
  [                     2.A10,                  [ 5, 7 ] ],
  [                     2.A11,               [ 3, 5, 7 ] ],
  [                   2.A11.2,              [ 5, 7, 11 ] ],
  [                     2.A12,            [ 2, 3, 5, 7 ] ],
  [                   2.A12.2,              [ 5, 7, 11 ] ],
  [                     2.A13,        [ 2, 3, 5, 7, 11 ] ],
  [                   2.A13.2,              [ 5, 7, 13 ] ],
  [                 2.Alt(14),            [ 2, 3, 5, 7 ] ],
  [                 2.Alt(15),               [ 2, 5, 7 ] ],
  [                 2.Alt(16),            [ 2, 3, 5, 7 ] ],
  [                 2.Alt(17),            [ 2, 3, 5, 7 ] ],
  [                 2.Alt(18),            [ 2, 3, 5, 7 ] ],
  [                       2.B,                [ 17, 23 ] ],
  [                   2.F4(2),          [ 2, 7, 13, 17 ] ],
  [                  2.Fi22.2,                [ 11, 13 ] ],
  [                   2.G2(4),                  [ 2, 7 ] ],
  [                 2.G2(4).2,              [ 5, 7, 13 ] ],
  [                      2.HS,           [ 3, 5, 7, 11 ] ],
  [                    2.HS.2,                 [ 3, 11 ] ],
  [               2.L3(4).2_1,                  [ 5, 7 ] ],
  [                      2.Ru,          [ 5, 7, 13, 29 ] ],
  [                     2.Suz,              [ 2, 5, 11 ] ],
  [                   2.Suz.2,              [ 3, 7, 13 ] ],
  [                 2.Sym(15),               [ 3, 5, 7 ] ],
  [                 2.Sym(16),               [ 3, 5, 7 ] ],
  [                 2.Sym(17),               [ 3, 5, 7 ] ],
  [                 2.Sym(18),                  [ 5, 7 ] ],
  [                   2.Sz(8),              [ 2, 5, 13 ] ],
  [                2^2.2E6(2),                [ 13, 19 ] ],
  [              2^2.2E6(2).2,                [ 13, 19 ] ],
  [                2^2.Fi22.2,             [ 3, 11, 13 ] ],
  [             2^2.L3(4).2^2,                  [ 5, 7 ] ],
  [             2^2.L3(4).2_1,                  [ 5, 7 ] ],
  [                 2^2.Sz(8),              [ 2, 5, 13 ] ],
  [                 2x2.F4(2),          [ 2, 7, 13, 17 ] ],
  [                  2x3.Fi22,               [ 2, 3, 5 ] ],
  [                  2x6.Fi22,               [ 2, 3, 5 ] ],
  [                   2x6.M22,              [ 2, 5, 11 ] ],
  [                  2xFi22.2,                [ 11, 13 ] ],
  [                    2xFi23,             [ 3, 17, 23 ] ],
  [                    3.Fi22,               [ 2, 3, 5 ] ],
  [                  3.Fi22.2,          [ 2, 5, 11, 13 ] ],
  [                      3.J3,             [ 2, 17, 19 ] ],
  [                    3.J3.2,          [ 2, 5, 17, 19 ] ],
  [               3.L3(4).2_3,               [ 2, 3, 7 ] ],
  [             3.L3(4).3.2_3,               [ 2, 3, 7 ] ],
  [                 3.L3(7).2,              [ 3, 7, 19 ] ],
  [                3.L3(7).S3,              [ 3, 7, 19 ] ],
  [                     3.McL,              [ 2, 5, 11 ] ],
  [                   3.McL.2,           [ 2, 3, 5, 11 ] ],
  [                      3.ON,      [ 3, 7, 11, 19, 31 ] ],
  [                    3.ON.2,   [ 3, 5, 7, 11, 19, 31 ] ],
  [                   3.Suz.2,              [ 2, 3, 13 ] ],
  [                 3x2.F4(2),          [ 2, 7, 13, 17 ] ],
  [                3x2.Fi22.2,                [ 11, 13 ] ],
  [                 3x2.G2(4),                  [ 2, 7 ] ],
  [                    3xFi23,             [ 3, 17, 23 ] ],
  [                      3xJ1,             [ 7, 11, 19 ] ],
  [                 3xL3(7).2,              [ 3, 7, 19 ] ],
  [                    4.HS.2,              [ 5, 7, 11 ] ],
  [                     4.M22,                  [ 5, 7 ] ],
  [             4_1.L3(4).2_1,                  [ 5, 7 ] ],
  [             4_2.L3(4).2_1,               [ 3, 5, 7 ] ],
  [                    6.Fi22,               [ 2, 3, 5 ] ],
  [                  6.Fi22.2,          [ 2, 5, 11, 13 ] ],
  [               6.L3(4).2_1,                  [ 5, 7 ] ],
  [                     6.M22,              [ 2, 5, 11 ] ],
  [                   6.O7(3),              [ 3, 5, 13 ] ],
  [                 6.O7(3).2,              [ 3, 5, 13 ] ],
  [                     6.Suz,              [ 2, 5, 11 ] ],
  [                   6.Suz.2,        [ 2, 3, 5, 7, 13 ] ],
  [                 6x2.F4(2),          [ 2, 7, 13, 17 ] ],
  [                       A12,                  [ 2, 3 ] ],
  [                       A14,               [ 2, 5, 7 ] ],
  [                       A17,                  [ 2, 7 ] ],
  [                       A18,            [ 2, 3, 5, 7 ] ],
  [                         B,        [ 13, 17, 23, 31 ] ],
  [                       F3+,            [ 17, 23, 29 ] ],
  [                     F3+.2,            [ 17, 23, 29 ] ],
  [                    Fi22.2,                [ 11, 13 ] ],
  [                      Fi23,             [ 3, 17, 23 ] ],
  [                        HN,          [ 2, 3, 11, 19 ] ],
  [                      HN.2,          [ 5, 7, 11, 19 ] ],
  [                        He,                 [ 5, 17 ] ],
  [                      He.2,              [ 5, 7, 17 ] ],
  [       Isoclinic(12.M22.2),           [ 2, 5, 7, 11 ] ],
  [        Isoclinic(2.A11.2),              [ 5, 7, 11 ] ],
  [        Isoclinic(2.A12.2),              [ 5, 7, 11 ] ],
  [        Isoclinic(2.A13.2),              [ 5, 7, 13 ] ],
  [       Isoclinic(2.Fi22.2),                [ 11, 13 ] ],
  [      Isoclinic(2.G2(4).2),              [ 5, 7, 13 ] ],
  [         Isoclinic(2.HS.2),                 [ 3, 11 ] ],
  [         Isoclinic(2.HSx2),           [ 3, 5, 7, 11 ] ],
  [    Isoclinic(2.L3(4).2_1),                  [ 5, 7 ] ],
  [        Isoclinic(2.Suz.2),              [ 3, 7, 13 ] ],
  [  Isoclinic(4_1.L3(4).2_1),                  [ 5, 7 ] ],
  [  Isoclinic(4_2.L3(4).2_1),               [ 3, 5, 7 ] ],
  [       Isoclinic(6.Fi22.2),          [ 2, 5, 11, 13 ] ],
  [    Isoclinic(6.L3(4).2_1),                  [ 5, 7 ] ],
  [        Isoclinic(6.Suz.2),        [ 2, 3, 5, 7, 13 ] ],
  [                        J1,             [ 7, 11, 19 ] ],
  [                      J1x2,             [ 7, 11, 19 ] ],
  [                        J3,             [ 2, 17, 19 ] ],
  [                      J3.2,          [ 2, 5, 17, 19 ] ],
  [                 L3(4).2_3,                  [ 3, 7 ] ],
  [               L3(4).3.2_3,               [ 2, 3, 7 ] ],
  [                   L3(7).2,              [ 3, 7, 19 ] ],
  [                  L3(7).S3,              [ 3, 7, 19 ] ],
  [                 L3(9).2_1,              [ 3, 7, 13 ] ],
  [                   L5(2).2,              [ 2, 7, 31 ] ],
  [                        Ly,             [ 7, 37, 67 ] ],
  [                       M23,              [ 2, 3, 23 ] ],
  [                        ON,      [ 3, 7, 11, 19, 31 ] ],
  [                      ON.2,   [ 3, 5, 7, 11, 19, 31 ] ],
  [                        Ru,          [ 5, 7, 13, 29 ] ],
  [                 S3xFi22.2,                [ 11, 13 ] ],
  [                     Suz.2,                 [ 3, 13 ] ] ]

##  doc2/maintain.xml (2510-2527)
gap> t:= CharacterTable( "J3" );;
gap> m:= t mod 19;;
gap> cand:= Filtered( Irr( m ), x -> x[1] = 110 );;
gap> Length( cand );
1
gap> slp:= AtlasProgram( "J3", "classes" );;
gap> 17a:= Position( slp.outputs, "17A" );
18
gap> info:= OneAtlasGeneratingSetInfo( "J3", Characteristic, 19,
>               Dimension, 110 );;
gap> gens:= AtlasGenerators( info );;
gap> reps:= ResultOfStraightLineProgram( slp.program,
>               gens.generators );;
gap> Quadratic( BrauerCharacterValue( reps[ 17a ] ) );
rec( ATLAS := "-1-b17", a := -1, b := -1, d := 2, 
  display := "(-1-Sqrt(17))/2", root := 17 )

##  doc2/maintain.xml (2638-2662)
gap> table:= [];;
gap> for pair in [ [  2, [ 78, 80, 244, 966 ] ],
>                  [ 19, [ 110, 214, 706 ] ] ] do
>      p:= pair[1];
>      for d in pair[2] do
>        info:= OneAtlasGeneratingSetInfo( "J3", Characteristic, p,
>                   Dimension, d );
>        gens:= AtlasGenerators( info );
>        reps:= ResultOfStraightLineProgram( slp.program,
>                   gens.generators );
>        val:= BrauerCharacterValue( reps[ 17a ] );
>        Add( table, [ p, d, Quadratic( val ).ATLAS,
>                            Quadratic( StarCyc( val ) ).ATLAS ] );
>      od;
>    od;
gap> PrintArray( table );
[ [       2,      78,   1-b17,   2+b17 ],
  [       2,      80,   3-b17,   4+b17 ],
  [       2,     244,  -2+b17,  -3-b17 ],
  [       2,     966,  -3+r17,  -3-r17 ],
  [      19,     110,  -1-b17,     b17 ],
  [      19,     214,   2+b17,   1-b17 ],
  [      19,     706,   1+b17,    -b17 ] ]

##  doc2/maintain.xml (2881-2888)
gap> t:= CharacterTable( PSL( 2, 11 ) );;
gap> modt:= t mod 5;;
gap> modt <> fail;
true
gap> InfoText( modt );
"computed using that all Brauer characters lift to char. zero"

##  doc2/maintain.xml (2897-2908)
gap> lib:= CharacterTable( "M11" );;
gap> fromgroup:= CharacterTable( MathieuGroup( 11 ) );;
gap> DecompositionMatrix( lib mod 5 );
[ [ 1, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 1, 0, 0 ], [ 1, 0, 0, 0, 1, 1, 1, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 1 ] ]
gap> fromgroup mod 5 <> fail;
true

##  doc2/maintain.xml (2919-2927)
gap> DecompositionMatrix( lib mod 2 );
[ [ 1, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0 ], [ 0, 1, 0, 0, 0 ], 
  [ 0, 1, 0, 0, 0 ], [ 1, 1, 0, 0, 0 ], [ 0, 0, 1, 0, 0 ], 
  [ 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 1 ], [ 1, 0, 0, 0, 1 ], 
  [ 1, 1, 0, 0, 1 ] ]
gap> fromgroup mod 2;
fail

##
gap> if IsBound( BrowseData ) then
>      data:= BrowseData.defaults.dynamic.replayDefaults;
>      data.replayInterval:= oldinterval;
>    fi;

##
gap> STOP_TEST( "maintain.tst" );
gap> SizeScreen( save );;

#############################################################################
##
#E
