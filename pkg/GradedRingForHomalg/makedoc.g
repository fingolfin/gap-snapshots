##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "GAPDoc" );

SetGapDocLaTeXOptions( "utf8" );

bib := ParseBibFiles( "doc/GradedRingForHomalg.bib" );
WriteBibXMLextFile( "doc/GradedRingForHomalgBib.xml", bib );

list := [
         "../gap/GradedRing.gd",
         "../gap/GradedRing.gi",
         "../gap/MatrixOverGradedRing.gd",
         "../gap/MatrixOverGradedRing.gi",
         "../gap/GradedRingBasic.gd",
         "../gap/GradedRingBasic.gi",
         "../gap/Tools.gd",
         "../gap/Tools.gi",
         ];

PrintTo( "VERSION", PackageInfo( "GradedRingForHomalg" )[1].Version );

MakeGAPDocDoc( "doc", "GradedRingForHomalg", list, "GradedRingForHomalg" );

GAPDocManualLab("GradedRingForHomalg");

quit;
