#############################################################################
##
#W  solmxgrp.gd			GAP Library		       Gene Cooperman
#W							     and Scott Murray
##
#H  @(#)$Id: solmxgrp.gd,v 4.7 2002/04/15 10:05:22 sal Exp $
##
#Y  Copyright (C)  1996,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1999 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  Computing with soluble matrix groups, as described in 
##  E. Luks, Computing in Solvable Matrix Groups, FOCS/STOC.
##
##  Note:  This code is incomplete (in fact we only deal with nilpotent 
##  groups) and should be considered experimental.
##
Revision.solmxgrp_gd :=
    "@(#)$Id: solmxgrp.gd,v 4.7 2002/04/15 10:05:22 sal Exp $";


#############################################################################
##
#F  SetIsCyclicWithSize( <G>, <gen>, <size> )
##
##  IMPORTANT:  Never SetIsCylic() without also setting size.
##
DeclareGlobalFunction( "SetIsCyclicWithSize", 
    [ IsGroup, IsAssociativeElement, IsInt ] );

#############################################################################
##
#F  ConjugateMatrixActionToLinearAction( <g> )
##
##  Action on Span( G ), for G a matrix group.
##  Given d x d matrix acting by conj., g, return d^2 x d^2 matrix acting 
##  linearly.
##  Could probably be done better via GAP with something like (not correct
##  here):
##   hom := OperationAlgebraHomomorphism( AsAlgebra(G), GF(q)^(d^2), x->x^g)
##   ImageElm( hom, g );
##
DeclareGlobalFunction( "ConjugateMatrixActionToLinearAction",
    [ IsAssociativeElement ] );

#############################################################################
##
#F  ConjugateMatrixGroupToLinearAction( <G> )
##
DeclareGlobalFunction( "ConjugateMatrixGroupToLinearAction",
    [ IsFFEMatrixGroup ] );

#############################################################################
##
#O  MakeHomChain( <G> )
##
##  Computes a chain of subgroups for the group <G> which are kernels of 
##  homomorphisms.
##  Currently only implemented for nilpotent groups.  We use the algorithm of
##  E. Luks, Computing in Solvable Matrix Groups, FOCS/STOC.
##
DeclareOperation( "MakeHomChain", [ IsGroup ] );

##  DeclareOperation( "MakeHomChain",
##      [ IsFFEMatrixGroup and IsAbelian and IsPGroup ] );

#############################################################################
##
#A  BasisOfHomCosetAddMatrixGroup( <G> )
##
##  We'll do Gaussian elimination ourselves.
##  GAP has V := VectorSpace(FieldOfMatrixGroup(quo), GeneratorsOfGroup(quo));
##     but GAP wants to know Dimension(V) and Basis(V) first, and
##     there seems to be no way to bootstrap up by giving GAP first
##     some linearly dependent elements.
##  LeftModuleByGenerators() also works, but again, GAP refuses to find
##      a basis for it.
##  SemiEchelonBasis(V) fails with UseSubsetRelation(arg[1], S);
##     in SubmoduleNC()
##  RETURN:  rec(basis, residue), where G generated by basis and residue
##     basis is set of indep. gen's of G;  residue elt's all satisfy
##     IsOne(residue), but they can be useful if this was a quotient group
##
DeclareAttribute( "BasisOfHomCosetAddMatrixGroup",
                  IsGroup and IsQuotientToAdditiveGroup );
DeclareAttribute( "BasisOfHomCosetAddMatrixGroup",
                  IsAdditiveGroup );
DeclareGlobalFunction( "BasisOfHomCosetAddMatrixGroupFnc" );

#############################################################################
##
#F  SiftVector( <basisVecList>, <vec> )
#F  SiftVector( <basisVecList> )
##
##    SiftVector(basisVecList,vec) sifts vec through basisVecList
##    SiftVector(basisVecList) returns a fnc to sift vec through basisVecList
##  So:  SiftVector(basisVecList)(vec) = SiftVector(basisVecList,vec)
##  This relies on basis for which each successive basis "vector"
##    has more leading zeroes than previous one
##
DeclareGlobalFunction( "SiftVector" );

#############################################################################
##
#A  SiftFunction( <G> )
##
DeclareAttribute( "SiftFunction", IsGroup and IsAdditiveGroup );
DeclareAttribute( "SiftFunction", IsGroup and IsQuotientToAdditiveGroup );
DeclareAttribute( "SiftFunction",
                  IsGroup and IsFFEMatrixGroup and IsCyclic and IsPGroup );


#############################################################################
#############################################################################
##
##  Abelian matrix p-groups:
##
#############################################################################
#############################################################################

#############################################################################
##
#O  InvariantSubspaceOrCyclicGroup( <H> )
##
##  Returns either an invariant subspace or a cyclic group.
##  Prefers to return invariant subspace. 
##  Hence, if it returns a cyclic group, the cyclic group is uniform.
##
DeclareOperation( "InvariantSubspaceOrCyclicGroup",
    [ IsFFEMatrixGroup and IsAbelian ] );
DeclareOperation( "InvariantSubspaceOrCyclicGroup", [ IsTrivial ] );

#############################################################################
##
#O  InvariantSubspaceOrUniformCyclicPGroup( <G> )
##
##  Returns either an invariant subspace or a uniform cyclic $p$-group.
##
DeclareOperation( "InvariantSubspaceOrUniformCyclicPGroup", 
    [ IsFFEMatrixGroup ] );

#############################################################################
##
#O  KernelOfHomQuotientGroup( <quo> )
##
##  Sets kernel of Homomorphism(quo) for IsHomQuotientGroup
##  when image is abelian.
##  (This would be useful as a method for Kernel, for the homomorphism.)
##
DeclareOperation( "KernelOfHomQuotientGroup",
                  [ IsHomQuotientGroup and IsAbelian ] );

#############################################################################
#############################################################################
##
##  Cyclic matrix p-groups:
##  Exports:  Size, IN, Random, Enumerator, Sift
##  Internal:  GeneratorOfCyclicGroup, TrivialQuotientSubgroup (presentation)
##
#############################################################################
#############################################################################

#############################################################################
##
#M  Size( <grp> )
##
InstallImmediateMethod(Size, HasGeneratorOfCyclicGroup, 0,
                       grp->Order(GeneratorOfCyclicGroup(grp)) );

#############################################################################
##
#O  Sift( <G> )
##
DeclareOperation( "Sift", [ IsFFEMatrixGroup and IsCyclic and IsPGroup,
                            IsMultiplicativeElementWithInverse ] );

#############################################################################
##
#O  TrivialQuotientSubgroup( <> )
##
##  TrivialQuotientSubgroup could be an attribute
##
DeclareOperation( "TrivialQuotientSubgroup", [ IsGroup ] );


#############################################################################
#############################################################################
##
##  Nilpotent matrix groups:
##
#############################################################################
#############################################################################

#############################################################################
##
#P  CanFindNilpotentClassTwoElement( <G> )
##
##  A nilpotent class 2 elt, g in G, satisfies:  [G,g] contained in Center(G)
##                                              and g not in Center(G)
##  This function guaranteed to succeed for non-abelian nilpotent groups,
##     but it may succeed for other groups, too.
##
DeclareProperty( "CanFindNilpotentClassTwoElement", IsGroup );

#############################################################################
##
#A  NilpotentClassTwoElement( <G> )
##
DeclareAttribute( "NilpotentClassTwoElement", IsGroup );

#############################################################################
##
#F  NaturalHomomorphismByNilpotentClassTwoElement( <G> )
##
DeclareGlobalFunction( "NaturalHomomorphismByNilpotentClassTwoElement",
    [ IsFFEMatrixGroup ] );


#############################################################################
##
#E  solmxgrp.gd . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
##
