#############################################################################
##
#W  pcgsmodu.gd                 GAP Library                      Frank Celler
##
#H  @(#)$Id: pcgsmodu.gd,v 4.18 2002/04/15 10:05:12 sal Exp $
##
#Y  Copyright (C)  1996,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file contains the operations for polycylic generating systems modulo
##  another such system.
##
Revision.pcgsmodu_gd :=
    "@(#)$Id: pcgsmodu.gd,v 4.18 2002/04/15 10:05:12 sal Exp $";

#############################################################################
##
#O  ModuloPcgsByPcSequenceNC( <home>, <pcs>, <modulo> )
##
DeclareOperation(
    "ModuloPcgsByPcSequenceNC",
    [ IsPcgs, IsList, IsPcgs ] );


#############################################################################
##
#O  ModuloPcgsByPcSequence( <home>, <pcs>, <modulo> )
##
DeclareOperation(
    "ModuloPcgsByPcSequence",
    [ IsPcgs, IsList, IsPcgs ] );

#############################################################################
##
#O  ModuloTailPcgsByList( <home>, <list>, <taildepths> )
##
##  constructs a modulo pcgs whose elements are <list> and whose denominator
##  is the subset of <home> given by the indices in <taildepths>.  <list>
##  must be a list of elements of different depths so that the exponents for
##  this modulo pcgs are just the exponents in home at the indices given by
##  the entries in <list>. (So in particular, <list> must be a subset of
##  <home> modulo the tail.) No check is performed whether the input is
##  valid.
DeclareGlobalFunction( "ModuloTailPcgsByList" );

#############################################################################
##
#O  ModuloPcgs( <G>, <N> )
##
##  returns a modulo pcgs for the factor $<G>/<N>$ which must be solvable,
##  which <N> may be insolvable.
DeclareOperation( "ModuloPcgs", [ IsGroup, IsGroup ] );


#############################################################################
##
#A  DenominatorOfModuloPcgs( <pcgs> )
##
##  returns a generating set for the denominator of the modulo pcgs <pcgs>. 
DeclareAttribute( "DenominatorOfModuloPcgs", IsModuloPcgs );


#############################################################################
##
#A  NumeratorOfModuloPcgs( <pcgs> )
##
##  returns a generating set for the numerator of the modulo pcgs <pcgs>.
DeclareAttribute( "NumeratorOfModuloPcgs", IsModuloPcgs );

#############################################################################
##
#P  IsNumeratorParentPcgsFamilyPcgs( <mpcgs> )
##
##  This property indicates that the numerator of the modulo pcgs <mpcgs> is
##  induced with respect to a family pcgs.
DeclareProperty( "IsNumeratorParentPcgsFamilyPcgs", IsModuloPcgs );


#############################################################################
##
#O  ExponentsConjugateLayer( <mpcgs>,<elm>,<e> )
##
##  Computes the exponents of $<elm>^<e>$ with respect to <mpcgs>; <elm>
##  must be in the span of <mpcgs>, <e> a pc element in the span of the
##  parent pcgs of <mpcgs> and <mpcgs> must be the modulo pcgs for
##  an abelian layer. (This is the usual case when acting on a chief
##  factor). In this case if <mpcgs> is induced by the family pcgs, the
##  exponents can be computed directly by looking up exponents without
##  having to compute in the group and having to collect a potential tail.
##
DeclareOperation( "ExponentsConjugateLayer",
  [IsModuloPcgs,IsMultiplicativeElementWithInverse,
                IsMultiplicativeElementWithInverse] );

#############################################################################
##
#E  pcgsmodu.gd . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
##
