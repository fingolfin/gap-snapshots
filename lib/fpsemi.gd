#############################################################################
##
#W  fpsemi.gd           GAP library          Andrew Solomon and Isabel Araujo
##
#H  @(#)$Id: fpsemi.gd,v 4.13 2002/04/15 10:04:40 sal Exp $
##
#Y  Copyright (C)  1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file contains the declarations for finitely 
##  presented semigroups. 
##
Revision.fpsemi_gd :=
    "@(#)$Id: fpsemi.gd,v 4.13 2002/04/15 10:04:40 sal Exp $";


#############################################################################
##
#C  IsElementOfFpSemigroup(<elm>)
##
##	returns true if <elm> is an element of a finitely presented semigroup. 
##
DeclareCategory( "IsElementOfFpSemigroup",
    IsMultiplicativeElement and IsAssociativeElement );

#############################################################################
##
#O  FpSemigroupOfElementOfFpSemigroup( <elm> )
##
##  returns the finitely presented semigroup to which <elm> belongs to
##
DeclareOperation( "FpSemigroupOfElementOfFpSemigroup",
[IsElementOfFpSemigroup]);

#############################################################################
##
#C  IsElementOfFpSemigroupCollection(<e>)
##
##  Created now so that lists of things in the category IsElementOfFpSemigroup
##  are given the category CategoryCollections(IsElementOfFpSemigroup)
##  Otherwise these lists (and other collections) won't create the 
##  collections category. See CollectionsCategory in the manual.
##   
DeclareCategoryCollections("IsElementOfFpSemigroup");

#############################################################################
##
#A  IsSubsemigroupFpSemigroup( <t> )
##  
##	true if <t> is a finitely presented semigroup or a 
##	subsemigroup of a finitely presented semigroup
##	(generally speaking, such a subsemigroup can be constructed
##	with `Semigroup(<gens>)', where <gens> is a list of elements
##	of a finitely presented semigroup).
##
DeclareSynonymAttr( "IsSubsemigroupFpSemigroup", 
	IsSemigroup and IsElementOfFpSemigroupCollection );

#############################################################################
##  
#C  IsElementOfFpSemigroupFamily
##
DeclareCategoryFamily( "IsElementOfFpSemigroup" );

#############################################################################
##
#F  FactorFreeSemigroupByRelations( <f>, <rels> )
##
##  for a free semigroup <f> and <rels> is a list of
##  pairs of elements of <f>. Returns the finitely presented semigroup 
##  which is the quotient of <f> by the least congruence on <f> generated by
##  the pairs in <rels>.
##
DeclareGlobalFunction("FactorFreeSemigroupByRelations");

#############################################################################
##  
#O  ElementOfFpSemigroup( <fam>, <w> )
##  
##  for a family <fam> of elements of a finitely presented semigroup and 
##  a word <w> in the free generators underlying this finitely presented
##  semigroup, this operation creates the element of the finitely 
##  presented semigroup with the representative <w> in the free semigroup.
##
DeclareOperation( "ElementOfFpSemigroup",
    [ IsElementOfFpSemigroupFamily, IsAssocWord ] );

#############################################################################
##
#P  IsFpSemigroup(<s>)
##
##  is a synonym for `IsSubsemigroupFpSemigroup(<s>)' and 
##  `IsWholeFamily(<s>)' (this is because a subsemigroup
##  of a finitely presented semigroup is not necessarily finitely presented).
##
DeclareSynonym( "IsFpSemigroup",IsSubsemigroupFpSemigroup and IsWholeFamily);

#############################################################################
## 
#A  FreeGeneratorsOfFpSemigroup( <s> )
## 
##  returns the underlying free generators corresponding to the 
##	generators of the finitely presented semigroup <s>.  
## 
DeclareAttribute("FreeGeneratorsOfFpSemigroup",  IsFpSemigroup );

#############################################################################
## 
#A  FreeSemigroupOfFpSemigroup( <s> )
## 
##	returns the underlying free semigroup for the finitely presented 
##	semigroup <s>, ie, the free semigroup over which <s> is defined 
##	as a quotient
##	(this is the free semigroup generated by the free generators provided 
##	by `FreeGeneratorsOfFpSemigroup(<s>)').
##
DeclareAttribute("FreeSemigroupOfFpSemigroup", IsFpSemigroup);

############################################################################
##
#A  RelationsOfFpSemigroup(<s>)
##
##  returns the relations of the finitely presented semigroup <s> as
##  pairs of words in the free generators provided by
##  `FreeGeneratorsOfFpSemigroup(<s>)'.
##
##
DeclareAttribute("RelationsOfFpSemigroup",IsFpSemigroup);

############################################################################
##
#A  IsomorphismFpSemigroup( <s> )
##
##  for a semigroup <s> returns an isomorphism from <s> to a 
##  finitely presented semigroup 
##
DeclareAttribute("IsomorphismFpSemigroup",IsSemigroup);

############################################################################
##
#O  FpGrpMonSmgOfFpGrpMonSmgElement( <elm> )
##
##	returns the finitely presented group, monoid or semigroup to which 
##	<elm> belongs
##
DeclareOperation("FpGrpMonSmgOfFpGrpMonSmgElement",[IsMultiplicativeElement]);


#############################################################################
##
#E

