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
