################################################################################
##
##  simpcomp / generate.gd
##
##  Generate simplicial complexes or construct them using existing
##  complexes.
##
##  $Id$
##
################################################################################

## GAPDoc include
## <#GAPDoc Label="generate">
## <Section Label="sec:FromScratch">
## <Heading>Creating an <C>SCSimplicialComplex</C> object from a facet list</Heading>
##
##  This section contains functions to generate or to construct new simplicial  complexes. Some of them obtain new complexes from existing ones, some generate  new complexes from scratch.
##
## <#Include Label="SCFromFacets"/>
## <#Include Label="SC"/>
## <#Include Label="SCFromDifferenceCycles"/>
## <#Include Label="SCFromGenerators"/>
##
## </Section>
##
## <Section Label="sec:Standard">
## <Heading>Generating some standard triangulations</Heading>
##
## <#Include Label="SCBdCrossPolytope"/>
## <#Include Label="SCBdCyclicPolytope"/>
## <#Include Label="SCBdSimplex"/>
## <#Include Label="SCEmpty"/>
## <#Include Label="SCSimplex"/>
## <#Include Label="SCFVectorBdCrossPolytope"/>
## <#Include Label="SCFVectorBdCyclicPolytope"/>
## <#Include Label="SCFVectorBdSimplex"/>
## </Section>
##
## <Section Label="sec:Series">
## <Heading>Generating infinite series of transitive triangulations</Heading>
##
## <#Include Label="SCSeriesAGL"/>
## <#Include Label="SCSeriesBdHandleBody"/>
## <#Include Label="SCSeriesBid"/>
## <#Include Label="SCSeriesC2n"/>
## <#Include Label="SCSeriesCSTSurface"/>
## <#Include Label="SCSeriesD2n"/>
## <#Include Label="SCSeriesHandleBody"/>
## <#Include Label="SCSeriesK"/>
## <#Include Label="SCSeriesKu"/>
## <#Include Label="SCSeriesL"/>
## <#Include Label="SCSeriesLe"/>
## <#Include Label="SCSeriesPrimeTorus"/>
##
## </Section >
## <Section Label="sec:generateFromOld">
## <Heading>Generating new complexes from old</Heading>
##
## <#Include Label="SCCartesianPower"/>
## <#Include Label="SCCartesianProduct"/>
## <#Include Label="SCConnectedComponents"/>
## <#Include Label="SCConnectedProduct"/>
## <#Include Label="SCConnectedSum"/>
## <#Include Label="SCConnectedSumMinus"/>
## <#Include Label="SCDifferenceCycleCompress"/>
## <#Include Label="SCDifferenceCycleExpand"/>
## <#Include Label="SCStronglyConnectedComponents"/>
## 
## </Section>
##
## <#Include Label="fromgroup"/>
##
## <#/GAPDoc>

DeclareAttribute("SCConnectedComponents",SCIsPolyhedralComplex);
DeclareAttribute("SCStronglyConnectedComponents",SCIsSimplicialComplex);

DeclareOperation("SCCartesianPower",[SCIsSimplicialComplex,IsInt]);
DeclareOperation("SCCartesianProduct",[SCIsSimplicialComplex,SCIsSimplicialComplex]);
DeclareOperation("SCConnectedProduct",[SCIsSimplicialComplex,IsInt]);
DeclareOperation("SCConnectedSum",[SCIsSimplicialComplex,SCIsSimplicialComplex]);
DeclareOperation("SCConnectedSumMinus",[SCIsSimplicialComplex,SCIsSimplicialComplex]);
DeclareOperation("SCFromDifferenceCycles",[IsList]);
DeclareOperation("SCFromGenerators",[IsPermGroup,IsList]);

DeclareGlobalFunction("SCBdCrossPolytope");
DeclareGlobalFunction("SCBdCyclicPolytope");
DeclareGlobalFunction("SCBdSimplex");
DeclareGlobalFunction("SCDifferenceCycleCompress");
DeclareGlobalFunction("SCDifferenceCycleExpand");
DeclareGlobalFunction("SCEmpty");
DeclareGlobalFunction("SCFVectorBdCrossPolytope");
DeclareGlobalFunction("SCFVectorBdCyclicPolytope");
DeclareGlobalFunction("SCFVectorBdSimplex");
DeclareGlobalFunction("SCSeriesAGL");
DeclareGlobalFunction("SCSeriesBdHandleBody");
DeclareGlobalFunction("SCSeriesBid");
DeclareGlobalFunction("SCSeriesC2n");
DeclareGlobalFunction("SCSeriesCSTSurface");
DeclareGlobalFunction("SCSeriesD2n");
DeclareGlobalFunction("SCSeriesHandleBody");
DeclareGlobalFunction("SCSeriesK");
DeclareGlobalFunction("SCSeriesKu");
DeclareGlobalFunction("SCSeriesL");
DeclareGlobalFunction("SCSeriesLe");
DeclareGlobalFunction("SCSeriesNSB1");
DeclareGlobalFunction("SCSeriesNSB2");
DeclareGlobalFunction("SCSeriesNSB3");
DeclareGlobalFunction("SCSeriesPrimeTorus");
DeclareGlobalFunction("SCSimplex");
