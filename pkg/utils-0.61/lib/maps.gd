##############################################################################
##
#W  maps.gd                     GAP4 package `Utils'               Stefan Kohl
##                                                               Chris Wensley
##
#Y  Copyright (C) 2015-2018, The GAP Group 

#############################################################################
##  these three functions were in RCWA and were initially transferred but, 
##  to simplify the situation, just EpimorphismByGenerators has been retained 
##
#O  EpimorphismByGenerators( <D1>, <D2> ) . epi: gen's of <D1>->gen's of <D2>
#O  EpimorphismByGeneratorsNC( <D1>, <D2> ) . . NC version as underlying oper
#M  EpimorphismByGeneratorsNC( <G>, <H> ) . . . . . . . . . . . .  for groups
##
DeclareOperation( "EpimorphismByGenerators", [ IsDomain, IsDomain ] );

#############################################################################
## 
#O  Pullback( <nu>, <mu> ) 
#A  PullbackInfo( <pb> ) 
## 
DeclareOperation( "Pullback", [ IsGroupHomomorphism, IsGroupHomomorphism ] ); 
DeclareAttribute( "PullbackInfo", IsGroup, "mutable" );

#############################################################################
##
#E  maps.gd . . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
