
gap> ftl := FromTheLeftCollector( 4 );
<<from the left collector with 4 generators>>
gap> PcpGroupByCollector( ftl );
Pcp-group with orders [ 0, 0, 0, 0 ]
gap> IsAbelian(last);
true


gap> ftl := FromTheLeftCollector( 4 );
<<from the left collector with 4 generators>>
gap> for i in [1..4] do SetRelativeOrder( ftl, i, 3 ); od;
gap> G := PcpGroupByCollector( ftl );
Pcp-group with orders [ 3, 3, 3, 3 ]
gap> IsElementaryAbelian( G );
true


gap> ftl := FromTheLeftCollector( 3 );
<<from the left collector with 3 generators>>
gap> SetRelativeOrder( ftl, 1, 3 );
gap> SetConjugate( ftl, 2, 1, [3,1] );
gap> SetConjugate( ftl, 3, 1, [2,-1,3,-1] );
gap> UpdatePolycyclicCollector( ftl );
gap> IsConfluent( ftl );
true


gap> SetConjugate( ftl, 2, -1, [2,-1,3,-1] );
gap> SetConjugate( ftl, 3, -1, [2,1] );
gap> IsConfluent( ftl );
Error, Collector is out of date called from
CollectWordOrFail( coll, ev1, [ j, 1, i, 1 ] ); called from
<function>( <arguments> ) called from read-eval-loop
Entering break read-eval-print loop ...
you can 'quit;' to quit to outer loop, or
you can 'return;' to continue
brk>
gap> UpdatePolycyclicCollector( ftl );
gap> IsConfluent( ftl );
true


gap> G := UnitriangularPcpGroup( 4, 0 );
Pcp-group with orders [ 0, 0, 0, 0, 0, 0 ]
gap> coll := Collector ( G );
<<from the left collector with 6 generators>>
gap> ObjByExponents( coll, [6,-5,4,3,-2,1] );
[ 1, 6, 2, -5, 3, 4, 4, 3, 5, -2, 6, 1 ]
gap> ExponentsByObj( coll, last );
[ 6, -5, 4, 3, -2, 1 ]

