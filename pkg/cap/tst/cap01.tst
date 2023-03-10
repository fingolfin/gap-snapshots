# CAP, single 1
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("cap01.tst");

# doc/_Chapter_Examples_and_Tests.xml:10-30
gap> LoadPackage( "CAP", false );
true
gap> list_of_operations_to_install := [
>     "ObjectConstructor",
>     "MorphismConstructor",
>     "ObjectDatum",
>     "MorphismDatum",
>     "PreCompose",
>     "IdentityMorphism",
>     "DirectSum",
> ];;
gap> dummy := DummyCategory( rec(
>     list_of_operations_to_install := list_of_operations_to_install,
>     properties := [ "IsAdditiveCategory" ],
> ) );;
gap> ForAll( list_of_operations_to_install, o -> CanCompute( dummy, o ) );
true
gap> IsAdditiveCategory( dummy );
true

#
gap> STOP_TEST("cap01.tst", 1);
