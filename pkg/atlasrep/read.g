#############################################################################
##
#W  read.g               GAP 4 package AtlasRep                 Thomas Breuer
##
#Y  Copyright (C)  2001,   Lehrstuhl D für Mathematik,  RWTH Aachen,  Germany
##

# Read the implementation part. 
ReadPackage( "atlasrep", "gap/bbox.gi"     );
ReadPackage( "atlasrep", "gap/access.gi"   );
ReadPackage( "atlasrep", "gap/types.gi"    );
ReadPackage( "atlasrep", "gap/interfac.gi" );
ReadPackage( "atlasrep", "gap/mindeg.gi"   );
ReadPackage( "atlasrep", "gap/utlmrkup.g"  );
ReadPackage( "atlasrep", "gap/utils.gi"    );
ReadPackage( "atlasrep", "gap/test.g"      );
ReadPackage( "atlasrep", "gap/json.g"      );

# Read Browse applications only if the Browse package will be loaded.
if IsPackageMarkedForLoading( "Browse", ">= 1.8.3" ) then
  ReadPackage( "atlasrep", "gap/brmindeg.g" );
  if IsPackageMarkedForLoading( "CTblLib", "" ) then
    ReadPackage( "atlasrep", "gap/brspor.g" );
  fi;
fi;

# Read obsolete variables iff this happens also in the GAP library.
if UserPreference( "gap", "ReadObsolete" ) <> false then
  ReadPackage( "atlasrep", "gap/obsolete.gi" );
fi;


#############################################################################
##
#E

