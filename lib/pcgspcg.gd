#############################################################################
##
#W  pcgspcg.gd                  GAP Library                      Frank Celler
##
#H  @(#)$Id: pcgspcg.gd,v 4.11 2002/04/15 10:05:12 sal Exp $
##
#Y  Copyright (C)  1996,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file contains the operations  for polycylic generating systems of pc
##  groups.
##
Revision.pcgspcg_gd :=
    "@(#)$Id: pcgspcg.gd,v 4.11 2002/04/15 10:05:12 sal Exp $";

#############################################################################
##
#P  IsFamilyPcgs( <pcgs> )
##
DeclareProperty( "IsFamilyPcgs", IsPcgs,
  30 #familyPcgs is stronger than prime orders and some other properties
     # (cf. rank for `IsParentPcgsFamilyPcgs' in pcgsind.gd)
  );
InstallTrueMethod(IsCanonicalPcgs,IsFamilyPcgs);
InstallTrueMethod(IsParentPcgsFamilyPcgs,IsFamilyPcgs);

#############################################################################
##
#F  DoExponentsConjLayerFampcgs( <p>,<m>,<e>,<c> )
##
##  this algorithm does not compute any conjugates but only looks them up and
##  adds vectors mod <p>.
##
DeclareGlobalFunction("DoExponentsConjLayerFampcgs");

#############################################################################
##
#E  pcgspcg.gd	. . . . . . . . . . . . . . . . . . . . . . . . . . ends here
##
