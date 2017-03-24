# scscp, chapter 7

# [ "doc/examples.xml", 71, 94 ]

gap> LoadPackage("anupq");
---------------------------------------------------------------------------
Loading    ANUPQ (ANU p-Quotient) 3.1.4
GAP code by  Greg Gamble <Greg.Gamble@uwa.edu.au> (address for correspondence)
           Werner Nickel (http://www.mathematik.tu-darmstadt.de/~nickel/)
           [uses ANU pq binary (C code program) version: 1.9]
C code by  Eamonn O'Brien (http://www.math.auckland.ac.nz/~obrien)
Co-maintained by Max Horn <max.horn@math.uni-giessen.de>

            For help, type: ?ANUPQ
---------------------------------------------------------------------------
true
gap> G := DihedralGroup( 512 );            
<pc group of size 512 with 9 generators>
gap> F := PqStandardPresentation( G );
<fp group on the generators [ f1, f2, f3, f4, f5, f6, f7, f8, f9 ]>
gap> H := PcGroupFpGroup( F );
<pc group of size 512 with 9 generators>
gap> IdStandardPresented512Group( H );
[ 512, 2042 ]


# [ "doc/examples.xml", 145, 158 ]

gap> IdGroup512 := function( G )
>    local code, result;
>    if Size( G ) <> 512 then
>      Error( "G must be a group of order 512 \n" );
>    fi;
>    code := CodePcGroup( G );
>    result := EvaluateBySCSCP( "IdGroup512ByCode", [ code ], 
>                               "localhost", 26133 );
>    return result.object;
> end;;


# [ "doc/examples.xml", 164, 169 ]

gap> IdGroup512(DihedralGroup(512));
[ 512, 2042 ]

