#############################################################################
##
#W  pcgs.gd                     GAP Library                      Frank Celler
##
#H  @(#)$Id: pcgs.gd,v 4.78.2.1 2005/10/14 08:45:40 gap Exp $
##
#Y  Copyright (C)  1996,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file contains the operations for polycylic generating systems.
##
Revision.pcgs_gd :=
    "@(#)$Id: pcgs.gd,v 4.78.2.1 2005/10/14 08:45:40 gap Exp $";

#############################################################################
##
#C  IsGeneralPcgs(<obj>)
##
##  The category of general pcgs. Each modulo pcgs is a general pcgs.
##  Relative orders are known for general pcgs, but it might not be possible
##  to compute exponent vectors or other elementary operations with respect
##  to a general pcgs. (For performance reasons immediate methods are always
##  ignored for Pcgs.)

DeclareCategory( "IsGeneralPcgs",
    IsHomogeneousList and IsDuplicateFreeList and IsConstantTimeAccessList
    and IsFinite and IsMultiplicativeElementWithInverseCollection
    and IsNoImmediateMethodsObject);

#############################################################################
##
#C  IsModuloPcgs(<obj>)
##
##  The category of modulo pcgs. Note that each pcgs is a modulo pcgs for
##  the trivial subgroup. 
DeclareCategory("IsModuloPcgs",IsGeneralPcgs);

#############################################################################
##
#C  IsPcgs(<obj>)
##
##  The category of pcgs. 
DeclareCategory( "IsPcgs", IsModuloPcgs);


#############################################################################
##
#C  IsPcgsFamily
##
DeclareCategory(
    "IsPcgsFamily",
    IsFamily );


#############################################################################
##
#R  IsPcgsDefaultRep
##
DeclareRepresentation(
    "IsPcgsDefaultRep",
    IsComponentObjectRep and IsAttributeStoringRep, [] );


#############################################################################
##
#O  PcgsByPcSequence( <fam>, <pcs> )
#O  PcgsByPcSequenceNC( <fam>, <pcs> )
##
##  constructs a pcgs for the elements family <fam> from the elements in the
##  list <pcs>. The elements must lie in the family <fam>.
##  `PcgsByPcSequence'(`NC') will always create a new pcgs which is not
##  induced by any other pcgs.
DeclareOperation( "PcgsByPcSequence", [ IsFamily, IsList ] );
DeclareOperation( "PcgsByPcSequenceNC", [ IsFamily, IsList ] );


#############################################################################
##
#O  PcgsByPcSequenceCons( <req-filters>, <imp-filters>, <fam>, <pcs>,<attr> )
##
DeclareConstructor( "PcgsByPcSequenceCons",
    [ IsObject, IsObject, IsFamily, IsList,IsList ] );


#############################################################################
##
#A  PcGroupWithPcgs( <mpcgs> )
##
##  creates a new Pc group <G> whose family pcgs is isomorphic to the
##  (modulo) pcgs <mpcgs>.
DeclareAttribute( "PcGroupWithPcgs", IsModuloPcgs );
DeclareSynonymAttr( "GroupByPcgs", PcGroupWithPcgs );


#############################################################################
##
#A  GroupOfPcgs( <pcgs> )
##
##  The group generated by <pcgs>.
DeclareAttribute(
    "GroupOfPcgs",
    IsPcgs );


#############################################################################
##
#A  OneOfPcgs( <pcgs> )
##
##  The identity of the group generated by <pcgs>.
DeclareAttribute(
    "OneOfPcgs",
    IsPcgs );


#############################################################################
##
#A  PcSeries( <pcgs> )
##
##  returns the subnormal series determined by <pcgs>.
DeclareAttribute( "PcSeries", IsPcgs );

#############################################################################
##
#P  IsPcgsElementaryAbelianSeries( <pcgs> )
##
##  returns `true' if the pcgs <pcgs> refines an elementary abelian series.
##  `IndicesEANormalSteps' then gives the indices in the Pcgs, at which the
##  subgroups of this series start. 
DeclareProperty("IsPcgsElementaryAbelianSeries", IsPcgs );

#############################################################################
##
#A  PcgsElementaryAbelianSeries( <G> )
#A  PcgsElementaryAbelianSeries( [<G>,<N1>,<N2>,....])
##
##  computes a pcgs for <G> that refines an elementary abelian series.
##  `IndicesEANormalSteps' gives the indices in the Pcgs, at which the
##  normal subgroups of this series start.  The second variant returns a
##  pcgs that runs through the normal subgroups <N1>, <N2>, etc.
DeclareAttribute( "PcgsElementaryAbelianSeries", IsGroup );

#############################################################################
##
#A  IndicesEANormalSteps(<pcgs>)
##
##  Let <pcgs> be a pcgs obtained as corresponding to a series of normal
##  subgroups with elementary abelian factors (for example from calling
##  `PcgsElementaryAbelianSeries')
##  Then `IndicesEANormalSteps' returns a sorted list of
##  integers, indicating the tails of <pcgs> which generate these normal
##  subgroup of <G>. If $i$ is an element of this list, $(g_i, \ldots, g_n)$
##  is a normal subgroup of <G>.  The list always starts with 1 and ends
##  with n+1. (These indices form *one* series with elementary abelian
##  subfactors, not necessarily the most refined one.)
##
##  The attribute `EANormalSeriesByPcgs' returns the actual series of
##  subgroups.
##
##  For arbitrary pcgs not obtained as belonging to a special series such a
##  set of indices not necessarily exists, and `IndicesEANormalSteps' is not
##  guaranteed to work in this situation.
##
##  Typically, `IndicesEANormalSteps' is set by
##  `PcgsElementaryAbelianSeries'.
DeclareAttribute( "IndicesEANormalSteps", IsPcgs );

#############################################################################
##
#A  EANormalSeriesByPcgs(<pcgs>)
##
##  Let <pcgs> be a pcgs obtained as corresponding to a series of normal
##  subgroups with elementary abelian factors (for example from calling
##  `PcgsElementaryAbelianSeries'). This attribute returns the actual series
##  of normal subgroups, corresponding to `IndicesEANormalSteps'.
DeclareAttribute("EANormalSeriesByPcgs",IsPcgs);

#############################################################################
##
#P  IsPcgsCentralSeries( <pcgs> )
##
##  returns `true' if the pcgs <pcgs> refines an central elementary abelian
##  series.  `IndicesCentralNormalSteps' then gives the indices in the Pcgs,
##  at which the subgroups of this series start. 
DeclareProperty("IsPcgsCentralSeries", IsPcgs );

#############################################################################
##
#A  PcgsCentralSeries( <G> )
##
##  computes a pcgs for <G> that refines a central elementary abelian series.
##  `IndicesCentralNormalSteps' gives the indices in the Pcgs, at which the
##  normal subgroups of this series start.
DeclareAttribute( "PcgsCentralSeries", IsGroup);

#############################################################################
##
#A  IndicesCentralNormalSteps(<pcgs>)
##
##  Let <pcgs> be a pcgs obtained as corresponding to a series of normal
##  subgroups with central elementary abelian factors (for example from calling
##  `PcgsCentralSeries')
##  Then `IndicesCentralNormalSteps' returns a sorted list of
##  integers, indicating the tails of <pcgs> which generate these normal
##  subgroup of <G>. If $i$ is an element of this list, $(g_i, \ldots, g_n)$
##  is a normal subgroup of <G>.  The list always starts with 1 and ends
##  with n+1. (These indices form *one* series with central elementary abelian
##  subfactors, not necessarily the most refined one.)
##
##  The attribute `CentralNormalSeriesByPcgs' returns the actual series of
##  subgroups.
##
##  For arbitrary pcgs not obtained as belonging to a special series such a
##  set of indices not necessarily exists, and `IndicesCentralNormalSteps'
##  is not guaranteed to work in this situation.
##
##  Typically, `IndicesCentralNormalSteps' is set by
##  `PcgsCentralSeries'.
DeclareAttribute( "IndicesCentralNormalSteps", IsPcgs );

#############################################################################
##
#A  CentralNormalSeriesByPcgs(<pcgs>)
##
##  Let <pcgs> be a pcgs obtained as corresponding to a series of normal
##  subgroups with central elementary abelian factors (for example from
##  calling `PcgsCentralSeries'). This attribute returns the actual series
##  of normal subgroups, corresponding to `IndicesCentralNormalSteps'.
DeclareAttribute("CentralNormalSeriesByPcgs",IsPcgs);

#############################################################################
##
#P  IsPcgsPCentralSeriesPGroup( <pcgs> )
##
##  returns `true' if the pcgs <pcgs> refines an $p$-central elementary
##  abelian series for a $p$-group.  `IndicesPCentralNormalStepsPGroup' then
##  gives the indices in the Pcgs, at which the subgroups of this series
##  start. 
DeclareProperty("IsPcgsPCentralSeriesPGroup", IsPcgs );

#############################################################################
##
#A  PcgsPCentralSeriesPGroup( <G> )
##
##  computes a pcgs for the $p$-group <G> that refines a $p$-central
##  elementary abelian series.  `IndicesPCentralNormalStepsPGroup' gives the
##  indices in the Pcgs, at which the normal subgroups of this series start.
DeclareAttribute( "PcgsPCentralSeriesPGroup", IsGroup);

#############################################################################
##
#A  IndicesPCentralNormalStepsPGroup(<pcgs>)
##
##  Let <pcgs> be a pcgs obtained as corresponding to a series of normal
##  subgroups with $p$-central elementary abelian factors (for example from
##  calling `PcgsPCentralSeriesPGroup').
##  Then `IndicesPCentralNormalStepsPGroup' returns a sorted list of
##  integers, indicating the tails of <pcgs> which generate these normal
##  subgroup of <G>. If $i$ is an element of this list, $(g_i, \ldots, g_n)$
##  is a normal subgroup of <G>.  The list always starts with 1 and ends
##  with n+1. (These indices form *one* series with central elementary abelian
##  subfactors, not necessarily the most refined one.)
##
##  The attribute `PCentralNormalSeriesByPcgsPGroup' returns the actual
##  series of subgroups.
##
##  For arbitrary pcgs not obtained as belonging to a special series such a
##  set of indices not necessarily exists, and
##  `IndicesPCentralNormalStepsPGroup'
##  is not guaranteed to work in this situation.
##
##  Typically, `IndicesPCentralNormalStepsPGroup' is set by
##  `PcgsPCentralSeriesPGroup'.
DeclareAttribute( "IndicesPCentralNormalStepsPGroup", IsPcgs );

#############################################################################
##
#A  PCentralNormalSeriesByPcgsPGroup(<pcgs>)
##
##  Let <pcgs> be a pcgs obtained as corresponding to a series of normal
##  subgroups with $p$-central elementary abelian factors (for example from
##  calling `PcgsPCentralSeriesPGroup'). This attribute returns the actual
##  series of normal subgroups, corresponding to
##  `IndicesPCentralNormalStepsPGroup'.
DeclareAttribute("PCentralNormalSeriesByPcgsPGroup",IsPcgs);

#############################################################################
##
#P  IsPcgsChiefSeries( <pcgs> )
##
##  returns `true' if the pcgs <pcgs> refines a chief series.
##  `IndicesChiefNormalSteps' then gives the indices in the Pcgs, at which the
##  subgroups of this series start. 
DeclareProperty("IsPcgsChiefSeries", IsPcgs );

#############################################################################
##
#A  PcgsChiefSeries( <G> )
##
##  computes a pcgs for <G> that refines a chief series.
##  `IndicesChiefNormalSteps' gives the indices in the Pcgs, at which the
##  normal subgroups of this series start.
DeclareAttribute( "PcgsChiefSeries", IsGroup );

#############################################################################
##
#A  IndicesChiefNormalSteps(<pcgs>)
##
##  Let <pcgs> be a pcgs obtained as corresponding to a chief series
##  for example from calling `PcgsChiefSeries').
##  Then `IndicesChiefNormalSteps' returns a sorted list of
##  integers, indicating the tails of <pcgs> which generate these normal
##  subgroup of <G>. If $i$ is an element of this list, $(g_i, \ldots, g_n)$
##  is a normal subgroup of <G>.  The list always starts with 1 and ends
##  with n+1. (These indices form *one* series with elementary abelian
##  subfactors, not necessarily the most refined one.)
##
##  The attribute `ChiefNormalSeriesByPcgs' returns the actual series of
##  subgroups.
##
##  For arbitrary pcgs not obtained as belonging to a special series such a
##  set of indices not necessarily exists, and `IndicesChiefNormalSteps' is not
##  guaranteed to work in this situation.
##
##  Typically, `IndicesChiefNormalSteps' is set by
##  `PcgsChiefSeries'.
DeclareAttribute( "IndicesChiefNormalSteps", IsPcgs );

#############################################################################
##
#A  ChiefNormalSeriesByPcgs(<pcgs>)
##
##  Let <pcgs> be a pcgs obtained as corresponding to a chief series
##  (for example from calling
##  `PcgsChiefSeries'). This attribute returns the actual series
##  of normal subgroups, corresponding to `IndicesChiefNormalSteps'.
DeclareAttribute("ChiefNormalSeriesByPcgs",IsPcgs);

#############################################################################
##
#A  IndicesNormalSteps( <pcgs> )
##
##
##  returns the indices of *all* steps in the pc series, which are normal in
##  the group defined by the pcgs.
##
##  (In general, this function yields a slower performance than the more
##  specialized index functions for elementary abelian series etc.)
DeclareAttribute( "IndicesNormalSteps", IsPcgs );

#############################################################################
##
#A  NormalSeriesByPcgs( <pcgs> )
##
##  returns the subgroups the pc series, which are normal in
##  the group defined by the pcgs.
##
##  (In general, this function yields a slower performance than the more
##  specialized index functions for elementary abelian series etc.)
DeclareAttribute( "NormalSeriesByPcgs", IsPcgs);

#############################################################################
##
#P  IsPrimeOrdersPcgs( <pcgs> )
##
##  tests whether the relative orders of <pcgs> are prime numbers. 
##  Many algorithms require a pcgs to have this property. The
##  operation~`IsomorphismRefinedPcGroup' (see~"IsomorphismRefinedPcGroup")
##  can be of help here.
DeclareProperty( "IsPrimeOrdersPcgs", IsGeneralPcgs );

#############################################################################
##
#P  IsFiniteOrdersPcgs( <pcgs> )
##
##  tests whether the relative orders of <pcgs> are all finite.
DeclareProperty( "IsFiniteOrdersPcgs", IsGeneralPcgs );

#############################################################################
##
#A  RefinedPcGroup( <G> )
##
##  returns the range of `IsomorphismRefinedPcGroup(<G>)'.
DeclareAttribute( "RefinedPcGroup", IsPcGroup );

#############################################################################
##
#A  IsomorphismRefinedPcGroup( <G> )
##
##  \index{isomorphic!pc group}
##  returns an isomorphism from <G> onto an isomorphic PC group whose family
##  pcgs is a prime order pcgs.
DeclareAttribute( "IsomorphismRefinedPcGroup", IsGroup );

#############################################################################
##
#A  RelativeOrders( <pcgs> )
##
##  returns the list of relative orders of the pcgs <pcgs>.
DeclareAttribute( "RelativeOrders", IsGeneralPcgs );

#############################################################################
##
#O  DepthOfPcElement( <pcgs>, <elm> )
##
##  returns the depth of the element <elm> with respect to <pcgs>.
DeclareOperation( "DepthOfPcElement", [ IsModuloPcgs, IsObject ] );

#############################################################################
##
#O  DifferenceOfPcElement( <pcgs>, <left>, <right> )
##
DeclareOperation( "DifferenceOfPcElement", [ IsPcgs, IsObject, IsObject ] );

#############################################################################
##
#O  ExponentOfPcElement( <pcgs>, <elm>, <pos> )
##
##  returns the <pos>-th exponent of <elm> with respect to <pcgs>.
DeclareOperation( "ExponentOfPcElement", 
                  [ IsModuloPcgs, IsObject, IsPosInt ] );

#############################################################################
##
#O  ExponentsOfPcElement( <pcgs>, <elm> )
#O  ExponentsOfPcElement( <pcgs>, <elm>, <posran> )
##
##  returns the exponents of <elm> with respect to <pcgs>. The second form
##  returns the exponents in the positions given in <posran>.
DeclareOperation( "ExponentsOfPcElement",
    [ IsModuloPcgs, IsObject ] );

#############################################################################
##
#O  ExponentsOfConjugate( <pcgs>, <i>, <j> )
##
##  returns the exponents of $<pcgs>[<i>]^<pcgs>[<j>]$ with respect to
##  <pcgs>. For the family pcgs or pcgs induced by it, this might be faster
##  than computing the element and computing its exponent vector.
DeclareOperation( "ExponentsOfConjugate",
    [ IsModuloPcgs, IsPosInt,IsPosInt ] );

#############################################################################
##
#O  ExponentsOfRelativePower( <pcgs>, <i> )
##
##  For $<p>=<pcgs>[<i>]$ this function returns the exponent vector with
##  respect to <pcgs> of the element $p^e$ where <e> is the relative order of
##  <p> in <pcgs>.  For the family pcgs or pcgs induced by it, this might be
##  faster than computing the element and computing its exponent vector.
DeclareOperation( "ExponentsOfRelativePower",
    [ IsModuloPcgs, IsPosInt ] );

#############################################################################
##
#O  ExponentsOfCommutator( <pcgs>, <i>, <j> )
##
##  returns the exponents of the commutatior Comm($<pcgs>[<i>],<pcgs>[<j>]$)
##  with respect to <pcgs>. For the family pcgs or pcgs induced by it, this
##  might be faster than computing the element and computing its exponent
##  vector.
DeclareOperation( "ExponentsOfCommutator",
    [ IsModuloPcgs, IsPosInt,IsPosInt ] );


#############################################################################
##
#O  LeadingExponentOfPcElement( <pcgs>, <elm> )
##
##  returns the leading exponent of <elm> with respect to <pcgs>.
DeclareOperation( "LeadingExponentOfPcElement",
    [ IsModuloPcgs, IsObject ] );


#############################################################################
##
#O  PcElementByExponents( <pcgs>, <list> )
#O  PcElementByExponentsNC( <pcgs>, <list> )
#O  PcElementByExponentsNC( <pcgs>,<basisind>, <list> )
##
##  returns the element corresponding to the exponent vector <list> with
##  respect to <pcgs>. The exponents in <list> must be in the range of
##  permissible exponents for <pcgs>. *It is not guaranteed that
##  `PcElementByExponents' will reduce the exponents modulo the relative
##  orders*. (You should use the operation `LinearCombinationPcgs' for this
##  purpose.) The NC version does not check that the lengths of the
##  lists fit together and does not check the exponent range.
##
##  The third version gives exponents only wrt. the generators in <pcgs>
##  indexed by <basisind>.
DeclareGlobalFunction("PcElementByExponents");
DeclareOperation( "PcElementByExponentsNC",
    [ IsModuloPcgs, IsList ] );

#############################################################################
##
#O  LinearCombinationPcgs( <pcgs>, <list> [,<one>] )
##
##  returns the product $\prod_i<pcgs>[i]^{<list>[i]}$. In contrast to
##  `PcElementByExponents' this permits negative exponents.
##  <pcgs> might be an list of group elements, in this case, an appropriate
##  <one> must be given. if <list> can be empty.
DeclareGlobalFunction("LinearCombinationPcgs");

#############################################################################
##
#F  PowerPcgsElement( <pcgs>, <i>, <exp> )
##
##  returns the power $<pcgs>[i]^{<exp>}$. <exp> may be negative. The
##  function caches the results which can be advantageous in particular if
##  the pcgs is not family.
DeclareGlobalFunction("PowerPcgsElement");

#############################################################################
##
#F  LeftQuotientPowerPcgsElement( <pcgs>, <i>, <exp>,<elm> )
##
##  returns the left quotient of elm by the power $<pcgs>[i]^{<exp>}$.
DeclareGlobalFunction("LeftQuotientPowerPcgsElement");


#############################################################################
##
#O  SumOfPcElement( <pcgs>, <left>, <right> )
##
##  returns the element in the span of <pcgs> whose coefficients are the
##  sums of the coefficients of <left> and <right> with respect to <pcgs>.
DeclareOperation(
    "SumOfPcElement",
    [ IsModuloPcgs, IsObject, IsObject ] );

#############################################################################
##
#O  ReducedPcElement( <pcgs>, <x>, <y> )
##
##  reduces the element <x> by dividing off (from the left) a power of <y>
##  such that the leading coefficient of the result with respect to <pcgs>
##  becomes zero. The elements <x> and <y> therefore have to have the same
##  depth.
DeclareOperation( "ReducedPcElement", [ IsModuloPcgs, IsObject, IsObject ] );


#############################################################################
##
#O  RelativeOrderOfPcElement( <pcgs>, <elm> )
##
##  The relative order of <elm> with respect to the prime order pcgs <pcgs>.
DeclareOperation(
    "RelativeOrderOfPcElement",
    [ IsModuloPcgs, IsObject ] );


#############################################################################
##
#O  HeadPcElementByNumber( <pcgs>, <elm>, <dep> )
##
##  returns an element in the span of <pcgs> whose exponents for indices 1
##  to $<dep>-1$ with respect to <pcgs> are the same as those of <elm>, the
##  remaining exponents are zero.
##  This can be used to obtain more
##  ``simple'' elements if only representatives in a factor are required.
DeclareOperation( "HeadPcElementByNumber",
    [ IsModuloPcgs, IsObject, IsInt ] );

#############################################################################
##
#O  CleanedTailPcElement( <pcgs>, <elm>, <dep> )
##
##  returns an element in the span of <pcgs> whose exponents for indices 1
##  to $<dep>-1$ with respect to <pcgs> are the same as those of <elm>, the
##  remaining exponents are undefined. This can be used to obtain more
##  ``simple'' elements if only representatives in a factor are required,
##  see~"Factor Groups of Polycyclic Groups - Modulo Pcgs".
##
##  The difference to `HeadPcElementByNumber' (see~"HeadPcElementByNumber")
##  is that `HeadPcElementByNumber' is guaranteed to zero out trailing
##  coefficients while `CleantedTailPcElement' will only do this if it can be
##  done cheaply.
DeclareOperation( "CleanedTailPcElement",
    [ IsModuloPcgs, IsObject, IsInt ] );


#############################################################################
##
#O  ExtendedIntersectionSumPcgs( <parent-pcgs>, <n>, <u>, <modpcgs> )
##
##  *@ The specification of this function is not clear. Do not use (or
##  document this function properly before using it*@.
##  The function returns a record whose entries are *not* pcgs but only
##  lists of pc elements (to avoid unnecessary creation of InducedPcgs)
##  If <modpcgs> is a tail if the <parent-pcgs> it is sufficient to give the
##  starting depth,
DeclareOperation( "ExtendedIntersectionSumPcgs",
    [ IsModuloPcgs, IsList, IsList, IsObject ] );


#############################################################################
##
#O  IntersectionSumPcgs( <parent-pcgs>, <n>, <u> )
##
##  *@ The specification of this function is not clear. Do not use (or
##  document this function properly before using it*@.
DeclareOperation( "IntersectionSumPcgs", [ IsModuloPcgs, IsList, IsList ] );


#############################################################################
##
#O  NormalIntersectionPcgs( <parent-pcgs>, <n>, <u> )
##
##  *@ The specification of this function is not clear. Do not use (or
##  document this function properly before using it*@.
DeclareOperation( "NormalIntersectionPcgs", [ IsModuloPcgs, IsList, IsList ] );


#############################################################################
##
#O  SumPcgs( <parent-pcgs>, <n>, <u> )
##
##  *@ The specification of this function is not clear. Do not use (or
##  document this function properly before using it*@.
DeclareOperation( "SumPcgs", [ IsModuloPcgs, IsList, IsList ] );


#############################################################################
##
#O  SumFactorizationFunctionPcgs( <parentpcgs>, <n>, <u>, <kerpcgs> )
##
##  computes the sum and intersection of the lists <n> and <u> whose
##  elements form modulo pcgs induced by <parentpcgs> for two subgroups
##  modulo a kernel given by <kerpcgs>.
##  If <kerpcgs> is a tail if the <parent-pcgs> it is sufficient to give the
##  starting depth, this can be more efficient than to construct an explicit
##  pcgs.
##  The factor group modulo <kerpcgs> generated by <n> must be elementary
##  abelian and normal under <u>.
##
##  The function returns a record with components
##  \beginitems
##  `sum'&Elements that form a modulo pcgs for the span of both subgroups.
##
##  `intersection'&Elements that form a modulo pcgs for the intersection of
##  both subgroups.
##
##  `factorization'&A function that returns for an element <x> in the span
##  of `sum' a record with components `u' and `n' that give its
##  decomposition.
##  \enditems
##  The record components `sum' and `intersection' are *not* pcgs but only
##  lists of pc elements (to avoid unnecessary creation of InducedPcgs).
DeclareOperation(
    "SumFactorizationFunctionPcgs",
    [ IsModuloPcgs, IsList, IsList, IsObject ] );


#############################################################################
##
#F  EnumeratorByPcgs( <pcgs>, <poss> )
##
DeclareOperation(
    "EnumeratorByPcgs",
    [ IsModuloPcgs ] );


#############################################################################
##
#O  ExtendedPcgs( <N>, <gens> )
##
##  extends the pcgs <N> (induced wrt. <home>) to a new induced pcgs by
##  prepending <gens>. No checks are performed that this really yields an
##  induced pcgs.
DeclareOperation( "ExtendedPcgs", [ IsModuloPcgs, IsList ] );


#############################################################################
##
#F  PcgsByIndependentGeneratorsOfAbelianGroup( <A> )
##
DeclareGlobalFunction( "PcgsByIndependentGeneratorsOfAbelianGroup" );

#############################################################################
##
#F  Pcgs_OrbitStabilizer( <pcgs>,<domain>,<pnt>,<oprs>,<opr> )
##
##  runs a solvable group orbit-stabilizer algorithm on <pnt> with <pcgs>
##  acting via the images <oprs> and the operation function <opr>.
##  The domain <domain> can be used to speed up search, if it is not known,
##  `false' can be given instead.
##  The function
##  returns a record with components `orbit', `stabpcgs' and `lengths', the
##  latter indicating the lengths of the orbit whenever it got extended.
##  This can be used to recompute transversal elements.
##  This function should be used only inside algorithms when speed is
##  essential.
DeclareGlobalFunction( "Pcgs_OrbitStabilizer" );
DeclareGlobalFunction( "Pcs_OrbitStabilizer" );
DeclareGlobalFunction( "Pcgs_OrbitStabilizer_Blist" );

#1
##  The following functions are intended for working with factor groups
##  obtained by factoring out the tail of a pcgs.
##  They provide a way to map elements or induced pcgs quickly in the factor
##  (respectively to take preimages) without the need to construct a
##  homomorphism.
##
##  The setup is always a pcgs <pcgs> of <G> and a pcgs <fpcgs> of a factor
##  group $<H>=<G>/<N>$ which corresponds to a head of <pcgs>.
##
## No tests for validity of the input are performed.

#############################################################################
##
#F  LiftedPcElement( <pcgs>,<fpcgs>,<elm> )
##
##  returns a preimage in <G> of an element <elm> of <H>.
DeclareGlobalFunction( "LiftedPcElement" );

#############################################################################
##
#F  ProjectedPcElement( <pcgs>,<fpcgs>,<elm> )
##
##  returns the image in <H> of an element <elm> of <G>.
DeclareGlobalFunction( "ProjectedPcElement" );

#############################################################################
##
#F  ProjectedInducedPcgs( <pcgs>,<fpcgs>,<ipcgs> )
##
##  <ipcgs> must be an induced pcgs with respect to <pcgs>. This operation
##  returns an induced pcgs with respect to <fpcgs> consisting of the
##  nontrivial images of <ipcgs>.
DeclareGlobalFunction( "ProjectedInducedPcgs" );

#############################################################################
##
#F  LiftedInducedPcgs( <pcgs>,<fpcgs>,<ipcgs>,<ker> )
##
##  <ipcgs> must be an induced pcgs with respect to <fpcgs>. This operation
##  returns an induced pcgs with respect to <pcgs> consisting of the
##  preimages of <ipcgs>, appended by the elements in <ker> (assuming
##  there is a bijection of <pcgs> mod <ker> to <fpcgs>). <ker> might be a
##  simple element list.
DeclareGlobalFunction( "LiftedInducedPcgs" );

#############################################################################
##
#E  pcgs.gd . . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
##
