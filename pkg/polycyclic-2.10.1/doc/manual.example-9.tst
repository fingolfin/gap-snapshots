
InstallGlobalFunction( "SiftUpperUnitriMatGroup", function( G )
    local   firstlevel,  g;

    firstlevel := MakeNewLevel( 0 );
    for g in GeneratorsOfGroup(G) do
        SiftUpperUnitriMat( GeneratorsOfGroup(G), firstlevel, g );
    od;
    return firstlevel;
end );

