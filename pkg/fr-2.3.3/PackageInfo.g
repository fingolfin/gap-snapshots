#############################################################################
##
##  PackageInfo.g for the package `FR'                    Laurent Bartholdi
##
SetPackageInfo( rec(
PackageName := "fr",
Subtitle := "Computations with functionally recursive groups",
Version := "2.3.3",
Date := "27/02/2016",
## <#GAPDoc Label="Version">
## <!ENTITY Version "2.3.3">
## <!ENTITY Date "27/02/2016">
## <#/GAPDoc>
ArchiveURL := Concatenation("https://github.com/gap-packages/fr/releases/download/v",~.Version,"/fr-",~.Version),
ArchiveFormats := ".tar.gz",
Persons := [
  rec(
    LastName      := "Bartholdi",
    FirstNames    := "Laurent",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "laurent.bartholdi@gmail.com",
    WWWHome       := "http://www.uni-math.gwdg.de/laurent",
    PostalAddress := Concatenation( [
                       "Mathematisches Institut\n",
                       "Bunsenstraße 3-5\n",
                       "D-37073 Göttingen\n",
                       "Germany" ] ),
    Place         := "Göttingen",
    Institution   := "Georg-August Universität zu Göttingen"
  )
],

Status := "deposited",
CommunicatedBy := "Götz Pfeiffer (NUI Galway)",
#AcceptDate := "",

README_URL := "http://gap-packages.github.io/fr/README.fr",
PackageInfoURL := "http://gap-packages.github.io/fr/PackageInfo.g",
AbstractHTML := "The <span class=\"pkgname\">FR</span> package allows \
   GAP to manipulate groups generated by automata, and more generally \
   functionally recursive groups",
PackageWWWHome := "http://gap-packages.github.io/fr/",

PackageDoc := rec(
  BookName  := "FR",
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Functionally recursive and automata groups",
  ArchiveURLSubset := ["doc"],
  Autoload  := true
),

Dependencies := rec(
  GAP := ">=4.7.6",
  NeededOtherPackages := [["FGA",">=1.1"],
                      ["Polycyclic",">=2.2"],
                      ["GAPDoc",">=1.0"]],
  SuggestedOtherPackages := [["GBNP",">=0.9"],
                      ["NQ",">=2.4"],
                      ["NQL",">=0.10"]],
  # additional desired packages: graphviz, display
  ExternalConditions := []
),

AvailabilityTest := ReturnTrue,
                    
BannerString := Concatenation("Loading FR ", String( ~.Version ), " ...\n"),

Autoload := false,
TestFile := "tst/testall.g",
Keywords := ["functionally recursive group", "mealy machine", "automata group"]
));