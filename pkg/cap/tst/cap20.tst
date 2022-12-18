# CAP, single 20
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("cap20.tst");

# doc/_Chapter_Examples_and_Tests.xml:901-961
gap> LoadPackage( "MonoidalCategories" );
true
gap> T := TerminalCategoryWithSingleObject( );
TerminalCategoryWithSingleObject( )
gap> Display( T );
A CAP category with name TerminalCategoryWithSingleObject( ):

63 primitive operations were used to derive 280 operations for this category
which algorithmically
* IsCategoryWithDecidableColifts
* IsCategoryWithDecidableLifts
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
<A zero object in TerminalCategoryWithSingleObject( )>
gap> t := TerminalObject( T );
<A zero object in TerminalCategoryWithSingleObject( )>
gap> z := ZeroObject( T );
<A zero object in TerminalCategoryWithSingleObject( )>
gap> Display( i );
A zero object in TerminalCategoryWithSingleObject( ).
gap> Display( t );
A zero object in TerminalCategoryWithSingleObject( ).
gap> Display( z );
A zero object in TerminalCategoryWithSingleObject( ).
gap> IsIdenticalObj( i, z );
true
gap> IsIdenticalObj( t, z );
true
gap> IsWellDefined( z );
true
gap> id_z := IdentityMorphism( z );
<A zero, identity morphism in TerminalCategoryWithSingleObject( )>
gap> fn_z := ZeroObjectFunctorial( T );
<A zero, identity morphism in TerminalCategoryWithSingleObject( )>
gap> IsWellDefined( fn_z );
true
gap> IsEqualForMorphisms( id_z, fn_z );
true
gap> IsCongruentForMorphisms( id_z, fn_z );
true
gap> IsLiftable( id_z, fn_z );
true
gap> Lift( id_z, fn_z );
<A zero, identity morphism in TerminalCategoryWithSingleObject( )>
gap> IsColiftable( id_z, fn_z );
true
gap> Colift( id_z, fn_z );
<A zero, identity morphism in TerminalCategoryWithSingleObject( )>

#
gap> STOP_TEST("cap20.tst", 1);
