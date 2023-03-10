# ToricVarieties, single 13
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("toricvarieties13.tst");

# /doc/_Chunks.xml:444-455
gap> v2:=Cone( [[1,1],[-1,1]] );
<A cone in |R^2>
gap> v2:=ToricVariety(v2);
<An affine normal toric variety of dimension 2>
gap> IsSmooth( v2 );
false
gap> Display( v2 );
An affine normal non smooth toric variety of dimension 2.
gap> ConeOfVariety( v * v2 );
<A pointed cone in |R^5>

#
gap> STOP_TEST("toricvarieties13.tst", 1);
