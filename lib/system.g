#############################################################################
##
#W  system.g                   GAP Library                   Alexander Hulpke
##
#H  @(#)$Id: system.g,v 4.12.2.5 2004/11/29 12:21:00 sal Exp $
##
#Y  Copyright (C)  1996,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file contains functions that are architecture dependent,
##  and the record `GAPInfo', which collects global variables that are needed
##  internally.
##
Revision.system_g :=
    "@(#)$Id: system.g,v 4.12.2.5 2004/11/29 12:21:00 sal Exp $";


BIND_GLOBAL( "GAPInfo", rec(

# do not edit the following two lines. They get replaced by string matching
# in the distribution wrapper scripts. (Occurrences of `4.dev' and `today'
# get replaced.)
    Version := "4.4.4",
    Date := "29-November-04",

    # The kernel version numbers are expected in the format `<v>.<r>.<p>'.
    KernelVersion := KERNEL_VERSION,
    NeedKernelVersion := "4.4.4",

    Architecture := GAP_ARCHITECTURE,

    # paths
    RootPaths := GAP_ROOT_PATHS,
    UserHome := USER_HOME,
    gaprc := GAP_RC_FILE,
    DirectoriesLibrary := rec(),
    DirectoriesSystemPrograms := DIRECTORIES_SYSTEM_PROGRAMS,
    DirectoriesPrograms := false,
    DirectoriesTemporary := [],
    DirectoryCurrent := false,

    # Shall the file `lib/obsolete.g' be read upon initialization?
    # (This can be changed in the user's `.gaprc' file.)
    ReadObsolete := true,

    # the command line options that were given for the current session
    CommandLineOptions := rec(),

    # the banner that is printed if no `-b' or `-q' option was given
    BannerString := "\
    \n\
            #########           ######         ###########           ###  \n\
         #############          ######         ############         ####  \n\
        ##############         ########        #############       #####  \n\
       ###############         ########        #####   ######      #####  \n\
      ######         #         #########       #####    #####     ######  \n\
     ######                   ##########       #####    #####    #######  \n\
     #####                    ##### ####       #####   ######   ########  \n\
     ####                    #####  #####      #############   ###  ####  \n\
     #####     #######       ####    ####      ###########    ####  ####  \n\
     #####     #######      #####    #####     ######        ####   ####  \n\
     #####     #######      #####    #####     #####         #############\n\
      #####      #####     ################    #####         #############\n\
      ######     #####     ################    #####         #############\n\
      ################    ##################   #####                ####  \n\
       ###############    #####        #####   #####                ####  \n\
         #############    #####        #####   #####                ####  \n\
          #########      #####          #####  #####                ####  \n\
                                                                          \n\
     Information at:  http://www.gap-system.org\n\
     Try '?help' for help. See also  '?copyright' and  '?authors'\n\
    \n",

    # This holds the maximal number of lines that are reasonably printed
    # in `ViewObj' methods.
#T The value can be changed using the function `ViewLength' that is defined
#T in `lib/oper.g' but currently is undocumented.
#T Should it become documented or is it sufficient to document this variable?
    ViewLength := 3

 ) );

GAPInfo.ScanCommandLineOption := function( name, type, default )
    if not IsBound( SY_COMMAND_LINE_OPTIONS.( name ) ) then
      GAPInfo.CommandLineOptions.( name ):= default;
    elif type = "toggle" then
      if LEN_LIST( SY_COMMAND_LINE_OPTIONS.( name ) ) mod 2 = 0 then
        GAPInfo.CommandLineOptions.( name ):= default;
      else
        GAPInfo.CommandLineOptions.( name ):= not default;
      fi;
    elif type = "string" then
      # Take the last value for this option.
      GAPInfo.CommandLineOptions.( name ):= SY_COMMAND_LINE_OPTIONS.( name )[
          LEN_LIST( SY_COMMAND_LINE_OPTIONS.( name ) ) ];
    elif type = "strlst" then
      # Take all values for this option.
      GAPInfo.CommandLineOptions.( name ):= SY_COMMAND_LINE_OPTIONS.( name );
    elif type = "modul3" then
      # special case for `-g'
      GAPInfo.CommandLineOptions.( name ):=
          LEN_LIST( SY_COMMAND_LINE_OPTIONS.( name ) ) mod 3;
    fi;
end;

GAPInfo.ScanCommandLineOption( "A", "toggle", false );
GAPInfo.ScanCommandLineOption( "B", "string", "" );
GAPInfo.ScanCommandLineOption( "D", "toggle", false );
GAPInfo.ScanCommandLineOption( "E", "toggle", false );
GAPInfo.ScanCommandLineOption( "K", "string", "0" );
GAPInfo.ScanCommandLineOption( "L", "string", "" );
GAPInfo.ScanCommandLineOption( "M", "toggle", false );
GAPInfo.ScanCommandLineOption( "N", "toggle", false );
GAPInfo.ScanCommandLineOption( "O", "toggle", false );
GAPInfo.ScanCommandLineOption( "P", "string", "0" );
GAPInfo.ScanCommandLineOption( "U", "string", "" );
GAPInfo.ScanCommandLineOption( "W", "string", "0" );
GAPInfo.ScanCommandLineOption( "R", "string", "" );
GAPInfo.ScanCommandLineOption( "T", "toggle", false );
GAPInfo.ScanCommandLineOption( "X", "toggle", false );
GAPInfo.ScanCommandLineOption( "Y", "toggle", false );
GAPInfo.ScanCommandLineOption( "a", "string", "0" );
GAPInfo.ScanCommandLineOption( "b", "toggle", false );
GAPInfo.ScanCommandLineOption( "c", "string", "0" );
GAPInfo.ScanCommandLineOption( "e", "toggle", false );
GAPInfo.ScanCommandLineOption( "f", "toggle", false );
GAPInfo.ScanCommandLineOption( "g", "modul3", 0 );
GAPInfo.ScanCommandLineOption( "i", "string", "" );
GAPInfo.ScanCommandLineOption( "l", "strlst", [] );
GAPInfo.ScanCommandLineOption( "m", "string", "24m" );
GAPInfo.ScanCommandLineOption( "n", "toggle", false );
GAPInfo.ScanCommandLineOption( "o", "string", "256m" );
GAPInfo.ScanCommandLineOption( "p", "toggle", false );
GAPInfo.ScanCommandLineOption( "q", "toggle", false );
GAPInfo.ScanCommandLineOption( "r", "toggle", false );
GAPInfo.ScanCommandLineOption( "x", "string", "80" );
GAPInfo.ScanCommandLineOption( "y", "string", "24" );
GAPInfo.ScanCommandLineOption( "z", "string", "20" );


#############################################################################
##  
##  Administration of Packages
##


#############################################################################
##
#V  GAPInfo.PackagesLoaded
##
##  This is a mutable record, the component names are the names of those
##  packages that are already loaded.
##  The component for each package is a list of length three or four,
##  the first three entries being the path to the {\GAP} root directory that
##  contains the package, the package version, and the package name,
##  and the fourth entry being a list used by `CreateCompletionFilesPackage'.
##
##  For each package, the value gets bound in the `LoadPackage' call.
##  The fourth entry is bound if and only if the package has a `read.g' file
##  and if no `read.co' file was used when the package was loaded;
##  in this case, the entry has been computed by `ReadOrComplete'.
##
GAPInfo.PackagesLoaded := rec();


#############################################################################
##
#V  GAPInfo.PackagesInfo
##
##  This is a mutable record, the component names are the names of those
##  packages for which the `PackageInfo.g' files have been read.
##  (These packages are not necessarily loaded.)
##
GAPInfo.PackagesInfo := rec();


#############################################################################
##
##  Remove globals exported by the kernel that are no longer needed.
#T wouldn't it be better to create the record `GAPInfo' with these components
#T in the kernel?
##
for name in [ "KERNEL_VERSION", "GAP_ARCHITECTURE", "GAP_ROOT_PATHS",
              "USER_HOME", "GAP_RC_FILE", "DIRECTORIES_SYSTEM_PROGRAMS",
              "DEBUG_LOADING" ] do
  MAKE_READ_WRITE_GLOBAL( name );
  UNBIND_GLOBAL( name );
od;


#############################################################################
##
##  identifier that will recognize the Windows and the Mac version
##
BIND_GLOBAL("WINDOWS_ARCHITECTURE",
  IMMUTABLE_COPY_OBJ("win"));
BIND_GLOBAL("MACINTOSH_68K_ARCHITECTURE",
  IMMUTABLE_COPY_OBJ("MC68020-motorola-macos-mwerksc"));
BIND_GLOBAL("MACINTOSH_PPC_ARCHITECTURE",
  IMMUTABLE_COPY_OBJ("PPC-motorola-macos-mwerksc"));

#T the following functions eventually should be more clever. This however
#T will require kernel support and thus is something for later.  AH

#############################################################################
##
#F  ARCH_IS_MAC()
##
##  tests whether {\GAP} is running on a Macintosh under MacOS
BIND_GLOBAL("ARCH_IS_MAC",function()
  return GAPInfo.Architecture = MACINTOSH_68K_ARCHITECTURE
      or GAPInfo.Architecture = MACINTOSH_PPC_ARCHITECTURE;
end);

#############################################################################
##
#F  ARCH_IS_WINDOWS()
##
##  tests whether {\GAP} is running on a Windows system.
BIND_GLOBAL("ARCH_IS_WINDOWS",function()
local l;
  l:=LEN_LIST( GAPInfo.Architecture );
  if l<9 then return false;fi; # trap some unixes with increadibly short
                               # string name
  return GAPInfo.Architecture{[l-6..l-4]} = WINDOWS_ARCHITECTURE;
end);

#############################################################################
##
#F  ARCH_IS_UNIX()
##
##  tests whether {\GAP} is running on a UNIX system.
BIND_GLOBAL("ARCH_IS_UNIX",function()
  return not (ARCH_IS_MAC() or ARCH_IS_WINDOWS());
end);

#############################################################################
##
#V  GAPInfo.BytesPerVariable
#V  DOUBLE_OBJLEN
##
##  `GAPInfo.BytesPerVariable' is the number of bytes used for one `Obj'
##  variable.
##
GAPInfo.BytesPerVariable := 4;
# are we a 64 (or more) bit system?
while TNUM_OBJ( 2^((GAPInfo.BytesPerVariable-1)*8) )
    = TNUM_OBJ( 2^((GAPInfo.BytesPerVariable+1)*8) ) do
  GAPInfo.BytesPerVariable:= GAPInfo.BytesPerVariable + 4;
od;
BIND_GLOBAL( "DOUBLE_OBJLEN", 2*GAPInfo.BytesPerVariable );


#############################################################################
##
#E

