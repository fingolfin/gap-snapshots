#############################################################################
##
#W  algfld.gd                   GAP Library                  Alexander Hulpke
##
#H  @(#)$Id: algfld.gd,v 4.20.2.1 2005/11/26 03:47:07 gap Exp $
##
#Y  Copyright (C)  1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1999 School Math and Comp. Sci., University of St  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file contains the categories,  attributes, properties and operations
##  for algebraic extensions of fields and their elements
Revision.algfld_gd:=
  "@(#)$Id: algfld.gd,v 4.20.2.1 2005/11/26 03:47:07 gap Exp $";

#############################################################################
##
#C  IsAlgebraicElement(<obj>)
##
##  is the category for elements of an algebraic extension.
DeclareCategory( "IsAlgebraicElement", IsScalar);
DeclareCategoryCollections( "IsAlgebraicElement");
DeclareCategoryCollections( "IsAlgebraicElementCollection");
DeclareCategoryCollections( "IsAlgebraicElementCollColl");

#############################################################################
##
#C  IsAlgebraicElementFamily     Category for Families of Algebraic Elements
##
DeclareCategoryFamily( "IsAlgebraicElement" );

#############################################################################
##
#C  IsAlgebraicExtension(<obj>)
##
##  is the category of algebraic extensions of fields.
DeclareCategory( "IsAlgebraicExtension", IsField );


#############################################################################
##
#A  AlgebraicElementsFamilies    List of AlgElm. families to one poly over
##                               different fields
##
DeclareAttribute( "AlgebraicElementsFamilies",
  IsUnivariatePolynomial, "mutable" );

#############################################################################
##
#O  AlgebraicElementsFamily   Create Family of alg elms
##
DeclareOperation( "AlgebraicElementsFamily",
  [IsField,IsUnivariatePolynomial]);

#############################################################################
##
#O  AlgebraicExtension(<K>,<f>)
##
##  constructs an extension <L> of the field <K> by one root of the irreducible
##  polynomial <f>, using Kronecker{\pif}s construction. <L> is a
##  field whose `LeftActingDomain' is <K>. The  polynomial <f> is the
##  `DefiningPolynomial' of <L> and the attribute `RootOfDefiningPolynomial'
##  of <L> holds a root of <f> in <L> (see~"RootOfDefiningPolynomial").
DeclareOperation( "AlgebraicExtension",
  [IsField,IsUnivariatePolynomial]);

#############################################################################
##
#F  MaxNumeratorCoeffAlgElm(<a>)
##
##  maximal (absolute value, in numerator) 
##  coefficient in the representation of algebraic elm. <a>
##
DeclareOperation("MaxNumeratorCoeffAlgElm",[IsScalar]);

#############################################################################
##
#F  DefectApproximation( <K> ) . . . . . . . approximation for defect K, i.e.
##                                      denominators of integer elements in K
##
DeclareAttribute("DefectApproximation",IsAlgebraicExtension);

#############################################################################
##
#F  AlgExtEmbeddedPol(<ext>,<pol>)
##
DeclareGlobalFunction("AlgExtEmbeddedPol");

DeclareGlobalFunction("AlgExtSquareHensel");

#############################################################################
##
#E  algfld.gd . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
##
