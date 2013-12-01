##############################################################################
##
#W  readall.g                     GAP4 package `Gpd'             Chris Wensley
#W                                                                & Emma Moore
##  version 1.11, 20/09/2011 
##
#Y  Copyright (C) 2011, Emma Moore and Chris Wensley,  
#Y  School of Computer Science, Bangor University, U.K. 
##  

LoadPackage( "gpd", false ); 
gpd_examples_dir := DirectoriesPackageLibrary( "gpd", "examples" ); 

Read( Filename( gpd_examples_dir, "mwo.g" ) ); 
Read( Filename( gpd_examples_dir, "mwohom.g" ) ); 
Read( Filename( gpd_examples_dir, "gpd.g" ) ); 
Read( Filename( gpd_examples_dir, "gpdhom.g" ) ); 
Read( Filename( gpd_examples_dir, "ggraph.g" ) ); 