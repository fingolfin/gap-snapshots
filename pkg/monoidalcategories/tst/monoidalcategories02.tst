# MonoidalCategories, single 2
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("monoidalcategories02.tst");

# /doc/_Chunks.xml:2-48
gap> T := TerminalCategory( );
TerminalCategory( )
gap> InfoOfInstalledOperationsOfCategory( T );
68 primitive operations were used to derive 317 operations for this category
which algorithmically
* IsEquippedWithHomomorphismStructure
* IsLinearCategoryOverCommutativeRing
* IsAbelianCategoryWithEnoughInjectives
* IsAbelianCategoryWithEnoughProjectives
* IsRigidSymmetricClosedMonoidalCategory
* IsRigidSymmetricCoclosedMonoidalCategory
and furthermore mathematically
* IsLocallyOfFiniteInjectiveDimension
* IsLocallyOfFiniteProjectiveDimension
* IsSkeletalCategory
* IsStrictMonoidalCategory
* IsTerminalCategory
gap> i := InitialObject( T );
<A zero object in TerminalCategory( )>
gap> t := TerminalObject( T );
<A zero object in TerminalCategory( )>
gap> z := ZeroObject( T );
<A zero object in TerminalCategory( )>
gap> Display( i );
A zero object in TerminalCategory( ).
gap> Display( t );
A zero object in TerminalCategory( ).
gap> Display( z );
A zero object in TerminalCategory( ).
gap> IsIdenticalObj( i, z );
true
gap> IsIdenticalObj( t, z );
true
gap> IsWellDefined( z );
true
gap> id_z := IdentityMorphism( z );
<A zero, identity morphism in TerminalCategory( )>
gap> fn_z := ZeroObjectFunctorial( T );
<A zero, isomorphism in TerminalCategory( )>
gap> IsWellDefined( fn_z );
true
gap> IsEqualForMorphisms( id_z, fn_z );
true
gap> IsCongruentForMorphisms( id_z, fn_z );
true

#
gap> STOP_TEST("monoidalcategories02.tst", 1);
