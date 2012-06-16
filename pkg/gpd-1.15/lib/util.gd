##############################################################################
##
#W  util.gd                    GAP4 package `Gpd'                Chris Wensley
##
##  version 1.15, 08/06/2012 
##
#Y  Copyright (C) 2012, Emma Moore and Chris Wensley,  
#Y  School of Computer Science, Bangor University, U.K. 
##  
##  Declaration file for utility functions in the Gpd package.
##

#############################################################################
##
#O  InclusionMappingGroups( <G>, <H> )
#O  RestrictionMappingGroups( <hom>, <src>, <rng> )
#O  MappingToOne( <G>, <H> );
##
DeclareOperation( "InclusionMappingGroups", [ IsGroup, IsGroup ] );
DeclareOperation( "RestrictionMappingGroups", 
    [ IsGroupHomomorphism, IsGroup, IsGroup ] );
DeclareOperation( "MappingToOne", [ IsGroup, IsGroup ] );

#############################################################################
##
#E  util.gd . . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
##  