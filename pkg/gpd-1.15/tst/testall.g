##############################################################################
##
#W  testall.g                     Gpd Package                    Chris Wensley
##
##  version 1.14, 20/04/2012   
##
#Y  Copyright (C) 2012, Chris Wensley,  
#Y  School of Computer Science, Bangor University, U.K. 
##  

LoadPackage( "gpd" ); 
gpd_tst_dir := DirectoriesPackageLibrary( "gpd", "tst" );; 

tnam := Filename( gpd_tst_dir, "mwo.tst" );
ss := InputTextString( StringFile( tnam ) );; 
Test( ss ); 

tnam := Filename( gpd_tst_dir, "mwohom.tst" );
ss := InputTextString( StringFile( tnam ) );; 
Test( ss ); 

tnam := Filename( gpd_tst_dir, "gpd.tst" );
ss := InputTextString( StringFile( tnam ) );; 
Test( ss ); 

tnam := Filename( gpd_tst_dir, "gpdhom.tst" );
ss := InputTextString( StringFile( tnam ) );; 
Test( ss ); 

tnam := Filename( gpd_tst_dir, "ggraph.tst" );
ss := InputTextString( StringFile( tnam ) );; 
Test( ss ); 
