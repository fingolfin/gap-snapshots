################################################################################
##
##  simpcomp / init.g
##
##  init.g for package simpcomp
##
##  $Id$
##
################################################################################

DeclareInfoClass("InfoSimpcomp");
SetInfoLevel(InfoSimpcomp,1);

DeclareGlobalVariable("SCIntFunc");
InstallValue(SCIntFunc,rec());
MakeReadWriteGlobal("SCIntFunc");

DeclareGlobalVariable("SCSettings");
DeclareGlobalFunction("SCInfoLevel");

ReadPackage("simpcomp","lib/propobject.gd");
ReadPackage("simpcomp","lib/tools.gd");
ReadPackage("simpcomp","lib/complex.gd");
ReadPackage("simpcomp","lib/io.gd");
ReadPackage("simpcomp","lib/lib.gd");
ReadPackage("simpcomp","lib/glprops.gd");
ReadPackage("simpcomp","lib/operations.gd");
ReadPackage("simpcomp","lib/labelops.gd");
ReadPackage("simpcomp","lib/generate.gd");
ReadPackage("simpcomp","lib/bistellar.gd");
ReadPackage("simpcomp","lib/homology.gd");
ReadPackage("simpcomp","lib/normalsurface.gd");
ReadPackage("simpcomp","lib/morse.gd");
ReadPackage("simpcomp","lib/fromgroup.gd");
ReadPackage("simpcomp","lib/blowups.gd");

# checks if package 'homology' is present and working
SCIntFunc.SetupHomology:=function()
	local success;
	success:=LoadPackage("homology", ">=1.4.2", false);
	if success=true and IsBoundGlobal("SimplicialHomology") and not ForAny( ["homology_gap","smithform_gap"], file -> Filename(DirectoriesPackagePrograms("homology"), file) = fail) then
		return true;
	else
		return false;
	fi;
end;

# checks if package 'GRAPE' is present and working
SCIntFunc.SetupGrape:=function()
	local success;
	success:=LoadPackage("grape", ">=4.2", false);
	if success=true and IsBoundGlobal("AutGroupGraph") and IsBoundGlobal("EdgeOrbitsGraph") and Filename(DirectoriesPackagePrograms("grape"),"dreadnautB")<>fail then
		return true;
	else
		return false;
	fi;
end;

SCIntFunc.SetupHomalg:=function()
    local success;
    success:=[LoadPackage("Gauss", ">=2011.08.22", false),LoadPackage("MatricesForHomalg", ">=2011.10.08", false),LoadPackage("homalg", ">=2011.10.05", false), LoadPackage("GaussForHomalg", ">=2011.08.10", false), LoadPackage("Modules", ">=2011.10.05", false)];
    if ForAll(success,x->x=true) then
        return true;
    else
        return false;
    fi;
end; 


if(SCIntFunc.SetupHomology()=false) then
	Info(InfoSimpcomp+InfoWarning,1,"simpcomp: package `homology' not installed or its binaries are not available, falling back to (slower) internal homology algorithms.");
fi;


if(SCIntFunc.SetupGrape()=false) then
	Info(InfoSimpcomp+InfoWarning,1,"simpcomp: package `GRAPE' not installed or its binaries are not available, falling back to (slower) internal algorithms for automorphism group computation.");
fi;

if(SCIntFunc.SetupHomalg()=false) then
	Info(InfoSimpcomp+InfoWarning,1,"simpcomp: package `homalg' not installed, homalg-related functions will not be available. Needed packages are: homalg, GaussForHomalg and dependencies.");
else
	ReadPackage("simpcomp","lib/pkghomalg.gd");
fi;
