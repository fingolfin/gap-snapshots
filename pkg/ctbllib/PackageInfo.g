#############################################################################
##
##  PackageInfo.g for the GAP 4 package CTblLib                 Thomas Breuer
##
SetPackageInfo( rec(
PackageName :=
  "CTblLib",
Version :=
  "1.3.4",
MyWWWHome :=
  "https://www.math.rwth-aachen.de/~Thomas.Breuer",
Subtitle :=
  "The GAP Character Table Library",
Date :=
  # "21/01/2002" -- Version 1.0
  # "18/11/2003" -- Version 1.1.0
  # "20/11/2003" -- Version 1.1.1
  # "27/11/2003" -- Version 1.1.2
  # "31/03/2004" -- Version 1.1.3
  # "07/05/2012" -- Version 1.2.0
  # "30/05/2012" -- Version 1.2.1
  # "07/03/2013" -- Version 1.2.2
  # "30/12/2019" -- Version 1.3.0
  # "08/04/2020" -- Version 1.3.1
  # "28/03/2021" -- Version 1.3.2
  # "02/01/2022" -- Version 1.3.3
  "26/04/2022",   # Version 1.3.4
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
#   rec(  
#     LastName      := "Claßen-Houben",
#     FirstNames    := "Michael",
#     IsAuthor      := true, 
#     IsMaintainer  := false,
#     Email         := "michael@oph.rwth-aachen.de",
#     Place         := "Aachen",
#     Institution   := "RWTH Aachen"
#   ),
  ],
Status :=
  "deposited",
README_URL :=
  Concatenation( ~.PackageWWWHome, "/README.md" ),
PackageInfoURL :=
  Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),
AbstractHTML := Concatenation( [
  "The package contains the <span class=\"pkgname\">GAP</span> ",
  "Character Table Library."
  ] ),
PackageDoc := [
  rec(
    BookName :=
      "CTblLib",
    ArchiveURLSubset :=
      [ "doc", "htm" ],  # files in htm are cross-references from the manual
    HTMLStart :=
      "doc/chap0.html",
    PDFFile :=
      "doc/manual.pdf",
    SixFile :=
      "doc/manual.six",
    LongTitle :=
      "The GAP Character Table Library",
  ),
  rec(
    BookName :=
      "CTblLibXpls",
    ArchiveURLSubset :=
      [ "doc2" ],
    HTMLStart :=
      "doc2/chap0.html",
    PDFFile :=
      "doc2/manual.pdf",
    SixFile :=
      "doc2/manual.six",
    LongTitle :=
      "Computations with the GAP Character Table Library",
  ) ],
Dependencies := rec(
  GAP :=
    ">= 4.11.0", # because of the extended 'CharacterTableIsoclinic'
  OtherPackagesLoadedInAdvance := [
    ],
  NeededOtherPackages := [
      [ "gapdoc", ">= 1.6.2" ],  # want extended `InitialSubstringUTF8String'
      [ "AtlasRep", ">=2.1" ],   # want the JSON interface,
                                 # want the user preference `DisplayFunction',
                                 # want `AGR.Pager',
                                 # want `ScanMeatAxeFile'
    ],
  SuggestedOtherPackages := [
      [ "Browse", ">= 1.8.10" ],  # because of database attributes
                                  # and overview functions,
                                  # want new JSON related features
      [ "chevie", ">= 1.0" ],     # because of Deligne-Lusztig names
      [ "PrimGrp", ">=1.0" ],     # because of group info
      [ "SmallGrp", ">=1.0" ],    # because of group info
      [ "SpinSym", ">= 1.5" ],    # because SpinSym extends the library
      [ "tomlib", ">= 1.0" ],     # because of the interface
      [ "TransGrp", ">=1.0" ],    # because of group info
    ],
  ExternalConditions := [
    ],
  ),
AvailabilityTest :=
  ReturnTrue,
TestFile :=
  "tst/testauto.g",  # regularly running `tst/testall.g' is not acceptable
Keywords :=
  [ "ordinary character table", "Brauer table", "generic character table",
    "decomposition matrix", "class fusion", "power map",
    "permutation character", "table automorphism",
    "central extension", "projective character",
    "Atlas Of Finite Groups" ],
) );


#############################################################################
##
#E

