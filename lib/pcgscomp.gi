#############################################################################
##
#W  pcgscomp.gi                 GAP Library                      Frank Celler
##
#H  @(#)$Id: pcgscomp.gi,v 4.27 2002/04/15 10:05:12 sal Exp $
##
#Y  Copyright (C)  1996,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file  contains the methods  for polycylic generating systems dealing
##  with or defined by a pc series.
##
Revision.pcgscomp_gi :=
    "@(#)$Id: pcgscomp.gi,v 4.27 2002/04/15 10:05:12 sal Exp $";


#############################################################################
##

#M  PcgsByPcSequenceNC( <fam>, <pcs> )
##


#############################################################################
InstallMethod( PcgsByPcSequenceNC, "pc series", true,
    [ IsFamily, IsHomogeneousList ], 0,
function( efam, pcs )
    local   pcgs;

    # quick check
    if not IsIdenticalObj( efam, ElementsFamily(FamilyObj(pcs)) )  then
        Error( "elements family of <pcs> does not match <efam>" );
    fi;

    # construct a pcgs
    pcgs := PcgsByPcSequenceCons(
                IsPcgsDefaultRep,
                IsPcgs,
                efam,
                pcs,[] );

    # that it
    return pcgs;

end );


#############################################################################
InstallMethod( PcgsByPcSequenceNC, "pc series, empty sequence", true,
    [ IsFamily, IsList and IsEmpty ], 0,

function( efam, pcs )
    local   pcgs;

    # construct a pcgs
    pcgs := PcgsByPcSequenceCons(
                IsPcgsDefaultRep, IsPcgs, efam, pcs,[] );

    # that it
    return pcgs;

end );


#############################################################################
##
#M  PcgsByPcSequence( <fam>, <pcs> )
##


#############################################################################
InstallMethod( PcgsByPcSequence,
    true,
    [ IsFamily,
      IsHomogeneousList ],
    0,

function( efam, pcs )
    #T  96/09/26 fceller  do some checks
    return PcgsByPcSequenceNC( efam, pcs );
end );
    

#############################################################################
InstallMethod( PcgsByPcSequence,
    true,
    [ IsFamily,
      IsList and IsEmpty ],
    0,

function( efam, pcs )
    #T  96/09/26 fceller  do some checks
    return PcgsByPcSequenceNC( efam, pcs );
end );


#############################################################################
##
#M  Pcgs( <grp> ) . . . . . . . . . . . . . . . . . . . . . . pcgs for groups
##
InstallMethod( Pcgs,
    "generic method using CompositionSeries",
    true,
#T Why was 'IsFinite' required here? This gave this method a higher value it
#T deserved
    [ IsGroup],0,

function( grp )
    local   series,  pcgs,  orders,  i,  elm,  o;

    if HasIsFinite(grp) and not IsFinite(grp) then
      Error("requires group to be finite!");
    fi;

    series := CompositionSeries(grp);
    pcgs   := [];
    orders := [];
    for i  in [ 1 .. Length(series)-1 ]  do
        o := Index(series[i],series[i+1]);
        if not IsPrime(o)  then
            Error( "finite group <grp> is not polycyclic" );
        fi;
        Add( orders, o );
        repeat
            elm := Random(series[i]);
        until not elm in series[i+1];
        Add( pcgs, elm );
    od;
    pcgs := PcgsByPcSequenceNC( FamilyObj(One(grp)), pcgs );
    SetPcSeries(       pcgs, series   );
    SetOneOfPcgs(      pcgs, One(grp) );
    SetRelativeOrders( pcgs, orders   );

    return pcgs;
end );


#############################################################################
##
#M  ExponentsOfPcElement( <pcgs>, <elm> )
##
InstallMethod( ExponentsOfPcElement, "pc series", IsCollsElms,
    [ IsPcgs, IsObject ], 0,

function( pcgs, elm )
local   series,  exps,  id,  depth,  exp,ml;

    series := PcSeries(pcgs);
    exps   := ListWithIdenticalEntries(Length(pcgs),0);
    id     := OneOfPcgs(pcgs);
    depth  := 1;
    ml:=Length(pcgs)+1;

    while elm <> id  do
        while elm in series[depth]  do
	  depth := depth + 1;
        od;
        exp := 0;
        repeat
            exp := exp+1;
	    if depth<2 or depth>ml then
	      return fail;
	    fi;
            elm := LeftQuotient( pcgs[depth-1], elm );
        until elm in series[depth];
        exps[depth-1] := exp;
    od;

    return exps;

end );


#############################################################################
##
#M  RelativeOrders( <pcgs> )
##
InstallMethod( RelativeOrders, "pc series", true, [ IsPcgs ], 0,
function( pcgs )
    local   ord,  pcs,  i;

    ord := [];
    pcs := PcSeries(pcgs);
    for i  in [ 1 .. Length(pcs)-1 ]  do
        Add( ord, Size(pcs[i]) / Size(pcs[i+1]) );
    od;
    return ord;
end );


#############################################################################
##
#M  PcSeries( <pcgs> )
##
InstallMethod( PcSeries,"construct subgroups", true, [ IsPcgs ], 0,
function( pcgs )
    local   grp,  series,  i;

    # construct the group generated by <pcgs>
    #T  1996/10/01 fceller something seems to break for Difference or Set
    #T  grp := GroupByGenerators( pcgs, One(pcgs) );
#T seems to work now, 1998/12/09 sam

    grp := GroupOfPcgs(pcgs);

    # construct the series
    series := [ grp ];
    for i  in [ 2 .. Length(pcgs)+1 ]  do
        Add( series, SubgroupByPcgs( grp,
	  InducedPcgsByPcSequenceNC(pcgs,pcgs{[ i .. Length(pcgs) ]} ) ));
    od;

    return series;

end );


#############################################################################
##

#E
##
