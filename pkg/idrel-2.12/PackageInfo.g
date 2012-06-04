#############################################################################
##
##  PackageInfo.g   file for the package IdRel version 2.12  (25/04/12)
##  Anne Heyworth and Chris Wensley 
##

SetPackageInfo( rec(
PackageName := "idrel",
Subtitle := "Identities among relations",

Version := "2.12",
Date := "25/04/2012",

##  duplicate these values for inclusion in the manual: 
##  <#GAPDoc Label="PKGVERSIONDATA">
##  <!ENTITY VERSION "2.12">
##  <!ENTITY RELEASEDATE "25/04/2012">
##  <#/GAPDoc>

PackageWWWHome := 
  "http://www.maths.bangor.ac.uk/chda/gap4r5/idrel/",

ArchiveURL := "http://www.maths.bangor.ac.uk/chda/gap4r5/idrel/idrel-2.12", 
ArchiveFormats := ".tar.gz",

Persons := [
  rec(
    LastName      := "Heyworth",
    FirstNames    := "Anne",
    IsAuthor      := true,
    IsMaintainer  := false,
    Email         := "anne.heyworth@googlemail.com",
    ## WWWHome       := "",
    ## PostalAddress := Concatenation( ["\n", "UK"] ),
    ## Place         := "",
    ## Institution   := ""
  ),
  rec(
    LastName      := "Wensley",
    FirstNames    := "Christopher D.",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "c.d.wensley@bangor.ac.uk",
    WWWHome       := "http://www.bangor.ac.uk/~mas023/",
    PostalAddress := Concatenation( [
                       "Dr. C.D. Wensley\n",
                       "School of Computer Science\n",
                       "Bangor University\n",
                       "Dean Street\n",
                       "Bangor\n",
                       "Gwynedd LL57 1UT\n",
                       "UK"] ),
    Place         := "Bangor",
    Institution   := "Bangor University"
  )
],

Status := "deposited",
## CommunicatedBy := "",
## AcceptDate := "",

README_URL := 
  Concatenation( ~.PackageWWWHome, "README" ),
PackageInfoURL := 
  Concatenation( ~.PackageWWWHome, "PackageInfo.g" ),

AbstractHTML :=
 "IdRel is a package for computing the identities among relations of a group presentation using rewriting, logged rewriting, monoid polynomials, module polynomials and Y-sequences.",

PackageDoc := rec(
  BookName  := "IdRel",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Identities among Relations",
  Autoload  := true
),

Dependencies := rec(
  GAP := ">=4.5",
  NeededOtherPackages := [ [ "xmod", ">= 2.16" ], [ "GAPDoc", ">= 1.3" ] ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ]
),

AvailabilityTest := ReturnTrue,

BannerString := Concatenation( 
    "Loading IdRel ", String( ~.Version ), " for GAP 4.5", 
    " - Anne Heyworth and Chris Wensley ...\n" ),

Autoload := false,

TestFile := "tst/idrel_manual.tst",

Keywords := ["logged rewriting","identities among relations",
             "Y-sequences"]

));
