#############################################################################
##
#W  system.g                   GAP Library                   Alexander Hulpke
##
##
#Y  Copyright (C)  1996,  Lehrstuhl D für Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file contains functions that are architecture dependent,
##  and the record `GAPInfo', which collects global variables that are needed
##  internally.
##
##  `GAPInfo' is initialized when GAP is started without a workspace,
##  and various components are added and modified later on.
##  When GAP is started with a workspace, the value of `GAPInfo' is kept,
##  just some dedicated components are modified via the
##  ``post restore functions'' mechanism.
##  

BIND_GLOBAL( "GAPInfo", rec(

# do not edit the following three lines. Occurences of `4.7.4' and `20-Feb-2014' 
# will be replaced by string matching by distribution wrapping scripts.
    Version := "4.7.4",
    Date := "20-Feb-2014",
    NeedKernelVersion := "4.7.4",

# Without the needed packages, GAP does not start.
    Dependencies := rec(
      NeededOtherPackages := [
        [ "gapdoc", ">= 1.2" ],
      ],
    ),

    HasReadGAPRC:= false,
    
    # list of all reserved keywords
    Keywords:=ALL_KEYWORDS(),

    # the maximal number of arguments a method can have
    MaxNrArgsMethod:= 6,

    # caches of functions that are needed also with a workspace
    AtExitFuncs:= [],
    PostRestoreFuncs:= [],

    TestData:= rec(),

    # admissible command line options
    # (name of the option, default value, descr. strings for help page;
    # if no help string appears then option is not advertised in the help)
    CommandLineOptionData := [
      [ "h", false, "print this help and exit" ],
      [ "b", false, "disable/enable the banner" ],
      [ "q", false, "enable/disable quiet mode" ],
      [ "e", false, "disable/enable quitting on <ctr>-D" ],
      [ "f", false, "force line editing" ],
      [ "n", false, "prevent line editing" ],
      [ "E", true, "disable/enable use of readline library (if possible)" ],
      [ "x", "", "<num>", "set line width" ],
      [ "y", "", "<num>", "set number of lines" ],
      ,
      [ "g", 0, "show GASMAN messages (full/all/no garbage collections)" ],
      [ "m", "128m", "<mem>", "set the initial workspace size" ],
      [ "o", "2g", "<mem>", "set hint for maximal workspace size (GAP may allocate more)" ],
      [ "K", "0", "<mem>", "set maximal workspace size (GAP never allocates more)" ],
      [ "c", "0", "<mem>", "set the cache size value" ],
      [ "a", "0", "<mem>", "set amount to pre-malloc-ate",
             "postfix 'k' = *1024, 'm' = *1024*1024, 'g' = *1024*1024*1024" ],
      ,
      [ "l", [], "<paths>", "set the GAP root paths" ],
      [ "r", false, "disable/enable user GAP root dir GAPInfo.UserGapRoot" ],
      [ "A", false, "disable/enable autoloading of suggested GAP packages" ],
      [ "B", "", "<name>", "current architecture" ],
      [ "D", false, "enable/disable debugging the loading of files" ],
      [ "M", false, "disable/enable loading of compiled modules" ],
      [ "N", false, "unused, for backward compatibility only" ],
      [ "O", false, "disable/enable loading of obsolete files" ],
      [ "X", false, "enable/disable CRC checking for compiled modules" ],
      [ "T", false, "disable/enable break loop" ],
      [ "i", "", "<file>", "change the name of the init file" ],
      ,
      [ "L", "", "<file>", "restore a saved workspace" ],
      [ "R", false, "prevent restoring of workspace (ignoring -L)" ],
      ,
      [ "p", false, "enable/disable package output mode" ],
      [ "E", false ],
      [ "U", "" ],     # -C -U undocumented options to the compiler
      [ "s", "4g" ],
      [ "z", "20" ],
          ],
    ) );
  

#############################################################################
##
#V  GAPInfo.BytesPerVariable
#V  DOUBLE_OBJLEN
##
##  <ManSection>
##  <Var Name="GAPInfo.BytesPerVariable"/>
##  <Var Name="DOUBLE_OBJLEN"/>
##
##  <Description>
##  <Ref Var="GAPInfo.BytesPerVariable"/> is the number of bytes used for one
##  <C>Obj</C> variable.
##  </Description>
##  </ManSection>
##
##  These variables need not be recomputed when a workspace is loaded.
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
#F  CallAndInstallPostRestore( <func> )
##
##  The argument <func> must be a function with no argument.
##  This function is called,
##  and it is added to the global list `GAPInfo.PostRestoreFuncs'.
##  The effect of the latter is that the function will be called
##  when GAP is started with a workspace (option `-L').
##
BIND_GLOBAL( "CallAndInstallPostRestore", function( func )
    if not IS_FUNCTION( func )  then
      Error( "<func> must be a function" );
    elif CHECK_INSTALL_METHOD and not NARG_FUNC( func ) in [ -1, 0 ] then
      Error( "<func> must accept zero arguments" );
    fi;

    func();

    ADD_LIST( GAPInfo.PostRestoreFuncs, func );
end );


#############################################################################
##
#F  InstallAndCallPostRestore( <func> )
##
##  The argument <func> must be a function with no argument.
##  This function is added to the global list `GAPInfo.PostRestoreFuncs',
##  and afterwards it is called.
##  The effect of the former is that the function will be called
##  when GAP is started with a workspace (option `-L').
##
BIND_GLOBAL( "InstallAndCallPostRestore", function( func )
    if not IS_FUNCTION( func )  then
      Error( "<func> must be a function" );
    elif CHECK_INSTALL_METHOD and not NARG_FUNC( func ) in [ -1, 0 ] then
      Error( "<func> must accept zero arguments" );
    fi;

    ADD_LIST( GAPInfo.PostRestoreFuncs, func );

    func();
end );


#############################################################################
##
##  - Set/adjust the kernel specific components.
##  - Compute `GAPInfo.DirectoriesSystemPrograms' from
##    `GAPInfo.SystemEnvironment.PATH'.
##  - Scan the command line.
##    In case of `-h' print a help screen and exit.
##
CallAndInstallPostRestore( function()
    local j, i, CommandLineOptions, opt, InitFiles, line, word, value;

    GAPInfo.KernelInfo:= KERNEL_INFO();    
    GAPInfo.KernelVersion:= GAPInfo.KernelInfo.KERNEL_VERSION;
    GAPInfo.Architecture:= GAPInfo.KernelInfo.GAP_ARCHITECTURE;
    GAPInfo.ArchitectureBase:= GAPInfo.KernelInfo.GAP_ARCHITECTURE;
    for i in [ 1 .. LENGTH( GAPInfo.Architecture ) ] do
      if GAPInfo.Architecture[i] = '/' then
        GAPInfo.ArchitectureBase:= GAPInfo.Architecture{ [ 1 .. i-1 ] };
        break;
      fi;
    od;
    # On 32-bit we have to adjust some values:
    if GAPInfo.BytesPerVariable = 4 then
      i := 1;
      while not(IsBound(GAPInfo.CommandLineOptionData[i])) or
            GAPInfo.CommandLineOptionData[i][1] <> "m" do i := i + 1; od;
      GAPInfo.CommandLineOptionData[i][2] := "64m";
      i := 1;
      while not(IsBound(GAPInfo.CommandLineOptionData[i])) or
            GAPInfo.CommandLineOptionData[i][1] <> "o" do i := i + 1; od;
      GAPInfo.CommandLineOptionData[i][2] := "1g";
      i := 1;
      while not(IsBound(GAPInfo.CommandLineOptionData[i])) or
            GAPInfo.CommandLineOptionData[i][1] <> "s" do i := i + 1; od;
      GAPInfo.CommandLineOptionData[i][2] := "1500m";
    fi;

    # The exact command line which called GAP as list of strings;
    # first entry is the executable followed by the options.
    GAPInfo.SystemCommandLine:= GAPInfo.KernelInfo.COMMAND_LINE;

    # The shell environment in which GAP was called as record
    GAPInfo.SystemEnvironment:= GAPInfo.KernelInfo.ENVIRONMENT;

    # paths
    GAPInfo.RootPaths:= GAPInfo.KernelInfo.GAP_ROOT_PATHS;
    GAPInfo.UserHome:= GAPInfo.SystemEnvironment.HOME;
    if IsBound(GAPInfo.KernelInfo.DOT_GAP_PATH) then
      GAPInfo.UserGapRoot := GAPInfo.KernelInfo.DOT_GAP_PATH;
    else
      GAPInfo.UserGapRoot := fail;
    fi;

    # directory caches
    GAPInfo.DirectoriesLibrary:= rec();
    GAPInfo.DirectoriesPrograms:= false;
    GAPInfo.DirectoriesTemporary:= [];
    GAPInfo.DirectoryCurrent:= false;
    GAPInfo.DirectoriesSystemPrograms:= [];
    j:= 1;
    for i in [1..LENGTH(GAPInfo.SystemEnvironment.PATH)] do
      if GAPInfo.SystemEnvironment.PATH[i] = ':' then
        if i > j then
          ADD_LIST_DEFAULT(GAPInfo.DirectoriesSystemPrograms, 
                GAPInfo.SystemEnvironment.PATH{[j..i-1]});
        fi;
        j := i+1;
      fi;
    od;
    if j <= LENGTH( GAPInfo.SystemEnvironment.PATH ) then
      ADD_LIST_DEFAULT( GAPInfo.DirectoriesSystemPrograms, 
          GAPInfo.SystemEnvironment.PATH{ [ j ..
              LENGTH( GAPInfo.SystemEnvironment.PATH ) ] } );
    fi;

    # the command line options that were given for the current session
    CommandLineOptions:= rec();
    for opt in GAPInfo.CommandLineOptionData do
      CommandLineOptions.( opt[1] ):= SHALLOW_COPY_OBJ( opt[2] );
    od;

    InitFiles:= [];

    line:= GAPInfo.SystemCommandLine;
    i:= 2;
    while i <= LENGTH( line ) do
      word:= line[i];
      i:= i+1;
      if word[1] = '-' and LENGTH( word ) = 2 then
        opt:= word{[2]};
        if not IsBound( CommandLineOptions.( opt ) ) then
          PRINT_TO( "*errout*", "Unrecognised command line option: -",
                    word, "\n" );
        else
          value:= CommandLineOptions.( opt );
          if IS_BOOL( value ) then
            CommandLineOptions.( opt ):= not CommandLineOptions.( opt );
          elif IS_INT( value ) then
            CommandLineOptions.( opt ):= CommandLineOptions.( opt ) + 1;
          elif i <= LENGTH( line ) then
            if IS_STRING_REP( value ) then
              # string
              CommandLineOptions.( opt ):= line[i];
              i := i+1;
            elif IS_LIST( value ) then
              # list of strings, starting from the empty list
              ADD_LIST_DEFAULT( CommandLineOptions.( opt ), line[i] );
              i := i+1;
            fi;
          else
            PRINT_TO( "*errout*", "Command line option -", word, " needs an argument.\n" );
          fi;
        fi;
      else
        ADD_LIST_DEFAULT( InitFiles, word );
      fi;
    od;
    CommandLineOptions.g:= CommandLineOptions.g mod 3;
    # use the same as the kernel
    CommandLineOptions.E:= GAPInfo.KernelInfo.HAVE_LIBREADLINE;
    MakeImmutable( CommandLineOptions );
    MakeImmutable( InitFiles );

    if CommandLineOptions.L = "" or CommandLineOptions.R then
      # start without a workspace
      GAPInfo.CommandLineOptionsPrev:= [];
      GAPInfo.InitFilesPrev:= [];
    else
      # start with a workspace
      ADD_LIST_DEFAULT( GAPInfo.CommandLineOptionsPrev,
                        GAPInfo.CommandLineOptions );
      ADD_LIST_DEFAULT( GAPInfo.InitFilesPrev, GAPInfo.InitFiles );
    fi;
    GAPInfo.CommandLineOptions:= CommandLineOptions;
    GAPInfo.InitFiles:= InitFiles;

    # Switch on debugging (`-D' option) when GAP is started with a workspace.
    if GAPInfo.CommandLineOptions.D then
      InfoRead1:= Print;
    fi;

    # Evaluate the `-h' option.
    if GAPInfo.CommandLineOptions.h then
      PRINT_TO( "*errout*",
        "usage: gap [OPTIONS] [FILES]\n",
        "       run the Groups, Algorithms and Programming system, Version ",
        GAPInfo.KernelVersion, "\n\n" );

      for i in [ 1 .. LENGTH( GAPInfo.CommandLineOptionData ) ] do
        if IsBound( GAPInfo.CommandLineOptionData[i] ) then
          opt:= GAPInfo.CommandLineOptionData[i];
          if LENGTH( opt ) > 2 then
            PRINT_TO( "*errout*", "  -", opt[1], " " );
            if LENGTH( opt )  = 3 then
              PRINT_TO( "*errout*", "         ", opt[3], "\n" );
            else
              PRINT_TO( "*errout*", opt[3] );
              for j in [ 1 .. 9 - LENGTH( opt[3] ) ] do
                PRINT_TO( "*errout*", " " );
              od;
              PRINT_TO( "*errout*", opt[4], "\n" );
              for j in [ 5 .. LENGTH( opt ) ] do
                PRINT_TO( "*errout*", "              ", opt[j], "\n" );
              od;
            fi;
          fi;
        else
          PRINT_TO( "*errout*", "\n" );
        fi;
      od;

      PRINT_TO("*errout*",
       "  Boolean options (b,q,e,r,A,D,E,M,N,T,X,Y) toggle the current value\n",
       "  each time they are called. Default actions are indicated first.\n",
       "\n" );
      QUIT_GAP();
    fi;
end );


#############################################################################
##
#V  GAPInfo.TestData
##
##  <ManSection>
##  <Var Name="GAPInfo.TestData"/>
##
##  <Description>
##  This is a mutable record used in files that are read via <C>ReadTest</C>.
##  These files contain the commands <C>START_TEST</C> and <C>STOP_TEST</C>,
##  which set, read, and unbind the components <C>START_TIME</C> and <C>START_NAME</C>.
##  The function <C>RunStandardTests</C> also uses a component <C>results</C>.
##  </Description>
##  </ManSection>
##


#T the following functions eventually should be more clever. This however
#T will require kernel support and thus is something for later.  AH

#############################################################################
##
#F  ARCH_IS_WINDOWS()
##
##  <#GAPDoc Label="ARCH_IS_WINDOWS">
##  <ManSection>
##  <Func Name="ARCH_IS_WINDOWS" Arg=''/>
##
##  <Description>
##  tests whether &GAP; is running on a Windows system.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
BIND_GLOBAL("ARCH_IS_WINDOWS",function()
  return POSITION_SUBSTRING (GAPInfo.Architecture, "cygwin", 0) <> fail;
end);

#############################################################################
##
#F  ARCH_IS_MAC_OS_X()
##
##  <#GAPDoc Label="ARCH_IS_MAC_OS_X">
##  <ManSection>
##  <Func Name="ARCH_IS_MAC_OS_X" Arg=''/>
##
##  <Description>
##  tests whether &GAP; is running on Mac OS X. Note that on Mac OS X, also
##  <Ref Func="ARCH_IS_UNIX"/> will be <C>true</C>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
BIND_GLOBAL("ARCH_IS_MAC_OS_X",function()
  return POSITION_SUBSTRING (GAPInfo.Architecture, "apple-darwin", 0) <> fail 
    and IsReadableFile ("/System/Library/CoreServices/Finder.app");
end);

#############################################################################
##
#F  ARCH_IS_UNIX()
##
##  <#GAPDoc Label="ARCH_IS_UNIX">
##  <ManSection>
##  <Func Name="ARCH_IS_UNIX" Arg=''/>
##
##  <Description>
##  tests whether &GAP; is running on a UNIX system (including Mac OS X).
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
BIND_GLOBAL("ARCH_IS_UNIX",function()
  return not ARCH_IS_WINDOWS();
end);


#############################################################################
##
#V  GAPInfo.InitFiles
#V  GAPInfo.CommandLineArguments
##
##  <ManSection>
##  <Var Name="GAPInfo.InitFiles"/>
##  <Var Name="GAPInfo.CommandLineArguments"/>
##
##  <Description>
##  <C>GAPInfo.InitFiles</C> is a list of strings containing the filenames
##  specified on the command line to be read initially.
##  <P/>
##  <C>GAPInfo.CommandLineArguments</C> is a single string containing all
##  the options and arguments passed to GAP at runtime (although not
##  necessarily in the original order).
##  </Description>
##  </ManSection>
##
#T really ???


#############################################################################
##
#E

