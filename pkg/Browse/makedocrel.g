##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##

pathtodoc:= "doc";;
main:= "main.xml";;
bookname:= "Browse";;
if not IsBound(pathtoroot) then
  pathtoroot:= "../../..";
fi;

files:= [
    "../app/atlasbrowse.g",
    "../app/ctbldisp.g",
    "../app/demo.g",
    "../app/filetree.g",
    "../app/gapbibl.g",
    "../app/gapdata.g",
    "../app/knight.g",
    "../app/manual.g",
    "../app/matdisp.g",
    "../app/pkgvar.g",
    "../app/profile.g",
    "../app/puzzle.g",
    "../app/rubik.g",
    "../app/solitair.g",
    "../app/sudoku.g",
    "../app/tomdisp.g",
    "../app/transbrowse.g",
    "../app/transdbattr.g",
    "../lib/brdbattr.gd",
    "../lib/browse.gd",
    "../lib/browse.gi",
    "../lib/brutils.g",
    "../lib/ncurses.gd",
    "../lib/ncurses.gi",
  ];;

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

tree := MakeGAPDocDoc( pathtodoc, main, files, bookname, pathtoroot );;
CopyHTMLStyleFiles(pathtodoc);

GAPDocManualLab( "Browse" );;

# Create the necessary `png' files.
CreatePictures:= function( filenames )
  local filename, str, pos, pos2, sub, nam;

  for filename in filenames do
    str:= StringFile( filename );
    pos:= PositionSublist( str, "<!-- BP" );
    pos2:= PositionSublist( str, "]]>\n##  <!-- EP" );
    while pos <> fail and pos2 <> fail do
      sub:= str{ [ pos + 8 .. pos2-1 ] };
      nam:= sub{ [ 1 .. Position( sub, ' ' ) - 1 ] };
      pos:= Position( sub, '\n' );
      pos:= Position( sub, '\n', pos );
      sub:= sub{ [ pos .. Length( sub ) ] };
      PrintTo( nam, "\\batchmode\\documentclass{article}\n",
                    "\\usepackage{graphicx}\\usepackage{epsfig}\n",
                    "\\pagestyle{empty}\\begin{document}\n",
                    ReplacedString( sub, "\n##  ", "\n" ),
                    "\n\\end{document}\n" );
      Exec( Concatenation( "latex ", nam ) );
      Exec( Concatenation( "dvips -o ", nam, ".ps ", nam ) );
      Exec( Concatenation( "gs -sDEVICE=ppmraw -sOutputFile=- -sNOPAUSE -q ",
                nam, ".ps -c showpage -c quit | pnmcrop| pnmmargin ",
                "-white 10 | pnmtopng > ", nam, ".png" ) );
      Exec( Concatenation( "rm -rf ", nam, " ", nam, ".aux ", nam, ".dvi ",
                nam, ".log ", nam, ".ps" ) );
      Exec( Concatenation( "mv ", nam, ".png doc" ) );

      pos:= PositionSublist( str, "<!-- BP", pos2 );
      pos2:= PositionSublist( str, "]]>\n##  <!-- EP", pos2 );
    od;
  od;
end;

CreatePictures( [ "app/rubik.g", "app/solitair.g" ] );

