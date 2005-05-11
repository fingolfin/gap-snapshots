#############################################################################
##  
##  PackageInfo.g for the GAP 4 package TomLib                  Thomas Breuer
##  
SetPackageInfo( rec(
PackageName :=
  "TomLib",
MyVersion :=
  "1r1p2",
MyWWWHome :=
  "http://www.math.rwth-aachen.de/~Thomas.Breuer",
Subtitle :=
  "The GAP Library of Tables of Marks",
Version :=
  JoinStringsWithSeparator( SplitString( ~.MyVersion, "rp" ), "." ),
Autoload :=
  true,
Date :=
  # "06/05/2002" // Version 1.0  # the release date of GAP 4.3
  # "18/12/2003" // Version 1.1.1
  "26/02/2004",
PackageWWWHome :=
  Concatenation( ~.MyWWWHome, "/", LowercaseString( ~.PackageName ) ),
ArchiveURL :=
  Concatenation( ~.PackageWWWHome, "/", LowercaseString( ~.PackageName ),
                 ~.MyVersion ),
ArchiveFormats :=
  ".tar.gz,.zoo",
Persons := [
  rec(
    LastName := "Breuer",
    FirstNames := "Thomas",
    IsAuthor := false,
    IsMaintainer := true,
    Email := "sam@math.rwth-aachen.de",
    WWWHome := ~.MyWWWHome,
    Place := "Aachen",
    Institution := "Lehrstuhl D f&uuml;r Mathematik, RWTH Aachen",
    PostalAddress := Concatenation( [
      "Thomas Breuer\n",
      "Lehrstuhl D f&uuml;r Mathematik\n",
      "Templergraben 64\n",
      "52062 Aachen\n",
      "Germany"
      ] )
  ),
  rec(
    LastName := "Merkwitz",
    FirstNames := "Thomas",
    IsAuthor := true,
    IsMaintainer := false,
    Email := "Thomas.Merkwitz@Team4.DE"
#   WWWHome := 
  ),
  rec(
    LastName := "Pfeiffer",
    FirstNames := "G&ouml;tz",
    IsAuthor := true,
    IsMaintainer := false,
    Email := "goetz.pfeiffer@nuigalway.ie",
#   WWWHome := 
    Place := "Galway"
#   Institution := "",
#   PostalAddress := Concatenation( [
#     ] )
  ),
  ],
Status :=
  "deposited",
#CommunicatedBy :=
#  "name (place)",
#AcceptDate :=
#  "MM/YYYY",
README_URL :=
  Concatenation( ~.PackageWWWHome, "/README" ),
PackageInfoURL :=
  Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),
AbstractHTML := Concatenation( [
  "The package contains the <span class=\"pkgname\">GAP</span> ",
  "Library of Tables of Marks"
  ] ),
PackageDoc := rec(
  BookName :=
    "TomLib",
  ArchiveURLSubset :=
    [ "doc", "htm" ],
  HTMLStart :=
    "htm/chapters.htm",
  PDFFile :=
    "doc/manual.pdf",
  SixFile :=
    "doc/manual.six",
  LongTitle :=
    "The GAP Library of Tables of Marks",
  Autoload :=
    true
  ),
Dependencies := rec(
  GAP :=
    ">= 4.4",
  NeededOtherPackages :=
    [],
  SuggestedOtherPackages :=
    [ ["ctbllib", ">= 1.1"] ], # [["gpisotyp", ">= 1.0"]],
  ExternalConditions :=
    []
  ),
AvailabilityTest :=
  ReturnTrue,
TestFile :=
  "tst/testall.g",
Keywords :=
  ["table of marks", "Burnside matrix", "finite simple groups"]
) );

#############################################################################
##  
#E

