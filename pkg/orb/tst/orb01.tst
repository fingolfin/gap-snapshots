# orb, chapter 3
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST("orb01.tst");

# doc/basic.xml:106-120
gap> g := GeneratorsOfGroup(MathieuGroup(24)); 
[ (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23), 
  (3,17,10,7,9)(4,13,14,19,5)(8,18,11,12,23)(15,20,22,21,16), 
  (1,24)(2,23)(3,12)(4,16)(5,18)(6,10)(7,20)(8,14)(9,21)(11,17)(13,22)(15,19) 
 ]
gap> o := Orb(g,2,OnPoints);
<open Int-orbit, 1 points>
gap> Enumerate(o,20);
<open Int-orbit, 21 points>
gap> IsClosed(o);
false
gap> Enumerate(o);   
<closed Int-orbit, 24 points>
gap> IsClosed(o);    
true

# doc/basic.xml:132-143
gap> Length(o);
24
gap> o[1];
2
gap> o[2];
3
gap> o{[3..5]};
[ 23, 4, 17 ]
gap> 17 in o;
true
gap> Position(o,17);
5

#
gap> STOP_TEST("orb01.tst", 1);
