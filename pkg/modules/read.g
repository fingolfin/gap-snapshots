# SPDX-License-Identifier: GPL-2.0-or-later
# Modules: A homalg based package for the Abelian category of finitely presented modules over computable rings
#
# Reading the implementation part of the package.
#

## init
ReadPackage( "Modules", "gap/ModulesForHomalg.gi" );

## rings
ReadPackage( "Modules", "gap/HomalgRingMap.gi" );

## relations/generators
ReadPackage( "Modules", "gap/HomalgRelations.gi" );
ReadPackage( "Modules", "gap/SetsOfRelations.gi" );
ReadPackage( "Modules", "gap/HomalgGenerators.gi" );
ReadPackage( "Modules", "gap/SetsOfGenerators.gi" );

## modules/submodules
ReadPackage( "Modules", "gap/HomalgModule.gi" );
ReadPackage( "Modules", "gap/HomalgSubmodule.gi" );

## maps
ReadPackage( "Modules", "gap/HomalgMap.gi" );

## elements
ReadPackage( "Modules", "gap/HomalgModuleElement.gi" );

## filtrations
ReadPackage( "Modules", "gap/HomalgFiltration.gi" );

## complexes
ReadPackage( "Modules", "gap/HomalgComplex.gi" );

## chain maps
ReadPackage( "Modules", "gap/HomalgChainMap.gi" );

## bicomplexes
ReadPackage( "Modules", "gap/HomalgBicomplex.gi" );

## bigraded objects
ReadPackage( "Modules", "gap/HomalgBigradedObject.gi" );

## main
ReadPackage( "Modules", "gap/Modules.gi" );
ReadPackage( "Modules", "gap/ToolFunctors.gi" );
ReadPackage( "Modules", "gap/BasicFunctors.gi" );
ReadPackage( "Modules", "gap/OtherFunctors.gi" );

## symmetric algebra
ReadPackage( "Modules", "gap/SymmetricAlgebra.gi" );

## exterior algebra
ReadPackage( "Modules", "gap/ExteriorAlgebra.gi" );

## tools
ReadPackage( "Modules", "gap/Tools.gi" );

## elements of the Grothendieck group of a projective space
ReadPackage( "Modules", "gap/GrothendieckGroup.gi" );

## LogicForHomalg subpackages
ReadPackage( "Modules", "gap/LIMAP.gi" );
ReadPackage( "Modules", "gap/LIREL.gi" );
ReadPackage( "Modules", "gap/LIMOD.gi" );
ReadPackage( "Modules", "gap/LIHOM.gi" );

HOMALG_MODULES.category.TypeOfElements := TheTypeHomalgModuleElement;

if IsBound( MakeThreadLocal ) then
    Perform(
            [
             "HOMALG_MODULES",
             "LIMOD",
             "LogicalImplicationsForHomalgModules",
             "LogicalImplicationsForHomalgModulesOverSpecialRings",
             "LIHOM",
             "LogicalImplicationsForHomalgMaps",
             "LogicalImplicationsForHomalgSelfMaps",
             ],
            MakeThreadLocal );
fi;

HOMALG_MODULES.category.TypeOfElements := TheTypeHomalgModuleElement;
