# ToricVarieties, single 9
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("toricvarieties09.tst");

# /doc/_Chunks.xml:345-367
gap> final_space2 := SequenceOfBlowupsOfToricVariety( base, 
>                     [ ["x,y,u","u1"], 
>                     ["x,y,u1","u2"],
>                     ["y,u1","u3"],
>                     ["y,u2","u4"],
>                     ["u2,u3","u5"],
>                     ["u1,u3","u6"],
>                     ["u2,u4","u7"],
>                     ["u3,u4","u8"],
>                     ["u4,u5","u9"],
>                     ["u5,u8","u10"],
>                     ["u4,u8","u11"],
>                     ["u4,u9","u12"],
>                     ["u8,u9","u13"],
>                     ["u9,u11","u14"],
>                     ["u4,v","d"],
>                     ["u3,u5","u15"] ] );
<A toric variety of dimension 5>
gap> [ IsComplete( final_space2 ), IsOrbifold( final_space2 ), 
>   IsSmooth( final_space2 ) ];
[ true, true, false ]

#
gap> STOP_TEST("toricvarieties09.tst", 1);
