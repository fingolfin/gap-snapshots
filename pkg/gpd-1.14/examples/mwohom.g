############################################################################# 
## 
#W  mwohom.g                  GAP4 package `Gpd'                Chris Wensley 
##
##  version 1.14, 19/04/2012 
##
#Y  Copyright (C) 2012, Chris Wensley,  
#Y  School of Computer Science, Bangor University, U.K. 
##  

SetInfoLevel( InfoGpd, 1 );
##  TraceImmediateMethods( true );


Print( "\n===============================================================\n");
Print( "<<<< testing examples in the Gpd manual (version 19/04/12) >>>>\n" );
Print( "<<<< functions for magmas with objects and their morphisms >>>>\n" );
Print( "===============================================================\n\n");
    
Print("\n========================  MAGMA MAPPINGS  ===================\n\n");

Print( "three ways to set up an endomorphism on m :- \n\n" ); 

tup1 := [ Tuple([m1,m2]), Tuple([m2,m1]), Tuple([m3,m4]), Tuple([m4,m3]) ]; 
f1 := GeneralMappingByElements( m, m, tup1 ); 
Print( "f1 = ", f1, "\n" ); 
IsMagmaHomomorphism( f1 ); 
Print( "KnownPropertiesOfObject( f1 ) :-\n", 
    KnownPropertiesOfObject( f1 ), "\n\n" );

f1a := MappingByFunction( m, m, 
        function(x) 
           if ( x = MagmaElement(m,1)) then return MagmaElement(m,2); 
         elif ( x = MagmaElement(m,2)) then return MagmaElement(m,1); 
         elif ( x = MagmaElement(m,3)) then return MagmaElement(m,4); 
         elif ( x = MagmaElement(m,4)) then return MagmaElement(m,3);
           fi; 
        end ); 
Print( "f1a = ", f1a, "\n" ); 
IsMagmaHomomorphism( f1a ); 
Print( "KnownPropertiesOfObject( f1a ) :-\n", 
    KnownPropertiesOfObject( f1a ), "\n\n" );

Print( "f1 = f1a ? ", f1=f1a, "\n\n" ); 

tup2 := [ Tuple([m1,m1]), Tuple([m2,m1]), Tuple([m3,m1]), Tuple([m4,m1]) ]; 
f2 := GeneralMappingByElements( m, m, tup2 ); 
Print( "f2 = ", f2, "\n" ); 
IsMagmaHomomorphism( f2 ); 
Print( "KnownPropertiesOfObject( f2 ) :-\n", 
    KnownPropertiesOfObject( f2 ), "\n\n" );

########################################################################

Print( "now use f1/f1a/f2 to make endomorphisms of M78 :- \n\n" ); 

hom1 := MagmaWithObjectsHomomorphism( M78, M78, f1, [-8,-7] ); 
Print( "hom1 = ", hom1, "\n" ); 
idm := f1*f1; 
for x in [m1,m2,m3,m4] do 
    Print( x, " -> ", ImageElm(idm,x), "\n" ); 
od;
idhom := MagmaWithObjectsHomomorphism( M78, M78, idm, [-7,-8] ); 
Print( "idhom = ", idhom, "\n" ); 
hom1a := MagmaWithObjectsHomomorphism( M78, M78, f1a, [-8,-7] ); 
Print( "hom1a = ", hom1a, "\n" ); 
hom2 := MagmaWithObjectsHomomorphism( M78, M78, f2, [-7,-8] ); 
Print( "hom2 = ", hom2, "\n" ); 
comp := hom1 * hom2; 
Print( "comp = hom1 * hom2 = ", comp, "\n" ); 
im1 := ImageElm( hom1, b87 );
im2 := ImageElm( hom2, im1 ); 
Print( "b87 = ", b87, "\n" ); 
Print( "maps by hom1 to ", im1, "\n" ); 
Print( "and then by hom2 to ", im2, "\n" ); 
Print( "ImageElm( comp, b87 ) = ", ImageElm( comp, b87 ), "\n\n" ); 

########################################################################

t2 := Transformation( [2,2,4,1] ); 
s2 := Transformation( [1,1,4,4] );
r2 := Transformation( [4,1,3,3] ); 
sgp2 := Semigroup( [ t2, s2, r2 ] );
Display( sgp2 ); 
SetName( sgp2, "sgp<t2,s2,r2>" );
##  apparently no method for transformation semigroups available for: 
##  nat := NaturalHomomorphismByGenerators( sgp, sgp2 ); 
##  so let's try the function approach: 
flip := function( t )  ## where t is a transformation on [1..4] 
    local i, j, k, L, L2, n; 
    n := DegreeOfTransformation( t );  
    L := ImageListOfTransformation( t ); 
    L2 := ShallowCopy( L );
    for i in [1..n] do 
        if IsOddInt( i ) then 
            j := i + 1; 
        else 
            j := i - 1; 
        fi; 
        k := L[j]; 
        if IsOddInt( k ) then 
            L2[i] := k + 1; 
        else 
            L2[i] := k - 1; 
        fi; 
    od; 
    return( Transformation( L2 ) ); 
end; 
smap := MappingByFunction( sgp, sgp2, flip ); 
ok := RespectsMultiplication( smap ); 
Print( "homomorphism smap : sgp -> sgp2 maps generators as follows :-\n" ); 
Print( t, " -> ", Image( smap, t ), "\n" ); 
Print( s, " -> ", Image( smap, s ), "\n" ); 
Print( r, " -> ", Image( smap, r ), "\n" ); 
SetName( smap, "smap" ); 
T123 := SemigroupWithObjects( sgp2, [-13,-12,-11] );
shom := MagmaWithObjectsHomomorphism( S123, T123, smap, [-11,-12,-13] ); 
Print( "\nusing smap to make a semigroup with objects homomorphism shom:\n" ); 
Display( shom );
Print( "\napplying shom to the elements t12, s23, r31 :-\n" );
Print( "    ", t12, "\n -> ", ImageElm( shom, t12 ), "\n" ); 
Print( "    ", s23, "\n -> ", ImageElm( shom, s23 ), "\n" ); 
Print( "    ", r31, "\n -> ", ImageElm( shom, r31 ), "\n" ); 

Print("\n==============  MAGMA MAPPINGS WITH PIECES ===================\n\n");

N4 := UnionOfPieces( [ M78, T123 ] );
h14 := HomomorphismByUnionNC( N1, N4, [ hom1, shom ] ); 
Print( "h14 = ", h14, "\n" ); 
h45 := IsomorphismNewObjects( N4, [ [-103,-102,-101], [-108,-107] ] );
Print( "h45 = ", h45, "\n" ); 
W1 := Range( h45 );
h15 := h14 * h45;
Print( "h15 = ", h15, "\n" ); 
