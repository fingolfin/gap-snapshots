Read( "ReducedBasisOfModule.g" );

Ext( 0, iota, pi );
Ext( 1, iota, pi );
Ext( 2, iota, pi );
Ext( 3, iota, pi );
Ext( 4, iota, pi );
Ext( 5, iota, pi );
Tor( 0, iota, pi );
Tor( 1, iota, pi );
Tor( 2, iota, pi );
Tor( 3, iota, pi );
Tor( 4, iota, pi );
Tor( 5, iota, pi );
Ext( 0, pi, iota );
Ext( 1, pi, iota );
Ext( 2, pi, iota );
Ext( 3, pi, iota );
Ext( 4, pi, iota );
Ext( 5, pi, iota );
Tor( 0, pi, iota );
Tor( 1, pi, iota );
Tor( 2, pi, iota );
Tor( 3, pi, iota );
Tor( 4, pi, iota );
Tor( 5, pi, iota );
RHom( 0, iota, pi );
RHom( 1, iota, pi );
RHom( 2, iota, pi );
RHom( 3, iota, pi );
RHom( 4, iota, pi );
RHom( 5, iota, pi );
LTensorProduct( 0, iota, pi );
LTensorProduct( 1, iota, pi );
LTensorProduct( 2, iota, pi );
LTensorProduct( 3, iota, pi );
LTensorProduct( 4, iota, pi );
LTensorProduct( 5, iota, pi );
RHom( 0, pi, iota );
RHom( 1, pi, iota );
RHom( 2, pi, iota );
RHom( 3, pi, iota );
RHom( 4, pi, iota );
RHom( 5, pi, iota );
LTensorProduct( 0, pi, iota );
LTensorProduct( 1, pi, iota );
LTensorProduct( 2, pi, iota );
LTensorProduct( 3, pi, iota );
LTensorProduct( 4, pi, iota );
LTensorProduct( 5, pi, iota );

Display( StringTime( homalgTime( Qxyz ) ) );
