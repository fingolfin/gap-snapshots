#############################################################################
##
#W  ringhom.gd                   GAP library                  Alexander Hulpke
##
#H  @(#)$Id: ringhom.gd,v 1.1.2.2 2008/10/08 15:49:05 gap Exp $
##
#Y  Copyright (C) 2008 The GAP Group
##
##  This file contains declarations of operations for ring general mappings
##  and homomorphisms. It is based on alghom.gd
##
##
Revision.ringhom_gd :=
    "@(#)$Id: ringhom.gd,v 1.1.2.2 2008/10/08 15:49:05 gap Exp $";


DeclareInfoClass("InfoRingHom");

#############################################################################
##
#O  RingGeneralMappingByImages( <A>, <B>, <gens>, <imgs> )
##
##
DeclareOperation( "RingGeneralMappingByImages",
    [ IsRing, IsRing, IsHomogeneousList, IsHomogeneousList ] );


#############################################################################
##
#F  RingHomomorphismByImages( <A>, <B>, <gens>, <imgs> )
##
##
##
DeclareGlobalFunction( "RingHomomorphismByImages" );


#############################################################################
##
#O  RingHomomorphismByImagesNC( <A>, <B>, <gens>, <imgs> )
##
##
DeclareOperation( "RingHomomorphismByImagesNC",
    [ IsRing, IsRing, IsHomogeneousList, IsHomogeneousList ] );

#############################################################################
##
#O  NaturalHomomorphismByIdeal( <A>, <I> )  . . . . . map onto factor ring
##
DeclareOperation( "NaturalHomomorphismByIdeal",
    [ IsRing, IsRing ] );


#############################################################################
##
#E

