# Circle, chapter 4

# [ "/Users/alexk/gap4r5p4May26/pkg/circle/doc/example.xml", 18, 35 ]

gap> x:=[ [ 0, 1, 0, 0, 0, 0, 0 ],
>         [ 0, 0, 0, 1, 0, 0, 0 ],
>         [ 0, 0, 0, 0, 1, 0, 0 ],
>         [ 0, 0, 0, 0, 0, 0, 1 ],
>         [ 0, 0, 0, 0, 0, 1, 0 ],
>         [ 0, 0, 0, 0, 0, 0, 0 ],
>         [ 0, 0, 0, 0, 0, 0, 0 ] ];;
gap> y:=[ [ 0, 0, 1, 0, 0, 0, 0 ],
>         [ 0, 0, 0, 0,-1, 0, 0 ],
>         [ 0, 0, 0, 1, 0, 1, 0 ],
>         [ 0, 0, 0, 0, 0, 1, 0 ],
>         [ 0, 0, 0, 0, 0, 0,-1 ],
>         [ 0, 0, 0, 0, 0, 0, 0 ],
>         [ 0, 0, 0, 0, 0, 0, 0 ] ];;


# [ "/Users/alexk/gap4r5p4May26/pkg/circle/doc/example.xml", 40, 51 ]

gap> R := Algebra( GF(5), One(GF(5))*[x,y] );
<algebra over GF(5), with 2 generators>
gap> Dimension( R );
6
gap> Size( R );
15625
gap> RadicalOfAlgebra( R ) = R;
true


# [ "/Users/alexk/gap4r5p4May26/pkg/circle/doc/example.xml", 55, 60 ]

gap> G := AdjointGroup( R );
<group of size 15625 with 3 generators>


# [ "/Users/alexk/gap4r5p4May26/pkg/circle/doc/example.xml", 66, 75 ]

gap> f := IsomorphismPcGroup( G );;
gap> H := Image( f );
Group([ f1, f2, f3, f4, f5, f6 ])
gap> gens := MinimalGeneratingSet( H );;
gap> Length( gens );
3


# [ "/Users/alexk/gap4r5p4May26/pkg/circle/doc/example.xml", 84, 95 ]

gap> R := Algebra( GF(3), One(GF(3))*[x,y] );
<algebra over GF(3), with 2 generators>
gap> G := AdjointGroup( R );
<group of size 729 with 3 generators>
gap> H := Image( IsomorphismPcGroup( G ) );
Group([ f1, f2, f3, f4, f5, f6 ])
gap> Length( MinimalGeneratingSet( H ) );
3


# [ "/Users/alexk/gap4r5p4May26/pkg/circle/doc/example.xml", 100, 111 ]

gap> R := Algebra( GF(2), One(GF(2))*[x,y] );
<algebra over GF(2), with 2 generators>
gap> G := AdjointGroup( R );                   
<group of size 64 with 5 generators>
gap> H := Image( IsomorphismPcGroup( G ) );
Group([ f1, f2, f3, f4, f5, f6 ])
gap> Length( MinimalGeneratingSet( H ) );
4

