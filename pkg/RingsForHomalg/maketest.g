## This file is automatically generated
## Standard maketest.g for the homalg project

LoadPackage( "RingsForHomalg" );
LoadPackage( "IO_ForHomalg" );
HOMALG_IO.show_banners := false;
HOMALG_IO.suppress_PID := true;
Read( "ListOfDocFiles.g" );
example_tree := ExtractExamples( DirectoriesPackageLibrary( "RingsForHomalg", "doc" )[1]![1], "RingsForHomalg.xml", list, 500 );
RunExamples( example_tree, rec( compareFunction := "uptowhitespace" ) );
GAPDocManualLab( "RingsForHomalg" );
QUIT;
