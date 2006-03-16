#############################################################################
#W  adjoin.gd                  GAP library                Steve Linton 
##
#H  @(#)$Id: adjoin.gd,v 1.1.2.2 2006/03/03 17:41:10 jamesm Exp $
##
##
##  This file contains the declarations for functions pertaining to 
##  adjoining an identity element to a semigroup. 
##

Revision.adjoin_gd :=
  "@(#)$Id: adjoin.gd,v 1.1.2.2 2006/03/03 17:41:10 jamesm Exp $";

DeclareCategory("IsMonoidByAdjoiningIdentityElt", IsMultiplicativeElementWithOne and IsAssociativeElement);
DeclareCategory("IsMonoidByAdjoiningIdentity", IsMonoid);

DeclareAttribute("AdjoinedIdentityFamily", IsFamily);
DeclareAttribute("UnderlyingSemigroupFamily", IsFamily);
DeclareAttribute("AdjoinedIdentityDefaultType", IsFamily);

DeclareRepresentation("IsMonoidByAdjoiningIdentityEltRep", IsPositionalObjectRep, 1);

###########################################################################
##
#A  MonoidByAdjoiningIdentity( <semigroup> ) 
##
##  this attribute stores the monoid obtained from <semigroup> by adjoining 
##  an identity. Even if <semigroup> happens to be a monoid, the resultant
##  monoid has a new identity adjoined.
##

DeclareAttribute("MonoidByAdjoiningIdentity", IsSemigroup);

###########################################################################
##
#A  UnderlyingSemigroupOfMonoidByAdjoiningIdentity( <monoid> ) 
##
##  this attribute stores the original semigroup that <monoid> was made from.
##

DeclareAttribute("UnderlyingSemigroupOfMonoidByAdjoiningIdentity", IsMonoidByAdjoiningIdentity );

###########################################################################
##
#A  MonoidByAdjoiningIdentityElt( <elt> ) 
##
##  the result of this function is the corresponding element in the category
##  MonoidByAdjoiningIdentityElt with IsOne set to false.
##

DeclareAttribute("MonoidByAdjoiningIdentityElt", IsMultiplicativeElement and IsAssociativeElement);

###########################################################################
##
#A  UnderlyingSemigroupOfMonoidByAdjoiningIdentity( <monoidelt> ) 
##
##  this attribute stores the original semigroup element that <monoidelt> 
##  was made from.
##

DeclareAttribute("UnderlyingSemigroupElementOfMonoidByAdjoiningIdentityElt", IsMonoidByAdjoiningIdentityElt);

#############################################################################
##
#E  adjoin.gd . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here