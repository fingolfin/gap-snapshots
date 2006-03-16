#############################################################################
##
#W  ratfun.gd                   GAP Library                      Frank Celler
#W                                                           Alexander Hulpke
##
#H  @(#)$Id: ratfun.gd,v 4.64.2.3 2005/10/26 16:18:04 gap Exp $
##
#Y  Copyright (C)  1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci.,  University of St  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file contains the categories,  attributes, properties and operations
##  for  rational functions, Laurent polynomials   and polynomials and  their
##  families.
Revision.ratfun_gd :=
    "@(#)$Id: ratfun.gd,v 4.64.2.3 2005/10/26 16:18:04 gap Exp $";

##  Warning:
##  If the mechanism for storing attributes is changed,
##  `LaurentPolynomialByExtRep' must be changed as well.
##  Also setter methods for coefficients and/or indeterminate number will be
##  ignored when creating Laurent polynomials.
##  (This is ugly and inconsistent, but crucial to get speed. ahulpke, May99)

#############################################################################
##
#I  InfoPoly
##
DeclareInfoClass( "InfoPoly" );

#############################################################################
##
#C  IsPolynomialFunction(<obj>)
#C  IsRationalFunction(<obj>)
##
##  A polynomial function is an element of a polynomial ring (not
##  necessarily an UFD).
##
##  A rational function is an element of the quotient field of a polynomial
##  ring over an UFD. It is represented as a quotient of two polynomials,
##  its numerator (see~"NumeratorOfRationalFunction") and
##  its denominator (see~"DenominatorOfRationalFunction")
DeclareCategory( "IsPolynomialFunction", IsRingElementWithInverse and IsZDFRE);
DeclareCategory( "IsRationalFunction", IsPolynomialFunction);

DeclareCategoryCollections( "IsPolynomialFunction" );
DeclareCategoryCollections( "IsRationalFunction" );

#############################################################################
##
#C  IsPolynomialFunctionsFamilyElement(<obj>)
#C  IsRationalFunctionsFamilyElement(<obj>)
##
##  A polynomial is an element of a polynomial functions family. If the
## underlying domain is an UFD, it is even a
## `IsRationalFunctionsFamilyElement'.
DeclareCategory("IsPolynomialFunctionsFamilyElement",IsPolynomialFunction);
DeclareCategory("IsRationalFunctionsFamilyElement", 
  IsRationalFunction and IsPolynomialFunctionsFamilyElement );

#############################################################################
##
#C  IsPolynomialFunctionsFamily(<obj>)
#C  IsRationalFunctionsFamily(<obj>)
##
##  `IsPolynomialFunctionsFamily' is the category of a family of polynomials.
##  For families over an UFD, the category becomes
##  `IsRationalFunctionsFamily' (as rational functions and quotients are only
##  provided for families over an UFD.)
##
#T  1996/10/14 fceller can this be done with `CategoryFamily'?
##
DeclareCategory( "IsPolynomialFunctionsFamily", IsFamily );
DeclareCategory( "IsRationalFunctionsFamily", IsPolynomialFunctionsFamily and IsUFDFamily );

#############################################################################
##
#C  IsRationalFunctionOverField(<obj>)
##
##  Indicates that the coefficients family for the rational function <obj>
##  is a field. In this situation it is permissible to move coefficients
##  from the denominator in the numerator, in particular the quotient of a
##  polynomial by a coefficient is again a polynomial. This last property
##  does not necessarily hold for polynomials over arbitrary rings.
DeclareCategory("IsRationalFunctionOverField", IsRationalFunction );

#############################################################################
##
#A  RationalFunctionsFamily( <fam> )
##
##  creates a   family  containing rational functions  with   coefficients
##  in <fam>. 
##  All elements of the `RationalFunctionsFamily' are rational functions
##  (see~"IsRationalFunction").
DeclareAttribute( "RationalFunctionsFamily", IsFamily );

#############################################################################
##
#A  CoefficientsFamily( <rffam> )
##
##  If <rffam> has been created as `RationalFunctionsFamily(<cfam>)' this
##  attribute holds the coefficients family <cfam>.
DeclareAttribute( "CoefficientsFamily", IsFamily );

#############################################################################
##
#A  NumeratorOfRationalFunction( <ratfun> )
##
##  returns the nominator of the rational function <ratfun>.
##
##  As no proper multivariate gcd has been implemented yet, numerators and
##  denominators are not guaranteed to be reduced!
##
DeclareAttribute( "NumeratorOfRationalFunction", IsPolynomialFunction);

#############################################################################
##
#A  DenominatorOfRationalFunction( <ratfun> )
##
##  returns the denominator of the rational function <ratfun>.
##
##  As no proper multivariate gcd has been implemented yet, numerators and
##  denominators are not guaranteed to be reduced!
##
DeclareAttribute( "DenominatorOfRationalFunction", IsRationalFunction );

#############################################################################
##
#P  IsPolynomial( <ratfun> )
##
##  A polynomial is a rational functions whose  denominator is one. (If the
##  coefficients family forms a field this is equivalent to the denominator
##  being constant.)
##
##  If the base family is not a field, it may be impossible to represent the
##  quotient of a polynomial by a ring element as a polynomial again, but it
##  will have to be represented as a rational function.
##
DeclareProperty( "IsPolynomial", IsPolynomialFunction );


#############################################################################
##
#A  AsPolynomial( <poly> )
##
##  If <poly> is a rational function that is a polynomial this attribute
##  returns an equal rational function <p> such that <p> is equal to its
##  numerator and the denominator of <p> is one.
##
DeclareAttribute( "AsPolynomial",
  IsPolynomialFunction and IsPolynomial);

#############################################################################
##
#P  IsUnivariateRationalFunction( <ratfun> )
##
##  A rational function is univariate if its numerator and its denominator
##  are both polynomials in the same one indeterminate. The attribute
##  `IndeterminateNumberOfUnivariateRationalFunction' can be used to obtain
##  the number of this common indeterminate.
DeclareProperty( "IsUnivariateRationalFunction", IsRationalFunction );

#############################################################################
##
#P  IsUnivariatePolynomial( <ratfun> )
##
##  A univariate polynomial is a polynomial in only one indeterminate.
DeclareSynonymAttr("IsUnivariatePolynomial",
  IsPolynomial and IsUnivariateRationalFunction);

#############################################################################
##
#P  IsLaurentPolynomial( <ratfun> )
##
##  A Laurent polynomial is a univariate rational function whose denominator
##  is a monomial. Therefore every univariate polynomial is a
##  Laurent polynomial.
##
DeclareProperty( "IsLaurentPolynomial", IsPolynomialFunction );

InstallTrueMethod( IsUnivariateRationalFunction,IsLaurentPolynomial );
InstallTrueMethod( IsLaurentPolynomial, IsUnivariatePolynomial );

#############################################################################
##
#P  IsConstantRationalFunction( <ratfun> )
##
##  A  constant  rational   function is  a    function  whose  numerator  and
##  denominator are polynomials of degree 0.
##
DeclareProperty( "IsConstantRationalFunction", IsPolynomialFunction );
InstallTrueMethod( IsUnivariateRationalFunction, IsConstantRationalFunction );

#############################################################################
##
#P  IsZeroRationalFunction( <ratfun> )
##
##  This property indicates whether <ratfun> is the zero element of the
##  field of rational functions.
DeclareSynonymAttr("IsZeroRationalFunction",IsZero and IsPolynomialFunction);

InstallTrueMethod( IsConstantRationalFunction,IsZeroRationalFunction );


#############################################################################
##
#R  IsRationalFunctionDefaultRep(<obj>)
##
##  is the default representation of rational functions. A rational function
##  in this representation is defined by the attributes
##  `ExtRepNumeratorRatFun' and `ExtRepDenominatorRatFun' where
##  `ExtRepNumeratorRatFun' and `ExtRepDenominatorRatFun' are
##  both external representations of a polynomial.
DeclareRepresentation("IsRationalFunctionDefaultRep",
    IsComponentObjectRep and IsAttributeStoringRep and IsRationalFunction,
    ["zeroCoefficient","numerator","denominator"] );


#############################################################################
##
#R  IsPolynomialDefaultRep(<obj>)
##
##  is the default representation of polynomials. A polynomial
##  in this representation is defined by the components
##  and `ExtRepNumeratorRatFun' where `ExtRepNumeratorRatFun' is the
##  external representation of the polynomial.
DeclareRepresentation("IsPolynomialDefaultRep",
    IsComponentObjectRep and IsAttributeStoringRep 
    and IsPolynomialFunction and IsPolynomial,["zeroCoefficient","numerator"]);


#############################################################################
##
#R  IsLaurentPolynomialDefaultRep(<obj>)
##
##  This representation is used for Laurent polynomials and univariate
##  polynomials. It represents a Laurent polynomial via the attributes
##  `CoefficientsOfLaurentPolynomial'
##  (see~"CoefficientsOfLaurentPolynomial") and
##  `IndeterminateNumberOfLaurentPolynomial'
##  (see~"IndeterminateNumberOfLaurentPolynomial").
DeclareRepresentation("IsLaurentPolynomialDefaultRep",
    IsComponentObjectRep and IsAttributeStoringRep
    and IsPolynomialFunction and IsLaurentPolynomial, [] );

#############################################################################
##
#R  IsUnivariateRationalFunctionDefaultRep(<obj>)
##
##  This representation is used for univariate rational functions
##  polynomials. It represents a univariate rational function via the attributes
##  `CoefficientsOfUnivariateRationalFunction'
##  (see~"CoefficientsOfUnivariateRationalFunction") and
##  `IndeterminateNumberOfUnivariateRationalFunction'
##  (see~"IndeterminateNumberOfUnivariateRationalFunction").
DeclareRepresentation("IsUnivariateRationalFunctionDefaultRep",
    IsComponentObjectRep and IsAttributeStoringRep
    and IsPolynomialFunction and IsUnivariateRationalFunction, [] );


#1 
##  \index{External representation of polynomials}
##  The representation of a polynomials is a list of the form
##  `[<mon>,<coeff>,<mon>,<coeff>,...]' where <mon> is a monomial in
##  expanded form (that is given as list) and <coeff> its coefficient. The
##  monomials must be sorted according to the total degree/lexicographic
##  order (This is the same as given by the ``grlex'' monomial ordering,
##  see~"MonomialGrlexOrdering"). We call
##  this the *external representation* of a polynomial. (The
##  reason for ordering is that addition of polynomials becomes linear in
##  the number of monomials instead of quadratic; the reason for the
##  particular ordering chose is that it is compatible with multiplication
##  and thus gives acceptable performance for quotient calculations.)


#3
##  The operations `LaurentPolynomialByCoefficients'
##  (see~"LaurentPolynomialByCoefficients"),
##  `PolynomialByExtRep' and `RationalFunctionByExtRep' are used to
##  construct objects in the three basic representations for rational
##  functions.

#############################################################################
##
#A  ExtRepNumeratorRatFun( <ratfun> )
##
##  returns the external representation of the numerator polynomial of the
##  rational function <ratfun>. Numerator and Denominator are not guaranteed
##  to be cancelled against each other.
DeclareAttribute("ExtRepNumeratorRatFun",IsPolynomialFunction);

#############################################################################
##
#A  ExtRepDenominatorRatFun( <ratfun> )
##
##  returns the external representation of the denominator polynomial of the
##  rational function <ratfun>. Numerator and Denominator are not guaranteed
##  to be cancelled against each other.
DeclareAttribute("ExtRepDenominatorRatFun",IsRationalFunction);

#############################################################################
##
#O  ZeroCoefficientRatFun( <ratfun> )
##
##  returns the zero of the coefficient ring. This might be needed to
##  represent the zero polynomial for which the external representation of
##  the numerator is the empty list.
DeclareOperation("ZeroCoefficientRatFun",[IsPolynomialFunction]);

#############################################################################
##
#A  ExtRepPolynomialRatFun( <polynomial> )
##
##  returns the external representation of a polynomial. The difference to
##  `ExtRepNumeratorRatFun' is that rational functions might know to be a
##  polynomial but can still have a non-vanishing denominator. In this case
##  `ExtRepPolynomialRatFun' has to call a quotient routine.
DeclareAttribute("ExtRepPolynomialRatFun",IsPolynomialFunction and IsPolynomial);

#############################################################################
##
#A  CoefficientsOfLaurentPolynomial( <laurent> )
##
##  For a Laurent polynomial this function returns a pair `[<cof>, <val>]',
##  consisting of the coefficient list (in ascending order) <cof> and the
##  valuation <val> of the Laurent polynomial <laurent>.
##
DeclareAttribute( "CoefficientsOfLaurentPolynomial",
    IsLaurentPolynomial );
DeclareSynonym( "CoefficientsOfUnivariateLaurentPolynomial",
  CoefficientsOfLaurentPolynomial);

#############################################################################
##
#A  IndeterminateNumberOfUnivariateRationalFunction( <rfun> )
##
##  returns the number of the indeterminate in which the univariate rational
##  function <rfun> is expressed. (This also provides a way to obtain the
##  number of a given indeterminate.)
##
##  A constant rational function might not possess an indeterminate number. In
##  this case `IndeterminateNumberOfUnivariateRationalFunction' will
##  default to a value of 1.
##  Therefore two univariate polynomials may be considered to be in the same
##  univariate polynomial ring if their indeterminates have the same number
##  or one if of them is constant.  (see also~"CIUnivPols"
##  and~"IsLaurentPolynomialDefaultRep").
DeclareAttribute( "IndeterminateNumberOfUnivariateRationalFunction",
    IsUnivariateRationalFunction );

#2
##  Algorithms should use only the attributes `ExtRepNumeratorRatFun',
##  `ExtRepDenominatorRatFun',
##  `ExtRepPolynomialRatFun', `CoefficientsOfLaurentPolynomial' and -- if
##  the univariate function is not constant --
##  `IndeterminateNumberOfUnivariateRationalFunction' as the low-level
##  interface to work with a polynomial. They should not refer to the actual
##  representation used.

#############################################################################
##
#O  LaurentPolynomialByCoefficients( <fam>, <cofs>, <val> [,<ind>] )
##
##  constructs a Laurent polynomial over the coefficients
##  family <fam> and in the indeterminate <ind> (defaulting to 1) with
##  the coefficients given by <coefs> and valuation <val>.
DeclareOperation( "LaurentPolynomialByCoefficients",
    [ IsFamily, IsList, IsInt, IsInt ] );
DeclareSynonym( "UnivariateLaurentPolynomialByCoefficients",
  LaurentPolynomialByCoefficients);

#############################################################################
##
#F  LaurentPolynomialByExtRep( <fam>, <cofs>,<val> ,<ind> )
#F  LaurentPolynomialByExtRepNC( <fam>, <cofs>,<val> ,<ind> )
##
##  creates a Laurent polynomial in the family <fam> with [<cofs>,<val>] as
##  value of `CoefficientsOfLaurentPolynomial'. No coefficient shifting is
##  performed.  This is the lowest level function to create a Laurent
##  polynomial but will rely on the coefficients being shifted properly and
##  will not perform any tests. Unless this is guaranteed for the
##  parameters, `LaurentPolynomialByCoefficients'
##  (see~"LaurentPolynomialByCoefficients") should be used.
DeclareGlobalFunction( "LaurentPolynomialByExtRepNC");
DeclareSynonym("LaurentPolynomialByExtRep",LaurentPolynomialByExtRepNC);

#############################################################################
##
#F  PolynomialByExtRep( <rfam>, <extrep> )
#F  PolynomialByExtRepNC( <rfam>, <extrep> )
##
##  constructs a polynomial (in the representation `IsPolynomialDefaultRep')
##  in the rational function family <rfam>, the polynomial itself is given
##  by the external representation <extrep>.
##
##  The variant `PolynomialByExtRepNC' does not perform any test of
##  the arguments and thus potentially can create illegal objects. It only
##  should be used if speed is required and the arguments are known to be
##  in correct form.
DeclareGlobalFunction( "PolynomialByExtRep" );
DeclareGlobalFunction( "PolynomialByExtRepNC" );

#############################################################################
##
#F  RationalFunctionByExtRep( <rfam>, <num>, <den> )
#F  RationalFunctionByExtRepNC( <rfam>, <num>, <den> )
##
##  constructs a rational function (in the representation
##  `IsRationalFunctionDefaultRep') in the rational function family <rfam>,
##  the rational function itself is given by the external representations
##  <num> and <den> for numerator and denominator.
##  No cancellation takes place.
##
##  The variant `RationalFunctionByExtRepNC' does not perform any test of
##  the arguments and thus potentially can create illegal objects. It only
##  should be used if speed is required and the arguments are known to be
##  in correct form.
DeclareGlobalFunction( "RationalFunctionByExtRep" );
DeclareGlobalFunction( "RationalFunctionByExtRepNC" );

#############################################################################
##
#F  UnivariateRationalFunctionByExtRep(<fam>,<ncof>,<dcof>,<val> ,<ind> )
#F  UnivariateRationalFunctionByExtRepNC(<fam>,<ncof>,<dcof>,<val> ,<ind> )
##
##  creates a univariate rational function in the family <fam> with
##  [<ncof>,<dcof>,<val>] as
##  value of `CoefficientsOfUnivariateRationalFunction'. No coefficient
##  shifting is performed.  This is the lowest level function to create a
##  univariate rational function but will rely on the coefficients being
##  shifted properly. Unless this is
##  guaranteed for the parameters,
##  `UnivariateLaurentPolynomialByCoefficients'
##  (see~"UnivariateLaurentPolynomialByCoefficients") should be used.
##  No cancellation is performed.
##
##  The variant `UnivariateRationalFunctionByExtRepNC' does not perform any test of
##  the arguments and thus potentially can create illegal objects. It only
##  should be used if speed is required and the arguments are known to be
##  in correct form.
DeclareGlobalFunction( "UnivariateRationalFunctionByExtRepNC");
DeclareSynonym("UnivariateRationalFunctionByExtRep",
  UnivariateRationalFunctionByExtRepNC);

#############################################################################
##
#F  RationalFunctionByExtRepWithCancellation( <rfam>, <num>, <den> )
##
##  constructs a rational function as `RationalFunctionByExtRep' does but
##  tries to cancel out common factors of numerator and denominator, calling
##  `TryGcdCancelExtRepPolynomials'.
DeclareGlobalFunction( "RationalFunctionByExtRepWithCancellation" );

#############################################################################
##
#A  IndeterminateOfUnivariateRationalFunction( <rfun> )
##
##  returns the indeterminate in which the univariate rational
##  function <rfun> is expressed. (cf.
##  "IndeterminateNumberOfUnivariateRationalFunction".)
DeclareAttribute( "IndeterminateOfUnivariateRationalFunction",
    IsUnivariateRationalFunction );
DeclareSynonym("IndeterminateOfLaurentPolynomial",
  IndeterminateOfUnivariateRationalFunction);

#############################################################################
##
#F  IndeterminateNumberOfLaurentPolynomial(<pol>)
##
##  Is a synonym for `IndeterminateNumberOfUnivariateRationalFunction'
##  (see~"IndeterminateNumberOfUnivariateRationalFunction").
DeclareSynonymAttr("IndeterminateNumberOfLaurentPolynomial",
  IndeterminateNumberOfUnivariateRationalFunction);
DeclareSynonymAttr("IndeterminateNumberOfUnivariateLaurentPolynomial",
  IndeterminateNumberOfUnivariateRationalFunction);

#############################################################################
##
#O  IndeterminateName(<fam>,<nr>)
#O  HasIndeterminateName(<fam>,<nr>)
#O  SetIndeterminateName(<fam>,<nr>,<name>)
##
##  `SetIndeterminateName' assigns the name <name> to indeterminate <nr>
##  in the rational functions family <fam>. It issues an error if the
##  indeterminate was already named.
##
##  `IndeterminateName' returns the name of the <nr>-th indeterminate (and
##  returns `fail' if no name has been assigned).
## 
##  `HasIndeterminateName' tests whether indeterminate <nr> has already been
##  assigned a name 
DeclareOperation( "IndeterminateName",
  [IsPolynomialFunctionsFamily,IsPosInt]);
DeclareOperation( "HasIndeterminateName",
  [IsPolynomialFunctionsFamily,IsPosInt]);
DeclareOperation( "SetIndeterminateName",
  [IsPolynomialFunctionsFamily,IsPosInt,IsString]);



#############################################################################
##
#A  CoefficientsOfUnivariatePolynomial( <pol> )
##
##  `CoefficientsOfUnivariatePolynomial'  returns  the     coefficient   list
##  of the polynomial <pol>, sorted in ascending order.
##
DeclareAttribute("CoefficientsOfUnivariatePolynomial",IsUnivariatePolynomial);

#############################################################################
##
#A  DegreeOfLaurentPolynomial( <pol> )
##
##  The degree of a univariate (Laurent) polynomial <pol> is the largest
##  exponent $n$ of a monomial $x^n$ of <pol>.
DeclareAttribute( "DegreeOfLaurentPolynomial",
    IsLaurentPolynomial );
DeclareSynonym( "DegreeOfUnivariateLaurentPolynomial",
  DegreeOfLaurentPolynomial);

#############################################################################
##
#O  UnivariatePolynomialByCoefficients( <fam>, <cofs>, <ind> )
##
##  constructs an univariate polynomial over the coefficients family
##  <fam> and in the indeterminate <ind> with the coefficients given by
##  <coefs>. This function should be used in algorithms to create
##  polynomials as it avoids overhead associated with
##  `UnivariatePolynomial'.
DeclareOperation( "UnivariatePolynomialByCoefficients",
    [ IsFamily, IsList, IsInt ] );


#############################################################################
##
#O  UnivariatePolynomial( <ring>, <cofs>[, <ind>] )
##
##  constructs an univariate polynomial over the ring <ring> in the
##  indeterminate <ind> with the coefficients given by <coefs>.
DeclareOperation( "UnivariatePolynomial",
  [ IsRing, IsRingElementCollection, IsPosInt ] );

#############################################################################
##
#A  CoefficientsOfUnivariateRationalFunction( <rfun> )
##
## if <rfun> is a univariate rational function, this attribute
##  returns a list [<ncof>,<dcof>,<val>] where <ncof> and <dcof> are
##  coefficient lists of univariate polynomials <n> and <d> and a valuation
##  <val> such that $<rfun>=x^{<val>}\cdot<n>/<d>$ where $x$ is the variable
##  with the number given by
##  "IndeterminateNumberOfUnivariateRationalFunction". Numerator and
##  Denominator are guaranteed to be cancelled.
DeclareAttribute( "CoefficientsOfUnivariateRationalFunction",
    IsUnivariateRationalFunction );

#############################################################################
##
#O  UnivariateRationalFunctionByCoefficients(<fam>,<ncof>,<dcof>,<val>[,<ind>])
##
##  constructs a univariate rational function over the coefficients
##  family <fam> and in the indeterminate <ind> (defaulting to 1) with
##  numerator and denominator coefficients given by <ncof> and <dcof> and
##  valuation <val>.
DeclareOperation( "UnivariateRationalFunctionByCoefficients",
    [ IsFamily, IsList, IsList, IsInt, IsInt ] );

#############################################################################
##
#O  Value(<ratfun>,<indets>,<vals>[,<one>])
#O  Value(<upol>,<value>[,<one>])
##
##  The first variant takes a rational function <ratfun> and specializes the
##  indeterminates given in <indets> to the values given in <vals>,
##  replacing the $i$-th indeterminate $<indets>_i$ by $<vals>_i$. If this
##  specialization results in a constant polynomial, an element of the
##  coefficient ring is returned. If the specialization would specialize
##  the denominator of <ratfun> to zero, an error is raised.
##
##  A variation is the evaluation at elements of another ring $R$, for which
##  a multiplication with elements of the coefficient ring of <ratfun> are
##  defined. In this situation the identity element of $R$ may be given by a
##  further argument <one> which will be used for $x^0$ for any specialized
##  indeterminate $x$.
##
##  The second version takes an univariate rational function and specializes
##  the value of its indeterminate to <val>. Again, an optional argument
##  <one> may be given.
DeclareOperation("Value",[IsPolynomialFunction,IsList,IsList]);

#############################################################################
##
#F  OnIndeterminates(<poly>,<perm>) 
##                               
##  A permutation <perm> acts on the multivariate polynomial <poly> by
##  permuting the indeterminates as it permutes points.
DeclareGlobalFunction("OnIndeterminates");

#############################################################################
##
#F ConstituentsPolynomial(<pol>)
##                               
##  Given a polynomial <pol> this function returns a record with components
##  `variables': A list of the variables occuring in <pol>, `monomials': A
##  listr of the monomials in <pol>, and `coefficients': A (corresponding)
##  list of coefficients. 
DeclareGlobalFunction("ConstituentsPolynomial");

#4
##  \index{Expanded form of monomials}
##  A monomial is a product of powers of indeterminates. A monomial is
##  stored as a list (we call this the *expanded form* of the monomial)
##  of the form `[<inum>,<exp>,<inum>,<exp>,...]' where each <inum>
##  is the number of an indeterminate and <exp> the corresponding exponent.
##  The list must be sorted according to the numbers of the indeterminates.
##  Thus for example, if $x$, $y$ and $z$ are the first three indeterminates,
##  the expanded form of the monomial $x^5z^8=z^8x^5$ is `[1,5,3,8]'.

#############################################################################
##
#F  MonomialExtGrlexLess(<a>,<b>)
##
##  implements comparison of monomial in their external representation by a 
##  ``grlex'' order with $x_1>x_2$
##  (This is exactly the same as the ordering by
##  `MonomialGrlexOrdering()', see~ "Monomial Orderings").
##  The function takes two
##  monomials <a> and <b> in expanded form and returns whether the first is
##  smaller than the second. (This ordering is also used by {\GAP}
##  internally for representing polynomials as a linear combination of
##  monomials.)
##
##  See section~"The Defining Attributes of Rational Functions" for details
##  on the expanded form of monomials.
DeclareGlobalFunction("MonomialExtGrlexLess");

#############################################################################
##
#F  LeadingMonomial(<pol>)  . . . . . . . .  leading monomial of a polynomial
##
##  returns the leading monomial (with respect to the ordering given by
##  "MonomialExtGrlexLess" of the polynomial <pol> as a list
##  containing indeterminate numbers and exponents.
##
DeclareOperation( "LeadingMonomial", [ IsPolynomialFunction ] );

#############################################################################
##
#O  LeadingCoefficient( <pol> )
##
##  returns the leading coefficient (that is the coefficient of the leading
##  monomial, see~"LeadingMonomial") of the polynomial <pol>.
##
DeclareOperation("LeadingCoefficient", [IsPolynomialFunction]);

#############################################################################
##
#F  LeadingMonomialPosExtRep(<fam>,<ext>,<order>)
##
##  This function takes an external representation <ext> of a polynomial in
##  family <fam> and returns the position of the leading monomial in <ext>
##  with respect to the monomial order implemented by the function <order>.
##
##  See section~"The Defining Attributes of Rational Functions" for details
##  on the external representation.
DeclareGlobalFunction("LeadingMonomialPosExtRep");

#5
##  The following set of functions consider one indeterminate of a multivariate
##  polynomial specially

#############################################################################
##
#O  PolynomialCoefficientsOfPolynomial( <pol>, <ind> )
#O  PolynomialCoefficientsOfPolynomial( <pol>, <inum> )
##
##  `PolynomialCoefficientsOfPolynomial' returns the coefficient list
##  (whose entries are polynomials not involving the indeterminate <ind>)
##  describing the polynomial <pol> viewed as a polynomial in <ind>. 
##  Instead of <ind> also the indeterminate number <inum> can be given.
##
DeclareOperation( "PolynomialCoefficientsOfPolynomial",
  [ IsPolynomial,IsPosInt]);

#############################################################################
##
#O  DegreeIndeterminate( <pol>,<ind> )
#O  DegreeIndeterminate( <pol>,<inum> )
##
##  returns the degree of the polynomial <pol> in the indeterminate <ind>
##  (respectively indeterminate number <inum>).
##
DeclareOperation("DegreeIndeterminate",[IsPolynomial,IsPosInt]);

#############################################################################
##
#O  Derivative( <ufun> )
#O  Derivative( <ratfun>,<ind> )
#O  Derivative( <ratfun>,<inum> )
##
##  returns the derivative $<upoly>'$ of the univariate rational function
##  <ufun> by its indeterminant. The second version returns the derivative
##  of <ratfun> by the indeterminate <ind> (respectively indeterminate
##  number <inum>) when viewing <ratfun> as univariate in <ind>.
##
DeclareAttribute("Derivative",IsUnivariateRationalFunction);
DeclareOperation("Derivative",[IsPolynomialFunction,IsPosInt]);

#############################################################################
##
#O  Resultant( <pol1>,<pol2>,<inum> )
#O  Resultant( <pol1>,<pol2>,<ind> )
##
##  computes the resultant of the polynomials <pol1> and <pol2> with respect
##  to the indeterminate <ind> or indeterminate number <inum>.
##  The resultant considers <pol1> and <pol2> as univariate in <ind> and
##  returns an element of the corresponding base ring (which might be a
##  polynomial ring).
DeclareOperation( "Resultant",[ IsPolynomial, IsPolynomial, IsPosInt]);

#############################################################################
##
#O  Discriminant( <upol> )
#O  Discriminant( <pol>,<ind> )
#O  Discriminant( <pol>,<inum> )
##
##  returns the discriminant disc($<upoly>$) of the univariate polynomial
##  <upoly> by its indeterminant. The second version returns the
##  discriminant of <pol> by the indeterminate <ind> (respectively
##  indeterminate number <inum>).
##
DeclareOperation("Discriminant",[IsPolynomial]);

#6
##  Technical functions for rational functions

#############################################################################
##
#F  CIUnivPols( <upol>, <upol> )
##
##  This function (whose name stands for
##  ``CommonIndeterminateOfUnivariatePolynomials'') takes two univariate
##  polynomials as arguments. If both polynomials are given in the same
##  indeterminate number <indnum> (in this case they are ``compatible'' as
##  univariate polynomials) it returns <indnum>. In all other cases it
##  returns `fail'.
##  `CIUnivPols' also accepts if either polynomial is constant but
##  formally expressed in another indeterminate, in this situation the
##  indeterminate of the other polynomial is selected.
DeclareGlobalFunction("CIUnivPols");

#############################################################################
##
#F  TryGcdCancelExtRepPolynomials(<fam>,<a>,<b>);
##
##  Let <f> and <g> be two polynomials given by the ext reps <a> and <b>.
##  This function tries to cancel common factors between <a> and <b> and
##  returns a list [<ac>,<bc>] of cancelled numerator and denominator ext
##  rep. As there is no proper multivariate GCD cancellation is not
##  guaranteed to be optimal.
DeclareGlobalFunction("TryGcdCancelExtRepPolynomials");

#############################################################################
##
#O  HeuristicCancelPolynomials(<fam>,<ext1>,<ext2>)
##
##  is called by `TryGcdCancelExtRepPol' to perform the actual work. It will
##  return either `fail' or a new list [<num>,<den>] of cancelled numerator
##  and denominator. The cancellation performed is not necessarily optimal.
DeclareOperation("HeuristicCancelPolynomialsExtRep",
  [IsRationalFunctionsFamily,IsList,IsList]);

#############################################################################
##
#F  QuotientPolynomialsExtRep(<fam>,<a>,<b>)
##
##  Let <a> and <b> the external representations of two polynomials in the
##  rational functions family <fam>. This function computes the external
##  representation of the quotient of both polynomials, it returns `fail' if
##  <b> does not divide <a>.
DeclareGlobalFunction("QuotientPolynomialsExtRep");

#############################################################################
##
#F  QuotRemLaurpols(<left>,<right>,<mode>)
##
##  takes two Laurent polynomials <left> and <right> and computes their
##  quotient. Depending on the integer variable <mode> it returns:
##  \beginlist%ordered
##  \item{1.}
##  the quotient (there might be some remainder),
##
##  \item{2.}
##  the remainder,
##
##  \item{3.}
##  a list [<q>,<r>] of quotient and remainder,
##
##  \item{4.}
##  the quotient if there is no remainder and `fail' otherwise.
##  \endlist
DeclareGlobalFunction("QuotRemLaurpols");

#############################################################################
##
#F  GcdCoeffs(<a>,<b>)
##
##  computes the univariate gcd coefficient list from coefficient lists.
##  This should eventually become an operation and dispatch specially for
##  rationals.
DeclareGlobalFunction("GcdCoeffs");

#############################################################################
##
#F  UnivariatenessTestRationalFunction(<f>)
##
##  takes a rational function <f> and tests whether it is univariate or even
##  a Laurent polynomial. It returns a list
##  `[<isunivariate>, <indet>, <islaurent>, <cofs>]' where <indet> is the
##  indeterminate number and <cofs> (if applicable) the coefficients lists.
##  The list <cofs> is the `CoefficientsOfLaurentPolynomial' if <islaurent>
##  is `true' and the `CoefficientsOfUnivariateRationalFunction' if
##  <islaurent> is `false' and <isunivariate> `true'.
##  As there is no proper multivariate gcd, it might return `fail' for
##  <isunivariate>.
DeclareGlobalFunction("UnivariatenessTestRationalFunction");

#############################################################################
##
#F  SpecializedExtRepPol(<fam>,<ext>,<ind>,<val>)
##
##  specializes the indeterminate <ind> in the polynomial ext rep to <val>
##  and returns the resulting polynomial ext rep.
DeclareGlobalFunction("SpecializedExtRepPol");

#############################################################################
##
#F  RandomPol(<ring>,<deg>[,<indnum>])
##
DeclareGlobalFunction("RandomPol");

#############################################################################
##
#O  ZippedSum( <z1>, <z2>, <czero>, <funcs> )
##
##  computes the sum of two external representations of polynomials <z1> and
##  <z2>. <czero> is the appropriate coefficient zero and <funcs> a list 
##  [ <monomial less>, <coefficient sum> ] containing a monomial comparison
##  and a coefficient addition function. This list can be found in the
##  component `<fam>!.zippedSum' of the rational functions family.
##
##  Note that <coefficient sum> must be a proper ``summation'' function, not
##  a function computing differences.
##
DeclareOperation( "ZippedSum", [ IsList, IsList, IsObject, IsList ] );

#############################################################################
##
#O  ZippedProduct( <z1>, <z2>, <czero>, <funcs> )
##
##  computes the product of two external representations of polynomials <z1>
##  and <z2>. <czero> is the appropriate coefficient zero and <funcs> a list
##  `[<monomial_prod>, <monomial_less>, <coefficient_sum>, <coefficient_prod>]'
##  containing functions to multiply and compare monomials, to add and to
##  multiply coefficients.  This list can be found in the component
##  `<fam>!.zippedProduct' of the rational functions family.
##
DeclareOperation( "ZippedProduct", [ IsList, IsList, IsObject, IsList ] );

DeclareGlobalFunction( "ProdCoefRatfun" );
DeclareGlobalFunction( "SumCoefRatfun" );
DeclareGlobalFunction( "SumCoefPolynomial" );

#7
##  The following functions are intended to permit the calculations with
##  (Laurent) Polynomials over Rings which are not an UFD. In this case it
##  is not possible to create the field of rational functions (and thus no
##  rational functions family exists.

#############################################################################
##
#C  IsLaurentPolynomialsFamilyElement
##
##  constructs a family containing  all Laurent polynomials with coefficients
##  in <family>  for  a family which   has  a one and   is  commutative.  The
##  external representation looks like the one for `RationalsFunctionsFamily'
##  so if  one really wants  rational  functions where  the denominator  is a
##  non-zero-divisor `LaurentPolynomialFunctionsFamily' can easily be changed
##  to `RestrictedRationalsFunctionsFamily'.
DeclareCategory( "IsLaurentPolynomialsFamilyElement", IsRationalFunction );


#############################################################################
##
#C  IsUnivariatePolynomialsFamilyElement
##
DeclareCategory( "IsUnivariatePolynomialsFamilyElement",
    IsRationalFunction );

#############################################################################
##
#C  IsLaurentPolynomialsFamily(<obj>)
##
##  At present Laurent polynomials  families only  exist if the  coefficients
##  family is commutative and has a one.
##
#T  1996/10/14 fceller can this be done with `CategoryFamily'?
##
DeclareCategory( "IsLaurentPolynomialsFamily",
    IsFamily and HasOne and IsCommutativeFamily );


#############################################################################
##
#C  IsUnivariatePolynomialsFamily
##
##  At present univariate polynomials families only exist if the coefficients
##  family is a skew field.
##
#T  1996/10/14 fceller can this be done with `CategoryFamily'?
##
DeclareCategory( "IsUnivariatePolynomialsFamily", IsFamily );



##  `IsRationalFunctionsFamilyElement',   an element of  a Laurent
##  polynomials family has category `IsLaurentPolynomialsFamilyElement',  and
##  an   element  of     a    univariate polynomials  family   has   category
##  `IsUnivariatePolynomialsFamilyElement'.   They  all   lie  in  the  super
##  category `IsRationalFunction'.

##
##  `IsPolynomial', `IsUnivariatePolynomials', `IsLaurentPolynomial',     and
##  `IsUnivariateLaurentPolynomial' are properties of rational functions.
##
##  The basic operations for rational functions are:
##
##    `ExtRepOfObj'
##    `ObjByExtRep'.
##
##  The basic operations for rational functions  which are univariate Laurent
##  polynomials are:
##
##    `UnivariateLaurentPolynomialByCoefficients'
##    `CoefficientsOfUnivariateLaurentPolynomial'
##    `IndeterminateNumberOfUnivariateLaurentPolynomial'
##





#############################################################################
##
#E  ratfun.gd . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
##
