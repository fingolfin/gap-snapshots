# Modules, single 16
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("modules16.tst");

# doc/../gap/HomalgMap.gi:924-931
gap> chi := HomalgMap( mat );	## or chi := HomalgMap( mat, "l" );
<A homomorphism of left modules>
gap> Source( chi );
<A free left module of rank 3 on free generators>
gap> Range( chi );
<A free left module of rank 4 on free generators>

#
gap> STOP_TEST("modules16.tst", 1);