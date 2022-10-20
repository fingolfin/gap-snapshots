# NConvex, single 4
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("nconvex04.tst");

# /doc/_Chunks.xml:254-269
gap> rays := [ [ 1,0 ], [ 0,1 ] ];;
gap> max_cones := [ [1,2] ];;
gap> fan_affine2 := Fan( rays, max_cones );;
gap> fan_blowup_affine2 := StarSubdivisionOfIthMaximalCone( fan_affine2, 1 );
<A fan in |R^2>
gap> Length( RaysInMaximalCones( fan_blowup_affine2 ) );
2
gap> rays := [ [ 1,0,0 ], [ 0,1,0 ], [0,0,1] ];;
gap> max_cones := [ [1,2,3] ];;
gap> fan_affine3 := Fan( rays, max_cones );;
gap> fan_blowup_affine3 := StarSubdivisionOfIthMaximalCone( fan_affine3, 1 );
<A fan in |R^3>
gap> Length( RaysInMaximalCones( fan_blowup_affine3 ) );
3

#
gap> STOP_TEST("nconvex04.tst", 1);
