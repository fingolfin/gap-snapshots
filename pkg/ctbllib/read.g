#############################################################################
##
#W  read.g               GAP 4 package CTblLib                  Thomas Breuer
##
#Y  Copyright (C)  2001,   Lehrstuhl D für Mathematik,  RWTH Aachen,  Germany
##

# Notify functions concerning Deligne-Lusztig names.
DeclareAutoreadableVariables( "ctbllib", "dlnames/dllib.g",
    [ "DeltigLibUnipotentCharacters", "DeltigLibGetRecord" ] );

# Read the implementation part.
ReadPackage( "ctbllib", "gap4/ctadmin.gi" );
ReadPackage( "ctbllib", "gap4/construc.gi" );
ReadPackage( "ctbllib", "gap4/ctblothe.gi" );
ReadPackage( "ctbllib", "gap4/test.g" );

# Read functions concerning Deligne-Lusztig names.
ReadPackage( "ctbllib", "dlnames/dlnames.gi" );
if IsPackageMarkedForLoading( "chevie", ">= 1.0" ) then
  DeclareAutoreadableVariables( "ctbllib", "dlnames/dlconstr.g",
      [ "DeltigConstructionFcts" ] );
  DeclareAutoreadableVariables( "ctbllib", "dlnames/dltest.g",
      [ "DeltigTestFcts", "DeltigTestFunction" ] );
fi;

# Notify database attributes
# and Browse overviews of tables, irrationalities, and differences of data.
ReadPackage( "ctbllib", "gap4/ctbltoct.g" );
if IsPackageMarkedForLoading( "Browse", "1.8.10" ) then
  ReadPackage( "ctbllib", "gap4/ctdbattr.g" );
  ReadPackage( "ctbllib", "gap4/brirrat.g" );
else
  CTblLib.Data.IdEnumerator:= rec( attributes:= rec(), identifiers:= [] );
  CTblLib.Data.IdEnumeratorExt:= rec( attributes:= rec(), identifiers:= [] );
  CTblLib.Data.attributesRelevantForGroupInfoForCharacterTable:= [];
fi;

# Notify ATLAS related stuff.
ReadPackage( "ctbllib", "gap4/atlasstr.g" );
ReadPackage( "ctbllib", "gap4/atlasirr.g" );
if IsPackageMarkedForLoading( "Browse", "1.8.10" ) then
  ReadPackage( "ctbllib", "gap4/atlasimp.g" );
  ReadPackage( "ctbllib", "gap4/atlasbro.g" );
fi;


#############################################################################
##
#E

