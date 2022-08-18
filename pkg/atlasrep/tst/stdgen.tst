#############################################################################
##
#W  stdgen.tst           GAP 4 package AtlasRep                 Thomas Breuer
##
#Y  Copyright (C)  2019,   Lehrstuhl D für Mathematik,  RWTH Aachen,  Germany
##
##  This file contains checks of standard generators computations.
##
##  In order to run the tests, one starts GAP from the 'tst' subdirectory
##  of the 'pkg/atlasrep' directory, and calls 'Test( "stdgen.tst" );'.
##
gap> START_TEST( "stdgen.tst" );

# Load the necessary packages.
gap> LoadPackage( "atlasrep", false );
true

# Check that 'StandardGeneratorsData' works.
gap> l:= [ # "B",
>          "Co1", "Co2", "Co3", "F4(2)", "Fi22", "Fi22.2", "Fi23", "Fi24'",
>          "Fi24'.2", "HN", "HN.2", "HS", "HS.2", "He", "He.2", "J1", "J2",
>          "J2.2", "J3", "J3.2", "J4", "Ly", "M11", "M12", "M12.2", "M22",
>          "M22.2", "M23", "M24", "McL", "McL.2", "ON", "ON.2", "Ru",
>          "S4(17)", "S10(2)", "Suz", "Suz.2", "Th", "U4(4)" ];;
gap> for name in l do
> Print( name, "\n" );
>      g:= AtlasGroup( name );
>      gens:= Permuted( GeneratorsOfGroup( g ), (1,2) );
>      res:= StandardGeneratorsData( gens, name );
>      if gens <> res.givengens then
>        Print( "#E  wrong 'givengens' for '", name, "'\n" );
>      fi;
>      if ResultOfStraightLineProgram( res.givengenstostdgens, gens )
>           <> res.stdgens then
>        Print( "#E  wrong 'stdgens' for '", name, "'\n" );
>      fi;
>      relimgs:= EvaluatePresentation( res.stdgens, name );
>      if relimgs = fail then
>        if AtlasProgram( name, "presentation" ) <> fail then
>          Print( "#E  'stdgens' does not fit to pres. for '", name, "'\n" );
>        fi;
>      elif not ForAll( relimgs, IsOne ) then
>        Print( "#E  'stdgens' does not fit to pres. for '", name, "'\n" );
>      fi;
>    od;

# Done.
gap> STOP_TEST( "stdgen.tst" );


#############################################################################
##
#E

