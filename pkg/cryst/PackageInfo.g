#############################################################################
##  
##  PackageInfo.g for Cryst
##  

SetPackageInfo( rec(

PackageName := "Cryst",

Subtitle := "Computing with crystallographic groups",

Version := "4.1.19",

# Format: dd/mm/yyyy
Date := "28/05/2019", # dd/mm/yyyy format
License := "GPL-2.0-or-later",

ArchiveURL := Concatenation( 
  "https://www.math.uni-bielefeld.de/~gaehler/gap45/Cryst/cryst-", ~.Version ),

ArchiveFormats := ".tar.gz",

BinaryFiles := [ "doc/manual.pdf", "doc/manual.dvi" ],

Persons := [
  rec(
    LastName := "Eick",
    FirstNames := "Bettina",
    IsAuthor := true,
    IsMaintainer := true,
    Email := "beick@tu-bs.de",
    WWWHome := "http://www.icm.tu-bs.de/~beick/",
    #PostalAddress := "",           
    Place := "Braunschweig",
    Institution := "Institut Computational Mathematics, TU Braunschweig"
  ),
  rec(
    LastName := "Gähler",
    FirstNames := "Franz",
    IsAuthor := true,
    IsMaintainer := true,
    Email := "gaehler@math.uni-bielefeld.de",
    WWWHome := "https://www.math.uni-bielefeld.de/~gaehler/",
    #PostalAddress := "",           
    Place := "Bielefeld",
    Institution := "Mathematik, Universität Bielefeld"
  ),
  rec(
    LastName := "Nickel",
    FirstNames := "Werner",
    IsAuthor := true,
    IsMaintainer := true,
    Email := "nickel@mathematik.tu-darmstadt.de",
    WWWHome := "http://www.mathematik.tu-darmstadt.de/~nickel/",
    #PostalAddress := "",           
    Place := "Darmstadt",
    Institution := "Fachbereich 4, AG 2, TU Darmstadt"
  )
],

Status := "accepted",

CommunicatedBy := "Herbert Pahlings (Aachen)",

AcceptDate := "02/2000",

README_URL := 
  "https://www.math.uni-bielefeld.de/~gaehler/gap45/Cryst/README.cryst",
PackageInfoURL := 
  "https://www.math.uni-bielefeld.de/~gaehler/gap45/Cryst/PackageInfo.g",

AbstractHTML := 
"This package, previously known as <span class=\"pkgname\">CrystGAP</span>, \
provides a rich set of methods for the computation with affine \
crystallographic groups, in particular space groups. Affine \
crystallographic groups are fully supported both in representations \
acting from the right or from the left, the latter one being preferred \
by crystallographers. Functions to determine representatives of all \
space group types of a given dimension are also provided. Where \
necessary, <span class=\"pkgname\">Cryst</span> can also make use of \
functionality provided by the package <span class=\"pkgname\">Carat</span>.",

PackageWWWHome := 
  "https://www.math.uni-bielefeld.de/~gaehler/gap45/packages.php",

SourceRepository := rec(
  Type := "git",
  URL := Concatenation( "https://github.com/gap-packages/",
                        LowercaseString( ~.PackageName ) ) ),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
SupportEmail := "gaehler@math.uni-bielefeld.de",

PackageDoc  := rec(
  BookName  := "Cryst",
  ArchiveURLSubset := ["doc", "htm"],
  HTMLStart := "htm/chapters.htm",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Computing with crystallographic groups",
  Autoload  := true
),

Dependencies := rec(
  GAP := ">=4.5",
  NeededOtherPackages := [ [ "polycyclic", ">=2.9" ] ],
  SuggestedOtherPackages := [ [ "CrystCat", ">=1.1.4" ],
                              [ "Carat", ">=2.1.1" ],
                              [ "XGAP", ">=4.22" ] 
  ],
  ExternalConditions := []
),

AvailabilityTest := ReturnTrue,

#BannerString := "",

TestFile := "tst/testall.g",

Keywords := [ "crystallographic groups", 
              "affine crystallographic groups",
              "space groups",
              "color groups",
              "point group",
              "Wyckoff positions",
              "International Tables for Crystallography",
              "maximal subgroups",
              "normalizer" ]
));
