## This file is automatically generated by AutoDoc.
## Changes will be discarded by the next call of the AutoDoc method.


LoadPackage( "CAP" );

LoadPackage( "IO_ForHomalg" );

LoadPackage( "GaussForHomalg" );

LoadPackage( "GeneralizedMorphismsForCAP" );

LoadPackage( "LinearAlgebraForCAP" );

HOMALG_IO.show_banners := false;

HOMALG_IO.suppress_PID := true;

HOMALG_IO.use_common_stream := true;

AUTODOC_file_scan_list := [ "../PackageInfo.g", "../examples/ArtinianModules.g", "../examples/Example.g", "../examples/FiniteZModules.g", "../examples/IntersectionCospan.g", "../examples/IntersectionSpan.g", "../examples/IntersectionThreeArrow.g", "../examples/IsSupportedInOrigin.g", "../examples/QuasiAffine.g", "../examples/Sweep.g", "../gap/GeneralizedMorphismCategory.gd", "../gap/GeneralizedMorphismCategory.gi", "../gap/GeneralizedMorphismCategoryByCospans.gd", "../gap/GeneralizedMorphismCategoryByCospans.gi", "../gap/GeneralizedMorphismCategoryBySpans.gd", "../gap/GeneralizedMorphismCategoryBySpans.gi", "../gap/GeneralizedMorphismCategoryByThreeArrows.gd", "../gap/GeneralizedMorphismCategoryByThreeArrows.gi", "../gap/GeneralizedMorphismCategoryFunctors.gd", "../gap/GeneralizedMorphismCategoryFunctors.gi", "../gap/SerreQuotientSubcategory.gd", "../gap/SerreQuotientSubcategory.gi", "../gap/SerreQuotients.gd", "../gap/SerreQuotients.gi", "../gap/SerreQuotientsByCospans.gd", "../gap/SerreQuotientsByCospans.gi", "../gap/SerreQuotientsBySpans.gd", "../gap/SerreQuotientsBySpans.gi", "../gap/SerreQuotientsByThreeArrows.gd", "../gap/SerreQuotientsByThreeArrows.gi", "../gap/SerreQuotientsFunctors.gd", "../gap/SerreQuotientsFunctors.gi", "../gap/Switcher.gd", "../gap/Switcher.gi", "../init.g", "../makedoc.g", "../read.g", "/home/gap/.gap/pkg/CAP_project/tmp/GeneralizedMorphismsForCAP-2020.10-01/doc/_Chunks.xml" ];

LoadPackage( "GAPDoc" );

example_tree := ExtractExamples( Directory("./doc/"), "GeneralizedMorphismsForCAP.xml", AUTODOC_file_scan_list, 500 );

RunExamples( example_tree, rec( compareFunction := "uptowhitespace" ) );

QUIT;
