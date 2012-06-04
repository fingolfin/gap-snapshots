# scscp, chapter 9

# [ "/Users/alexk/gap4r5p4May26/pkg/scscp/doc/../lib/scscp.gd", 429, 439 ]

gap> PingSCSCPservice("localhost",26133);
true
gap> PingSCSCPservice("localhost",26140);                     
Error: rec(
  message := "Connection refused",
  number := 61 )
fail


# [ "/Users/alexk/gap4r5p4May26/pkg/scscp/doc/../lib/scscp.gd", 463, 469 ]

gap> PingStatistic("localhost",26133,1000);
1000 packets transmitted, 1000 received, 0% packet loss, time 208ms
min/avg/max = [ 0, 26/125, 6 ]


# [ "/Users/alexk/gap4r5p4May26/pkg/scscp/doc/../lib/scscp.gd", 33, 53 ]

gap> SetInfoLevel(InfoSCSCP,2);                              
gap> EvaluateBySCSCP( "WS_Factorial",[10],"localhost",26133); 
#I  Creating a socket ...
#I  Connecting to a remote socket via TCP/IP ...
#I  Got connection initiation message
#I  <?scscp service_name="GAP" service_version="4.dev" service_id="localhost:2\
6133:286" scscp_versions="1.0 1.1 1.2 1.3" ?>
#I  Requesting version 1.3 from the server ...
#I  Server confirmed version 1.3 to the client ...
#I  Request sent ...
#I  Waiting for reply ...
#I  <?scscp start ?>
#I  <?scscp end ?>
#I  Got back: object 3628800 with attributes 
[ [ "call_id", "localhost:26133:286:JL6KRQeh" ] ]
rec( attributes := [ [ "call_id", "localhost:26133:286:JL6KRQeh" ] ], 
  object := 3628800 )


# [ "/Users/alexk/gap4r5p4May26/pkg/scscp/doc/../lib/scscp.gd", 56, 63 ]

gap> SetInfoLevel(InfoSCSCP,0);                              
gap> EvaluateBySCSCP( "WS_Factorial",[10],"localhost",26133);
rec( attributes := [ [ "call_id", "localhost:26133:286:jzjsp6th" ] ], 
  object := 3628800 )


# [ "/Users/alexk/gap4r5p4May26/pkg/scscp/doc/../lib/scscp.gd", 66, 121 ]

gap> SetInfoLevel(InfoSCSCP,3);
gap> EvaluateBySCSCP( "WS_Factorial",[10],"localhost",26133);
#I  Creating a socket ...
#I  Connecting to a remote socket via TCP/IP ...
#I  Got connection initiation message
#I  <?scscp service_name="GAP" service_version="4.dev" service_id="localhost:2\
6133:286" scscp_versions="1.0 1.1 1.2 1.3" ?>
#I  Requesting version 1.3 from the server ...
#I  Server confirmed version 1.3 to the client ...
#I  Composing procedure_call message: 
<?scscp start ?>
<OMOBJ>
	<OMATTR>
		<OMATP>
			<OMS cd="scscp1" name="call_id"/>
			<OMSTR>localhost:26133:286:Jok6cQAf</OMSTR>
			<OMS cd="scscp1" name="option_return_object"/>
			<OMSTR></OMSTR>
		</OMATP>
		<OMA>
			<OMS cd="scscp1" name="procedure_call"/>
			<OMA>
				<OMS cd="scscp_transient_1" name="WS_Factorial"/>
				<OMI>10</OMI>
			</OMA>
		</OMA>
	</OMATTR>
</OMOBJ>
<?scscp end ?>
#I  Total length 396 characters 
#I  Request sent ...
#I  Waiting for reply ...
#I  <?scscp start ?>
#I Received message: 
<OMOBJ>
	<OMATTR>
		<OMATP>
			<OMS cd="scscp1" name="call_id"/>
			<OMSTR>localhost:26133:286:Jok6cQAf</OMSTR>
		</OMATP>
		<OMA>
			<OMS cd="scscp1" name="procedure_completed"/>
			<OMI>3628800</OMI>
		</OMA>
	</OMATTR>
</OMOBJ>
#I  <?scscp end ?>
#I  Got back: object 3628800 with attributes 
[ [ "call_id", "localhost:26133:286:Jok6cQAf" ] ]
rec( attributes := [ [ "call_id", "localhost:26133:286:Jok6cQAf" ] ], 
  object := 3628800 )
gap> SetInfoLevel(InfoSCSCP,0);


# [ "/Users/alexk/gap4r5p4May26/pkg/scscp/doc/../lib/scscp.gd", 149, 160 ]

gap> SetInfoLevel(InfoMasterWorker,2);
gap> ParListWithSCSCP( List( [2..6], n -> SymmetricGroup(n)), "WS_IdGroup" );
#I  1/5:master --> localhost:26133
#I  2/5:master --> localhost:26134
#I  3/5:master --> localhost:26133
#I  4/5:master --> localhost:26134
#I  5/5:master --> localhost:26133
[ [ 2, 1 ], [ 6, 1 ], [ 24, 12 ], [ 120, 34 ], [ 720, 763 ] ]


# [ "/Users/alexk/gap4r5p4May26/pkg/scscp/doc/../lib/scscp.gd", 163, 170 ]

gap> SetInfoLevel(InfoSCSCP,0);       
gap> SetInfoLevel(InfoMasterWorker,0);
gap> ParListWithSCSCP( List( [2..6], n -> SymmetricGroup(n)), "WS_IdGroup" );
[ [ 2, 1 ], [ 6, 1 ], [ 24, 12 ], [ 120, 34 ], [ 720, 763 ] ]


# [ "/Users/alexk/gap4r5p4May26/pkg/scscp/doc/../lib/scscp.gd", 173, 190 ]

gap> SetInfoLevel(InfoMasterWorker,5);                                       
gap> ParListWithSCSCP( List( [2..6], n -> SymmetricGroup(n)), "WS_IdGroup" );
#I  1/5:master --> localhost:26133 : SymmetricGroup( [ 1 .. 2 ] )
#I  2/5:master --> localhost:26134 : SymmetricGroup( [ 1 .. 3 ] )
#I  localhost:26133 --> 1/5:master : [ 2, 1 ]
#I  3/5:master --> localhost:26133 : SymmetricGroup( [ 1 .. 4 ] )
#I  localhost:26134 --> 2/5:master : [ 6, 1 ]
#I  4/5:master --> localhost:26134 : SymmetricGroup( [ 1 .. 5 ] )
#I  localhost:26133 --> 3/5:master : [ 24, 12 ]
#I  5/5:master --> localhost:26133 : SymmetricGroup( [ 1 .. 6 ] )
#I  localhost:26134 --> 4/5:master : [ 120, 34 ]
#I  localhost:26133 --> 5/5:master : [ 720, 763 ]
[ [ 2, 1 ], [ 6, 1 ], [ 24, 12 ], [ 120, 34 ], [ 720, 763 ] ]
gap> SetInfoLevel(InfoMasterWorker,2);


# [ "/Users/alexk/gap4r5p4May26/pkg/scscp/doc/../lib/utils.g", 202, 207 ]

gap> f := IO_PickleToString( GF( 125 ) );
"FFIEINTG\>15INTG\>13FAIL"


# [ "/Users/alexk/gap4r5p4May26/pkg/scscp/doc/../lib/utils.g", 239, 246 ]

gap> IO_UnpickleFromString( f );                    
GF(5^3)
gap> f = IO_UnpickleFromString( IO_PickleToString( f ) ); 
true

