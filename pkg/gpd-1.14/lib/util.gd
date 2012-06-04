##############################################################################
##
#W  util.gd                    GAP4 package `Gpd'                Chris Wensley
##
##  version 1.14, 25/01/2012 
##
#Y  Copyright (C) 2012, Emma Moore and Chris Wensley,  
#Y  School of Computer Science, Bangor University, U.K. 
##  
##  Declaration file for utility functions in the Gpd package.
##

#############################################################################
##
#A  IdentitySubgroup( <G> )
##
DeclareAttribute( "IdentitySubgroup", IsGroup );

#############################################################################
##
#O  GroupHomomorphismByImagesTriv( <G>, <H>, <gens>, <imgs> ) 
#O  InclusionMappingGroups( <G>, <H> )
#O  RestrictionMappingGroups( <hom>, <src>, <rng> )
#O  MappingToOne( <G>, <H> );
##
DeclareOperation( "GroupHomomorphismByImagesTriv", 
    [ IsGroup, IsGroup, IsList, IsList ] );
DeclareOperation( "InclusionMappingGroups", [ IsGroup, IsGroup ] );
DeclareOperation( "RestrictionMappingGroups", 
    [ IsGroupHomomorphism, IsGroup, IsGroup ] );
DeclareOperation( "MappingToOne", [ IsGroup, IsGroup ] );

#############################################################################
##
#E  util.gd . . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
##  