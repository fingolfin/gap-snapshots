# SPDX-License-Identifier: GPL-2.0-or-later
# Modules: A homalg based package for the Abelian category of finitely presented modules over computable rings
#
# Declarations
#

##  Declaration stuff for a set of relations.

####################################
#
# categories:
#
####################################

# A new GAP-category:

##  <#GAPDoc Label="IsHomalgRelations">
##  <ManSection>
##    <Filt Type="Category" Arg="rel" Name="IsHomalgRelations"/>
##    <Returns><C>true</C> or <C>false</C></Returns>
##    <Description>
##      The &GAP; category of &homalg; relations.
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareCategory( "IsHomalgRelations",
        IsAttributeStoringRep );

## CAUTION: in the code the following two categories are the only ones for sets of generators,
##          i.e. IsHomalgRelations and not IsHomalgRelationsOfLeftModule => IsHomalgRelationsOfRightModule

##  <#GAPDoc Label="IsHomalgRelationsOfLeftModule">
##  <ManSection>
##    <Filt Type="Category" Arg="rel" Name="IsHomalgRelationsOfLeftModule"/>
##    <Returns><C>true</C> or <C>false</C></Returns>
##    <Description>
##      The &GAP; category of &homalg; relations of a left module. <P/>
##      (It is a subcategory of the &GAP; category <C>IsHomalgRelations</C>.)
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareCategory( "IsHomalgRelationsOfLeftModule",
        IsHomalgRelations );

##  <#GAPDoc Label="IsHomalgRelationsOfRightModule">
##  <ManSection>
##    <Filt Type="Category" Arg="rel" Name="IsHomalgRelationsOfRightModule"/>
##    <Returns><C>true</C> or <C>false</C></Returns>
##    <Description>
##      The &GAP; category of &homalg; relations of a right module. <P/>
##      (It is a subcategory of the &GAP; category <C>IsHomalgRelations</C>.)
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareCategory( "IsHomalgRelationsOfRightModule",
        IsHomalgRelations );

####################################
#
# properties:
#
####################################

##  <#GAPDoc Label="CanBeUsedToDecideZeroEffectively">
##  <ManSection>
##    <Prop Arg="rel" Name="CanBeUsedToDecideZeroEffectively"/>
##    <Returns><C>true</C> or <C>false</C></Returns>
##    <Description>
##      Check if the &homalg; set of relations <A>rel</A> can be used for normal form reductions. <Br/>
##      (no method installed)
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty( "CanBeUsedToDecideZeroEffectively",
        IsHomalgRelations );

##  <#GAPDoc Label="IsInjectivePresentation">
##  <ManSection>
##    <Prop Arg="rel" Name="IsInjectivePresentation"/>
##    <Returns><C>true</C> or <C>false</C></Returns>
##    <Description>
##      Check if the &homalg; set of relations <A>rel</A> has zero syzygies.
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty( "IsInjectivePresentation",
        IsHomalgRelations );

##
DeclareProperty( "IsTorsion",
        IsHomalgRelations );

DeclareAttribute( "NrGeneratorsForRelations",
        IsHomalgRelations );

DeclareAttribute( "NrRelationsForRelations",
        IsHomalgRelations );

####################################
#
# attributes:
#
####################################

##
DeclareAttribute( "EvalMatrixOfRelations",
        IsHomalgRelations );

##
DeclareAttribute( "EvaluatedMatrixOfRelations",
        IsHomalgRelations );

####################################
#
# global functions and operations:
#
####################################

# constructors:

DeclareGlobalFunction( "_HomalgRelationsForLeftModule" );

DeclareOperation( "HomalgRelationsForLeftModule",
        [ IsObject, IsObject ] );

DeclareOperation( "HomalgRelationsForLeftModule",
        [ IsObject ] );

DeclareGlobalFunction( "_HomalgRelationsForRightModule" );

DeclareOperation( "HomalgRelationsForRightModule",
        [ IsObject, IsObject ] );

DeclareOperation( "HomalgRelationsForRightModule",
        [ IsObject ] );

# basic operations:

DeclareGlobalFunction( "INSTALL_TODO_LIST_ENTRIES_FOR_MATRICES_OF_RELATIONS" );

DeclareGlobalFunction( "INSTALL_TODO_LIST_ENTRIES_FOR_RELATIONS_OF_MODULES" );

DeclareOperation( "MatrixOfRelations",
        [ IsHomalgRelations ] );

DeclareOperation( "HomalgRing",
        [ IsHomalgRelations ] );

DeclareOperation( "HasNrGenerators",
        [ IsHomalgRelations ] );

DeclareOperation( "NrGenerators",
        [ IsHomalgRelations ] );

DeclareOperation( "HasNrRelations",
        [ IsHomalgRelations ] );

DeclareOperation( "NrRelations",
        [ IsHomalgRelations ] );

DeclareOperation( "CertainRelations",
        [ IsHomalgRelations, IsList ] );

DeclareOperation( "UnionOfRelations",
        [ IsHomalgRelations, IsHomalgRelations ] );

DeclareOperation( "UnionOfRelations",
        [ IsHomalgMatrix, IsHomalgRelations ] );

DeclareOperation( "UnionOfRelations",
        [ IsHomalgRelations, IsHomalgMatrix ] );

DeclareOperation( "BasisOfModule",
        [ IsHomalgRelations ] );

DeclareOperation( "DecideZero",
        [ IsHomalgMatrix, IsHomalgRelations ] );

DeclareOperation( "DecideZero",
        [ IsHomalgRelations, IsHomalgRelations ] );

DeclareOperation( "BasisCoeff",
        [ IsHomalgRelations ] );

DeclareOperation( "RightDivide",
        [ IsHomalgMatrix, IsHomalgMatrix, IsHomalgRelations ] );

DeclareOperation( "LeftDivide",
        [ IsHomalgMatrix, IsHomalgMatrix, IsHomalgRelations ] );

DeclareOperation( "SyzygiesGenerators",
        [ IsHomalgRelations ] );

DeclareOperation( "SyzygiesGenerators",
        [ IsHomalgMatrix, IsHomalgRelations ] );

DeclareOperation( "ReducedSyzygiesGenerators",
        [ IsHomalgRelations ] );

DeclareOperation( "ReducedSyzygiesGenerators",
        [ IsHomalgMatrix, IsHomalgRelations ] );

DeclareOperation( "NonZeroGenerators",
        [ IsHomalgRelations ] );

DeclareOperation( "GetRidOfObsoleteRelations",
        [ IsHomalgRelations ] );

DeclareOperation( "GetIndependentUnitPositions",
        [ IsHomalgRelations, IsHomogeneousList ] );

DeclareOperation( "GetIndependentUnitPositions",
        [ IsHomalgRelations ] );

DeclareOperation( "^",
        [ IsHomalgRelations, IsHomalgMatrix ] );

DeclareOperation( "*",
        [ IsHomalgRelations, IsHomalgMatrix ] );

####################################
#
# synonyms:
#
####################################

DeclareSynonym ( "BetterBasis",
        GetRidOfObsoleteRelations );

