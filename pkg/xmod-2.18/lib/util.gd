##############################################################################
##
#W  util.gd                    GAP4 package `XMod'               Chris Wensley
#W                                                                 & Murat Alp
##
##  version 2.14, 16/07/2011 
##
#Y  Copyright (C) 2011, Murat Alp and Chris Wensley,  
#Y  School of Computer Science, Bangor University, U.K. 

#? replace by IsEndoMapping and (IsEndomapping and IsBijective ??

#############################################################################
##
## #P  IsEndomorphismOfGroup( <f> )
## #P  IsAutomorphismOfGroup( <f> )
##
## DeclareProperty( "IsEndomorphismOfGroup", IsGroupHomomorphism );
## DeclareProperty( "IsAutomorphismOfGroup", IsGroupHomomorphism );
## InstallTrueMethod( IsAutomorphismOfGroup, 
##     IsEndomorphismOfGroup and IsBijective );

##############################################################################
##
#O  InnerAutomorphismsByNormalSubgroup( <G>, <N> )
##  
DeclareOperation( "InnerAutomorphismsByNormalSubgroup", [ IsGroup, IsGroup ] );

##############################################################################
##
#O  TrivialAction( <G>, <H> ) 
##
DeclareOperation( "TrivialAction", [ IsGroup, IsGroup ] );

##############################################################################
##
#R  IsAbelianModuleObj( <obj> )
#P  IsAbelianModule( <obj> )
#A  AbelianModuleGroup( <obj> )
#A  AbelianModuleAction( <obj> )
#O  AbelianModuleObject( <abgrp>, <act> )
#O  AbelianModuleWithTrivialAction( <abgrp>, <grp> )
##
DeclareRepresentation( "IsAbelianModuleObj", 
  IsObject and IsAttributeStoringRep,
    [ "AbelianModuleGroup", "AbelianModuleAction" ] );
DeclareProperty( "IsAbelianModule", IsObject );
DeclareAttribute( "AbelianModuleGroup", IsAbelianModule );
DeclareAttribute( "AbelianModuleAction", IsAbelianModule );
DeclareOperation( "AbelianModuleObject", [ IsGroup, IsGroupHomomorphism ] ); 
DeclareOperation( "AbelianModuleWithTrivialAction", [ IsGroup, IsGroup ] );

#############################################################################
##
#A  AutomorphismClass( <G> )
##
DeclareAttribute( "AutomorphismClass", IsGroup );

#############################################################################
##
#R  IsEndomorphismClassObj( <obj> )
#P  IsEndomorphismClass( <cl> )
#O  EndomorphismClassObj( <nat>, <iso>, <aut>, <conj> )
#A  EndoClassNaturalHom( <class> )
#A  EndoClassIsomorphism( <class> )
#A  EndoClassConjugators( <class> )
##
##  An endomorphism class of a group G is a set of endomorphisms G -> G
##  with image in the same conjugacy class of subgroups of G
##
DeclareRepresentation( "IsEndomorphismClassObj",
    IsObject and IsAttributeStoringRep, [ "EndoClassNaturalHom", 
    "EndoClassIsomorphism", "AutoGroup",  "EndoClassConjugators" ] );
DeclareProperty( "IsEndomorphismClass", IsObject );
DeclareOperation( "EndomorphismClassObj",
 [IsGroupHomomorphism, IsGroupHomomorphism, IsGroupOfAutomorphisms, IsList] );
DeclareAttribute( "EndoClassNaturalHom", IsEndomorphismClassObj );
DeclareAttribute( "EndoClassIsomorphism", IsEndomorphismClassObj );
DeclareAttribute( "EndoClassConjugators", IsEndomorphismClassObj );

#############################################################################
##
#F  EndomorphismClasses( <G> )
#A  NontrivialEndomorphismClasses( <G> )
#A  NonIntersectingEndomorphismClasses( <G> )
#A  ZeroEndomorphismClass( <G> )
#O  EndomorphismImages( <list> )
#O  IdempotentImages( <list> )
##
DeclareGlobalFunction( "EndomorphismClasses", [ IsGroup, IsInt ] );
DeclareAttribute( "NontrivialEndomorphismClasses", IsGroup );
DeclareAttribute( "NonIntersectingEndomorphismClasses", IsGroup );
DeclareAttribute( "ZeroEndomorphismClass", IsGroup );
DeclareOperation( "EndomorphismImages", [ IsList ] );
DeclareOperation( "IdempotentImages", [ IsList ] );

##############################################################################
##
#A  GenerationOrder         elements of G generated as words in the generators
#A  GenerationPairs         elements of G generated as words in the generators
#O  CheckGenerationPairs             G.generationPairs, G.generationOrder ok ?
##
DeclareAttribute( "GenerationOrder", IsGroup );
DeclareAttribute( "GenerationPairs", IsGroup );
DeclareOperation( "CheckGenerationPairs", [ IsGroup ] );

####################### items added May 2002 ################################

#############################################################################
##
#O  DistinctRepresentatives( <L> )
#O  CommonRepresentatives( <J>, <K> )
#O  CommonTransversal( <G>, <H> )
#O  IsCommonTransversal( <G>, <H>, <T> )
##
DeclareOperation( "DistinctRepresentatives", [ IsList ] );
DeclareOperation( "CommonRepresentatives", [ IsList, IsList ] );
DeclareOperation( "CommonTransversal", [ IsGroup, IsGroup ] );
DeclareOperation( "IsCommonTransversal", [ IsGroup, IsGroup, IsList ] );

#############################################################################
##
#F  TzCommutatorPair( <tietze record>, <rel> )
#F  TzPartition( <tietze record> )
#F  FactorsPresentation( <tietze record> )
##
DeclareGlobalFunction( "TzCommutatorPair" );
DeclareGlobalFunction( "TzPartition" );
DeclareGlobalFunction( "FactorsPresentation" );

#############################################################################
##
#A  IsomorphismFpInfo( <G> )
#A  IsomorphismPermInfo( <G> )
#A  IsomorphismPcInfo( <G> )
#A  IsomorphismPermOrPcInfo( <G> )
##
DeclareAttribute( "IsomorphismFpInfo", IsGroup, "mutable" );
DeclareAttribute( "IsomorphismPermInfo", IsGroup, "mutable" );
DeclareAttribute( "IsomorphismPcInfo", IsGroup, "mutable" );
DeclareAttribute( "IsomorphismPermOrPcInfo", IsGroup, "mutable" );

#############################################################################
##
#F  IsomorphismPermObject( <obj> )
#F  IsomorphismFpObject( <obj> )
#F  IsomorphismPcObject( <obj> )
#F  IsomorphismPermOrPcObject( <obj> )
##
DeclareGlobalFunction( "IsomorphismPermObject" );
DeclareGlobalFunction( "IsomorphismFpObject" );
DeclareGlobalFunction( "IsomorphismPcObject" );
DeclareGlobalFunction( "IsomorphismPermOrPcObject" );

#############################################################################
##
#O  MetacyclicGroup( <m>, <n>, <l> )
##
DeclareOperation( "MetacyclicGroup", [ IsPosInt, IsPosInt, IsPosInt ] );

#############################################################################
## added Iso... 08/01/04;  changed to Nicer... 23/06/06
## 16/07/07 ... perhaps better to get rid of these
##              and just use  HasSmallerDegreePermRep  ???
#############################################################################
##
#P  HasSmallerDegreePermRep( <perm-gp> )
#A  NicerMonomorphism( <grp> )
#A  NicerObject( <grp> )
#O  IsomorphismSmallPermGroup( <grp> )
##
DeclareProperty( "HasSmallerDegreePermRep", IsPermGroup ); 
DeclareAttribute( "NicerMonomorphism", IsGroup );
DeclareAttribute( "NicerObject", IsGroup );
DeclareOperation( "IsomorphismSmallPermGroup", [ IsGroup ] );

#############################################################################
##  17/07/07
#############################################################################
##
#O  AutomorphismsFixingSubgroups( G, H ) 
##
DeclareOperation( "AutomorphismsFixingSubgroups", [ IsGroup, IsList ] );

#############################################################################
##
#E  util.gd . . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
