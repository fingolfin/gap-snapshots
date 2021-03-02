# This file was created automatically, do not edit!
#############################################################################
##
#W  docxpl2.tst             GAP 4 package CTblLib               Thomas Breuer
##
#Y  Copyright (C)  2020,   Lehrstuhl D für Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the GAP code of those examples in the package
##  documentation files that do not involve the visual mode used by the
##  Browse package and that run not too long.
##  
##  In order to run the tests, one starts GAP from the 'tst' subdirectory
##  of the 'pkg/ctbllib' directory, and calls 'Test( "docxpl2.tst" );'.
##  
gap> LoadPackage( "CTblLib", false );
true
gap> save:= SizeScreen();;
gap> SizeScreen( [ 72 ] );;
gap> START_TEST( "docxpl2.tst" );

##  ./introduc.xml (27-30)
gap> InstalledPackageVersion( "ctbllib" ) <> fail;
true

##  ./tutorial.xml (27-30)
gap> origpref:= UserPreference( "AtlasRep", "DisplayFunction" );;
gap> SetUserPreference( "AtlasRep", "DisplayFunction", "Print" );

##  ./tutorial.xml (155-162)
gap> CharacterTable( "J1" );
CharacterTable( "J1" )
gap> CharacterTable( "L2(11)" );
CharacterTable( "L2(11)" )
gap> CharacterTable( "S5" );
CharacterTable( "A5.2" )

##  ./tutorial.xml (179-184)
gap> AllCharacterTableNames( Size, 168 );
[ "(2^2xD14):3", "2^3.7.3", "L3(2)", "L3(4)M7", "L3(4)M8" ]
gap> OneCharacterTableName( NrConjugacyClasses, n -> n <= 4 );
"S3"

##  ./tutorial.xml (216-221)
gap> tom:= TableOfMarks( "M11" );
TableOfMarks( "M11" )
gap> t:= CharacterTable( tom );
CharacterTable( "M11" )

##  ./tutorial.xml (241-248)
gap> t:= CharacterTable( "M11" );
CharacterTable( "M11" )
gap> HasMaxes( t );
true
gap> Maxes( t );
[ "A6.2_3", "L2(11)", "3^2:Q8.2", "A5.2", "2.S4" ]

##  ./tutorial.xml (255-258)
gap> CharacterTable( "M11M2" );
CharacterTable( "L2(11)" )

##  ./tutorial.xml (266-271)
gap> NamesOfFusionSources( t );
[ "A5.2", "A6.2_3", "P48/G1/L1/V1/ext2", "P48/G1/L1/V2/ext2", 
  "L2(11)", "2.S4", "3^5:M11", "3^6.M11", "s4", "3^2:Q8.2", "M11N2", 
  "5:4", "11:5" ]

##  ./tutorial.xml (278-281)
gap> List( ComputedClassFusions( t ), r -> r.name );
[ "A11", "M12", "M23", "HS", "McL", "ON", "3^5:M11", "B" ]

##  ./tutorial.xml (304-313)
gap> t1:= CharacterTable( "A5" );;
gap> t2:= CharacterTable( "PSL", 2, 4 );;
gap> t3:= CharacterTable( "PSL", 2, 5 );;
gap> TransformingPermutationsCharacterTables( t1, t2 );
rec( columns := (), group := Group([ (4,5) ]), rows := () )
gap> TransformingPermutationsCharacterTables( t1, t3 );
rec( columns := (2,4)(3,5), group := Group([ (2,3) ]), 
  rows := (2,5,3,4) )

##  ./tutorial.xml (325-335)
gap> t:= CharacterTable( "M12" );
CharacterTable( "M12" )
gap> mx:= Maxes( t );
[ "M11", "M12M2", "A6.2^2", "M12M4", "L2(11)", "3^2.2.S4", "M12M7", 
  "2xS5", "M8.S4", "4^2:D12", "A4xS3" ]
gap> s1:= CharacterTable( mx[1] );
CharacterTable( "M11" )
gap> s2:= CharacterTable( mx[2] );
CharacterTable( "M12M2" )

##  ./tutorial.xml (349-386)
gap> GetFusionMap( s1, t );
[ 1, 3, 4, 7, 8, 10, 12, 12, 15, 14 ]
gap> GetFusionMap( s2, t );
[ 1, 3, 4, 6, 8, 10, 11, 11, 14, 15 ]
gap> Display( t );
M12

      2   6  4  6  1  2  5  5  1  2  1  3  3   1   .   .
      3   3  1  1  3  2  .  .  .  1  1  .  .   .   .   .
      5   1  1  .  .  .  .  .  1  .  .  .  .   1   .   .
     11   1  .  .  .  .  .  .  .  .  .  .  .   .   1   1

         1a 2a 2b 3a 3b 4a 4b 5a 6a 6b 8a 8b 10a 11a 11b
     2P  1a 1a 1a 3a 3b 2b 2b 5a 3b 3a 4a 4b  5a 11b 11a
     3P  1a 2a 2b 1a 1a 4a 4b 5a 2a 2b 8a 8b 10a 11a 11b
     5P  1a 2a 2b 3a 3b 4a 4b 1a 6a 6b 8a 8b  2a 11a 11b
    11P  1a 2a 2b 3a 3b 4a 4b 5a 6a 6b 8a 8b 10a  1a  1a

X.1       1  1  1  1  1  1  1  1  1  1  1  1   1   1   1
X.2      11 -1  3  2 -1 -1  3  1 -1  . -1  1  -1   .   .
X.3      11 -1  3  2 -1  3 -1  1 -1  .  1 -1  -1   .   .
X.4      16  4  . -2  1  .  .  1  1  .  .  .  -1   A  /A
X.5      16  4  . -2  1  .  .  1  1  .  .  .  -1  /A   A
X.6      45  5 -3  .  3  1  1  . -1  . -1 -1   .   1   1
X.7      54  6  6  .  .  2  2 -1  .  .  .  .   1  -1  -1
X.8      55 -5  7  1  1 -1 -1  .  1  1 -1 -1   .   .   .
X.9      55 -5 -1  1  1  3 -1  .  1 -1 -1  1   .   .   .
X.10     55 -5 -1  1  1 -1  3  .  1 -1  1 -1   .   .   .
X.11     66  6  2  3  . -2 -2  1  . -1  .  .   1   .   .
X.12     99 -1  3  .  3 -1 -1 -1 -1  .  1  1  -1   .   .
X.13    120  . -8  3  .  .  .  .  .  1  .  .   .  -1  -1
X.14    144  4  .  . -3  .  . -1  1  .  .  .  -1   1   1
X.15    176 -4  . -4 -1  .  .  1 -1  .  .  .   1   .   .

A = E(11)+E(11)^3+E(11)^4+E(11)^5+E(11)^9
  = (-1+Sqrt(-11))/2 = b11

##  ./tutorial.xml (392-399)
gap> IsDuplicateTable( s2 );
true
gap> IdentifierOfMainTable( s2 );
"M11"
gap> IdentifiersOfDuplicateTables( s1 );
[ "HSM9", "M12M2", "ONM11" ]

##  ./tutorial.xml (446-459)
gap> isambivalent:= tbl -> PowerMap( tbl, -1 )
>                            = [ 1 .. NrConjugacyClasses( tbl ) ];;
gap> AllCharacterTableNames( IsSimple, true, IsDuplicateTable, false,
>        IsAbelian, false, isambivalent, true );
[ "3D4(2)", "3D4(3)", "3D4(4)", "A10", "A14", "A5", "A6", "J1", "J2", 
  "L2(101)", "L2(109)", "L2(113)", "L2(121)", "L2(125)", "L2(13)", 
  "L2(16)", "L2(17)", "L2(25)", "L2(29)", "L2(32)", "L2(37)", 
  "L2(41)", "L2(49)", "L2(53)", "L2(61)", "L2(64)", "L2(73)", 
  "L2(8)", "L2(81)", "L2(89)", "L2(97)", "O12+(2)", "O12-(2)", 
  "O12-(3)", "O7(5)", "O8+(2)", "O8+(3)", "O8+(7)", "O8-(2)", 
  "O8-(3)", "O9(3)", "S10(2)", "S12(2)", "S4(4)", "S4(5)", "S4(8)", 
  "S4(9)", "S6(2)", "S6(4)", "S6(5)", "S8(2)" ]

##  ./tutorial.xml (485-519)
gap> isppure:= function( p )
>      return tbl -> Size( tbl ) mod p = 0 and
>        ForAll( OrdersClassRepresentatives( tbl ),
>                n -> n mod p <> 0 or IsPrimePowerInt( n ) );
>    end;;
gap> for i in [ 2, 3, 5, 7, 11, 13 ] do
>      Print( i, "\n",
>        AllCharacterTableNames( IsSimple, true, IsAbelian, false,
>            IsDuplicateTable, false, isppure( i ), true ),
>        "\n" );
>    od;
2
[ "A5", "A6", "L2(16)", "L2(17)", "L2(31)", "L2(32)", "L2(64)", 
  "L2(8)", "L3(2)", "L3(4)", "Sz(32)", "Sz(8)" ]
3
[ "A5", "A6", "L2(17)", "L2(19)", "L2(27)", "L2(53)", "L2(8)", 
  "L2(81)", "L3(2)", "L3(4)" ]
5
[ "A5", "A6", "A7", "L2(11)", "L2(125)", "L2(25)", "L2(49)", "L3(4)", 
  "M11", "M22", "S4(7)", "Sz(32)", "Sz(8)", "U4(2)", "U4(3)" ]
7
[ "A7", "A8", "A9", "G2(3)", "HS", "J1", "J2", "L2(13)", "L2(49)", 
  "L2(8)", "L2(97)", "L3(2)", "L3(4)", "M22", "O8+(2)", "S6(2)", 
  "Sz(8)", "U3(3)", "U3(5)", "U4(3)", "U6(2)" ]
11
[ "A11", "A12", "A13", "Co2", "HS", "J1", "L2(11)", "L2(121)", 
  "L2(23)", "L5(3)", "M11", "M12", "M22", "M23", "M24", "McL", 
  "O10+(3)", "O12+(3)", "ON", "Suz", "U5(2)", "U6(2)" ]
13
[ "2E6(2)", "2F4(2)'", "3D4(2)", "A13", "A14", "A15", "F4(2)", 
  "Fi22", "G2(3)", "G2(4)", "L2(13)", "L2(25)", "L2(27)", "L3(3)", 
  "L4(3)", "O7(3)", "O8+(3)", "S4(5)", "S6(3)", "Suz", "Sz(8)", 
  "U3(4)" ]

##  ./tutorial.xml (572-592)
gap> fun:= function( tbl )
>      local result, p, bl;
> 
>      result:= false;
>      for p in PrimeDivisors( Size( tbl ) ) do
>        bl:= PrimeBlocks( tbl, p );
>        if Length( bl.defect ) = 1 then
>          result:= true;
>          Print( "only one block: ", Identifier( tbl ), ", p = ", p, "\n" );
>        fi;
>      od;
> 
>      return result;
> end;;
gap> AllCharacterTableNames( IsSimple, true, IsAbelian, false,
>                            IsDuplicateTable, false, fun, true );
only one block: M22, p = 2
only one block: M24, p = 2
[ "M22", "M24" ]

##  ./tutorial.xml (617-620)
gap> CharacterTable( "ONN3" );
CharacterTable( "3^4:2^(1+4)D10" )

##  ./tutorial.xml (628-641)
gap> 3t:= CharacterTable( "3.ON" );;
gap> orders:= OrdersClassRepresentatives( 3t );;
gap> ord3:= PositionsProperty( orders, x -> x = 3 );
[ 2, 3, 7 ]
gap> sizes:= SizesCentralizers( 3t ){ ord3 };
[ 1382446517760, 1382446517760, 3240 ]
gap> Size( 3t );
1382446517760
gap> Collected( Factors( sizes[3] ) );
[ [ 2, 3 ], [ 3, 4 ], [ 5, 1 ] ]
gap> 9 in orders;
false

##  ./tutorial.xml (663-682)
gap> tbl:= CharacterTable( "2.A6" );;
gap> HasMaxes( tbl );
true
gap> maxes:= Maxes( tbl );
[ "2.A5", "2.A6M2", "3^2:8", "2.Symm(4)", "2.A6M5" ]
gap> mx:= List( maxes, CharacterTable );;
gap> prim1:= List( mx, s -> TrivialCharacter( s )^tbl );;
gap> Display( tbl,
>      rec( chars:= prim1, centralizers:= false, powermap:= false ) );
2.A6

       1a 2a 4a 3a 6a 3b 6b 8a 8b 5a 10a 5b 10b

Y.1     6  6  2  3  3  .  .  .  .  1   1  1   1
Y.2     6  6  2  .  .  3  3  .  .  1   1  1   1
Y.3    10 10  2  1  1  1  1  2  2  .   .  .   .
Y.4    15 15  3  3  3  .  .  1  1  .   .  .   .
Y.5    15 15  3  .  .  3  3  1  1  .   .  .   .

##  ./tutorial.xml (687-690)
gap> PermCharInfo( tbl, prim1 ).ATLAS;
[ "1a+5a", "1a+5b", "1a+9a", "1a+5a+9a", "1a+5b+9a" ]

##  ./tutorial.xml (695-711)
gap> tom:= TableOfMarks( tbl );
TableOfMarks( "2.A6" )
gap> allperm:= PermCharsTom( tbl, tom );;
gap> prim2:= allperm{ MaximalSubgroupsTom( tom )[1] };;
gap> Display( tbl,
>      rec( chars:= prim2, centralizers:= false, powermap:= false ) );
2.A6

       1a 2a 4a 3a 6a 3b 6b 8a 8b 5a 10a 5b 10b

Y.1     6  6  2  3  3  .  .  .  .  1   1  1   1
Y.2     6  6  2  .  .  3  3  .  .  1   1  1   1
Y.3    10 10  2  1  1  1  1  2  2  .   .  .   .
Y.4    15 15  3  .  .  3  3  1  1  .   .  .   .
Y.5    15 15  3  3  3  .  .  1  1  .   .  .   .

##  ./tutorial.xml (724-729)
gap> FusionToTom( tbl );
rec( map := [ 1, 2, 5, 4, 8, 3, 7, 11, 11, 6, 13, 6, 13 ], 
  name := "2.A6", perm := (4,5), 
  text := "fusion map is unique up to table autom." )

##  ./tutorial.xml (759-801)
gap> t:= CharacterTable( "Fi23" );
CharacterTable( "Fi23" )
gap> mx:= Maxes( t );
[ "2.Fi22", "O8+(3).3.2", "2^2.U6(2).2", "S8(2)", "S3xO7(3)", 
  "2..11.m23", "3^(1+8).2^(1+6).3^(1+2).2S4", "Fi23M8", "A12.2", 
  "(2^2x2^(1+8)).(3xU4(2)).2", "2^(6+8):(A7xS3)", "S4xS6(2)", 
  "S4(4).4", "L2(23)" ]
gap> m:= CharacterTable( mx[7] );
CharacterTable( "3^(1+8).2^(1+6).3^(1+2).2S4" )
gap> n:= ClassPositionsOfPCore( m, 3 );
[ 1 .. 6 ]
gap> f:= m / n;
CharacterTable( "3^(1+8).2^(1+6).3^(1+2).2S4/[ 1, 2, 3, 4, 5, 6 ]" )
gap> reg:= 0 * [ 1 .. NrConjugacyClasses( f ) ];;
gap> reg[1]:= Size( f );;
gap> infl:= reg{ GetFusionMap( m, f ) };
[ 165888, 165888, 165888, 165888, 165888, 165888, 0, 0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
gap> ind:= Induced( m, t, [ infl ] );
[ ClassFunction( CharacterTable( "Fi23" ),
  [ 207766624665600, 0, 0, 0, 603832320, 127567872, 6635520, 663552, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0 ] ) ]
gap> PermCharInfo( t, ind ).contained;
[ [ 1, 0, 0, 0, 864, 1538, 3456, 13824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]
gap> PositionsProperty( OrdersClassRepresentatives( t ), x -> x = 3 );
[ 5, 6, 7, 8 ]

##  ./tutorial.xml (818-824)
gap> nam:= OneCharacterTableName( CommutatorLength, x -> x > 1
>                                 : OrderedBy:= Size );
"3.(A4x3):2"
gap> Size( CharacterTable( nam ) );
216

##  ./tutorial.xml (828-832)
gap> OneSmallGroup( Size, [ 2 .. 100 ],
>                   G -> CommutatorLength( G ) > 1, true );
<pc group of size 96 with 6 generators>

##  ./tutorial.xml (843-849)
gap> OneCharacterTableName( IsSimple, true, IsAbelian, false,
>                           IsDuplicateTable, false,
>                           CommutatorLength, x -> x > 1
>                           : OrderedBy:= Size );
fail

##  ./tutorial.xml (853-861)
gap> nam:= OneCharacterTableName( IsPerfect, true,
>                                 IsDuplicateTable, false,
>                                 CommutatorLength, x -> x > 1
>                                 : OrderedBy:= Size );
"P1/G1/L1/V1/ext2"
gap> Size( CharacterTable( nam ) );
960

##  ./tutorial.xml (866-876)
gap> for n in [ 2 .. 960 ] do
>      for i in [ 1 .. NrPerfectGroups( n ) ] do
>        g:= PerfectGroup( n,  i);
>        if CommutatorLength( g ) <> 1 then
>          Print( [ n, i ], "\n" );
>        fi;
>      od;
>    od;
[ 960, 2 ]

##  ./tutorial.xml (921-931)
gap> t:= CharacterTable( "J4" );;
gap> deg1333:= Filtered( Irr( t ), x -> x[1] = 1333 );;
gap> antisym:= AntiSymmetricParts( t, deg1333, 2 );;
gap> List(  antisym, x -> Position( Irr( t ), x ) );
[ 7, 6 ]
gap> ComplexConjugate( antisym[1] ) = antisym[2];
true
gap> chi:= antisym[1];;  chi[1];
887778

##  ./tutorial.xml (940-947)
gap> s:= CharacterTable( Maxes( t )[1] );;
gap> Size( s ) = 2^11 * Size( CharacterTable( "M24" ) );
true
gap> rest:= RestrictedClassFunction( chi, s );;
gap> smod11:= s mod 11;;
gap> rest:= RestrictedClassFunction( rest, smod11 );;

##  ./tutorial.xml (952-958)
gap> dec:= Decomposition( Irr( smod11 ), [ rest ], "nonnegative" )[1];;
gap> Sum( dec );
9
gap> constpos:= PositionsProperty( dec, x -> x <> 0 );
[ 15, 36, 46, 53, 55, 58, 63, 67, 69 ]

##  ./tutorial.xml (962-972)
gap> smod11fuss:= GetFusionMap( smod11, s );;
gap> sfust:= GetFusionMap( s, t );;
gap> fus:= CompositionMaps( sfust, smod11fuss );;
gap> inv:= Filtered( InverseMap( fus ), IsList );
[ [ 3, 4, 5 ], [ 2, 6, 7 ], [ 8, 9 ], [ 10, 11, 16 ], 
  [ 12, 14, 15, 17, 18, 21 ], [ 13, 19, 20, 22 ], [ 26, 27, 28, 30 ], 
  [ 25, 29, 31 ], [ 34, 39 ], [ 35, 37, 38 ], [ 40, 42 ], [ 41, 43 ], 
  [ 44, 47, 48 ], [ 45, 49, 50 ], [ 46, 51 ], [ 56, 57 ], [ 63, 64 ], 
  [ 69, 70 ] ]

##  ./tutorial.xml (976-984)
gap> const:= Irr( smod11 ){ constpos };;
gap> zero:= 0 * TrivialCharacter( smod11 );;
gap> comb:= List( Combinations( const ), x -> Sum( x, zero ) );;
gap> cand:= Filtered( comb,
>               x -> ForAll( inv, l -> Length( Set( x{ l } ) ) = 1 ) );;
gap> List( cand, x -> x[1] );
[ 0, 887778 ]

##  ./tutorial.xml (1037-1076)
gap> GenProjNotProj:= function( modtbl )
>      local p, tbl, X, PIMs, n, psingular, list, labels, i, j, psi,
>            pos, dec, poss;
> 
>      p:= UnderlyingCharacteristic( modtbl );
>      tbl:= OrdinaryCharacterTable( modtbl );
>      X:= Irr( tbl );
>      PIMs:= TransposedMat( DecompositionMatrix( modtbl ) ) * X;
>      n:= Length( X );
>      psingular:= Difference( [ 1 .. n ], GetFusionMap( modtbl, tbl ) );
>      list:= [];
>      labels:= [];
>      for i in [ 1 .. n ] do
>        for j in [ 1 .. i ] do
>          psi:= List( [ 1 .. n ], x -> X[i][x] * X[j][x] );
>          if IsZero( psi{ psingular } ) then
>            # This is a generalized projective character.
>            pos:= Position( list, psi );
>            if pos = fail then
>              Add( list, psi );
>              Add( labels, [ [ j, i ] ] );
>            else
>              Add( labels[ pos ], [ j, i ] );
>            fi;
>          fi;
>        od;
>      od;
> 
>      if Length( list ) > 0 then
>        # Decompose the generalized projective tensor products
>        # into the projective indecomposables.
>        dec:= Decomposition( PIMs, list, "nonnegative" );
>        poss:= Positions( dec, fail );
>        return Set( Concatenation( labels{ poss } ) );
>      else
>        return [];
>      fi;
>      end;;

##  ./tutorial.xml (1085-1094)
gap> tbl:= CharacterTable( "J2" );;
gap> modtbl:= tbl mod 2;;
gap> pairs:= GenProjNotProj( modtbl );
[ [ 6, 12 ] ]
gap> irr:= Irr( tbl );;
gap> PIMs:= TransposedMat( DecompositionMatrix( modtbl ) ) * irr;;
gap> SolutionMat( PIMs, irr[6] * irr[12] );
[ 0, 0, 0, 1, 1, 1, 0, 0, -2, 3 ]

##  ./../gap4/ctadmin.gd (650-658)
gap> s5:= CharacterTable( "A5.2" );
CharacterTable( "A5.2" )
gap> sym5:= CharacterTable( "Symmetric", 5 );
CharacterTable( "Sym(5)" )
gap> TransformingPermutationsCharacterTables( s5, sym5 );
rec( columns := (2,3,4,7,5), group := Group(()), 
  rows := (1,7,3,4,6,5,2) )

##  ./../gap4/ctadmin.gd (666-671)
gap> CharacterTable( "J5" );
fail
gap> CharacterTable( "A5" ) mod 2;
BrauerTable( "A5", 2 )

##  ./../gap4/ctadmin.gd (702-709)
gap> BrauerTable( "A5", 2 );
BrauerTable( "A5", 2 )
gap> BrauerTable( "J5", 2 );  # no ordinary table with name J5
fail
gap> BrauerTable( "M", 2 );   # Brauer table not known
fail

##  ./../gap4/ctadmin.gd (982-984)
gap> names:= AllCharacterTableNames();;

##  ./../gap4/ctadmin.gd (989-992)
gap> simpnames:= AllCharacterTableNames( IsSimple, true,
>                                        IsAbelian, false );;

##  ./../gap4/ctadmin.gd (997-1001)
gap> AllCharacterTableNames( IsSimple, true, IsAbelian, false,
>                            Size, [ 1 .. 100 ] );
[ "A5", "A6M2", "Alt(5)" ]

##  ./../gap4/ctadmin.gd (1014-1017)
gap> AllCharacterTableNames( Size, IsPrimeInt );
[ "2.Alt(2)", "Alt(3)", "C2", "C3", "Sym(2)" ]

##  ./../gap4/ctadmin.gd (1022-1026)
gap> AllCharacterTableNames( Identifier,
>        x -> PositionSublist( x, "L8" ) <> fail );
[ "L8(2)", "P1L82", "P2L82" ]

##  ./../gap4/ctadmin.gd (1036-1044)
gap> CTblLib.SupportedAttributes;
[ "AbelianInvariants", "Identifier", "IdentifiersOfDuplicateTables", 
  "InfoText", "IsAbelian", "IsAlmostSimple", "IsDuplicateTable", 
  "IsNontrivialDirectProduct", "IsPerfect", "IsSimple", 
  "IsSporadicSimple", "KnowsDeligneLusztigNames", 
  "KnowsSomeGroupInfo", "Maxes", "NamesOfFusionSources", 
  "NrConjugacyClasses", "Size" ]

##  ./../gap4/ctadmin.gd (1066-1079)
gap> AllCharacterTableNames( IsSporadicSimple, true,
>        Size, [ 1 .. 10^6 ],
>        IsDuplicateTable, false );
[ "J1", "J2", "M11", "M12", "M22" ]
gap> AllCharacterTableNames( IsSporadicSimple, true,
>        Size, [ 1 .. 10^6 ],
>        IsDuplicateTable, false : OrderedBy:= Size );
[ "M11", "M12", "J1", "M22", "J2" ]
gap> AllCharacterTableNames( IsSporadicSimple, true,
>        Size, [ 1 .. 10^6 ],
>        IsDuplicateTable, false : OrderedBy:= NrConjugacyClasses );
[ "M11", "M22", "J1", "M12", "J2" ]

##  ./../gap4/ctadmin.gd (1093-1097)
gap> maxesnames:= AllCharacterTableNames( IsSporadicSimple, true,
>                                         HasMaxes, true,
>                                         OfThose, Maxes );;

##  ./../gap4/ctadmin.gd (1137-1142)
gap> OneCharacterTableName( IsSimple, true, Size, 60 );
"A5"
gap> OneCharacterTableName( IsSimple, true, Size, 20 );
fail

##  ./../gap4/ctadmin.gd (1182-1193)
gap> tbl:= CharacterTable( "Alternating", 5 );;
gap> NameOfEquivalentLibraryCharacterTable( tbl );
"A5"
gap> NamesOfEquivalentLibraryCharacterTables( tbl );
[ "A5", "A6M2", "Alt(5)" ]
gap> tbl:= CharacterTable( "Cyclic", 17 );;
gap> NameOfEquivalentLibraryCharacterTable( tbl );
fail
gap> NamesOfEquivalentLibraryCharacterTables( tbl );
[  ]

##  ./../gap4/ctadmin.gi (5515-5520)
gap> TableOfMarks( CharacterTable( "A5" ) );
TableOfMarks( "A5" )
gap> TableOfMarks( CharacterTable( "M" ) );
fail

##  ./../gap4/ctadmin.gi (5589-5592)
gap> CharacterTable( TableOfMarks( "A5" ) );
CharacterTable( "A5" )

##  ./../gap4/ctadmin.gi (5430-5437)
gap> tbl:= CharacterTable( "A5" );
CharacterTable( "A5" )
gap> tom:= TableOfMarks( "A5" );
TableOfMarks( "A5" )
gap> FusionCharTableTom( tbl, tom );
[ 1, 2, 3, 5, 5 ]

##  ./../gap4/ctadmin.gd (1792-1797)
gap> FusionToTom( CharacterTable( "2.A6" ) );
rec( map := [ 1, 2, 5, 4, 8, 3, 7, 11, 11, 6, 13, 6, 13 ], 
  name := "2.A6", perm := (4,5), 
  text := "fusion map is unique up to table autom." )

##  ./../gap4/ctadmin.gd (2588-2593)
gap> NameOfLibraryCharacterTable( "A5" );
"A5"
gap> NameOfLibraryCharacterTable( "S5" );
"A5.2"

##  ./../gap4/ctadmin.gd (1939-1975)
gap> GroupInfoForCharacterTable( CharacterTable( "A5" ) );
[ [ "AlternatingGroup", [ 5 ] ], [ "AtlasGroup", [ "A5" ] ], 
  [ "AtlasStabilizer", [ "A6", "A6G1-p6aB0" ] ], 
  [ "AtlasStabilizer", [ "A6", "A6G1-p6bB0" ] ], 
  [ "AtlasStabilizer", [ "L2(11)", "L211G1-p11aB0" ] ], 
  [ "AtlasStabilizer", [ "L2(11)", "L211G1-p11bB0" ] ], 
  [ "AtlasStabilizer", [ "L2(19)", "L219G1-p57aB0" ] ], 
  [ "AtlasStabilizer", [ "L2(19)", "L219G1-p57bB0" ] ], 
  [ "AtlasSubgroup", [ "A5.2", 1 ] ], [ "AtlasSubgroup", [ "A6", 1 ] ]
    , [ "AtlasSubgroup", [ "A6", 2 ] ], 
  [ "AtlasSubgroup", [ "J2", 9 ] ], 
  [ "AtlasSubgroup", [ "L2(109)", 4 ] ], 
  [ "AtlasSubgroup", [ "L2(109)", 5 ] ], 
  [ "AtlasSubgroup", [ "L2(11)", 1 ] ], 
  [ "AtlasSubgroup", [ "L2(11)", 2 ] ], 
  [ "AtlasSubgroup", [ "S6(3)", 11 ] ], 
  [ "GroupForTom", [ "2^4:A5", 68 ] ], 
  [ "GroupForTom", [ "2^4:A5`", 56 ] ], [ "GroupForTom", [ "A5" ] ], 
  [ "GroupForTom", [ "A5xA5", 85 ] ], [ "GroupForTom", [ "A6", 21 ] ],
  [ "GroupForTom", [ "J2", 99 ] ], 
  [ "GroupForTom", [ "L2(109)", 25 ] ], 
  [ "GroupForTom", [ "L2(11)", 15 ] ], 
  [ "GroupForTom", [ "L2(125)", 18 ] ], 
  [ "GroupForTom", [ "L2(16)", 18 ] ], 
  [ "GroupForTom", [ "L2(19)", 17 ] ], 
  [ "GroupForTom", [ "L2(29)", 19 ] ], 
  [ "GroupForTom", [ "L2(31)", 25 ] ], 
  [ "GroupForTom", [ "S5", 18 ] ], [ "PSL", [ 2, 4 ] ], 
  [ "PSL", [ 2, 5 ] ], [ "PerfectGroup", [ 60, 1 ] ], 
  [ "PrimitiveGroup", [ 5, 4 ] ], [ "PrimitiveGroup", [ 6, 1 ] ], 
  [ "PrimitiveGroup", [ 10, 1 ] ], [ "SmallGroup", [ 60, 5 ] ], 
  [ "TransitiveGroup", [ 5, 4 ] ], [ "TransitiveGroup", [ 6, 12 ] ], 
  [ "TransitiveGroup", [ 10, 7 ] ], [ "TransitiveGroup", [ 12, 33 ] ],
  [ "TransitiveGroup", [ 15, 5 ] ], [ "TransitiveGroup", [ 20, 15 ] ],
  [ "TransitiveGroup", [ 30, 9 ] ] ]

##  ./../gap4/ctadmin.gd (1998-2003)
gap> KnowsSomeGroupInfo( CharacterTable( "A5" ) );
true
gap> KnowsSomeGroupInfo( CharacterTable( "M" ) );
false

##  ./../gap4/ctadmin.gd (2032-2035)
gap> CharacterTableForGroupInfo( [ "AlternatingGroup", [ 5 ] ] );
CharacterTable( "A5" )

##  ./../gap4/ctadmin.gd (2068-2073)
gap> GroupForGroupInfo( [ "AlternatingGroup", [ 5 ] ] );
Alt( [ 1 .. 5 ] )
gap> GroupForGroupInfo( [ "PrimitiveGroup", [ 5, 4 ] ] );
A(5)

##  ./../gap4/ctadmin.gd (2108-2116)
gap> g:= GroupForTom( "A5" );  u:= GroupForTom( "A5", 2 );
Group([ (2,4)(3,5), (1,2,5) ])
Group([ (2,3)(4,5) ])
gap> IsSubset( g, u );
true
gap> GroupForTom( "J4" );
fail

##  ./../gap4/ctadmin.gd (2154-2157)
gap> AtlasStabilizer( "A5","A5G1-p5B0");
Group([ (1,2)(3,4), (2,3,4) ])

##  ./../gap4/ctadmin.gd (2178-2184)
gap> mx:= Maxes( CharacterTable( "J1" ) );
[ "L2(11)", "2^3.7.3", "2xA5", "19:6", "11:10", "D6xD10", "7:6" ]
gap> List( mx, name -> IsNontrivialDirectProduct(
>                          CharacterTable( name ) ) );
[ false, false, true, false, false, true, false ]

##  ./../dlnames/dlnames.gd (138-144)
gap> tbl:= CharacterTable( "U4(2).2" );;
gap> UnipotentCharacter( tbl, [ [ 0, 1 ], [ 2 ] ] );
Character( CharacterTable( "U4(2).2" ),
 [ 15, 7, 3, -3, 0, 3, -1, 1, 0, 1, -2, 1, 0, 0, -1, 5, 1, 3, -1, 2, 
  -1, 1, -1, 0, 0 ] )

##  ./../dlnames/dlnames.gd (62-72)
gap> DeligneLusztigNames( "L2(7)" );
[ [ 2 ],,,, [ 1, 1 ] ]
gap> tbl:= CharacterTable( "L2(7)" );
CharacterTable( "L3(2)" )
gap> HasDeligneLusztigNames( tbl );
true
gap> DeligneLusztigNames( rec( isoc:= "A", isot:= "simple",
>                              l:= 2, q:= 2 ) );
[ [ 3 ],,, [ 2, 1 ],, [ 1, 1, 1 ] ]

##  ./../dlnames/dlnames.gd (96-105)
gap> tbl:= CharacterTable( "F4(2)" );;
gap> DeligneLusztigName( Irr( tbl )[9] );
fail
gap> HasDeligneLusztigNames( tbl );
true
gap> List( [ 1 .. 8 ], i -> DeligneLusztigName( Irr( tbl )[i] ) );
[ "phi{1,0}", "[ [ 2 ], [  ] ]", "phi{2,4}''", "phi{2,4}'", 
  "F4^II[1]", "phi{4,1}", "F4^I[1]", "phi{9,2}" ]

##  ./../gap4/ctadmin.gd (2227-2232)
gap> KnowsDeligneLusztigNames( CharacterTable( "A5" ) );
true
gap> KnowsDeligneLusztigNames( CharacterTable( "M" ) );
false

##  ./../gap4/ctbltoct.g (771-776)
gap> StringCTblLibInfo( CharacterTable( "A5" ) );;
gap> StringCTblLibInfo( CharacterTable( "A5" ) mod 2 );;
gap> StringCTblLibInfo( "A5" );;
gap> StringCTblLibInfo( "A5", 2 );;

##  ./../gap4/atlasstr.g (1836-1850)
gap> str:= StringAtlasContents();;
gap> pos:= PositionNthOccurrence( str, '\n', 10 );;
gap> Print( str{ [ 1 .. pos ] } );
A5 = L2(4) = L2(5)    2       2:2, 3:2, 5:2
L3(2) = L2(7)         3       2:3, 3:3, 7:3
A6 = L2(9) = S4(2)'   4       2:4, 3:4, 5:5
L2(8) = R(3)'         6       2:6, 3:6, 7:6
L2(11)                7       2:7, 3:7, 5:8, 11:8
L2(13)                8       2:9, 3:9, 7:10, 13:10
L2(17)                9       2:11, 3:11, 17:12
A7                   10       2:13, 3:13, 5:14, 7:15
L2(19)               11       2:16, 3:16, 5:17, 19:18
L2(16)               12       2:19, 3:20, 5:20, 17:21

##  ./../gap4/atlasstr.g (1223-1246)
gap> DisplayAtlasMap( "M12" );
--------- ---------   
|       | |       |   
|   G   | |  G.2  | 15
|       | |       |   
--------- ---------   
--------- ---------   
|       | |       |   
|  2.G  | | 2.G.2 | 11
|       | |       |   
--------- ---------   
    15        9    
gap> DisplayAtlasMap( "M12", 2 );
--------- ---------  
|       | |       |  
|   G   | |  G.2  | 6
|       | |       |  
--------- ---------  
    6         0    
gap> StringsAtlasMap( "M11" );
[ "---------   ", "|       |   ", "|   G   | 10", "|       |   ", 
  "---------   ", "    10   " ]

##  ./../gap4/atlasstr.g (1259-1270)
gap> DisplayAtlasMap( "S10(2)" );
---------    
|       |    
|   G   | 198
|       |    
---------    
   198   
gap> DisplayAtlasMap( "L12(27)" );
gap> StringsAtlasMap( "L12(27)" );
fail

##  ./../gap4/atlasstr.g (1280-1310)
gap> DisplayAtlasMap( rec(
> labels:= [ [ "G", "G.3" ],
>            [ "2.G", "" ],
>            [ "2'.G", "" ],
>            [ "2''.G", "" ] ],
> shapes:= [ [ "closed", "closed" ],
>            [ "closed", "empty" ],
>            [ "closed", "empty" ],
>            [ "closed", "empty" ] ],
> labelscol:= [ "1", "1" ],
> labelsrow:= [ "1", "1", "1", "1" ],
> dashedhorz:= [ false, false, true, true ],
> dashedvert:= [ false, false ],
> showdashedrows:= true ) );
      --------- ---------  
      |       | |       |  
      |   G   | |  G.3  | 1
      |       | |       |  
      --------- ---------  
      ---------            
      |       |            
      |  2.G  |           1
      |       |            
      ---------            
 2'.G ---------          
      ---------          
2''.G ---------          
      ---------          
          1         1    

##  ./../gap4/atlasstr.g (1316-1338)
gap> DisplayAtlasMap( rec(
> labels:= [ [ "G", "G.2" ],
>            [ "3.G", "3.G.2" ] ],
> shapes:= [ [ "closed", "closed" ],
>            [ "closed", "open" ] ],
> labelscol:= [ "1", "1" ],
> labelsrow:= [ "1", "1" ],
> dashedhorz:= [ false, false ],
> dashedvert:= [ false, false ],
> showdashedrows:= true ) );
--------- ---------  
|       | |       |  
|   G   | |  G.2  | 1
|       | |       |  
--------- ---------  
--------- --------   
|       | |          
|  3.G  | | 3.G.2   1
|       | |          
---------            
    1         1    

##  ./../gap4/ctadmin.gd (2332-2339)
gap> Maxes( CharacterTable( "A6" ) );
[ "A5", "A6M2", "3^2:4", "s4", "A6M5" ]
gap> IsDuplicateTable( CharacterTable( "A5" ) );
false
gap> IsDuplicateTable( CharacterTable( "A6M2" ) );
true

##  ./../gap4/ctadmin.gd (2369-2376)
gap> Maxes( CharacterTable( "A6" ) );
[ "A5", "A6M2", "3^2:4", "s4", "A6M5" ]
gap> IdentifierOfMainTable( CharacterTable( "A5" ) );
fail
gap> IdentifierOfMainTable( CharacterTable( "A6M2" ) );
"A5"

##  ./../gap4/ctadmin.gd (2406-2413)
gap> Maxes( CharacterTable( "A6" ) );
[ "A5", "A6M2", "3^2:4", "s4", "A6M5" ]
gap> IdentifiersOfDuplicateTables( CharacterTable( "A5" ) );
[ "A6M2", "Alt(5)" ]
gap> IdentifiersOfDuplicateTables( CharacterTable( "A6M2" ) );
[  ]

##  ./../gap4/ctadmin.gd (1704-1712)
gap> tbl:= CharacterTable( "M11" );;
gap> HasMaxes( tbl );
true
gap> maxes:= Maxes( tbl );
[ "A6.2_3", "L2(11)", "3^2:Q8.2", "A5.2", "2.S4" ]
gap> CharacterTable( maxes[1] );
CharacterTable( "A6.2_3" )

##  ./../gap4/ctadmin.gd (1842-1849)
gap> ProjectivesInfo( CharacterTable( "A5" ) );
[ rec( 
      chars := [ [ 2, 0, -1, E(5)+E(5)^4, E(5)^2+E(5)^3 ], 
          [ 2, 0, -1, E(5)^2+E(5)^3, E(5)+E(5)^4 ], 
          [ 4, 0, 1, -1, -1 ], [ 6, 0, 0, 1, 1 ] ], 
      map := [ 1, 3, 4, 6, 8 ], name := "2.A5" ) ]

##  ./../gap4/ctadmin.gd (1891-1894)
gap> ExtensionInfoCharacterTable( CharacterTable( "A5" ) );
[ "2", "2" ]

##  ./../gap4/ctadmin.gi (40-43)
gap> AllCharacterTableNames( InfoText,
>        s -> PositionSublist( s, "tests:" ) <> fail );;

##  ./../gap4/ctadmin.gd (790-809)
gap> c5:= CharacterTableSpecialized( CharacterTable( "Cyclic" ), 5 );
CharacterTable( "C5" )
gap> Display( c5 );
C5

     5  1  1  1  1  1

       1a 5a 5b 5c 5d
    5P 1a 1a 1a 1a 1a

X.1     1  1  1  1  1
X.2     1  A  B /B /A
X.3     1  B /A  A /B
X.4     1 /B  A /A  B
X.5     1 /A /B  B  A

A = E(5)
B = E(5)^2

##  ./../gap4/ctadmin.gd (814-823)
gap> HasClassParameters( c5 );  HasCharacterParameters( c5 );
true
true
gap> ClassParameters( c5 );  CharacterParameters( c5 );
[ [ 1, 0 ], [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ] ]
[ [ 1, 0 ], [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ] ]
gap> ClassParameters( CharacterTable( "Symmetric", 3 ) );
[ [ 1, [ 1, 1, 1 ] ], [ 1, [ 2, 1 ] ], [ 1, [ 3 ] ] ]

##  ./../gap4/ctadmin.gd (830-838)
gap> CharacterTable( "Cyclic" ).irreducibles[1][1]( 5, 2, 3 );
E(5)
gap> tbl:= CharacterTable( "Symmetric" );;
gap> tbl.irreducibles[1][1]( 5, [ 3, 2 ], [ 2, 2, 1 ] );
1
gap> tbl.orders[1]( 5, [ 2, 1, 1, 1 ] );
2

##  ./ctbllibr.xml (597-631)
gap> Print( CharacterTable( "Cyclic" ), "\n" );
rec(
  centralizers := [ function ( n, k )
            return n;
        end ],
  charparam := [ function ( n )
            return [ 0 .. n - 1 ];
        end ],
  classparam := [ function ( n )
            return [ 0 .. n - 1 ];
        end ],
  domain := <Category "(IsInt and IsPosRat)">,
  identifier := "Cyclic",
  irreducibles := [ [ function ( n, k, l )
                return E( n ) ^ (k * l);
            end ] ],
  isGenericTable := true,
  libinfo := rec(
      firstname := "Cyclic",
      othernames := [  ] ),
  orders := [ function ( n, k )
            return n / Gcd( n, k );
        end ],
  powermap := [ function ( n, k, pow )
            return [ 1, k * pow mod n ];
        end ],
  size := function ( n )
        return n;
    end,
  specializedname := function ( q )
        return Concatenation( "C", String( q ) );
    end,
  text := "generic character table for cyclic groups" )

##  ./../gap4/ctadmin.gd (2546-2562)
gap> AtlasLabelsOfIrreducibles( CharacterTable( "3.A7.2" ) );
[ "\\chi_{1,0}", "\\chi_{1,1}", "\\chi_{2,0}", "\\chi_{2,1}", 
  "\\chi_{3+4}", "\\chi_{5,0}", "\\chi_{5,1}", "\\chi_{6,0}", 
  "\\chi_{6,1}", "\\chi_{7,0}", "\\chi_{7,1}", "\\chi_{8,0}", 
  "\\chi_{8,1}", "\\chi_{9,0}", "\\chi_{9,1}", "\\chi_{17+17\\ast 2}",
  "\\chi_{18+18\\ast 2}", "\\chi_{19+19\\ast 2}", 
  "\\chi_{20+20\\ast 2}", "\\chi_{21+21\\ast 2}", 
  "\\chi_{22+23\\ast 8}", "\\chi_{22\\ast 8+23}" ]
gap> AtlasLabelsOfIrreducibles( CharacterTable( "3.A7.2" ), "short" );
[ "\\chi_{1,0}", "\\chi_{1,1}", "\\chi_{2,0}", "\\chi_{2,1}", 
  "\\chi_{3+}", "\\chi_{5,0}", "\\chi_{5,1}", "\\chi_{6,0}", 
  "\\chi_{6,1}", "\\chi_{7,0}", "\\chi_{7,1}", "\\chi_{8,0}", 
  "\\chi_{8,1}", "\\chi_{9,0}", "\\chi_{9,1}", "\\chi_{17+}", 
  "\\chi_{18+}", "\\chi_{19+}", "\\chi_{20+}", "\\chi_{21+}", 
  "\\chi_{22+}", "\\chi_{23+}" ]

##  ./../gap4/ctadmin.gd (1649-1659)
gap> tbl:= CharacterTable( "m10" );
CharacterTable( "A6.2_3" )
gap> HasCASInfo( tbl );
true
gap> CASInfo( tbl );
[ rec( name := "m10", permchars := (3,5)(4,8,7,6), permclasses := (), 
      text := "names:     m10\norder:     2^4.3^2.5 = 720\nnumber of c\
lasses: 8\nsource:    cambridge atlas\ncomments:  point stabilizer of \
mathieu-group m11\ntest:      orth, min, sym[3]\n" ) ]

##  ./../gap4/ctadmin.gd (1668-1673)
gap> First( ComputedClassFusions( tbl ), x -> x.name = "M11" );
rec( map := [ 1, 2, 3, 4, 5, 4, 7, 8 ], name := "M11", 
  text := "fusion is unique up to table automorphisms,\nthe representa\
tive is equal to the fusion map on the CAS table" )

##  ./../gap4/ctadmin.gd (572-579)
gap> LibInfoCharacterTable( "S5" );
rec( fileName := "ctoalter", firstName := "A5.2" )
gap> LibInfoCharacterTable( "S5mod2" );
rec( fileName := "ctbalter", firstName := "A5.2mod2" )
gap> LibInfoCharacterTable( "J5" );
fail

##  ./../gap4/ctadmin.gd (346-352)
gap> CharacterTable( "private" );
fail
gap> NotifyNameOfCharacterTable( "A5", [ "private" ] );
gap> a5:= CharacterTable( "private" );
CharacterTable( "A5" )

##  ./../gap4/ctadmin.gd (1422-1432)
gap> s5:= CharacterTable( "S5" );
CharacterTable( "A5.2" )
gap> fus:= PossibleClassFusions( a5, s5 );
[ [ 1, 2, 3, 4, 4 ] ]
gap> fusion:= rec( name:= s5, map:= fus[1], text:= "unique" );;
gap> Print( LibraryFusion( "A5", fusion ) );
ALF("A5","A5.2",[1,2,3,4,4],[
"unique"
]);

##  ./../gap4/ctadmin.gd (1493-1505)
gap> tbl:= CharacterTable( "A5" );     
CharacterTable( "A5" )
gap> tom:= TableOfMarks( "A5" );
TableOfMarks( "A5" )
gap> fus:= PossibleFusionsCharTableTom( tbl, tom );
[ [ 1, 2, 3, 5, 5 ] ]
gap> fusion:= rec( name:= tom, map:= fus[1], text:= "unique" );;
gap> Print( LibraryFusionTblToTom( "A5", fusion ) );
ARC("A5","tomfusion",rec(name:="A5",map:=[1,2,3,5,5],text:=[
"unique"
]));

##  ./../gap4/ctblothe.gd (101-124)
gap> Print( CASString( CharacterTable( "Cyclic", 2 ) ), "\n" );
'C2'
00/00/00. 00.00.00.
(2,2,0,2,-1,0)
text:
(#computed using generic character table for cyclic groups#),
order=2,
centralizers:(
2,2
),
reps:(
1,2
),
powermap:2(
1,1
),
characters:
(1,1
,0:0)
(1,-1
,0:0);
/// converted from GAP

##  ./../gap4/ctblothe.gd (202-206)
gap> MAKElb11( [ 3, 4 ] );
   3   2   0   1   0
   4   2   0   1   0

##  ./../gap4/ctblothe.gd (381-414)
gap> moca5:= MOCTable( CharacterTable( "A5" ) );
rec( 30170 := [ [  ], [ 2, 2, 1, 1 ], [ 3, 3, 1, 1 ], [ 4, 5, 1, 1 ] ]
    , 
  30900 := [ [ 1, 1, 1, 1, 0 ], [ 3, -1, 0, 0, -1 ], 
      [ 3, -1, 0, 1, 1 ], [ 4, 0, 1, -1, 0 ], [ 5, 1, -1, 0, 0 ] ], 
  GAPtbl := CharacterTable( "A5" ), centralizers := [ 60, 4, 3, 5 ], 
  cycsubgps := [ 1, 2, 3, 4, 4 ], 
  fieldbases := 
    [ CanonicalBasis( Rationals ), CanonicalBasis( Rationals ), 
      CanonicalBasis( Rationals ), 
      Basis( NF(5,[ 1, 4 ]), [ 1, E(5)+E(5)^4 ] ) ], fields := [  ], 
  galconjinfo := [ 1, 1, 2, 1, 3, 1, 4, 1, 4, 2 ], 
  identifier := "MOCTable(A5)", 
  invmap := [ [ 1, 1, 0 ], [ 1, 2, 0 ], [ 1, 3, 0 ], 
      [ 1, 4, 0, 1, 5, 0 ] ], orders := [ 1, 2, 3, 5 ], 
  powerinfo := 
    [ , 
      [ [ 1, 1, 0 ], [ 1, 1, 0 ], [ 1, 3, 0 ], 
          [ 1, 4, -1, 5, 0, -1, 5, 0 ] ], 
      [ [ 1, 1, 0 ], [ 1, 2, 0 ], [ 1, 1, 0 ], 
          [ 1, 4, -1, 5, 0, -1, 5, 0 ] ],, 
      [ [ 1, 1, 0 ], [ 1, 2, 0 ], [ 1, 3, 0 ], [ 1, 1, 0, 0 ] ] ], 
  prime := 0, repcycsub := [ 1, 2, 3, 4 ], 
  tensinfo := 
    [ [ 1 ], [ 1 ], [ 1 ], 
      [ 2, 1, 1, 1, 1, 2, 2, 0, 1, 1, 2, 1, 2, 1, -1, 2, 2, 0 ] ] )
gap> str:= MOCString( moca5 );;
gap> str{[1..68]};
"y100y105ay110fey130t60edfy140bcdfy150bbbfcabbey160bbcbdbebecy170ccbb"
gap> moca5mod3:= MOCTable( CharacterTable( "A5" ) mod 3, [ 1 .. 4 ] );;
gap> MOCString( moca5mod3 ){ [ 1 .. 68 ] };
"y100y105dy110edy130t60efy140bcfy150bbfcabbey160bbcbdbdcy170ccbbdfbby"

##  ./../gap4/ctblothe.gd (485-506)
gap> scan:= ScanMOC( str );
rec( y050 := [ 5, 1, 1, 0, 1, 2, 0, 1, 3, 0, 1, 1, 0, 0 ], 
  y105 := [ 0 ], y110 := [ 5, 4 ], y130 := [ 60, 4, 3, 5 ], 
  y140 := [ 1, 2, 3, 5 ], y150 := [ 1, 1, 1, 5, 2, 0, 1, 1, 4 ], 
  y160 := [ 1, 1, 2, 1, 3, 1, 4, 1, 4, 2 ], 
  y170 := [ 2, 2, 1, 1, 3, 3, 1, 1, 4, 5, 1, 1 ], 
  y210 := [ 1, 1, 1, 2, 1, 1, 1, 1, 2, 2, 0, 1, 1, 2, 1, 2, 1, -1, 2, 
      2, 0 ], y220 := [ 1, 1, 0, 1, 2, 0, 1, 3, 0, 1, 4, 0, 1, 5, 0 ],
  y230 := [ 2, 1, 1, 0, 1, 1, 0, 1, 3, 0, 1, 4, -1, 5, 0, -1, 5, 0 ], 
  y900 := [ 1, 1, 1, 1, 0, 3, -1, 0, 0, -1, 3, -1, 0, 1, 1, 4, 0, 1, 
      -1, 0, 5, 1, -1, 0, 0 ] )
gap> gapchars:= GAPChars( moca5, scan.y900 );
[ [ 1, 1, 1, 1, 1 ], [ 3, -1, 0, -E(5)-E(5)^4, -E(5)^2-E(5)^3 ], 
  [ 3, -1, 0, -E(5)^2-E(5)^3, -E(5)-E(5)^4 ], [ 4, 0, 1, -1, -1 ], 
  [ 5, 1, -1, 0, 0 ] ]
gap> mocchars:= MOCChars( moca5, gapchars );
[ [ 1, 1, 1, 1, 0 ], [ 3, -1, 0, 0, -1 ], [ 3, -1, 0, 1, 1 ], 
  [ 4, 0, 1, -1, 0 ], [ 5, 1, -1, 0, 0 ] ]
gap> Concatenation( mocchars ) = scan.y900;
true

##  ./../gap4/ctblothe.gd (592-618)
gap> tbl:= CharacterTable( "Alternating", 5 );;
gap> str:= GAP3CharacterTableString( tbl );;
gap> Print( str );
rec(
centralizers := [ 60, 4, 3, 5, 5 ],
fusions := [ rec( map := [ 1, 3, 4, 7, 7 ], name := "Sym(5)" ) ],
identifier := "Alt(5)",
irreducibles := [
[ 1, 1, 1, 1, 1 ],
[ 4, 0, 1, -1, -1 ],
[ 5, 1, -1, 0, 0 ],
[ 3, -1, 0, -E(5)-E(5)^4, -E(5)^2-E(5)^3 ],
[ 3, -1, 0, -E(5)^2-E(5)^3, -E(5)-E(5)^4 ]
],
orders := [ 1, 2, 3, 5, 5 ],
powermap := [ , [ 1, 1, 3, 5, 4 ], [ 1, 2, 1, 5, 4 ], , [ 1, 2, 3, 1, \
1 ] ],
size := 60,
text := "computed using generic character table for alternating groups\
",
operations := CharTableOps )
gap> scan:= GAP3CharacterTableScan( str );
CharacterTable( "Alt(5)" )
gap> TransformingPermutationsCharacterTables( tbl, scan );
rec( columns := (), group := Group([ (4,5) ]), rows := () )

##  ./../gap4/ctblothe.gd (750-758)
gap> CambridgeMaps( CharacterTable( "A5" ) );
rec( names := [ "1A", "2A", "3A", "5A", "B*" ], 
  power := [ "", "A", "A", "A", "A" ], 
  prime := [ "", "A", "A", "A", "A" ] )
gap> CambridgeMaps( CharacterTable( "A5" ) mod 2 );
rec( names := [ "1A", "3A", "5A", "B*" ], 
  power := [ "", "A", "A", "A" ], prime := [ "", "A", "A", "A" ] )

##  ./../gap4/ctblothe.gd (800-845)
gap> str:= StringOfCambridgeFormat( [ [   "A5",   "A5.2" ],
>                                     [ "2.A5", "2.A5.2" ] ] );;
gap> Print( str );
#23 ? A5
#7 4 4 4 4 4 4 4 4 4 4 4 
#9 ; @ @ @ @ @ ; ; @ @ @ 
#1 | 60 4 3 5 5 | | 6 2 3 
#2 p power A A A A | | A A AB 
#3 p' part A A A A | | A A AB 
#4 ind 1A 2A 3A 5A B* fus ind 2B 4A 6A 
#5 + 1 1 1 1 1 : ++ 1 1 1 
#5 + 3 -1 0 -b5 * . + 0 0 0 
#5 + 3 -1 0 * -b5 . | | | | 
#5 + 4 0 1 -1 -1 : ++ 2 0 -1 
#5 + 5 1 -1 0 0 : ++ 1 -1 1 
#6 ind 1 4 3 5 5 fus ind 2 8 6 
#6 | 2 | 6 10 10 | | | 8 6 
#5 - 2 0 -1 b5 * . - 0 0 0 
#5 - 2 0 -1 * b5 . | | | | 
#5 - 4 0 1 -1 -1 : oo 0 0 i3 
#5 - 6 0 0 1 1 : oo 0 i2 0 
#8
gap> str:= StringOfCambridgeFormat( [ [   "A5",   "A5.2" ],
>                                     [ "2.A5", "2.A5.2" ] ], 3 );;
gap> Print( str );
#23 A5 (Mod 3)
#7 4 4 4 4 4 4 4 4 4 
#9 ; @ @ @ @ ; ; @ @ 
#1 | 60 4 5 5 | | 6 2 
#2 p power A A A | | A A 
#3 p' part A A A | | A A 
#4 ind 1A 2A 5A B* fus ind 2B 4A 
#5 + 1 1 1 1 : ++ 1 1 
#5 + 3 -1 -b5 * . + 0 0 
#5 + 3 -1 * -b5 . | | | 
#5 + 4 0 -1 -1 : ++ 2 0 
#6 ind 1 4 5 5 fus ind 2 8 
#6 | 2 | 10 10 | | | 8 
#5 - 2 0 b5 * . - 0 0 
#5 - 2 0 * b5 . | | | 
#5 - 6 0 1 1 : oo 0 i2 
#8
gap> StringOfCambridgeFormat( [ [ "L10(11)" ] ], 0 );
fail

##  ./../gap4/ctblothe.gd (925-942)
gap> b:= BosmaBase( 8 );
[ 0, 1, 2, 3 ]
gap> b:= Basis( CF(8), List( b, i -> E(8)^i ) );
Basis( CF(8), [ 1, E(8), E(4), E(8)^3 ] )
gap> Coefficients( b, Sqrt(2) );
[ 0, 1, 0, -1 ]
gap> Coefficients( b, Sqrt(-2) );
[ 0, 1, 0, 1 ]
gap> b:= BosmaBase( 15 );
[ 0, 5, 3, 8, 6, 11, 9, 14 ]
gap> b:= List( b, i -> E(15)^i );
[ 1, E(3), E(5), E(15)^8, E(5)^2, E(15)^11, E(5)^3, E(15)^14 ]
gap> Coefficients( Basis( CF(15), b ), EB(15) );
[ -1, -1, 0, 0, -1, -2, -1, -2 ]
gap> BosmaBase( 48 );
[ 0, 3, 6, 9, 12, 15, 18, 21, 16, 19, 22, 25, 28, 31, 34, 37 ]

##  ./../gap4/ctblothe.gd (976-1078)
gap> tmpdir:= DirectoryTemporary();;
gap> file:= Filename( tmpdir, "magmatable" );;
gap> str:= "\
> Character Table of Group G\n\
> --------------------------\n\
> \n\
> ---------------------------\n\
> Class |   1  2  3    4    5\n\
> Size  |   1 15 20   12   12\n\
> Order |   1  2  3    5    5\n\
> ---------------------------\n\
> p  =  2   1  1  3    5    4\n\
> p  =  3   1  2  1    5    4\n\
> p  =  5   1  2  3    1    1\n\
> ---------------------------\n\
> X.1   +   1  1  1    1    1\n\
> X.2   +   3 -1  0   Z1 Z1#2\n\
> X.3   +   3 -1  0 Z1#2   Z1\n\
> X.4   +   4  0  1   -1   -1\n\
> X.5   +   5  1 -1    0    0\n\
> \n\
> Explanation of Character Value Symbols\n\
> --------------------------------------\n\
> \n\
> # denotes algebraic conjugation, that is,\n\
> #k indicates replacing the root of unity w by w^k\n\
> \n\
> Z1     = (CyclotomicField(5: Sparse := true)) ! [\n\
> RationalField() | 1, 0, 1, 1 ]\n\
> ";;
gap> FileString( file, str );;
gap> tbl:= GAPTableOfMagmaFile( file, "MagmaA5" );;
gap> Display( tbl );
MagmaA5

     2  2  2  .  .  .
     3  1  .  1  .  .
     5  1  .  .  1  1

       1a 2a 3a 5a 5b
    2P 1a 1a 3a 5b 5a
    3P 1a 2a 1a 5b 5a
    5P 1a 2a 3a 1a 1a

X.1     1  1  1  1  1
X.2     3 -1  .  A *A
X.3     3 -1  . *A  A
X.4     4  .  1 -1 -1
X.5     5  1 -1  .  .

A = -E(5)-E(5)^4
  = (1-Sqrt(5))/2 = -b5
gap> tbl2:= GAPTableOfMagmaFile( str, "MagmaA5", "string" );;
gap> Irr( tbl ) = Irr( tbl2 );
true
gap> str:= "\
> Character Table of Group G\n\
> --------------------------\n\
> \n\
> ------------------------------\n\
> Class |   1  2   3   4   5   6\n\
> Size  |   1  1   1   1   1   1\n\
> Order |   1  2   3   3   6   6\n\
> ------------------------------\n\
> p  =  2   1  1   4   3   3   4\n\
> p  =  3   1  2   1   1   2   2\n\
> ------------------------------\n\
> X.1   +   1  1   1   1   1   1\n\
> X.2   +   1 -1   1   1  -1  -1\n\
> X.3   0   1  1   J-1-J-1-J   J\n\
> X.4   0   1 -1   J-1-J 1+J  -J\n\
> X.5   0   1  1-1-J   J   J-1-J\n\
> X.6   0   1 -1-1-J   J  -J 1+J\n\
> \n\
> \n\
> Explanation of Character Value Symbols\n\
> --------------------------------------\n\
> \n\
> J = RootOfUnity(3)\n\
> ";;
gap> FileString( file, str );;
gap> tbl:= GAPTableOfMagmaFile( file, "MagmaC6" );;
gap> Display( tbl );
MagmaC6

     2  1  1  1  1   1   1
     3  1  1  1  1   1   1

       1a 2a 3a 3b  6a  6b
    2P 1a 1a 3b 3a  3a  3b
    3P 1a 2a 1a 1a  2a  2a

X.1     1  1  1  1   1   1
X.2     1 -1  1  1  -1  -1
X.3     1  1  A /A  /A   A
X.4     1 -1  A /A -/A  -A
X.5     1  1 /A  A   A  /A
X.6     1 -1 /A  A  -A -/A

A = E(3)
  = (-1+Sqrt(-3))/2 = b3

##  ./../gap4/ctblothe.gd (1155-1170)
gap> if CTblLib.IsMagmaAvailable() then
>      g:= MathieuGroup( 24 );
>      ccl:= ConjugacyClasses( g );
>      t:= CharacterTableComputedByMagma( g, "testM24" );
>      if t = fail then
>        Print( "#E  Magma did not compute a character table.\n" );
>      elif ( not HasConjugacyClasses( t ) ) or
>           ( ConjugacyClasses( t ) <> ccl ) then
>        Print( "#E  The conjugacy classes do not fit.\n" );
>      elif TransformingPermutationsCharacterTables( t,
>               CharacterTable( "M24" ) ) = fail then
>        Print( "#E  Inconsistency of character tables?\n" );
>      fi;
>    fi;

##  ./../gap4/atlasirr.g (972-977)
gap> values:= List( [ "e31", "y'24+3", "r2+i", "r2+i2" ],
>                   AtlasIrrationality );;
gap> List( values, CTblLib.StringOfAtlasIrrationality );
[ "e31", "y'24+3", "z8-&3+i", "2z8" ]

##  ./../gap4/ctadmin.gd (2449-2452)
gap> StructureDescriptionCharacterTableName( "M12M2" );
"M11"

##
gap> STOP_TEST( "docxpl2.tst" );
gap> SizeScreen( save );;

#############################################################################
##
#E
