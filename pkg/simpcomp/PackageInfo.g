################################################################################
##
##  simpcomp / PackageInfo.g
##
##  PackageInfo.g for package simpcomp
##
##  $Id$
##
################################################################################

SetPackageInfo( rec(

PackageName := "simpcomp",
Subtitle := "A GAP toolbox for simplicial complexes",
Version := "1.5.4",
Date := "23/11/2011",

ArchiveURL :=Concatenation( "http://www.igt.uni-stuttgart.de/LstDiffgeo/simpcomp/simpcomp-",String(~.Version)),
ArchiveFormats := ".tar.gz",

Persons := [
  rec(
      LastName      := "Effenberger",
      FirstNames    := "Felix",
      IsAuthor      := true,
      IsMaintainer  := true,
      Email         := "effenberger@mathematik.uni-stuttgart.de",
      WWWHome       := "http://www.igt.uni-stuttgart.de/LstDiffgeo/Effenberger",
      PostalAddress := Concatenation( [
            "Institut fuer Geometrie und Topologie\n",
            "Universitaet Stuttgart\n",
            "Pfaffenwaldring 57" ] ),
      Place         := "70550 Stuttgart",
      Institution   := "University of Stuttgart"),
  rec(
      LastName      := "Spreer",
      FirstNames    := "Jonathan",
      IsAuthor      := true,
      IsMaintainer  := true,
      Email         := "spreer@mathematik.uni-stuttgart.de",
      WWWHome       := "http://www.igt.uni-stuttgart.de/LstDiffgeo/Spreer",
      PostalAddress := Concatenation( [
            "Institut fuer Geometrie und Topologie\n",
            "Universitaet Stuttgart\n",
            "Pfaffenwaldring 57" ] ),
      Place         := "70550 Stuttgart",
      Institution   := "University of Stuttgart")
    ],

##  Status information. Currently the following cases are recognized:
##    "accepted"      for successfully refereed packages
##    "deposited"     for packages for which the GAP developers agreed 
##                    to distribute them with the core GAP system
##    "dev"           for development versions of packages 
##    "other"         for all other packages
##
Status := "deposited",

##  You must provide the next two entries if and only if the status is 
##  "accepted" because is was successfully refereed:
# format: 'name (place)'
# CommunicatedBy := "Mike Atkinson (St. Andrews)",
#CommunicatedBy := "",
# format: mm/yyyy
# AcceptDate := "08/1999",
#AcceptDate := "",
#CommunicatedBy := "",
#AcceptDate := "",

README_URL := "http://www.igt.uni-stuttgart.de/LstDiffgeo/simpcomp/README",
PackageInfoURL := "http://www.igt.uni-stuttgart.de/LstDiffgeo/simpcomp/PackageInfo.g",

AbstractHTML :=
  "<span class=\"pkgname\">simpcomp</span> is a <span class=\"pkgname\">GAP</span> package for working with simplicial complexes. It allows the computation of many properties of simplicial complexes (such as the f-, g- and h-vectors, the face lattice, the automorphism group, (co-)homology with explicit basis computation, intersection form, etc.) and provides the user with functions to compute new complexes from old (simplex links and stars, connected sums, cartesian products, handle additions, bistellar flips, etc.). Furthermore, it comes with an extensive library of known triangulations of manifolds and provides the user with the possibility to create own complex libraries.<br /> <span class=\"pkgname\">simpcomp</span> caches computed properties of a simplicial complex, thus avoiding unnecessary computations, internally handles the vertex labeling of the complexes and insures the consistency of a simplicial complex throughout all operations.<br /> <span class=\"pkgname\">simpcomp</span> relies on the <span class=\"pkgname\">GAP</span> package <span class=\"pkgname\">homology</span> for its homology computation, but also provides the user with an own (co-)homology algorithm in case the packacke <span class=\"pkgname\">homology</span> is not available. For automorphism group computation the <span class=\"pkgname\">GAP</span> package <span class=\"pkgname\">GRAPE</span> is used, which in turn uses the program <tt>nauty</tt> by Brendan McKay. An internal automorphism group calculation algorithm in used as fallback if the <span class=\"pkgname\">GRAPE</span> package is not available.",

PackageWWWHome := "http://www.igt.uni-stuttgart.de/LstDiffgeo/simpcomp/",

PackageDoc := rec(
  # use same as in GAP
  BookName  := "simpcomp",
  # format/extension can be one of .zoo, .tar.gz, .tar.bz2, -win.zip
  #Archive := Concatenation("simpcomp-doc-",String(~.Version),".tar.gz"),
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  # the path to the .six file used by GAP's help system
  SixFile   := "doc/manual.six",
  # a longer title of the book, this together with the book name should
  # fit on a single text line (appears with the '?books' command in GAP)
  LongTitle := "A GAP toolbox for simplicial complexes",
  # Should this help book be autoloaded when GAP starts up? This should
  # usually be 'true', otherwise say 'false'.
  Autoload  := true
),


##  Are there restrictions on the operating system for this package? Or does
##  the package need other packages to be available?
Dependencies := rec(
  GAP := ">=4.5",
  NeededOtherPackages := [[ "GAPDoc", ">=0.9999" ],[ "io", ">=3.0" ]],
  SuggestedOtherPackages := [[ "Homology", ">=1.4.2" ],[ "GRAPE", ">=4.4" ],[ "homalg", ">=2011.10.05" ]],
	ExternalConditions := []
),

Autoload := false,

##  If the default banner does not suffice then provide a string that is
##  printed when the package is loaded (not when it is autoloaded or if
##  command line options `-b' or `-q' are given).
BannerString :=Concatenation("Loading simpcomp ",String(~.Version),"\nby F.Effenberger and J.Spreer\nhttp://www.igt.uni-stuttgart.de/LstDiffgeo/simpcomp\n"),

AvailabilityTest := 
function()
	if not ARCH_IS_UNIX() then
	  Info(InfoWarning, 1, "simpcomp: non-Unix architecture, some functionality will not work.");
	fi;
	
	return true;
end,

##  *Optional*, but recommended: path relative to package root to a file which
##  contains as many tests of the package functionality as sensible.
TestFile := "tst/simpcomp.tst",


Keywords := ["simplicial topology", "combinatorial manifolds", "PL equivalence", "triangulating manifolds"]

));
