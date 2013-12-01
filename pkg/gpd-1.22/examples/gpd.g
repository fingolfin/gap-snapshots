##############################################################################
##
#W  gpd.g                       GAP4 package `Gpd'               Chris Wensley
#W                                                                & Emma Moore
##  version 1.15, 08/06/2012 
##
#Y  Copyright (C) 2012, Emma Moore and Chris Wensley,  
#Y  School of Computer Science, Bangor University, U.K. 
##  

SetInfoLevel( InfoGpd, 1 );
##  TraceImmediateMethods( false );

Print( "\n===============================================================\n");
Print( "<<<< testing examples in the Gpd manual (version 08/06/12) >>>>\n" );
Print( "<<<<      functions for groupoids and their morphisms      >>>>\n" );
Print( "===============================================================\n\n");

Print( "Some filter ranks:\n" ); 
Print( "RankFilter( IsMagmaWithObjects ) = ", 
        RankFilter( IsMagmaWithObjects ), "\n" ); 
Print( "RankFilter( IsSinglePiece ) = ", 
        RankFilter( IsSinglePiece ), "\n" ); 
Print( "RankFilter( IsGroupoid ) = ", RankFilter( IsGroupoid ), "\n" ); 
Print( "RankFilter( IsSinglePieceRaysRep ) = ", 
        RankFilter( IsSinglePieceRaysRep ), "\n" ); 

######################################################## 

### Section 4.1.1 : Single piece groupoid ###

Print( "\nSome permutation groupoids:-\n" ); 
s4 := Group( (1,2,3,4), (3,4) );;
d8 := Group( (1,2,3,4), (1,3) );;
SetName( s4, "s4" ); 
SetName( d8, "d8" );
Gs4 := SinglePieceGroupoid( s4, [-15 .. -11] ); 
Print( "Gs4 = ", Gs4, "\n" );
Gd8 := SinglePieceGroupoid( d8, [-9,-8,-7] );
Print( "Gd8 = ", Gd8, "\n" );

c6 := Group( (5,6,7)(8,9) );;
SetName( c6, "c6" );
Gc6 := DomainWithSingleObject( c6, -6 );
Print( "Gc6 = ", Gc6, "\n" ); 
Hc6 := HomogeneousDiscreteGroupoid( c6, [-7..-4] );
Print( "Hc6 = ", Hc6, "\n" ); 

### Section 4.1.3 : Union of Pieces ###

U3 := UnionOfPieces( [ Gs4, Gd8, Gc6 ] ); 
Print( "U3 = " ); 
Display( U3 );
SetName( Gs4, "Gs4" );
SetName( Gd8, "Gd8" );
SetName( Gc6, "Gc6" );
SetName( U3, "Gs4+Gd8+Gc6" );
Print( ObjectList( U3 ), "\n" );
Hd8 := HomogeneousGroupoid( Gd8, [ [-12,-11,-10], [-16,-15,-14] ] ); 
Print( "\nHd8 = ", Hd8, "\n" ); 

Print( "\nSome fp- or pc-groupoids:-\n" ); 
f2 := FreeGroup( 2 );
SetName( f2, "f2" );
Gf2 := Groupoid( f2, -22 );
q8 := SmallGroup( 8, 4 );
Gq8 := Groupoid( q8, [ -28, -27 ] );
SetName( Gq8, "Gq8" );
U2 := Groupoid( [ Gf2, Gq8 ] );
Print( [ IsFpGroupoid(Gf2), IsPcGroupoid(Gq8), IsPcGroupoid(U2) ], "\n\n" );
Print( [ Size(Gs4), Size(Gd8), Size(Gc6), Size(U3), Size(U2) ], "\n\n" );

U5 := Groupoid( [ U3, Gf2, Gq8 ] );
Print( "U5 = " ); 
Display( U5 );
Print( "Size of U5 is ", Size(U5), "\n\n" );
V5 := Groupoid( [ Gq8, Gf2, U3 ] );
Print( "U5 = V5 ?  ", U5=V5, "\n\n" );

W5 := ReplaceOnePieceInUnion( U5, Gs4, Groupoid( s4, [-20,-19] ) ); 
Print( "W5 = ", W5, "\n" ); 

Ds4 := HomogeneousDiscreteGroupoid( s4, [-13..-10] );
Print( "Ds4 = ", Ds4, "\n" ); 

### Section 4.2.1 : Groupoid elements ###

e1 := GroupoidElement( Gd8, (1,2,3,4), -9, -8 );
e2 := GroupoidElement( Gd8, (1,3), -8, -7 );
prod := e1*e2;
Print( "e1 = ", e1, "\ne2 = ", e2, "\n" );
Print( "prod = ", prod, "\n" );
e3 := GroupoidElement( Gd8, (2,4), -7, -9 );
cycle := prod*e3;
Print("e3 = ",e3, "\ncycle = ",cycle, ",  cycle^2 = ", cycle^2, "\n" ); 
Print("cycle has order = ", Order(cycle), "\n" );
ce1 := ConjugateGroupoidElement( cycle, e1 ); 
Print( "conjugate of cycle by e1 is ", ce1, "\n\n" ); 

### Section 4.2 : Groupoid elements: star, costar and homset ###

i8 := IdentityElement( Gd8, -8 );
Print( "i8 = ", i8, "\n" ); 
Print( "[ e1*i8, i8*e1] = ", [ e1*i8, i8*e1], "\n" ); 
star9 := ObjectStar( Gd8, -9 );
Print( "star9 = ", star9, "  has size ", Size( star9 ), "\n" ); 
Print( "elements in star9 with group element of order 4:\n" ); 
for e in star9 do
    if ( Order( e![1] ) = 4 ) then Print( e, "\n" ); fi;
od;
costar6 := ObjectCostar( Gc6, -6 );
Print( "costar6 = ", costar6, "  has size ", Size( costar6 ), "\n" ); 
hsetq8 := Homset( Gq8, -28, -27 );
Print( "hsetq8 = ", hsetq8, "  has size ", Size( hsetq8 ), "\n" ); 
for e in hsetq8 do Print(e,"\n"); od;
Print( "\n" ); 


### Section 4.3 : Subgroupoids ###

c4 := Subgroup( d8, [ (1,2,3,4) ] ); 
SetName( c4, "c4" );
k4 := Subgroup( d8, [ (1,2)(3,4), (1,3)(2,4) ] );
SetName( k4, "k4" );
Ud8 := Subgroupoid( Gd8, [ [ k4, [-9] ], [ c4, [-8,-7] ] ] );
SetName( Ud8, "Ud8" );
Display( Ud8 );
Print( "Ud8 has parent ", Parent( Ud8 ), "\n" ); 
Print( "Ud8 is a wide subgroupoid of Gd8? ", IsWide( Gd8, Ud8 ), "\n" ); 

genf2b := List( GeneratorsOfGroup(f2), g -> g^2 );
Print( "genf2b = ", genf2b, "\n" ); 
f2b := Subgroup( f2, genf2b );
H2 := SubgroupoidByPieces( U2, [ [q8,[-27]], [f2b,[-22]] ] );
Print( "H2 = ", H2, "\n" ); 
Print( "IsSubgroupoid( Gf2, Groupoid( f2b, [-22] ) ) ? ", 
        IsSubgroupoid( Gf2, Groupoid( f2b, [-22] ) ), "\n" );
Display( FullSubgroupoid( U3, [-7,-6] ) );
Display( DiscreteSubgroupoid( U3, [ c4, k4 ], [-9,-7] ) );
Display( FullTrivialSubgroupoid( Ud8 ) );
Display( MaximalDiscreteSubgroupoid(U2) );
Print( "\n" ); 

Hs4 := FullSubgroupoid( Gs4, [-14,-13,-12] ); 
Print( "Hs4 = ", Hs4, "\n" ); 
Hd8a := SubgroupoidWithRays( Hs4, d8, [(),(2,3),(3,4)] );
Print( "Hd8a = ", Hd8a, "\n" );
hs1413 := Homset( Hd8a, -14, -13 );
for e in hs1413 do  Print(e,", "); od;  Print( "\n");
Hd8b := SubgroupoidWithRays( Hs4, d8, [(),(1,2,3),(1,2,4)] );
Print( "Hd8b = ", Hd8b, "\n" );
Print( "Hd8a = Hd8b ? ", Hd8a=Hd8b, "\n" ); 
Print( "Hd8b has rays ", RaysOfGroupoid( Hd8b ), "\n" ); 
Print( "Hd8a has parent ", Parent( Hd8a ), 
         " and ancestor ", Ancestor( Hd8a ), "\n" ); 
Fd8a := FullSubgroupoid( Hd8a, [-13,-12] );            
Print( "Fd8a = ", Fd8a, "\n" ); 
Kd8a := SubgroupoidWithRays( Fd8a, k4, [ (), (1,3) ] ); 
Print( "Kd8a = ", Kd8a, "\n" ); 


####################   Left, Right and Double Cosets   ##################

re2 := RightCoset( Gd8, Ud8, e2 );
Print( "\nre2 has elements:\n" ); 
for x in re2 do Print( x, "\n" ); od;
rcrd8 := RightCosetRepresentatives( Gd8, Ud8 );
Print( "rcrd8 = ", rcrd8, "\n" ); 
lcr7 := LeftCosetRepresentativesFromObject( Gd8, Ud8, -7 );
Print( " lcr7 = ", lcr7, "\n" ); 

### Section 4.5 : conjugation ###

x := GroupoidElement( Gd8, (1,3), -9, -9 ); 
y := GroupoidElement( Gd8, (1,2,3,4), -8, -9 ); 
z := GroupoidElement( Gd8, (1,2)(3,4), -9, -7 );
Print( "\n[x,y,z] = ", [x,y,z], "\n" ); 
##  conjugation with elements x, y, and z in Gd8: 
ConjugateGroupoidElement(x,y);
ConjugateGroupoidElement(x,z);
ConjugateGroupoidElement(y,x);
ConjugateGroupoidElement(y,z);
ConjugateGroupoidElement(z,x);
Print( "x^y = ", ConjugateGroupoidElement(x,y), "\n" );
Print( "x^z = ", ConjugateGroupoidElement(x,z), "\n" );
Print( "y^x = ", ConjugateGroupoidElement(y,x), "\n" );
Print( "y^z = ", ConjugateGroupoidElement(y,z), "\n" );
Print( "z^x = ", ConjugateGroupoidElement(z,x), "\n" );
Print( "z^y = ", ConjugateGroupoidElement(z,y), "\n" );


#######################   conjugation of subgroupoids   ##################

u1 := GroupoidElement( Hs4, (1,4), -14, -14 ); 
Cd8u1 := ConjugateGroupoid( Hd8a, u1 ); 
Print( "\nCd8u1 = ", Cd8u1, "\n" ); 
Print( GeneratorsOfGroupoid( Cd8u1 ), "\n\n" ); 

u2 := GroupoidElement( Hs4, (1,2,3), -13, -13 ); 
Cd8u2 := ConjugateGroupoid( Hd8b, u2 ); 
Print( "Cd8u2 = ", Cd8u2, "\n" ); 
Print( GeneratorsOfGroupoid( Cd8u2 ), "\n\n" ); 

u3 := GroupoidElement( Hs4, (1,4,2), -13, -14 ); 
Cd8u3 := ConjugateGroupoid( Hd8a, u3 ); 
Print( "Cd8u3 = ", Cd8u3, "\n" ); 
Print( GeneratorsOfGroupoid( Cd8u3 ), "\n\n" ); 

u4 := GroupoidElement( Hs4, (1,4,2,3), -14, -12 ); 
Cd8u4 := ConjugateGroupoid( Hd8b, u4 ); 
Print( "Cd8u4 = ", Cd8u4, "\n" ); 
Print( GeneratorsOfGroupoid( Cd8u4 ), "\n\n" ); 

u5 := GroupoidElement( Hs4, (1,3,4), -13, -12 ); 
Cd8u5 := ConjugateGroupoid( Hd8a, u5 ); 
Print( "Cd8u5 = ", Cd8u5, "\n" ); 
Print( GeneratorsOfGroupoid( Cd8u5 ), "\n\n" ); 

## last two examples use SinglePieceGroupoidByGenerators 

u6 := GroupoidElement( Gs4, (1,4), -15, -13 ); 
Cd8u6 := ConjugateGroupoid( Hd8a, u6 );
Print( "Cd8u6 = ", Cd8u6, "\n" ); 
Print( GeneratorsOfGroupoid( Cd8u6 ), "\n\n" ); 

u7 := GroupoidElement( Gs4, (1,4), -11, -13 ); 
Cd8u7 := ConjugateGroupoid( Hd8a, u7 );
Print( "Cd8u7 = ", Cd8u7, "\n" ); 
Print( GeneratorsOfGroupoid( Cd8u7 ), "\n\n" ); 
