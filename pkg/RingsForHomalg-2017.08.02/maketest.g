LoadPackage( "AutoDoc" );
LoadPackage( "RingsForHomalg" );
LoadPackage( "IO_ForHomalg" );
HOMALG_IO.show_banners := false;
HOMALG_IO.suppress_PID := true;

dir := DirectoryCurrent( );
files := AUTODOC_FindMatchingFiles( dir,
    ["gap", "examples", "examples/doc" ],
    [ "g", "gi", "gd" ] );
files := List(files, x -> Concatenation("../", x));

example_tree := ExtractExamples( Directory("doc/"), "RingsForHomalg.xml", files, "All" );
RunExamples( example_tree, rec( compareFunction := "uptowhitespace" ) );

QUIT;
