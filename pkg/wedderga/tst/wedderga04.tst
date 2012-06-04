# wedderga, chapter 4

# [ "/Users/alexk/gap4r5p4May26/pkg/wedderga/doc/idempot.xml", 23, 41 ]

gap> QS3 := GroupRing( Rationals, SymmetricGroup(3) );;                 
gap> PrimitiveCentralIdempotentsByCharacterTable( QS3 );
[ (1/6)*()+(-1/6)*(2,3)+(-1/6)*(1,2)+(1/6)*(1,2,3)+(1/6)*(1,3,2)+(-1/6)*(1,3),
  (2/3)*()+(-1/3)*(1,2,3)+(-1/3)*(1,3,2), (1/6)*()+(1/6)*(2,3)+(1/6)*(1,2)+(1/
    6)*(1,2,3)+(1/6)*(1,3,2)+(1/6)*(1,3) ]
gap> QG:=GroupRing( Rationals , SmallGroup(24,3) );
<algebra-with-one over Rationals, with 4 generators>
gap> FG:=GroupRing( CF(3) , SmallGroup(24,3) );
<algebra-with-one over CF(3), with 4 generators>
gap> pciQG := PrimitiveCentralIdempotentsByCharacterTable(QG);;
gap> pciFG := PrimitiveCentralIdempotentsByCharacterTable(FG);;
gap> Length(pciQG);
5
gap> Length(pciFG);
7


# [ "/Users/alexk/gap4r5p4May26/pkg/wedderga/doc/idempot.xml", 80, 91 ]

gap> QS5 := GroupRing( Rationals, SymmetricGroup(5) );;
gap> idemp := PrimitiveCentralIdempotentsByCharacterTable( QS5 );;
gap> IsCompleteSetOfOrthogonalIdempotents( QS5, idemp );
true
gap> IsCompleteSetOfOrthogonalIdempotents( QS5, [ One( QS5 ) ] );
true
gap> IsCompleteSetOfOrthogonalIdempotents( QS5, [ One( QS5 ), One( QS5 ) ] );
false


# [ "/Users/alexk/gap4r5p4May26/pkg/wedderga/doc/idempot.xml", 130, 154 ]

gap> QG:=GroupRing( Rationals, AlternatingGroup(4) );;           
gap> PrimitiveCentralIdempotentsByStrongSP( QG );
[ (1/12)*()+(1/12)*(2,3,4)+(1/12)*(2,4,3)+(1/12)*(1,2)(3,4)+(1/12)*(1,2,3)+(1/
    12)*(1,2,4)+(1/12)*(1,3,2)+(1/12)*(1,3,4)+(1/12)*(1,3)(2,4)+(1/12)*
    (1,4,2)+(1/12)*(1,4,3)+(1/12)*(1,4)(2,3),
  (1/6)*()+(-1/12)*(2,3,4)+(-1/12)*(2,4,3)+(1/6)*(1,2)(3,4)+(-1/12)*(1,2,3)+(
    -1/12)*(1,2,4)+(-1/12)*(1,3,2)+(-1/12)*(1,3,4)+(1/6)*(1,3)(2,4)+(-1/12)*
    (1,4,2)+(-1/12)*(1,4,3)+(1/6)*(1,4)(2,3),
  (3/4)*()+(-1/4)*(1,2)(3,4)+(-1/4)*(1,3)(2,4)+(-1/4)*(1,4)(2,3) ]
gap> QG := GroupRing( Rationals, SmallGroup(24,3) );;
gap> PrimitiveCentralIdempotentsByStrongSP( QG );;
Wedderga: Warning!!!
The output is a NON-COMPLETE list of prim. central idemp.s of the input! 
gap> FG := GroupRing( GF(2), Group((1,2,3)) );;
gap> PrimitiveCentralIdempotentsByStrongSP( FG );
[ (Z(2)^0)*()+(Z(2)^0)*(1,2,3)+(Z(2)^0)*(1,3,2), 
  (Z(2)^0)*(1,2,3)+(Z(2)^0)*(1,3,2) ]
gap> FG := GroupRing( GF(5), SmallGroup(24,3) );; 
gap> PrimitiveCentralIdempotentsByStrongSP( FG );;
Wedderga: Warning!!!
The output is a NON-COMPLETE list of prim. central idemp.s of the input! 


# [ "/Users/alexk/gap4r5p4May26/pkg/wedderga/doc/idempot.xml", 177, 211 ]

gap> QG := GroupRing( Rationals, SymmetricGroup(4) );
<algebra-with-one over Rationals, with 2 generators>
gap> pci:=PrimitiveCentralIdempotentsBySP( QG );
[ (1/24)*()+(1/24)*(3,4)+(1/24)*(2,3)+(1/24)*(2,3,4)+(1/24)*(2,4,3)+(1/24)*
    (2,4)+(1/24)*(1,2)+(1/24)*(1,2)(3,4)+(1/24)*(1,2,3)+(1/24)*(1,2,3,4)+(1/
    24)*(1,2,4,3)+(1/24)*(1,2,4)+(1/24)*(1,3,2)+(1/24)*(1,3,4,2)+(1/24)*
    (1,3)+(1/24)*(1,3,4)+(1/24)*(1,3)(2,4)+(1/24)*(1,3,2,4)+(1/24)*(1,4,3,2)+(
    1/24)*(1,4,2)+(1/24)*(1,4,3)+(1/24)*(1,4)+(1/24)*(1,4,2,3)+(1/24)*(1,4)
    (2,3), (1/24)*()+(-1/24)*(3,4)+(-1/24)*(2,3)+(1/24)*(2,3,4)+(1/24)*
    (2,4,3)+(-1/24)*(2,4)+(-1/24)*(1,2)+(1/24)*(1,2)(3,4)+(1/24)*(1,2,3)+(-1/
    24)*(1,2,3,4)+(-1/24)*(1,2,4,3)+(1/24)*(1,2,4)+(1/24)*(1,3,2)+(-1/24)*
    (1,3,4,2)+(-1/24)*(1,3)+(1/24)*(1,3,4)+(1/24)*(1,3)(2,4)+(-1/24)*
    (1,3,2,4)+(-1/24)*(1,4,3,2)+(1/24)*(1,4,2)+(1/24)*(1,4,3)+(-1/24)*(1,4)+(
    -1/24)*(1,4,2,3)+(1/24)*(1,4)(2,3), (3/8)*()+(-1/8)*(3,4)+(-1/8)*(2,3)+(
    -1/8)*(2,4)+(-1/8)*(1,2)+(-1/8)*(1,2)(3,4)+(1/8)*(1,2,3,4)+(1/8)*
    (1,2,4,3)+(1/8)*(1,3,4,2)+(-1/8)*(1,3)+(-1/8)*(1,3)(2,4)+(1/8)*(1,3,2,4)+(
    1/8)*(1,4,3,2)+(-1/8)*(1,4)+(1/8)*(1,4,2,3)+(-1/8)*(1,4)(2,3), 
  (3/8)*()+(1/8)*(3,4)+(1/8)*(2,3)+(1/8)*(2,4)+(1/8)*(1,2)+(-1/8)*(1,2)(3,4)+(
    -1/8)*(1,2,3,4)+(-1/8)*(1,2,4,3)+(-1/8)*(1,3,4,2)+(1/8)*(1,3)+(-1/8)*(1,3)
    (2,4)+(-1/8)*(1,3,2,4)+(-1/8)*(1,4,3,2)+(1/8)*(1,4)+(-1/8)*(1,4,2,3)+(-1/
    8)*(1,4)(2,3), (1/6)*()+(-1/12)*(2,3,4)+(-1/12)*(2,4,3)+(1/6)*(1,2)(3,4)+(
    -1/12)*(1,2,3)+(-1/12)*(1,2,4)+(-1/12)*(1,3,2)+(-1/12)*(1,3,4)+(1/6)*(1,3)
    (2,4)+(-1/12)*(1,4,2)+(-1/12)*(1,4,3)+(1/6)*(1,4)(2,3) ]
gap> IsCompleteSetOfPCIs(QG,pci);
true
gap> QS5 := GroupRing( Rationals, SymmetricGroup(5) );;
gap> pci:=PrimitiveCentralIdempotentsBySP( QS5 );;
Wedderga: Warning!!
The output is a NON-COMPLETE list of prim. central idemp.s of the input!
gap> IsCompleteSetOfPCIs( QS5 , pci );
false


# [ "/Users/alexk/gap4r5p4May26/pkg/wedderga/doc/idempot.xml", 217, 241 ]

gap> QG := GroupRing( Rationals, SmallGroup(48,28) );;
gap> pci:=PrimitiveCentralIdempotentsBySP( QG );;
Wedderga: Warning!!
The output is a NON-COMPLETE list of prim. central idemp.s of the input! 
gap> Length(pci);    
6
gap> spci:=PrimitiveCentralIdempotentsByStrongSP( QG );;  
Wedderga: Warning!!!
The output is a NON-COMPLETE list of prim. central idemp.s of the input! 
gap> Length(spci);
5
gap> IsSubset(pci,spci);          
true
gap> QG:=GroupRing(Rationals,SmallGroup(1000,86));
<algebra-with-one over Rationals, with 6 generators>
gap> IsCompleteSetOfPCIs( QG , PrimitiveCentralIdempotentsBySP(QG) );
true
gap> IsCompleteSetOfPCIs( QG , PrimitiveCentralIdempotentsByStrongSP(QG) );
Wedderga: Warning!!!
The output is a NON-COMPLETE list of prim. central idemp.s of the input!
false

