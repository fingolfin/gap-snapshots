#############################################################################
##
#W  trans.gd                 GAP library                       Andrew Solomon
##
#H  @(#)$Id: trans.gd,v 4.18 2003/09/10 10:16:22 gap Exp $
##
#Y  Copyright (C)  1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file contains the declarations for transformations
##
##  Further maintenance and development by:
##    Andrew Solomon
##    Robert F. Morse

#1  
##  A *transformation* in {\GAP} is an endomorphism of a set of integers
##  of the form $\{1,\dots, n\}$.  Transformations are taken to act on the 
##  right, which defines the composition $i^{(\alpha\beta)} = (i^\alpha)^\beta$
##  for $i$ in $\{1, \dots, n\}$.
##
##  For a transformation $\alpha$ on the set $\{1, \ldots, n\}$, we define
##  its *degree* to be $n$, its *image list* to be the list,
##  $[1\alpha, \ldots, n\alpha]$, its *image* to be the image 
##  list considered as a set,
##  and its *rank* to be the size of the image.
##  We also define the *kernel* of $\alpha$ to be the equivalence relation
##  containing the pair $(i, j)$ if and only if $i^\alpha = j^\alpha$.
##
##  Note that unlike permutations, we do not consider
##  unspecified points to be fixed by a transformation.
##  Therefore multiplication is only defined on two transformations of the same
##  degree.

Revision.trans_gd :=
    "@(#)$Id: trans.gd,v 4.18 2003/09/10 10:16:22 gap Exp $";

############################################################################
##
#C  IsTransformation(<obj>)
#C  IsTransformationCollection(<obj>)
##
##  We declare it as `IsMultiplicativeElementWithOne' since
##  the identity automorphism of  $\{1,\ldots,n\}$ is a multiplicative
##  two sided identity for any transformation on the same set.

DeclareCategory("IsTransformation", 
	IsMultiplicativeElementWithOne and IsAssociativeElement);
DeclareCategoryCollections("IsTransformation");

############################################################################
##
#R  IsTransformationRep(<obj>)
## 
##  A transformation is an endomorphism of a set of integers
##  of the form `[1 .. n]'. 
##
##  A transformation is completely specified by a list of images
##  the ith element is the image of i under the transformation.
##
DeclareRepresentation("IsTransformationRep", IsPositionalObjectRep ,[1]);

#############################################################################
##
#F  Transformation(<images>)
#F  TransformationNC(<images>)
##
##  both return a transformation with the image list <images>.   The
##  normal version checks that the all the elements of the given list
##  lie within the range $\{1,\dots,n\}$ where <n> is the length of <images>,
##  but for speed purposes, a non-checking version is also supplied.
## 
DeclareGlobalFunction("Transformation");
DeclareGlobalFunction("TransformationNC");

#############################################################################
##
#F  IdentityTransformation(<n>)
## 
##  return the identity transformation of degree <n>  
##
DeclareGlobalFunction("IdentityTransformation");

#############################################################################
##
#F  RandomTransformation(<n>)
##
##  returns a random transformation of degree <n>
##
DeclareGlobalFunction("RandomTransformation");

############################################################################
##
#A  DegreeOfTransformation(<trans>)
## 
##  returns the degree of <trans>.
##  
DeclareAttribute("DegreeOfTransformation", IsTransformation);

#############################################################################
##
#A  ImageListOfTransformation(<trans>)
##
##  returns the image list of <trans>.
##
DeclareAttribute("ImageListOfTransformation", IsTransformation);

#############################################################################
##
#A  ImageSetOfTransformation(<trans>)
##
##  returns the image of <trans> as a set.
## 
DeclareAttribute("ImageSetOfTransformation", IsTransformation);

#############################################################################
##
#A  RankOfTransformation( <trans> )
##
##  returns the rank of <trans>.
##
DeclareAttribute("RankOfTransformation", IsTransformation);

#############################################################################
##
#A  KernelOfTransformation(<trans>)
##
##  Returns the kernel of <trans> as an equivalence relation (See
##  "General Binary Relations").
##
DeclareAttribute("KernelOfTransformation", IsTransformation);

#############################################################################
##
#O  PreimagesOfTransformation(<trans>, <i>)
##
##  returns the subset of $\{1,\dots,n\}$  which maps to <i> under <trans>.
##
DeclareOperation("PreimagesOfTransformation",[IsTransformation, IsInt]);

#############################################################################
##
#O  RestrictedTransformation(<trans>, <alpha>)
##  
##  The transformation <trans> is restricted to only those points of <alpha>.
##
DeclareOperation("RestrictedTransformation", 
    [IsTransformation, IsListOrCollection]);

############################################################################
##
#O  AsTransformation( <O> )
#O  AsTransformation( <O>, <n> )
#O  AsTransformationNC( <O>, <n> )
##
##  returns the object <O> as a transformation. Supported objects are
##  permutations and binary relations on points. In the
##  second form, the operation  returns a 
##  transformation of degree <n>, signalling
##  an error if such a representation is not possible.  `AsTransformationNC'
##  does not perform this check.
##
DeclareOperation("AsTransformation", [IsObject]);
DeclareOperation("AsTransformationNC", [IsObject]);

############################################################################
##
#O  TransformationRelation( <R> )
##
##  returns the binary relation <R> when considered as a transformation.
##  Only makes sense for injective binary relations over `[1..n]'.  Returns 
##  an error if the relation is not over `[1..n]', and `fail' if it is not
##  injective.
##
DeclareOperation("TransformationRelation", [IsGeneralMapping]);

#############################################################################
##
#O  BinaryRelationTransformation( <trans> )
##
##  returns <trans> when considered as a binary relation.
##
DeclareOperation("BinaryRelationTransformation", [IsTransformation]);

DeclareOperation("InverseOp", [IsTransformation]);


#############################################################################
##  
#O  PermLeftQuoTransformation(<tr1>, <tr2>)
##
##  Given transformations <tr1> and <tr2> with equal kernel and image, 
##  we compute the permutation induced by (<tr1>)$^{-1}*$<tr2> on the set of 
##  images of <tr1>. If the kernels and images are not equal, an error 
##  is signaled.
##
DeclareOperation("PermLeftQuoTransformation", 
    [IsTransformation, IsTransformation]);

#############################################################################
##
#F  TransformationFamily(n) 
#F  TransformationType(n) 
#F  TransformationData(n)
##
##  For each `<n> > 0' there is a single family and type of transformations
##  on n points. To speed things up, we store these in 
##  a database of types. The three functions above a then 
##  access functions. If the <n>th entry isn't yet created, they trigger
##  creation as well.
## 
##  For `<n> > 0', element <n>  of the type database is
##  `[TransformationFamily(n), TransformationType(n)]'

DeclareGlobalFunction("TransformationFamily");
DeclareGlobalFunction("TransformationType");
DeclareGlobalFunction("TransformationData");
_TransformationFamiliesDatabase := [];


#############################################################################
##
#E
