##############################################################################
##
#W  gpd2obj.gd                 GAP4 package `XMod'               Chris Wensley
##
#Y  Copyright (C) 2001-2017, Chris Wensley et al,  
#Y  School of Computer Science, Bangor University, U.K. 

#############################################################################
## 
#C  Is2DimensionalDomainWithObjects( <obj> )
##  
DeclareCategory( "Is2DimensionalDomainWithObjects", 
    Is2DimensionalDomain and IsDomainWithObjects ); 

############################################################################## 
## 
#C  Is2DimensionalMagmaWithObjects( <m2d> ) category of 2d magmas with objects
#C  Is2DimensionalMagmaWithObjectsAndOnes( <m2d> ) . . . . . . . and with ones
#C  Is2DimensionalMagmaWithObjectsAndInverses( <m2d> ) . . . and some inverses
#C  Is2DimensionalGroupWithObjects( <m2d> )  . . . . . . . .  and all inverses
##
DeclareCategory( "Is2DimensionalMagmaWithObjects", 
    Is2DimensionalDomainWithObjects and IsMagmaWithObjects ); 
DeclareCategoryCollections( "Is2DimensionalMagmaWithObjects" ); 
DeclareCategory( "Is2DimensionalMagmaWithObjectsAndOne", 
    Is2DimensionalMagmaWithObjects 
    and CategoryCollections( IsMultiplicativeElementWithObjectsAndOnes ) ); 
DeclareCategory( "Is2DimensionalMagmaWithObjectsAndInverses", 
    Is2DimensionalMagmaWithObjectsAndOne 
    and CategoryCollections( IsMultiplicativeElementWithObjectsAndInverses ) ); 
DeclareCategory( "Is2DimensionalGroupWithObjects", 
    Is2DimensionalMagmaWithObjectsAndInverses 
    and CategoryCollections( IsAssociativeElement ) ); 

############################################################################# 
##  
#V  Family2DimensionalGroupWithObjects  . . family for 2d-groups with objects
##  
BindGlobal( "Family2DimensionalGroupWithObjects", 
    NewFamily( "Family2DimensionalGroupWithObjects", 
               Is2DimensionalGroupWithObjects, 
               CanEasilySortElements, CanEasilySortElements ) ); 

#############################################################################
##
#P  IsPreXModWithObjects( <PM> ) . . . . . . . . for a 2d-domain with objects 
#P  IsXModWithObjects( <PM> )
##
DeclareProperty( "IsPreXModWithObjects", 
    IsPreXMod and Is2DimensionalDomainWithObjects );
DeclareProperty( "IsXModWithObjects", IsPreXModWithObjects ); 

#############################################################################
##
#R  IsPreXModWithObjectsObj( <obj> ) . . . . for objects, boundary and action 
##  
##  A pre-crossed module of groupoids is a morphism preserving an action
##
DeclareRepresentation( "IsPreXModWithObjectsObj", 
    Is2DimensionalDomainWithObjects and IsAttributeStoringRep, 
    [ "objects", "boundary", "action" ] );

#############################################################################
## 
#O  PreXModWithObjectsObj( <obs>, <bdy>, <act> )  . . for obs, bdy and action 
## 
##  ?? should require IsGroupoidHomomorphism, but at present 
##  ?? HomomorphismByUnion(NC) does not return such! 
##  
DeclareOperation( "PreXModWithObjectsObj",
    [ IsHomogeneousList, IsGeneralMappingWithObjects, 
      IsGeneralMappingWithObjects ] );

#############################################################################
##
#O  DiscreteNormalPreXModWithObjects( <gpd>, <gp> ) .. for groupoid and group
##  
DeclareOperation( "DiscreteNormalPreXModWithObjects",
    [ IsSinglePiece, IsGroup ] );

############################################################################## 
## 
#E  gpd2obj.gd . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here 
## 
