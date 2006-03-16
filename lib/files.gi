#############################################################################
##
#W  files.gi                    GAP Library                      Frank Celler
##
#H  @(#)$Id: files.gi,v 4.26.2.1 2006/02/20 17:12:22 gap Exp $
##
#Y  Copyright (C)  1996,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file contains the methods for files and directories.
##
Revision.files_gi :=
    "@(#)$Id: files.gi,v 4.26.2.1 2006/02/20 17:12:22 gap Exp $";


#############################################################################
##

#R  IsDirectoryRep  . . . . . . . . . . default representation of a directory
##
DeclareRepresentation(
    "IsDirectoryRep",
    IsPositionalObjectRep,
    [] );


#############################################################################
##
#V  DirectoryType . . . . . . . . . . . . . . . . default type of a directory
##
BindGlobal( "DirectoryType", NewType(
    DirectoriesFamily,
    IsDirectory and IsDirectoryRep ) );


#############################################################################
##
#F  USER_HOME_EXPAND . . . . . . . . . . . .  expand leading ~ in file name
##
##  If `GAPInfo.UserHome' has positive length then a leading '~' character in
##  string `str' is substituted by the content of `GAPInfo.UserHome'.
##  Otherwise `str' itself is returned.
##
InstallGlobalFunction(USER_HOME_EXPAND, function(str)
  if Length(str) > 0 and str[1] = '~' and Length( GAPInfo.UserHome ) > 0 then
    return Concatenation( GAPInfo.UserHome, str{[2..Length(str)]});
  else
    return str;
  fi;
end);


#############################################################################
##
#M  Directory( <str> )  . . . . . . . . . . .  create a new directpory object
##
InstallMethod( Directory,
    "string",
    [ IsString ],
function( str )
    str := USER_HOME_EXPAND(str);
    #
    # ':' or '\\' probably are untranslated MSDOS or MaxOS path
    # separators, but ':' in position 2 may be OK
    #
    if '\\' in str or (':' in str and str[2] <> ':') then
        Error( "<str> must not contain '\\' or ':'" );
    fi;
    if str[Length(str)] = '/'  then
        str := Immutable(str);
    else
        str := Immutable( Concatenation( str, "/" ) );
    fi;
    return Objectify( DirectoryType, [str] );
end );


#############################################################################
##
#M  EQ( <dir1>, <dir2> ) . . . . . . . . . . . equality for directory objects
##
InstallMethod( EQ,
   "for two directories",
   [ IsDirectory, IsDirectory ],
   function( d1, d2 ) return d1![1] = d2![1]; end );


#############################################################################
##
#M  ViewObj( <directory> )  . . . . . . . . . . . . . view a directory object
##
InstallMethod( ViewObj,
    "default directory rep",
    [ IsDirectoryRep ],
function( obj )
    Print( "dir(\"", obj![1] ,"\")" );
end );


#############################################################################
##
#M  PrintObj( <directory> ) . . . . . . . . . . . .  print a directory object
##
InstallMethod( PrintObj,
    "default directory rep",
    [ IsDirectoryRep ],
function( obj )
    Print( "Directory(\"", obj![1] ,"\")" );
end );


#############################################################################
##

#M  Filename( <directory>, <string> ) . . . . . . . . . . . create a filename
##
InstallOtherMethod( Filename,
    "for a directory and a string",
    [ IsDirectory,
      IsString ],
function( dir, name )
    if '\\' in name or ':' in name  then
        Error( "<name> must not contain '\\' or ':'" );
    fi;
    return Immutable( Concatenation( dir![1], name ) );
end );


#############################################################################
##
#M  Filename( <directories>, <string> ) . . . . . . . . search for a filename
##
InstallMethod( Filename,
    "for a list and a string",
    [ IsList, IsString ],
function( dirs, name )
    local   dir,  new, newgz;

    for dir  in dirs  do
        new := Filename( dir, name );
        newgz := Concatenation(new,".gz");
        if IsExistingFile(new) = true or IsExistingFile(newgz) = true then
            return new;
        fi;
    od;
    return fail;
end );

#############################################################################
##
#F  DirectoryContents(<name>)
##
InstallGlobalFunction(DirectoryContents, function(dirname)
  local str;
  # to make ~/mydir work
  dirname := USER_HOME_EXPAND(dirname);
  if dirname[Length(dirname)] <> '/' then
    Add(dirname, '/');
  fi;
  str := STRING_LIST_DIR(dirname);
  if str = fail then
    Error("Could not open ", dirname, " as directory,\nsee LastSystemError();");
  fi;
  # Why is this file read before string.gd ???
  return SplitStringInternal(str, "", "\000");
end);



##  function(str)
##  local a, l, i, j;
##    a:=STRING_LIST_DIR(str);
##    l:=[];
##    i:=1;
##    j:=1;
##    while i<=Length(a) do
##      if a[i]='\000' then
##        Add(l,a{[j..i-1]});
##        j:=i+1;
##      fi;
##      i:=i+1;
##    od;
##    return l;
##  end);


#############################################################################
##
#M  Read( <filename> )  . . . . . . . . . . . . . . . . . . .  read in a file
##
READ_INDENT := "";

InstallMethod( Read,
    "string",
    [ IsString ],
function ( name )
    local   readIndent,  found;

    name := USER_HOME_EXPAND(name);

    readIndent := SHALLOW_COPY_OBJ( READ_INDENT );
    APPEND_LIST_INTR( READ_INDENT, "  " );
    InfoRead1( "#I", READ_INDENT, "Read( \"", name, "\" )\n" );
    found := (IsReadableFile(name)=true) and READ(name);
    READ_INDENT := readIndent;
    if found and READ_INDENT = ""  then
        InfoRead1( "#I  Read( \"", name, "\" ) done\n" );
    fi;
    if not found  then
        Error( "file \"", name, "\" must exist and be readable" );
    fi;
end );


#############################################################################
##
#M  ReadTest( <filename> )  . . . . . . . . . . . . . . . .  read a test file
##
InstallMethod( ReadTest,
    "string",
    [ IsString ],
    function( name )
    local oldvalue, result;

    oldvalue:= SizeScreen();
    SizeScreen( [ 80 ] );
    result:= READ_TEST( USER_HOME_EXPAND( name ) );
    SizeScreen( oldvalue );
    return result;
    end );


#############################################################################
##
#M  ReadAsFunction( <filename> )  . . . . . . . . . . read a file as function
##
InstallMethod( ReadAsFunction,
    "string",
    [ IsString ],
    name -> READ_AS_FUNC( USER_HOME_EXPAND( name ) ) );


#############################################################################
##
#M  Edit( <filename> )  . . . . . . . . . . . . . . . . .  edit and read file
##
InstallGlobalFunction( Edit, function( name )
    local   editor,  ret;

    name := USER_HOME_EXPAND(name);
    editor := Filename( DirectoriesSystemPrograms(), EDITOR );
    if editor = fail  then
        Error( "cannot locate editor `", EDITOR, "'" );
    fi;
    ret := Process( DirectoryCurrent(), editor, InputTextUser(),
                    OutputTextUser(), [ name ] );
    if ret <> 0  then
        Error( "editor returned ", ret );
    fi;
    Read(name);
end );


#############################################################################
##
#M  CreateCompletionFiles( [<path>] ) . . . . . . create "lib/readX.co" files
#M  CreateCompletionFiles( <path>, <list> ) .  create "pkg/.../read.co" files
##
##  The undocumented two argument version is used for creating completion
##  files of packages.
##
InstallGlobalFunction( CreateCompletionFiles, function( arg )
    local path, list, input, i, com, read, j, crc;

    # get the path to the output
    if 0 = Length(arg)  then
        path := DirectoriesLibrary("")[1];
        list := COMPLETABLE_FILES;
    elif 1 = Length(arg)  then
        path := Directory(arg[1]);
        list := COMPLETABLE_FILES;
    elif 2 = Length(arg)  then
        path := Directory(arg[1]);
        list := arg[2];
    fi;
    input:= DirectoriesLibrary("");

    # loop over the list of completable files
    for i in list do

        # convert "read" into "comp"
        com := Filename( path, ReplacedString( i[1], ".g", ".co" ) );
        if com = fail  then
            Error( "cannot create output file" );
        fi;
        Print( "#I  converting \"", i[1], "\" to \"", com, "\"\n" );

        # now find the input file
        read := List( [1 .. Length(i[2]) ], x
           -> [ i[2][x], Filename( input, i[2][x] ), i[3][x] ] );
        if ForAny( read, x -> x[2] = fail )  then
            Error( "cannot locate input files" );
        fi;

        # create the completion files
        PRINT_TO( com, "#I  file=\"", i[1], "\"\n\n" );
        for j  in read  do

            # create a crc value
            Print( "#I    parsing \"", j[1], "\"\n" );
            crc := GAP_CRC(j[2]);

            # create ranking list
            APPEND_TO( com, "#F  file=\"", j[1], "\" crc=", crc, "\n" );
            APPEND_TO( com, "RANK_FILTER_LIST  := ", j[3], ";\n",
                            "RANK_FILTER_COUNT := 1;\n\n" );

            # create `COM_FILE' header and `if' start
            APPEND_TO( com, "#C  load module, file, or complete\n" );
            APPEND_TO( com,
              "COM_RESULT := COM_FILE( \"", j[1], "\", ", crc, " );\n",
              "if COM_RESULT = fail  then\n",
              "Error(\"cannot locate file \\\"", j[1], "\\\"\");\n",
              "elif COM_RESULT = 1  then\n",
              ";\n",
              "elif COM_RESULT = 2  then\n",
              ";\n",
              "elif COM_RESULT = 4  then\n",
              "READ_CHANGED_GAP_ROOT(\"",j[1],"\");\n",
              "elif COM_RESULT = 3  then\n"
            );

            # create completion
            MAKE_INIT( com, j[2] );

            APPEND_TO( com,
              "else\n",
              "Error(\"unknown result code \", COM_RESULT );\n",
              "fi;\n\n",
              "#U  unbind temporary variables\n",
              "Unbind(RANK_FILTER_LIST);\n",
              "Unbind(RANK_FILTER_COUNT);\n",
              "Unbind(COM_RESULT);\n",
              "#E  file=\"", j[1], "\"\n\n"
            );
        od;
    od;
end );

#############################################################################
##
#M  CheckCompletionFiles()  . . . . . . . . . . .  check the completion files
##
InstallGlobalFunction( CheckCompletionFiles, function()
    local   dirs,  file,  com,  stream,  next,  pos,  fname,  crc,
            lfile,  new,  nook;

    dirs := DirectoriesLibrary("");
    nook := [];
    for file  in COMPLETED_FILES  do
        com := ReplacedString( file, ".g", ".co" );
        Print( "#I  checking \"", com, "\"\n" );
        stream := InputTextFile(com);
        while not IsEndOfStream(stream)  do
            next := ReadLine(stream);
            if next <> fail and next[1] = '#'  then
                if next[2] = 'F'  then

                    # extract the filename
                    pos := 4;
                    while next[pos] <> '"'  do
                        pos := pos + 1;
                    od;
                    pos := pos+1;
                    fname := "";
                    while next[pos] <> '"'  do
                        Add( fname, next[pos] );
                        pos := pos + 1;
                    od;

                    # extract the crc value
                    while next[pos] <> '='  do
                        pos := pos + 1;
                    od;
                    crc := Int(next{[pos+1..Length(next)-1]});

                    # recompute crc
                    lfile := Filename( dirs, fname );
                    if lfile = fail  then
                        Print( "#W   file \"", fname, "\" not found\n" );
                        Add( nook, fname );
                    else
                        new := GAP_CRC( lfile );
                        if new <> crc  then
                            Print( "#W   file \"", fname, "\" not OK\n" );
                            Add( nook, fname );
                        else
                            Print( "#I   file \"", fname, "\" OK\n" );
                        fi;
                    fi;
                fi;
            fi;
        od;
        CloseStream(stream);
    od;
    return nook;
end );


#############################################################################
##
#E

