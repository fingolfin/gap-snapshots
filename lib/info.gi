#############################################################################
##
#W  info.gi                     GAP library                      Steve Linton
##
#H  @(#)$Id: info.gi,v 4.29 2002/10/07 01:41:46 gap Exp $
##
#Y  Copyright (C)  1996,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This package sets up a GAP level prototype of the new Info messages
##  system, parts of which will eventually have to be moved into
##  the kernel
##  
##  Informational messages are controlled by the user setting desired
##  levels of verbosity for InfoClasses. A set of InfoClasses is an
##  InfoSelector, and classes and selectors may be built up with \+
#N  I wanted to use \or, but this isn't at operation
##  
##  An message is associated with a selector and a level and is
##  printed when the desired level for any of the classes in the selector
##  equals or exceeds  the level of the message
##
#N  There may be a case for doing this without using method selection at all
#N  as it could then be installed earlier in library loading
#N
##
##  This file is the implementation  part of that package
##
Revision.info_gi :=
    "@(#)$Id: info.gi,v 4.29 2002/10/07 01:41:46 gap Exp $";


#############################################################################
##
#R  IsInfoClassListRep(<obj>)                       length one positional rep
##                              
##  An InfoClass is represented as a length one positional object with
##  a positive integer in ic![1]. No other representations are 
##  anticipated
##

DeclareRepresentation("IsInfoClassListRep", IsPositionalObjectRep,[]);

#############################################################################
##
#V  InfoData                 record of private stuff
#V  InfoData.CurrentLevels   the current desired verbosity levels set by user
#V  InfoData.ClassNames          names of all info classes, used for printing
##
##  these are both lists, and should have the same length, which defines the
##  number of Info classes that exist
##

if not IsBound(InfoData) then

    BIND_GLOBAL( "InfoData", rec() );
    InfoData.CurrentLevels := [];
    InfoData.ClassNames := [];
fi;


#############################################################################
##
#F  InfoData.InfoClass( <num> )               make a number into an InfoClass
##

InfoData.InfoClass :=  function(num)
    if num < 1 or num > Length(InfoData.CurrentLevels) then
        Error("Bad info class number -- this is a bug");
    fi;
    return Objectify(NewType(InfoClassFamily,IsInfoClassListRep),
                   [num]);
end;

#############################################################################
##
#M  NewInfoClass( <name> )                              make a new Info Class  
##
##  This is how Info Classes should be obtained
##
#N  Is there any reason to make this an Operation?
##

InstallMethod(NewInfoClass, true, [IsString], 0,
        function(name)
    local pos;
    
    # if we are rereading and this class already exists then 
    # do not make a new class
    if REREADING then
        pos := Position(InfoData.ClassNames,name);
        if pos <> fail then
            return InfoData.InfoClass(pos);
        fi;
    fi;
    
    Add(InfoData.CurrentLevels,0);
    Add(InfoData.ClassNames,name);
    return InfoData.InfoClass(Length(InfoData.CurrentLevels));
end);


#############################################################################
##
#F  DeclareInfoClass( <name> )
##
InstallGlobalFunction( DeclareInfoClass, function( name )
    if not ISBOUND_GLOBAL( name ) then
      BIND_GLOBAL( name, NewInfoClass( name ) );
    elif not IsInfoClass( VALUE_GLOBAL( name ) ) then
      Error( "value of `",name,"' is already bound and not an info class" );
    fi;
end );


#############################################################################
##
#M  Basic methods for Info Classes: =, < (so that we can make Sets),
##                                  PrintObj
##

InstallMethod(\=,
    "for two info classes",
    IsIdenticalObj, [IsInfoClassListRep, IsInfoClassListRep], 0,
        function(ic1,ic2)
    return ic1![1] = ic2![1];
end);

InstallMethod(\<,
    "for two info classes",
    IsIdenticalObj, [IsInfoClassListRep, IsInfoClassListRep], 0,
        function(ic1,ic2)
    return ic1![1] < ic2![1];
end);

InstallMethod(PrintObj,
    "for an info class",
    true, [IsInfoClassListRep], 0,
        function(ic)
    Print(InfoData.ClassNames[ic![1]]);
end);

#############################################################################
##
#M  <info class> + <info class>
#M  <info selector> + <info class>
#M  <info class> + <info selector>
#M  <info selector> + <info selector>
##
##  Used to build up InfoSelectors, these are essentially just taking unions
##

InstallOtherMethod(\+,
    "for two info classes",
    IsIdenticalObj, [IsInfoClass, IsInfoClass], 0,
        function(ic1,ic2)
    return Set([ic1,ic2]);
end);

InstallOtherMethod(\+,
    "for info class and info selector",
    true, [IsInfoClass, IsInfoSelector], 0,
        function(ic,is)
    return Union(is,[ic]);
end);

InstallOtherMethod(\+,
    "for info selector and info class",
    true, [IsInfoSelector, IsInfoClass], 0,
        function(is,ic)
    return Union(is,[ic]);
end);

InstallOtherMethod(\+,
    "for two info selectors",
    IsIdenticalObj, [IsInfoSelector, IsInfoSelector], 0,
        function(is1,is2)
    return Union(is1,is2);
end);

#############################################################################
##
#M  SetInfoLevel( <class>, <level>)   set desired verbosity level for a class  
##

InfoData.handler := function(ic,lev)
    InfoData.CurrentLevels[ic![1]] := lev;
end;

InstallMethod(SetInfoLevel, true, 
        [IsInfoClass and IsInfoClassListRep, IsPosInt], 0,
        InfoData.handler);

InstallMethod(SetInfoLevel, true, 
        [IsInfoClass and IsInfoClassListRep, IsZeroCyc], 0,
        InfoData.handler);

Unbind(InfoData.handler);

#############################################################################
##
#F  SetAllInfoLevels(  <level>)   set desired verbosity level for all classes
##

BIND_GLOBAL( "SetAllInfoLevels", function( level )
    local i;
    for i in [1..Length(InfoData.CurrentLevels)] do
        InfoData.CurrentLevels[i] := level;
    od;
end );
                                     

#############################################################################
##
#M  InfoLevel( <class> )              get desired verbosity level for a class  
##

InstallMethod(InfoLevel, true, 
        [IsInfoClass and IsInfoClassListRep], 0,
        function(ic)
    return InfoData.CurrentLevels[ic![1]];
end);

#############################################################################
##
#F  InfoDecision( <selector>, <level>) .  decide whether a message is printed
##
##  This is called by the kernel
##

BIND_GLOBAL( "InfoDecision", function(selectors, level)
    local usage;
    usage := "Usage : InfoDecision(<selectors>, <level>)";
    if not IsInt(level) or level <= 0 then
        if level = 0 then
            Error("Level 0 info messages are not allowed");
        else
            Error(usage);
        fi;
    fi;
    
    if IsInfoClass(selectors) then
        return InfoLevel(selectors) >= level;
    elif IsInfoSelector(selectors)  then

        # note that we 'or' the classes together
        return ForAny(selectors, ic -> InfoLevel(ic) >= level);
    else
        Error(usage);
    fi;
end );
    
#############################################################################
##
#F  InfoDoPrint( arglist )  . . . . . . . . . . . . . . Print an info message
##
##  This is called by the kernel to actually produce the message
##

BIND_GLOBAL( "InfoDoPrint", function(arglist)
    Print("#I  ");
    CallFuncList(Print, arglist);
    Print("\n");
end );


##
## Former GAP Info function, now replaced by the keyword Info.
##
###Info := function(arg)
##    local usage;
##   
##    # Check and unpack the arguments
##   usage := "Usage : Info(<selectors>, <level>, <data>...)";
##    if Length(arg) < 2 then
##        Error(usage);
##    fi;
##    if InfoDecision(arg[1], arg[2]) then
##        InfoDoPrint(arg{[3..Length(arg)]});
##    fi;
##end;


#N  Probably this file should also define InfoClasses for a range of purposes
#N  which cut across files


#############################################################################
##
#V  InfoDebug
##
if not IsBound(InfoDebug) then
    DeclareInfoClass( "InfoDebug" );
fi;


#############################################################################
##
#V  InfoMethodSelection
##
if not IsBound(InfoMethodSelection) then
    DeclareInfoClass( "InfoMethodSelection" );
fi;


#############################################################################
##
#V  InfoTiming
##
if not IsBound(InfoTiming) then
    DeclareInfoClass( "InfoTiming" );
fi;

#############################################################################
##
#V  InfoWarning
##
##  This info class has a default level of 1.
##  Warnings can be switched off by setting its level to zero
##
if not IsBound(InfoWarning) then
    DeclareInfoClass( "InfoWarning" );
    SetInfoLevel( InfoWarning, 1 );

    # The call of `INFO_INSTALL' in `oper.g' (with level 2)
    # is thought as a call to `InfoWarning'.
    MAKE_READ_WRITE_GLOBAL( "INFO_INSTALL" );
    INFO_INSTALL:= function( arg )
        local string, i;
        string:= [];
        for i in [ 2 .. LEN_LIST( arg ) ] do
          APPEND_LIST_INTR( string, arg[i] );
        od;
        Info( InfoWarning, arg[1], string );
    end;
    MAKE_READ_ONLY_GLOBAL( "INFO_INSTALL" );
fi;

#############################################################################
##
#V  InfoPerformance
##
##  This info class has a default level of 1. It prints warnings about
##  performance problems when doing things in particularly unsuitable ways.
##  Warnings can be switched off by setting its level to zero
##
DeclareInfoClass( "InfoPerformance" );
SetInfoLevel( InfoPerformance, 1 );

#############################################################################
##
#V  InfoTeaching
##
##  This info class has a default level of 1.
##  Warnings can be switched off by setting its level to zero
##
if not IsBound(InfoTeaching) then
  DeclareInfoClass( "InfoTeaching" );
  if not TEACHING_MODE then
    SetInfoLevel( InfoTeaching, 1 );
  fi;
fi;

InstallGlobalFunction(CompletionBar,function(c,a,s,v)
local out,w,i;
  if InfoLevel(c)>=a then
    out:=OutputTextUser();
    if not IsRat(v) then
      PrintTo(out,"\n");
      return;
    fi;
    w:=SizeScreen()[1];
    for i in [1..w] do
      PrintTo(out,"\r");
    od;
    PrintTo(out,"\c");
    w:=w-Length(s)-5;
    v:=v*w;
    PrintTo(out,s," ");
    for i in [1..w] do
      if v>0 then
	PrintTo(out,"#");
      else
	PrintTo(out," ");
      fi;
      v:=v-1;
    od;
    PrintTo(out,"|\c");
  fi;
end);
