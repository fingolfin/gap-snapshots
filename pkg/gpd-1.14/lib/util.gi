#############################################################################
##
#W  util.gi                    GAP4 package `Gpd'               Chris Wensley
##
##  version 1.14, 26/01/2012 
##
#Y  Copyright (C) 2012, Emma Moore and Chris Wensley,  
#Y  School of Computer Science, Bangor University, U.K. 
##  
##  Installation file for utility functions in Gpd and XMod packages.
## 

#############################################################################
##
#V  InfoGpd
##
DeclareInfoClass( "InfoGpd" );
SetInfoLevel( InfoGpd, 1 );

##############################################################################
##
#M  IdentitySubgroup . . . . . . . . . . . . . . . . . . . . . . .  of a group
##
InstallMethod( IdentitySubgroup, "of a group", true, [ IsGroup ], 0,
function( G )

    local  S;

    S := Subgroup( G, [ One( G ) ] );
    if HasName( G ) then
        SetName( S, Concatenation( "id(", Name( G ), ")" ) );
    fi;
    return S;
end );

############################################################################# 
## 
#M  GroupHomomorphismByImagesTriv( <G>, <H>, <gens>, <imgs> ) 
## 
##  allows for GHBI in the case when gens and imgs are empty
##
InstallMethod( GroupHomomorphismByImagesTriv, "for group, group, list, list",
    true, [ IsGroup, IsGroup, IsList, IsList ], 0,
function( G, H, gens, imgs )
local   hom;
    if ( ( gens = [ ] ) and ( imgs = [ ] ) ) then 
        gens := [ One( G ) ]; 
        imgs := [ One( H ) ]; 
        hom := GroupGeneralMappingByImages( G, H, gens, imgs ); 
        SetIsMapping( hom, true ); 
        SetIsTotal( hom, true ); 
    else 
        hom := GroupGeneralMappingByImages( G, H, gens, imgs ); 
    fi; 
    if IsMapping( hom ) and IsTotal( hom ) then
        return GroupHomomorphismByImagesNC( G, H, gens, imgs );
    else
        return fail;
    fi;
    return hom;
end );

#############################################################################
##
#M  InclusionMappingGroups( <G>, <H> )
##
InstallMethod( InclusionMappingGroups, "generic method for subgroup",
               IsIdenticalObj, [ IsGroup, IsGroup ], 0,
function( G, H )

    local  genH, inc, ok;
    if not IsSubgroup( G, H ) then
        Error( "usage: InclusionMappingGroups( G, H );  with  H <= G" );
    fi;
    genH := GeneratorsOfGroup( H );
    inc := GroupHomomorphismByImagesTriv( H, G, genH, genH );
    ok := IsInjective( inc );
    return inc;
end );

#############################################################################
##
#M  MappingToOne( <G>, <H> )
##
InstallMethod( MappingToOne, "generic method for groups",
    true, [ IsGroup, IsGroup ], 0,
function( G, H )

    local  genG, oneH, ones;
    genG := GeneratorsOfGroup( G );
    oneH := One( H );
    ones := List( genG, g -> oneH );
    return GroupHomomorphismByImagesTriv( G, H, genG, ones );
end );

#############################################################################
##
#M  RestrictionMappingGroups( <hom>, <src>, <rng> )
##
InstallMethod( RestrictionMappingGroups, "generic method for group hom",
    true, [ IsGroupHomomorphism, IsGroup, IsGroup ], 0,
function( hom, src, rng )

    local  res, gens, ims, r;

    if not IsSubgroup( Source( hom ), src ) then
        return fail;
    fi;
    if not IsSubgroup( Range( hom ), rng ) then
        return fail;
    fi;
    res := RestrictedMapping( hom, src );
    gens := GeneratorsOfGroup( src );
    ims := List( gens, g -> Image( res, g ) );
    for r in ims do
        if not (r in rng ) then
            return fail;
        fi;
    od;
    return GroupHomomorphismByImagesTriv( src, rng, gens, ims );
end );

#############################################################################
##
#E  util.gi . . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
##  