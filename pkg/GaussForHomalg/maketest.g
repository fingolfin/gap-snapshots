##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "GaussForHomalg" );
LoadPackage( "GAPDoc" );

LoadPackage( "Modules" );

list := [
         "../gap/GaussForHomalg.gi",
         "../gap/GaussTools.gi",
         "../gap/GaussBasic.gi",
         "../gap/GaussFQI.gi",
         "../examples/Hom(Hom(-,Z128),Z16)_On_Seq.g",
         ];

size := SizeScreen( );
SizeScreen([80]);

TestManualExamples( DirectoriesPackageLibrary( "GaussForHomalg", "doc" )[1]![1], "GaussForHomalg.xml", list );

GAPDocManualLab( "GaussForHomalg" );

SizeScreen( size );

quit;
