#############################################################################
##
#W  ghomperm.gd                 GAP library                    Heiko Thei"sen
##
#H  @(#)$Id: ghomperm.gd,v 4.11 2002/04/15 10:04:42 sal Exp $
##
#Y  Copyright (C)  1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen, Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
Revision.ghomperm_gd :=
    "@(#)$Id: ghomperm.gd,v 4.11 2002/04/15 10:04:42 sal Exp $";


#############################################################################
##
#R  IsPermGroupGeneralMappingByImages(<map>)
#R  IsPermGroupHomomorphismByImages(<map>)
##
##  is the representation for mappings that map from a perm group
DeclareRepresentation( "IsPermGroupGeneralMappingByImages",
      IsGroupGeneralMappingByImages,
      [ "generators", "genimages" ] );
DeclareSynonym( "IsPermGroupHomomorphismByImages",
    IsPermGroupGeneralMappingByImages and IsMapping );


#############################################################################
##
#R  IsToPermGroupGeneralMappingByImages(<map>)
#R  IsToPermGroupHomomorphismByImages(<map>)
##
##  is the representation for mappings that map to a perm group
DeclareRepresentation( "IsToPermGroupGeneralMappingByImages",
      IsGroupGeneralMappingByImages,
      [ "generators", "genimages" ] );
DeclareSynonym( "IsToPermGroupHomomorphismByImages",
    IsToPermGroupGeneralMappingByImages and IsMapping );


#############################################################################
##
#F  RelatorsPermGroupHom(<hom>,<gens>)
##
##  `RelatorsPermGroupHom' is an internal function which is called by the
##  operation `IsomorphismFpGroupByGeneratorsNC' in case of a permutation group.
##  It implements John Cannon's multi-stage relations finding algorithm as
##  described in~\cite{Neu82}.
##
DeclareGlobalFunction("RelatorsPermGroupHom");


#############################################################################
DeclareGlobalFunction( "AddGeneratorsGenimagesExtendSchreierTree" );
DeclareGlobalFunction( "ImageSiftedBaseImage" );
DeclareGlobalFunction( "CoKernelGensIterator" );
DeclareGlobalFunction( "CoKernelGensPermHom" );
DeclareGlobalFunction( "StabChainPermGroupToPermGroupGeneralMappingByImages" );
DeclareGlobalFunction( "MakeStabChainLong" );
DeclareGlobalFunction( "ImageKernelBlocksHomomorphism" );
DeclareGlobalFunction( "PreImageSetStabBlocksHomomorphism" );


#############################################################################
##
#E

