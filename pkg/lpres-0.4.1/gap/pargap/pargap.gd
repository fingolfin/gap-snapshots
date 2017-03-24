############################################################################
##
#W pargap/pargap.gd		LPRES				René Hartung
##

# force the slaves to load the LPRES-package
if IsMaster() then BroadcastMsg("RequirePackage(\"LPRES\")"); fi;

# declaration for misc.gi
DeclareGlobalFunction( "LPRESPar_CollectorToFunction" );
DeclareGlobalFunction( "LPRESPar_MapRelations" );

# declaration for store.gi
DeclareGlobalFunction( "LPRESPar_MapRelationsStoring" );

# declaration for consist.gi
DeclareGlobalFunction( "LPRESPar_ListOfConsistencyChecks" );
DeclareGlobalFunction( "LPRESPar_CheckConsRel" );
DeclareGlobalFunction( "LPRESPar_MSCheckConsistencyRelations");
DeclareGlobalFunction( "LPRESPar_CheckConsistencyRelations");

# declaration for induce.gi
DeclareGlobalFunction( "LPRESPar_InduceEndomorphism" );
