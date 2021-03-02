##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##
SetInfoLevel( InfoGAPDoc, 2 );

SetGapDocLaTeXOptions( "nocolor", "utf8",
      rec( Maintitlesize := "\\fontsize{36}{38}\\selectfont" ) );

pathtodoc:= ".";;
main:= "main.xml";;
pkgname:= "CTblLib";;

# Extract the book name from the 'main' file.
str:= StringFile( Concatenation( pathtodoc, "/", main ) );;
pos:= PositionSublist( str, "<Book" );;
pos:= PositionSublist( str, "Name=\"", pos );;
pos:= Position( str, '\"', pos );;
pos2:= Position( str, '\"', pos );;
bookname:= str{ [ pos + 1 .. pos2 - 1 ] };;

pathtoroot:= "../../..";;

files:= [
    "../gap4/atlasbro.g",
    "../gap4/atlasimp.g",
    "../gap4/atlasirr.g",
    "../gap4/atlasstr.g",
    "../gap4/brirrat.g",
    "../gap4/brctdiff.g",
    "../gap4/construc.gd",
    "../gap4/ctadmin.gd",
    "../gap4/ctadmin.gi",
    "../gap4/ctblothe.gd",
    "../gap4/ctbltocb.g",
    "../gap4/ctbltoct.g",
    "../gap4/ctdbattr.g",
    "../gap4/test.g",
    "../tst/testinst.g",
    "../dlnames/dlnames.gd",
  ];;

pathtotst:= "../tst";
authors:= [ "Thomas Breuer" ];

AddHandlerBuildRecBibXMLEntry( "Wrap:Package", "BibTeX",
  function( entry, r, restype, strings, options )
    return Concatenation( "\\textsf{", ContentBuildRecBibXMLEntry(
               entry, r, restype, strings, options ), "}" );
  end );

AddHandlerBuildRecBibXMLEntry( "Wrap:Package", "HTML",
  function( entry, r, restype, strings, options )
    return Concatenation( "<strong class='pkg'>", ContentBuildRecBibXMLEntry(
               entry, r, restype, strings, options ), "</strong>" );
  end );

# Fetch GAP's current 'manualbib.xml'.
# This way, we avoid creating 'xml.bib' files in other paths.
bibfile:= Filename( DirectoriesLibrary( "doc" ), "manualbib.xml" );
if bibfile = fail then
  Error( "cannot access GAP's current 'manualbib.xml'" );
fi;
Exec( Concatenation( "cp ", bibfile, " ", pathtodoc, "/gapmanualbib.xml" ) );

MakeGAPDocDoc( pathtodoc, main, files, bookname, pathtoroot, "MathJax" );;

# Remove GAP's current 'manualbib.xml', and the automatically generated.
# 'manualbib.xml.bib'.
Exec( Concatenation( "rm ", pathtodoc, "/", "gapmanualbib.xml" ) );
Exec( Concatenation( "rm ", pathtodoc, "/", "gapmanualbib.xml.bib" ) );

CopyHTMLStyleFiles( pathtodoc );

GAPDocManualLabFromSixFile( bookname,
    Concatenation( pathtodoc, "/manual.six" ) );


#############################################################################

# Check the consistency of version numbers in 'PackageInfo.g' and the manual.
CheckVersionNumber:= function( pkgname, pathtodoc, main )
    local str, pos, pos2, version1, version2;

    # definition in the manual
    str:= StringFile( Concatenation( pathtodoc, "/", main ) );
    pos:= PositionSublist( str, "<!ENTITY VERSIONNUMBER \"" );
    pos:= Position( str, '\"', pos );
    pos2:= Position( str, '\"', pos );
    version1:= str{ [ pos + 1 .. pos2 - 1 ] };

    # definition in 'PackageInfo.g'
    Read( Concatenation( pathtodoc, "/../PackageInfo.g" ) );
    version2:= GAPInfo.PackageInfoCurrent.Version;

    if version1 <> version2 then
      Error( "version numbers '", version1, "' (from ", main,
             ") and '", version2, "' (from PackageInfo.g) differ" );
    fi;
end;

CheckVersionNumber( pkgname, pathtodoc, main );


#############################################################################

tstfilename:= "docxpl.tst";

tstheadertext:= "\
This file contains the GAP code of examples in the package\n\
documentation files.\n\n\
In order to run the tests, one starts GAP from the 'tst' subdirectory\n\
of the 'pkg/PKGNAME' directory, and calls 'Test( \"FILENAME\" );'.\n\
";

ExampleFileHeader:= function( filename, pkgname, authors, text, linelen,
                              pathtodoc, main )
    local str, pos, pos2, releaseyear, free1, free2, i;

    # definition in the manual
    str:= StringFile( Concatenation( pathtodoc, "/", main ) );
    pos:= PositionSublist( str, "<!ENTITY RELEASEYEAR \"" );
    pos:= Position( str, '\"', pos );
    pos2:= Position( str, '\"', pos );
    releaseyear:= str{ [ pos + 1 .. pos2 - 1 ] };

    free1:= Int( ( linelen - Length( pkgname ) - 14 ) / 2 );
    free2:= linelen - free1 - 14 - Length( pkgname ) - Length( authors[1] );

    text:= ReplacedString( text, "PKGNAME", LowercaseString( pkgname ) );
    text:= ReplacedString( text, "FILENAME", filename );
    text:= ReplacedString( text, "\n", "\n##  " );

    str:= RepeatedString( "#", linelen );
    Append( str, "\n##\n#W  " );
    Append( str, filename );
    Append( str, RepeatedString( " ", free1 - Length( filename ) - 4 ) );
    Append( str, "GAP 4 package " );
    Append( str, pkgname );
    Append( str, RepeatedString( " ", free2 ) );
    Append( str, authors[1] );
    for i in [ 2 .. Length( authors ) ] do
      Append( str, "\n#W" );
      Append( str, RepeatedString( " ", linelen - Length( authors[i] ) - 4 ) );
      Append( str, authors[i] );
    od;
    Append( str, "\n##\n#Y  Copyright (C)  " );
    Append( str, releaseyear );
    Append( str, ",   Lehrstuhl D für Mathematik,  RWTH Aachen,  Germany" );
    Append( str, "\n##\n##  " );
    Append( str, text );

    Append( str, "\ngap> LoadPackage( \"" );
    Append( str, pkgname );
    Append( str, "\", false );\ntrue" );
    Append( str, "\ngap> save:= SizeScreen();;" );
    Append( str, "\ngap> SizeScreen( [ 72 ] );;" );
    Append( str, "\ngap> START_TEST( \"" );
    Append( str, filename );
    Append( str, "\" );\n" );
    Append( str, "\n##\ngap> if IsBound( BrowseData ) then\n" );
    Append( str, ">      data:= BrowseData.defaults.dynamic.replayDefaults;\n" );
    Append( str, ">      oldinterval:= data.replayInterval;\n" );
    Append( str, ">      data.replayInterval:= 1;\n" );
    Append( str, ">    fi;\n" );

    return str;
end;

ExampleFileFooter:= function( filename, linelen )
    local str;

    str:= "\n##\ngap> if IsBound( BrowseData ) then\n";
    Append( str, ">      data:= BrowseData.defaults.dynamic.replayDefaults;\n" );
    Append( str, ">      data.replayInterval:= oldinterval;\n" );
    Append( str, ">    fi;\n" );
    Append( str, "\n##\ngap> STOP_TEST( \"" );
    Append( str, filename );
    Append( str, "\" );\n" );
    Append( str, "gap> SizeScreen( save );;\n\n" );
    Append( str, RepeatedString( "#", linelen ) );
    Append( str, "\n##\n#E\n" );

    return str;
end;


##  Create the test file(s) with examples.
##  If 'tstfilename' equals "chapter-wise" then one file is created for each
##  chapter, with filename <srcname>'.tst' if the contents of the chapter is
##  in <srcname>'.xml'.
##  Otherwise, all examples are collected in the file with name 'tstfilename'.
##
CreateManualExamplesFiles:= function( pkgname, authors, text, path, main,
                                      files, tstpath, tstfilename )
    local linelen, xpls, str, pos, pos2, tstfilenames, i, r, l,
          tstfilenameold;

    linelen:= 77;

    xpls:= ExtractExamples( path, main, files, "Chapter" );

    # Distinguish chapter-wise or book-wise test files.
    if tstfilename = "chapter-wise" then
      str:= StringFile( Concatenation( pathtodoc, "/", main ) );
      pos:= PositionSublist( str, "<Body>" );
      pos2:= PositionSublist( str, "</Body>", pos );
      str:= str{ [ pos .. pos2 ] };
      tstfilenames:= [];
      pos:= PositionSublist( str, "<#Include SYSTEM \"" );
      while pos <> fail do
        pos:= pos + 18;
        pos2:= PositionSublist( str, "\"", pos );
        Add( tstfilenames,
             ReplacedString( str{ [ pos .. pos2-1 ] }, ".xml", ".tst" ) );
        pos:= PositionSublist( str, "<#Include SYSTEM \"", pos2 );
      od;
      if Length( xpls ) <> Length( tstfilenames ) then
        Error( "wrong number of chapters?" );
      fi;
    else
      tstfilenames:= [ tstfilename ];
      xpls:= [ Concatenation( xpls ) ];
    fi;

    for i in [ 1 .. Length( xpls ) ] do
      str:= "# This file was created automatically, do not edit!\n";
      Append( str, ExampleFileHeader( tstfilenames[i], pkgname, authors,
                                      text, linelen, path, main ) );
      for l in xpls[i] do
        Append( str, Concatenation( "\n##  ", l[2][1],
                " (", String( l[2][2] ), "-", String( l[2][3] ), ")" ) );
        Append( str, l[1] );
      od;
      Append( str, ExampleFileFooter( tstfilenames[i], linelen ) );
      tstfilename:= Concatenation( tstpath, "/", tstfilenames[i] );
      tstfilenameold:= Concatenation( tstfilename, "~" );
      if IsExistingFile( tstfilename ) then
        Exec( Concatenation( "rm -f ", tstfilenameold ) );
        Exec( Concatenation( "mv ", tstfilename, " ", tstfilenameold ) );
      fi;
      FileString( tstfilename, str );
      if IsExistingFile( tstfilenameold ) then
        Print( "#I  differences in `", tstfilename, "':\n" );
        Exec( Concatenation( "diff ", tstfilenameold, " ", tstfilename ) );
      fi;
      Exec( Concatenation( "chmod 444 ", tstfilename ) );
    od;
end;


CreateManualExamplesFiles( pkgname, authors, tstheadertext, pathtodoc,
                           main, files, pathtotst, tstfilename );


