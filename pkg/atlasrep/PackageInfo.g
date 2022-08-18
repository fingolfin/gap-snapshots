#############################################################################
##
##  PackageInfo.g for the GAP 4 package AtlasRep                Thomas Breuer
##
SetPackageInfo( rec(
PackageName :=
  "AtlasRep",
Version :=
  "2.1.4",
MyWWWHome :=
  "https://www.math.rwth-aachen.de/~Thomas.Breuer",
Subtitle :=
  "A GAP Interface to the Atlas of Group Representations",
Date :=
  # "03/04/2001" -- Version 1.0
  # "23/10/2002" -- Version 1.1
  # "06/11/2003" -- Version 1.2
  # "05/04/2004" -- Version 1.2.1
  # "06/06/2007" -- Version 1.3
  # "01/10/2007" -- Version 1.3.1
  # "23/06/2008" -- Version 1.4
  # "12/07/2011" -- Version 1.5.0
  # "30/03/2016" -- Version 1.5.1
  # "02/05/2019" -- Version 2.0.0
  # "10/05/2019" -- Version 2.1.0
  # "23/02/2022" -- Version 2.1.1
  # "30/03/2022" -- Version 2.1.2
  # "04/08/2022" -- Version 2.1.3
  "05/08/2022", # -- Version 2.1.4
License :=
  "GPL-3.0-or-later",
PackageWWWHome :=
  Concatenation( ~.MyWWWHome, "/", LowercaseString( ~.PackageName ) ),
ArchiveURL :=
  Concatenation( ~.PackageWWWHome, "/", LowercaseString( ~.PackageName ),
                 "-", ~.Version ),
ArchiveFormats :=
  ".tar.gz",
Persons := [
  rec(
    LastName := "Wilson",
    FirstNames := "Robert A.",
    IsAuthor := true,
    IsMaintainer := false,
    Email := "R.A.Wilson@qmul.ac.uk",
    WWWHome := "http://www.maths.qmw.ac.uk/~raw",
    Place := "London",
    Institution := Concatenation( [
      "School of Mathematical Sciences, ",
      "Queen Mary, University of London",
      ] ),
    ),
  rec(
    LastName := "Parker",
    FirstNames := "Richard A.",
    IsAuthor := true,
    IsMaintainer := false,
    Email := "richpark7920@gmail.com",
  ),
  rec(
    LastName := "Nickerson",
    FirstNames := "Simon",
    IsAuthor := true,
    IsMaintainer := false,
    WWWHome := "http://nickerson.org.uk/groups",
    Institution := Concatenation( [
      "School of Mathematics, ",
      "University of Birmingham",
      ] ),
  ),
  rec(
    LastName := "Bray",
    FirstNames := "John N.",
    IsAuthor := true,
    IsMaintainer := false,
    Email := "J.N.Bray@qmul.ac.uk",
    WWWHome := "http://www.maths.qmw.ac.uk/~jnb",
    Place := "London",
    Institution := Concatenation( [
      "School of Mathematical Sciences, ",
      "Queen Mary, University of London",
      ] ),
  ),
  rec(
    LastName := "Breuer",
    FirstNames := "Thomas",
    IsAuthor := true,
    IsMaintainer := true,
    Email := "sam@math.rwth-aachen.de",
    WWWHome := ~.MyWWWHome,
    Place := "Aachen",
    Institution := "Lehrstuhl für Algebra und Zahlentheorie, RWTH Aachen",
    PostalAddress := Concatenation( [
      "Thomas Breuer\n",
      "Lehrstuhl für Algebra und Zahlentheorie\n",
      "Pontdriesch 14/16\n",
      "52062 Aachen\n",
      "Germany"
      ] ),
  ),
  ],
Status :=
  "accepted",
CommunicatedBy :=
  "Herbert Pahlings (Aachen)",
AcceptDate :=
  "04/2001",
README_URL :=
  Concatenation( ~.PackageWWWHome, "/README.md" ),
PackageInfoURL :=
  Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),
AbstractHTML := Concatenation( [
  "The package provides a <span class=\"pkgname\">GAP</span> interface ",
  "to the <a href=\"http://atlas.math.rwth-aachen.de/Atlas/v3\">",
  "Atlas of Group Representations</a>"
  ] ),
PackageDoc := rec(
  BookName :=
    "AtlasRep",
  ArchiveURLSubset :=
    [ "doc" ],
  HTMLStart :=
    "doc/chap0.html",
  PDFFile :=
    "doc/manual.pdf",
  SixFile :=
    "doc/manual.six",
  LongTitle :=
    "An Atlas of Group Representations",
  ),
Dependencies := rec(
  GAP :=
    ">= 4.11.0",  # need extended 'IntegratedStraightLineProgram'
  NeededOtherPackages := [
      [ "gapdoc", ">= 1.6.2" ],  # want extended 'InitialSubstringUTF8String'
    ],
  SuggestedOtherPackages := [
      [ "browse", ">= 1.8.3" ], # want extended 'BrowseAtlasInfo'
      [ "ctbllib", ">= 1.2" ], # want 'StructureDescriptionCharacterTableName'
      [ "ctblocks", ">= 1.0" ], # yields a data extension
      [ "io", ">= 3.3" ], # want file transfer tools
      [ "mfer", ">= 1.0" ], # yields a data extension
      [ "recog", ">= 1.3.1" ], # because of some functions in 'gap/test.g'
      [ "tomlib", ">= 1.0" ], # used in tests and min. degree computations
    ],
  ExternalConditions :=
    []
  ),
AvailabilityTest :=
  ReturnTrue,
TestFile :=
  "tst/testauto.g",
Keywords :=
  [ "group representations", "finite simple groups" ],
) );


#############################################################################
##
#E

