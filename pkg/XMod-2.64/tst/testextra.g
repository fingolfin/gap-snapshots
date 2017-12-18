##############################################################################
##
#W  testextra.g                    XMod Package                  Chris Wensley 
##
#Y  Copyright (C) 2000-2017, Chris Wensley et al,  
#Y  School of Computer Science, Bangor University, U.K. 
##  

LoadPackage( "xmod" );

pkgname := "xmod"; 
pkgdir := DirectoriesPackageLibrary( pkgname, "tst" );
testfiles := [ "allxmods.xtst", "cat1mor.xtst" ];
testresult := true;
for ff in testfiles do
    fn := Filename( pkgdir, ff );
    Print( "#I  Testing ", fn, "\n" );
    if not Test( fn, rec(compareFunction := "uptowhitespace") ) then
        testresult := false;
    fi;
od;
if testresult then
    Print("#I  No errors detected in extra tests for ", pkgname, "\n");
else
    Print("#I  Errors detected in extra tests for ", pkgname, "\n");
fi;
