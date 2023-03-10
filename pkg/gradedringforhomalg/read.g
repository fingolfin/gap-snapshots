# SPDX-License-Identifier: GPL-2.0-or-later
# GradedRingForHomalg: Endow Commutative Rings with an Abelian Grading
#
# Reading the implementation part of the package.
#

## init
ReadPackage( "GradedRingForHomalg", "gap/GradedRingForHomalg.gi" );

## graded rings
ReadPackage( "GradedRingForHomalg", "gap/GradedRing.gi" );

## matrices over graded rings
ReadPackage( "GradedRingForHomalg", "gap/MatrixOverGradedRing.gi" );

## the basic matrix operations
ReadPackage( "GradedRingForHomalg", "gap/GradedRingBasic.gi" );

## the matrix tool operations
ReadPackage( "GradedRingForHomalg", "gap/GradedRingTools.gi" );

## build the homalgTable
ReadPackage( "GradedRingForHomalg", "gap/GradedRingTable.gi" );

## ring element and matrix tools
ReadPackage( "GradedRingForHomalg", "gap/Tools.gi" );

## LogicForHomalg subpackages
ReadPackage( "GradedRingForHomalg", "gap/LIGrRNG.gi" );
ReadPackage( "GradedRingForHomalg", "gap/LIHMAT.gi" );


## homalg table entries for the supported external computer algebra systems
ReadPackage( "GradedRingForHomalg", "gap/SingularTools.gi" );
ReadPackage( "GradedRingForHomalg", "gap/Macaulay2Tools.gi" );
ReadPackage( "GradedRingForHomalg", "gap/MAGMATools.gi" );
ReadPackage( "GradedRingForHomalg", "gap/MapleHomalgTools.gi" );
ReadPackage( "GradedRingForHomalg", "gap/OscarTools.gi" );

if IsBound( MakeThreadLocal ) then
    Perform(
            [
             "HOMALG_GRADED_RING",
             "LIGrRNG",
             "CommonHomalgTableForGradedRings",
             "CommonHomalgTableForGradedRingsBasic",
             "HomalgTableLinearSyzygiesForGradedRingsBasic",
             "CommonHomalgTableForGradedRingsTools",
             "GradedRingMacrosForMAGMA",
             "GradedRingTableForMAGMATools",
             "GradedRingMacrosForMacaulay2",
             "GradedRingTableForMacaulay2Tools",
             "GradedRingMacrosForMaple",
             "GradedRingTableForMapleHomalgTools",
             "GradedRingMacrosForSingular",
             "GradedRingTableForSingularTools",
             "GradedRingMacrosForOscar",
             "GradedRingTableForOscarTools",
             ],
            MakeThreadLocal );
fi;
