#############################################################################
##
#W  rwsgrp.gd                   GAP Library                      Frank Celler
##
#H  @(#)$Id: rwsgrp.gd,v 4.16 2002/04/15 10:05:15 sal Exp $
##
#Y  Copyright (C)  1996,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This   file contains  the operations  for  groups   defined by  rewriting
##  systems.
##
##  `GroupByRws' tries   to convert a  rewriting system  into  a  group.  The
##  generic  method requires that  the    underlying structure is a    group.
##  Rewriting  system constructors should   set the rewriting system  feature
##  `IsBuiltFromGroup' in this case.
##
Revision.rwsgrp_gd :=
    "@(#)$Id: rwsgrp.gd,v 4.16 2002/04/15 10:05:15 sal Exp $";


#############################################################################
##

#C  IsElementsFamilyByRws .  category of elements family constructed with RWS
##
DeclareCategory(
    "IsElementsFamilyByRws",
    IsFamily );


#############################################################################
##
#O  MultiplicativeElementsWithInversesFamilyByRws( <rws> )  . . . this family
##
DeclareOperation(
    "MultiplicativeElementsWithInversesFamilyByRws",
    [ IsRewritingSystem ] );


#############################################################################
##


#C  IsMultiplicativeElementWithInverseByRws . . .  category of these elements
##
DeclareCategory(
    "IsMultiplicativeElementWithInverseByRws",
    IsMultiplicativeElementWithInverse );


#############################################################################
##
#O  ElementByRws( <fam>, <elm> )  . . . . . . . . . construct such an element
##
DeclareOperation(
    "ElementByRws",
    [ IsElementsFamilyByRws, IsObject ] );


#############################################################################
##
#O  GroupByRws( <rws> ) . . . . . . . . . . . .  construct a group from a RWS
##
DeclareOperation(
    "GroupByRws",
    [ IsRewritingSystem ] );


#############################################################################
##
#O  GroupByRwsNC( <rws> ) . . . . . . . . . . .  construct a group from a RWS
##
DeclareOperation(
    "GroupByRwsNC",
    [ IsRewritingSystem ] );


#############################################################################
##

#E  rwsgrp.gd . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
##
