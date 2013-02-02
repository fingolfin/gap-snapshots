##############################################################################
##
#W  testall.g                    Kan Package                     Chris Wensley
#W                                                             & Anne Heyworth
##  version 1.02, 23/04/2012
##
#Y  Copyright (C) 1996-2012, Chris Wensley and Anne Heyworth 
##

LoadPackage( "kan" );
kan_tst_dir := DirectoriesPackageLibrary( "kan", "tst" ); 
if ( Filename( KBMAG_FOR_KAN_PATH, "kbprog" ) = fail ) then 
    tnam := Filename( kan_tst_dir, "parttest.tst" );
    ss := InputTextString( StringFile( tnam ) );; 
    Test( ss ); 
else 
    tnam := Filename( kan_tst_dir, "fulltest.tst" );
    ss := InputTextString( StringFile( tnam ) );; 
    Test( ss ); 
fi; 
