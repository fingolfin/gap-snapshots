# SPDX-License-Identifier: GPL-2.0-or-later
# GradedRingForHomalg: Endow Commutative Rings with an Abelian Grading
#
# Reading the declaration part of the package.
#

## init
ReadPackage( "GradedRingForHomalg", "gap/GradedRingForHomalg.gd" );

## graded rings
ReadPackage( "GradedRingForHomalg", "gap/GradedRing.gd" );

## matrices over graded rings
ReadPackage( "GradedRingForHomalg", "gap/MatrixOverGradedRing.gd" );

## the basic matrix operations
ReadPackage( "GradedRingForHomalg", "gap/GradedRingBasic.gd" );

## the matrix tool operations
ReadPackage( "GradedRingForHomalg", "gap/GradedRingTools.gd" );

## build the homalgTable
ReadPackage( "GradedRingForHomalg", "gap/GradedRingTable.gd" );

## ring element and matrix tools
ReadPackage( "GradedRingForHomalg", "gap/Tools.gd" );

## LogicForHomalg subpackages
ReadPackage( "GradedRingForHomalg", "gap/LIGrRNG.gd" );
ReadPackage( "GradedRingForHomalg", "gap/LIHMAT.gd" );

## homalg table entries for the supported external computer algebra systems
ReadPackage( "GradedRingForHomalg", "gap/SingularTools.gd" );
ReadPackage( "GradedRingForHomalg", "gap/Macaulay2Tools.gd" );
ReadPackage( "GradedRingForHomalg", "gap/MAGMATools.gd" );
ReadPackage( "GradedRingForHomalg", "gap/MapleHomalgTools.gd" );
ReadPackage( "GradedRingForHomalg", "gap/OscarTools.gd" );
