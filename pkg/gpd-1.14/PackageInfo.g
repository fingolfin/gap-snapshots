#############################################################################
##
##  PackageInfo.g   file for the package Gpd version 1.14  (23/04/12)
##  Emma Moore and Chris Wensley 
##

SetPackageInfo( rec(
PackageName := "gpd",
Subtitle := "Groupoids, graphs of groups, and graphs of groupoids",

Version := "1.14",
Date := "23/04/2012", 

##  duplicate these values for inclusion in the manual: 
##  <#GAPDoc Label="PKGVERSIONDATA">
##  <!ENTITY VERSION "1.14">
##  <!ENTITY RELEASEDATE "23/04/2012">
##  <#/GAPDoc>

PackageWWWHome := 
 "http://www.maths.bangor.ac.uk/chda/gap4r5/gpd/",

ArchiveURL := "http://www.maths.bangor.ac.uk/chda/gap4r5/gpd/gpd-1.14", 
ArchiveFormats := ".tar.gz",

Persons := [
  rec(
    LastName      := "Moore",
    FirstNames    := "Emma J.",
    IsAuthor      := true,
    IsMaintainer  := false,
    ## Email         := "",
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
    Institution   := "University of Wales, Bangor"
  )
],

Status := "submitted",
## CommunicatedBy := "",
## AcceptDate := "",

README_URL := 
  Concatenation( ~.PackageWWWHome, "README" ),
PackageInfoURL := 
  Concatenation( ~.PackageWWWHome, "PackageInfo.g" ),

AbstractHTML :=
 "The Gpd package provides a collection of functions for computing with \
finite groupoids, graph of groups, and graphs of groupoids. \
These are based on the more basic structures of magmas with objects \
and their mappings. \
It provides functions for normal forms of elements in Free Products with \
Amalgamation and in HNN extensions.",

PackageDoc := rec(
  BookName  := "Gpd",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Finite Groupoids and Graphs of Groups",
  Autoload  := true
),

Dependencies := rec(
  GAP := ">=4.5",
  NeededOtherPackages := [ [ "GAPDoc", ">= 1.3" ], 
                           [ "fga", ">= 1.1.0.1" ] ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ]
),

AvailabilityTest := ReturnTrue,

BannerString := Concatenation(
    "Loading Gpd ", String( ~.Version ), " for GAP 4.5", 
    " - Emma Moore and Chris Wensley ...\n" ),

Autoload := false,

TestFile := "tst/testall.g", 

Keywords := [ "magma with objects", "groupoid", "graph of groups", 
              "free product with amalgamation", "HNN extension", 
              "automorphisms" ]

));
