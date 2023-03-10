# SPDX-License-Identifier: GPL-2.0-or-later
# RingsForHomalg: Dictionaries of external rings
#
# Implementations
#

##  Implementations for the rings provided by the Maple package JanetOre
##  accessed via the Maple implementation of homalg.

####################################
#
# constructor functions and methods:
#
####################################

InstallMethod( CreateHomalgTable,
        "for homalg rings provided by the maple package JanetOre",
        [ IsHomalgExternalRingObjectInMapleUsingJanetOreRep ],

  function( ext_ring_obj )
    local RP, RP_Basic, RP_General, RP_BestBasis, RP_specific, component;
    
    RP := ShallowCopy( CommonHomalgTableForMapleHomalgTools );
    
    RP_General := ShallowCopy( CommonHomalgTableForRings );
    
    RP_Basic := ShallowCopy( CommonHomalgTableForMapleHomalgBasic );
    
    RP_BestBasis := ShallowCopy( CommonHomalgTableForMapleHomalgBestBasis );
    
    RP_specific :=
          rec(
               ## Can optionally be provided by the RingPackage
               ## (homalg functions check if these functions are defined or not)
               ## (homalgTable gives no default value)
               
               RingName := function( R ) local r; if HasCoefficientsRing( R ) then r := RingName( CoefficientsRing( R ) ); else r := "k"; fi; return Concatenation( r, "<", homalgSendBlocking( [ "op(", R, "[1][1])" ], "need_output", "variables" ), "|", homalgSendBlocking( [ "op(", R, "[1][3])" ], "need_output", "variables" ), ">" ); end,
               
          );
    
    for component in NamesOfComponents( RP_General ) do
        RP.(component) := RP_General.(component);
    od;
    
    for component in NamesOfComponents( RP_Basic ) do
        RP.(component) := RP_Basic.(component);
    od;
    
    for component in NamesOfComponents( RP_specific ) do
        RP.(component) := RP_specific.(component);
    od;
    
    Objectify( TheTypeHomalgTable, RP );
    
    return RP;
    
end );
