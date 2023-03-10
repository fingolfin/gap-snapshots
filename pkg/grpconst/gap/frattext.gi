#############################################################################
##
#W  frattext.gi                 GrpConst                         Bettina Eick
#W                                                         Hans Ulrich Besche
##

#############################################################################
##
#F IntCoefficients( primes, vec )
##
BindGlobal( "IntCoefficients", function( primes, vec )
    local int, i;
    int := 0;
    for i in [1..Length(primes)] do
        int := int * primes[i] + vec[i];
    od;
    return int;
end );

#############################################################################
##
#F EnlargedModule( M, F, H )
##
InstallGlobalFunction( EnlargedModule, function( M, F, H )
    local N, l, mats;
    N := ShallowCopy( M );
    l := Length( Pcgs( H ) ) - Length( Pcgs( F ) );
    mats := List( [1..l], x -> IdentityMat( M.dimension, M.field ) );
    N.generators := Concatenation( N.generators, mats );
    return N;
end );

#############################################################################
##
#F FindUniqueModules( modus )
##
InstallGlobalFunction( FindUniqueModules, function( list )
    local modus, i, j, dims, cent;
        
    for modus in list do

        # find the ones with unique dimension
        dims := List( modus, x -> x.dimension );
        for j in [1..Length(modus)] do
            if Length( Filtered(dims, x -> x = modus[j].dimension) ) = 1
            then
                modus[j].unique := true;
            else
                modus[j].unique := false;
            fi;
            modus[j].isCentral := false;
        od;

        # find the trivial module 
        for j in [1..Length(modus)] do
            if ForAll( modus[j].generators, x -> x = x^0 ) then
                modus[j].unique := true;
                modus[j].isCentral := true;
            fi;
        od;
    od;
end );

#############################################################################
##
#F CentralModules( F, field, d )
##
BindGlobal( "CentralModules", function( F, field, d )
    local modus, i, mats, modu;
    modus := [];
    for i in [2..d] do
        mats := List( Pcgs(F), x -> IdentityMat( i, field ) );
        modu := GModuleByMats( mats, field );
        modu.unique := true;
        modu.isCentral := true;
        Add( modus, modu );
    od;
    return modus;
end );

#############################################################################
##
#F IsCentralExtension( F, ext )
##
BindGlobal( "IsCentralExtension", function( F, ext )
    local pcgs, N;
    pcgs := Pcgs( ext );
    N := Subgroup( ext, pcgs{[Length(Pcgs(F))+1..Length(pcgs)]} );
    return IsElementaryAbelian(N) and IsCentral( ext, N );
end );

#############################################################################
##
#F FrattiniExtensionsOfCode( code, o )
##
InstallGlobalFunction( FrattiniExtensionsOfCode, function( code, o )
    local primes, prim, modus, grps, exts, min, sub, H, rest, tup,
          j, modu, M, size, new, i, count, p, d, grp, F, Finfo;


    # the trivial cases
    if code.order = o then return [code]; fi;

    # check size
    if not Set( FactorsInt( code.order ) ) = Set( FactorsInt( o ) ) or
       not IsInt( o/code.order ) then
        return []; 
    fi;

    # construct irreducible modules for F
    F      := PcGroupCodeRec( code );
    Finfo  := rec( F := F );
    rest   := o / code.order;
    primes := Collected( FactorsInt( rest ) );
    prim   := List( primes, x -> x[1] );
    modus  := List( primes, x -> IrreducibleModules( F, GF(x[1]), x[2] )[2] );
    FindUniqueModules( modus );

    # set up
    grps := [];
    exts := [code]; 

    # start loop
    while Length( exts ) > 0 do

        min := Minimum( List( exts, x -> x.order ) );
        sub := Filtered( exts, x -> x.order = min );
        exts:= Filtered( exts, x -> x.order > min );
        sub := Flat( ReducedByIsomorphismsFEM( sub, Finfo ) );
        Info( InfoGrpCon, 2,"  next layer with ",Length(sub),
                              " groups of order ", min );

        # loop over elements in sub
        for i in [1..Length(sub)] do

            # the Frattini free group is a special case
            H := PcGroupCodeRec( sub[i] );

            rest := o / Size( H );
            tup  := Collected( FactorsInt( rest ) )[1];
            j    := Position( prim, tup[1] );
            modu := Filtered( modus[j], x -> x.dimension <= tup[2] );
            modu := List( modu, x -> EnlargedModule( x, F, H ) );

            Info( InfoGrpCon, 3,"   start group ", i, " of ", Length(sub),
                                ", with ", Length(modu)," modules");

            # loop over modules
            count := 1;
            for M in modu do
                Unbind(M.absolutelyIrreducible);
 
                # create extensions
                d := M.dimension;
                p := Characteristic( M.field );
                size := Size( H ) * p^d; 
                Info( InfoGrpCon, 4,"    start module of dimension ", d, 
                                    " with char ",p );

                # create extensions
                new := NonSplitExtensions( H, M );
                for j in [1..Length(new.groups)] do

                    grp := rec( code := CodePcGroup( new.groups[j] ),
                                order := size,
                                isFrattiniFree := false );
                    grp.first := code.first;
                    grp.socledim := code.socledim; 
                    grp.extdim := ShallowCopy( sub[i].extdim );
                    Add( grp.extdim, p^d );
                    Sort( grp.extdim );
                    grp.isUnique := (new.reduced and M.unique and
                                     sub[i].isFrattiniFree );

                    new.groups[j] := grp;
                    count := count + 1;
                od;

                Info( InfoGrpCon, 4,"    constructed ", Length(new.groups),
                      " new groups ");

                if size = o then
                    Append( grps, new.groups );
                else
                    Append( exts, new.groups );
                fi;
                Unbind( new );
            od;
        od;
    od;
    grps := ReducedByIsomorphismsFEM( grps, Finfo );
    Info( InfoGrpCon, 2,"  determined ", Length( grps ),
                          " classes with groups of order ",o);
    return grps;
end );

#############################################################################
##
#F FrattiniExtensionsOfGroup( F, size )
##
InstallGlobalFunction( FrattiniExtensionsOfGroup, function( F, size )
    local P, S, K, pcgs, code;

    P := FrattiniSubgroup( F );
    if not Size(P) = 1 then
        Error(" group must be Frattini free ");
    fi;
    S := FittingSubgroup( F );
    K := ComplementClassesRepresentatives( F, S )[1];
    pcgs := PcgsByPcSequence( FamilyObj( One(F) ),
                              Concatenation( Pcgs( K ), Pcgs(S) ) );
    code := rec( code := CodePcgs( pcgs ),
                 order := Size( F ),
                 isFrattiniFree := true,
                 first := [1, Length(Pcgs(K))+1, Length(pcgs)+1],
                 socledim := false,
                 extdim := [],
                 exindent := [],
                 isUnique := true ); 
    return FrattiniExtensionsOfCode( code, size );
end );

#############################################################################
##
#F FrattiniExtensions( list, size [,uncoded] )
##
InstallGlobalFunction( FrattiniExtensions, function( arg )
    local res, free, size, new, F, i, uncoded;

    free := arg[1];
    size := arg[2];
    uncoded := Length( arg ) = 3 and arg[3];

    if IsRecord( free ) then
        res := FrattiniExtensionsOfCode( free, size );
    elif IsGroup( free ) then
        res := FrattiniExtensionsOfGroup( free, size );
    else
        res := [];
        for i in [1..Length(free)] do
            F := free[i];
            if IsPcGroup( F ) then
                Info( InfoGrpCon, 1, " extend candidate number ",i,
                                       " of ",Length(free),
                                       " with size ",Size(F) );
                new := FrattiniExtensionsOfGroup( F, size );
            else
                Info( InfoGrpCon, 1, " extend candidate number ",i,
                                       " of ",Length(free),
                                       " with size ",F.order );
                new := FrattiniExtensionsOfCode( F, size );
            fi;
            Append( res, new );
        od;
    fi;
    if uncoded then
        for i in [1..Length(res)] do
            if IsList( res[i] ) then
                res[i] := List( res[i], PcGroupCodeRec );
            else
                res[i] := PcGroupCodeRec( res[i] );
            fi;
        od;
    fi;
    return res;
end );

#############################################################################
##
#F FrattiniExtensionMethod( size [, flags, uncoded] )
##
InstallGlobalFunction( FrattiniExtensionMethod, function( arg )
    local size, prop, uncoded, free, ext, i;

    # catch the arguments
    size := arg[1];
    if Length( arg ) = 1 then
        prop := rec();
        uncoded := false;
    elif Length( arg ) = 2 then
        if IsBool( arg[2] ) then
            uncoded := arg[2];
            prop := rec();
        else
            prop := arg[2];
            uncoded := false;
        fi;
    else
        prop := arg[2];
        uncoded := arg[3];
    fi;

    # catch the case of size = 1 
    if size = 1 then
        if not CheckFlags( prop ) then return []; fi;
        if IsBound( prop.nonnilpot ) or 
           IsBound( prop.nonsupsol ) or
           IsBound( prop.nonpnorm ) then 
            return [];
        elif not uncoded then
            return [rec( code := 0,
                         order := 1,
                         isFrattiniFree := true,
                         isUnique := true )];
        else
            return [PcGroupCode( 0, 1 )];
        fi;
    fi;

    Info( InfoGrpCon, 1, "computing groups of order ", FactorsInt( size ),
                         ": \n" );
    Info( InfoGrpCon, 1, "compute Frattini factors: ");
    free := FrattiniFactorCandidates( size, prop );
    Info( InfoGrpCon, 1, "found ",Length( free )," candidates ", "\n");
    Info( InfoGrpCon, 1, "compute Frattini extensions: ");
    ext  := FrattiniExtensions( free, size, uncoded );
    Info( InfoGrpCon, 1, "found ", Length( Flat(ext) )," extensions ", "\n");

    return ext;
end );
