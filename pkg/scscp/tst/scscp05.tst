# scscp, chapter 5
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been autogenerated with GAP. It contains examples
# extracted from the documentation. Each example is preceded by the
# comment which points to the location of its source.
#
gap> START_TEST( "scscp05.tst");

# doc/../lib/scscp.gd:727-735
gap> GetServiceDescription( "localhost", 26133 );
rec( 
  description := "Started with the configuration file scscp/example/myserver.g\
  on Thu 16 Feb 2017 16:03:56 GMT", service_name := "GAP SCSCP service", 
  version := "GAP 4.8.6 + SCSCP 2.2.1" )

# doc/../lib/scscp.gd:685-704
gap> GetAllowedHeads("localhost",26133);
rec( scscp_transient_1 := [ "AClosestVectorCombinationsMatFFEVecFFE", 
      "Determinant", "GroupIdentificationService", 
      "IO_UnpickleStringAndPickleItBack", "IdGroup512ByCode", "Identity", 
      "IsPrimeInt", "Length", "MathieuGroup", "MatrixGroup", 
      "NormalizedUnitCFcommutator", "NormalizedUnitCFpower", 
      "NrConjugacyClasses", "NrSmallGroups", "NumberCFGroups", 
      "NumberCFSolvableGroups", "PointImages", "QuillenSeriesByIdGroup", 
      "ResetMinimumDistanceService", "SCSCPStartTracing", "SCSCPStopTracing", 
      "Size", "SylowSubgroup", "WS_AlternatingGroup", "WS_AutomorphismGroup", 
      "WS_ConwayPolynomial", "WS_Factorial", "WS_FactorsCFRAC", 
      "WS_FactorsECM", "WS_FactorsMPQS", "WS_FactorsPminus1", 
      "WS_FactorsPplus1", "WS_FactorsTD", "WS_IdGroup", "WS_LatticeSubgroups",
      "WS_Mult", "WS_MultMatrix", "WS_Phi", "WS_PrimitiveGroup", 
      "WS_SmallGroup", "WS_SymmetricGroup", "WS_TransitiveGroup", "addition" 
     ] )

# doc/../lib/scscp.gd:854-863
gap> IsAllowedHead( "permgp1", "group", "localhost", 26133 );
true
gap> IsAllowedHead( "setname1", "Q", "localhost", 26133 );
true
gap> IsAllowedHead( "setname1", "R", "localhost", 26133 );
false

# doc/../lib/scscp.gd:806-823
gap> GetTransientCD( "scscp_transient_1", "localhost", 26133 );
rec( CDDate := "2017-02-08", 
  CDDefinitions := 
    [ rec( Description := "Size is currently undocumented.", Name := "Size" ),
      rec( Description := "Length is currently undocumented.", 
          Name := "Length" ), 
      rec( Description := "NrConjugacyClasses is currently undocumented.", 
          Name := "NrConjugacyClasses" ), 
...
      rec( Description := "MatrixGroup is currently undocumented.", 
          Name := "MatrixGroup" ) ], CDName := "scscp_transient_1", 
  CDReviewDate := "2017-02-08", CDRevision := "0", CDStatus := "private", 
  CDVersion := "0", 
  Description := "This is a transient CD for the GAP SCSCP service" )

# doc/../lib/scscp.gd:768-775
gap> GetSignature("scscp_transient_1","WS_Factorial","localhost",26133);
rec( maxarg := 1, minarg := 1,
  symbol := rec( cd := "scscp_transient_1", name := "WS_Factorial" ),
  symbolargs := rec( cd := "scscp2", name := "symbol_set_all" ) )

#
gap> STOP_TEST("scscp05.tst", 1 );
