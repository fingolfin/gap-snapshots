#############################################################################
##
#W  testall.g                 GAP4 package `XMod'               Chris Wensley
## 
##  version 2.18, 18/04/2012 
##
#Y  Copyright (C) 2012, Murat Alp and Chris Wensley, 
#Y  School of Computer Science, Bangor University, U.K. 
##
#############################################################################

LoadPackage( "xmod", false );
xmod_tst_dir := DirectoriesPackageLibrary( "xmod", "tst" );

tnam := Filename( xmod_tst_dir, "gp2obj.tst" );
ss := InputTextString( StringFile( tnam ) );; 
Test( ss ); 

tnam := Filename( xmod_tst_dir, "gp2map.tst" );
ss := InputTextString( StringFile( tnam ) );; 
Test( ss ); 

tnam := Filename( xmod_tst_dir, "gp2up.tst" );
ss := InputTextString( StringFile( tnam ) );; 
Test( ss ); 

tnam := Filename( xmod_tst_dir, "gp2act.tst" );
ss := InputTextString( StringFile( tnam ) );; 
Test( ss ); 

tnam := Filename( xmod_tst_dir, "gp2ind.tst" );
ss := InputTextString( StringFile( tnam ) );; 
Test( ss ); 

tnam := Filename( xmod_tst_dir, "gp3objmap.tst" );
ss := InputTextString( StringFile( tnam ) );; 
Test( ss ); 

tnam := Filename( xmod_tst_dir, "gpd2obj.tst" );
ss := InputTextString( StringFile( tnam ) );; 
Test( ss ); 

tnam := Filename( xmod_tst_dir, "util.tst" );
ss := InputTextString( StringFile( tnam ) );; 
Test( ss ); 

