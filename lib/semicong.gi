#############################################################################
##
#W  semicong.gi                  GAP library   	               Andrew Solomon
##
#H  @(#)$Id: semicong.gi,v 4.16 2002/04/15 10:05:21 sal Exp $
##
#Y  Copyright (C)  1996,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file contains generic methods for semigroup congruences.
##
##  Maintenance and further development by:
##  Robert F. Morse
##  Andrew Solomon
##
Revision.semicong_gi :=
    "@(#)$Id: semicong.gi,v 4.16 2002/04/15 10:05:21 sal Exp $";

######################################################################
##
##
#P  LeftSemigroupCongruenceByGeneratingPairs( <semigroup>, <gens> )
#P  RightSemigroupCongruenceByGeneratingPairs( <semigroup>, <gens> )
#P  SemigroupCongruenceByGeneratingPairs( <semigroup>, <gens> )
##
##
######################################################################

InstallMethod( LeftSemigroupCongruenceByGeneratingPairs,
    "for a Semigroup  and a list of pairs of its elements",
    IsElmsColls,
    [ IsSemigroup, IsList ], 0,
    function( M, gens )
        local cong;
        cong := LR2MagmaCongruenceByGeneratingPairsCAT(M, gens, 
                    IsLeftMagmaCongruence);
        SetIsLeftSemigroupCongruence(cong,true);
        return cong;
    end );

InstallMethod( LeftSemigroupCongruenceByGeneratingPairs,
    "for a Semigroup and an empty list",
    true,
    [ IsSemigroup, IsList and IsEmpty ], 0,
    function( M, gens )
        local cong;
        cong := LR2MagmaCongruenceByGeneratingPairsCAT(M, gens, 
                    IsLeftMagmaCongruence);
        SetIsLeftSemigroupCongruence(cong,true);
        SetEquivalenceRelationPartition(cong,[]);
        return cong;
    end );

InstallMethod( RightSemigroupCongruenceByGeneratingPairs,
    "for a Semigroup and a list of pairs of its elements",
    IsElmsColls,
    [ IsSemigroup, IsList ], 0,
    function( M, gens )
        local cong;
        cong := LR2MagmaCongruenceByGeneratingPairsCAT(M, gens, 
                    IsRightMagmaCongruence);
        SetIsRightSemigroupCongruence(cong,true);
        return cong;
    end );

InstallMethod( RightSemigroupCongruenceByGeneratingPairs,
    "for a Semigroup and an empty list",
    true,
    [ IsSemigroup, IsList and IsEmpty ], 0,
    function( M, gens )
        local cong;
        cong := LR2MagmaCongruenceByGeneratingPairsCAT(M, gens, 
                    IsRightMagmaCongruence);
        SetIsRightSemigroupCongruence(cong,true);
        SetEquivalenceRelationPartition(cong,[]);
        return cong;
    end );

InstallMethod( SemigroupCongruenceByGeneratingPairs,
    "for a semigroup and a list of pairs of its elements",
    IsElmsColls,
    [ IsSemigroup, IsList ], 0,
    function( M, gens )
        local cong;
        cong := LR2MagmaCongruenceByGeneratingPairsCAT(M, gens, 
                    IsMagmaCongruence);
        SetIsSemigroupCongruence(cong,true);
        return cong;
    end );

InstallMethod( SemigroupCongruenceByGeneratingPairs,
    "for a semigroup and an empty list",
    true,
    [ IsSemigroup, IsList and IsEmpty], 0,
    function( M, gens )
        local cong;
        cong := LR2MagmaCongruenceByGeneratingPairsCAT(M, gens, 
                    IsMagmaCongruence);
        SetIsSemigroupCongruence(cong,true);
        SetEquivalenceRelationPartition(cong,[]);
        return cong;
    end );

#############################################################################
##
#P  IsLeftSemigroupCongruence(<c>)
#P  IsRightSemigroupCongruence(<c>)
#P  IsSemigroupCongruence(<c>)
##
InstallMethod( IsLeftSemigroupCongruence, 
    "test whether a left magma congruence is a semigroup a congruence", 
    true,
    [ IsLeftMagmaCongruence ], 0,
    function(c)
        return IsSemigroup(Source(c)); 
    end);            

InstallMethod( IsRightSemigroupCongruence, 
    "test whether a right magma congruence is a semigroup a congruence",
    true,
    [ IsRightMagmaCongruence ], 0,
    function(c)
        return IsSemigroup(Source(c)); 
    end);            

InstallMethod( IsSemigroupCongruence, 
    "test whether a magma congruence is a semigroup a congruence",
    true,
    [ IsMagmaCongruence ], 0,
    function(c)
        return IsSemigroup(Source(c)); 
    end);            

#############################################################################
##
#M  IsReesCongruence(<c>)
##
##  True when the congruence has at most one
##  nonsingleton congruence class and that equivalence
##  class forms an ideal of the semigroup.
##  A special check is needed if the congruence is the
##  diagonal congruence -- as this congruence is a Rees
##  congruence only if the semigroup contains a zero element.
##
InstallMethod( IsReesCongruence,
    "for a semigroup congruence",
    true,
    [ IsSemigroupCongruence ], 0,
    function( cong )
        local part,  # partition
              id,    # ideal generated by non singleton block
              it,    # iterator of id
              s,     # underlying semigroup 
              i;     # index variable

        part := EquivalenceRelationPartition(cong);

        # Determine if the congruence is Green's relation
        #    we have slightly different attributes as the 
        #    relation is represented on points.
        #
        if IsGreensRelation(cong) then
            s := AssociatedSemigroup(cong);
            part := List(part, x->List(x,y->AsSortedList(s)[y]));
        else 
            s := Source(cong);
        fi; 


        if Length(part)=0 then
            # if all blocks are singletons we must check to see
            # if the semigroup contains a zero otherwise return false.
            #
            # See if it already has one -- if so return true
            #
            if HasMultiplicativeZero(s) then return true; fi;

            # The semigroup might have a zero it just isn't identified
            # yet.
            #
            # Using the IsMultiplicativeZero method for semigroups
            # is the most efficient which only checks with the
            # generators of the semigroup. We prune our search to the 
            # idempotents.

            return ForAny(Idempotents(s), x->IsMultiplicativeZero(s,x));

        elif Length(part)=1 then
            # if there is one non singletion block
            # check that it forms an ideal
            id := MagmaIdealByGenerators(s,part[1]);

            # loop through the elements of the ideal id
            # until you find an element not in the non singleton block
            it := Iterator(id);
            while not IsDoneIterator(it) do
                if not NextIterator(it) in part[1] then
                    return false;
                fi;
            od;
            # here we know that the block forms an ideal
            # hence the congruence is Rees
            return true;
        else
            # if the partition has more than one non singleton class
            # then it is not a Rees congruence
            return false;
        fi;
    end);


#############################################################################
##
#M  PrintObj( <smg cong> ) 
##
##  left semigroup congruence
##
InstallMethod( PrintObj,
    "for a left semigroup congruence",
    true,
    [ IsLeftSemigroupCongruence ], 0,
    function( S )
        Print( "LeftSemigroupCongruence( ... )" );
    end );

InstallMethod( PrintObj,
    "for a left semigroup congruence with known generating pairs",
    true,
    [ IsLeftSemigroupCongruence and HasGeneratingPairsOfMagmaCongruence ], 0,
    function( S )
        Print( "LeftSemigroupCongruence( ", 
               GeneratingPairsOfMagmaCongruence( S ), " )" );
    end );

##  right semigroup congruence

InstallMethod( PrintObj,
    "for a right semigroup congruence",
    true,
    [ IsRightSemigroupCongruence ], 0,
    function( S )
        Print( "RightSemigroupCongruence( ... )" );
    end );

InstallMethod( PrintObj,
    "for a right semigroup congruence with known generating pairs",
    true,
    [ IsRightSemigroupCongruence and HasGeneratingPairsOfMagmaCongruence ], 0,
    function( S )
        Print( "RightSemigroupCongruence( ", 
                   GeneratingPairsOfMagmaCongruence( S ), " )" );
    end );

##  two sided semigroup congruence

InstallMethod( PrintObj,
    "for a semigroup congruence",
    true,
    [ IsSemigroupCongruence ], 0,
    function( S )
        Print( "SemigroupCongruence( ... )" );
    end );

InstallMethod( PrintObj,
    "for a semigroup Congruence with known generating pairs",
    true,
    [ IsSemigroupCongruence and HasGeneratingPairsOfMagmaCongruence ], 0,
    function( S )
        Print( "SemigroupCongruence( ",
               GeneratingPairsOfMagmaCongruence( S ), " )" );
    end );


#############################################################################
##
#M  ViewObj( <smg cong> ) 
##

##  left semigroup congruence

InstallMethod( ViewObj,
    "for a LeftSemigroupCongruence",
    true,
    [ IsLeftSemigroupCongruence ], 0,
    function( S )
        Print( "<LeftSemigroupCongruence>" );
    end );

InstallMethod( ViewObj,
    "for a LeftSemigroupCongruence with known generating pairs",
    true,
    [ IsLeftSemigroupCongruence and HasGeneratingPairsOfMagmaCongruence ], 0,
    function( S )
        Print( "<LeftSemigroupCongruence with ", 
               Length( GeneratingPairsOfMagmaCongruence( S ) ), 
               " generating pairs>" );
    end );

##  right semigroup congruence

InstallMethod( ViewObj,
    "for a RightSemigrouCongruence",
    true,
    [ IsRightSemigroupCongruence ], 0,
    function( S )
        Print( "<RightSemigroupCongruence>" );
    end );

InstallMethod( ViewObj,
    "for a RightSemigroupCongruence with generators",
    true,
    [ IsRightSemigroupCongruence and HasGeneratingPairsOfMagmaCongruence ], 0,
    function( S )
        Print( "<RightSemigroupCongruence with ", 
               Length( GeneratingPairsOfMagmaCongruence( S ) ), 
               " generating pairs>" );
    end );

## two sided semigroup congruence

InstallMethod( ViewObj,
    "for a semigroup congruence",
    true,
    [ IsSemigroupCongruence ], 0,
    function( S )
        Print( "<semigroup congruence>" );
    end );

InstallMethod( ViewObj,
    "for a semigroup Congruence with known generating pairs",
    true,
    [ IsSemigroupCongruence and HasGeneratingPairsOfMagmaCongruence ], 0,
    function( S )
        Print( "<semigroup congruence with ",
               Length(GeneratingPairsOfMagmaCongruence( S )), 
               " generating pairs>" );
    end );

#############################################################################
##
#E

