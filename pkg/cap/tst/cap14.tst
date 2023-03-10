# CAP, single 14
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("cap14.tst");

# doc/_Chapter_Examples_and_Tests.xml:437-473
gap> LoadPackage( "LinearAlgebraForCAP", false );
true
gap> Q := HomalgFieldOfRationals( );
Q
gap> Qmat := MATRIX_CATEGORY( Q );
Category of matrices over Q
gap> Wrapper := WrapperCategory( Qmat, rec( ) );
WrapperCategory( Category of matrices over Q )
gap> mor := ZeroMorphism( ZeroObject( Wrapper ), ZeroObject( Wrapper ) );;
gap> 2 * mor;;
gap> BasisOfExternalHom( Source( mor ), Range( mor ) );;
gap> CoefficientsOfMorphism( mor );;
gap> distinguished_object := DistinguishedObjectOfHomomorphismStructure( Wrapper );;
gap> object := HomomorphismStructureOnObjects( Source( mor ), Source( mor ) );;
gap> HomomorphismStructureOnMorphisms( mor, mor );;
gap> HomomorphismStructureOnMorphismsWithGivenObjects( object, mor, mor, object );;
gap> iota := InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( mor );;
gap> InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( distinguished_object, mor, object );;
gap> beta := InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( mor ), Range( mor ), iota );;
gap> IsCongruentForMorphisms( mor, beta );
true
gap> Qmat2 := MATRIX_CATEGORY( Q );
Category of matrices over Q
gap> Wrapper2 := WrapperCategory( Qmat2, rec( wrap_range_of_hom_structure := true ) );
WrapperCategory( Category of matrices over Q )
gap> mor := ZeroMorphism( ZeroObject( Wrapper2 ), ZeroObject( Wrapper2 ) );;
gap> distinguished_object := DistinguishedObjectOfHomomorphismStructure( Wrapper2 );;
gap> object := HomomorphismStructureOnObjects( Source( mor ), Source( mor ) );;
gap> HomomorphismStructureOnMorphisms( mor, mor );;
gap> HomomorphismStructureOnMorphismsWithGivenObjects( object, mor, mor, object );;
gap> iota := InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( mor );;
gap> InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( distinguished_object, mor, object );;
gap> beta := InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( mor ), Range( mor ), iota );;
gap> IsCongruentForMorphisms( mor, beta );
true

#
gap> STOP_TEST("cap14.tst", 1);
