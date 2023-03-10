# SPDX-License-Identifier: GPL-2.0-or-later
# LocalizeRingForHomalg: A Package for Localization of Polynomial Rings
#
# Implementations
#

##  Implementations for localization at prime ideals

####################################
#
# constructor functions and methods:
#
####################################

##
InstallMethod( CreateHomalgTableForLocalizedRingsAtPrimeIdeals,
        "for polynomial homalg rings with Groebner basis computations",
        [ IsHomalgRing and IsCommutative ],
        
  function( globalR )
    local RP;
    
    RP := rec(
              Zero := Zero( globalR ),
              
              One := One( globalR ),
              
              MinusOne := MinusOne( globalR ),
              );
    
    ## RP_General
    AppendToAhomalgTable( RP, CommonHomalgTableForLocalizedRingsAtPrimeIdeals );
    
    ## RP_Tools
    AppendToAhomalgTable( RP, CommonHomalgTableForLocalizedRingsAtPrimeIdealsTools );
    
    AppendToAhomalgTable( RP, CommonHomalgTableForHomalgFakeLocalRing );
    
    ## Objectify
    Objectify( TheTypeHomalgTable, RP );
    
    return RP;
    
end );
