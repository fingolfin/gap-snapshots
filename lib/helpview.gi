#############################################################################
##  
#W  helpview.gi                 GAP Library                      Frank L�beck
##  
#H  @(#)$Id: helpview.gi,v 1.5 2003/04/25 16:46:13 gap Exp $
##  
#Y  Copyright (C)  2001,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 2001 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##  
##  The  files  helpview.g{d,i} contain the configuration mechanism  for  the
##  different help viewer.
##  
Revision.helpview_gi := 
  "@(#)$Id: helpview.gi,v 1.5 2003/04/25 16:46:13 gap Exp $";

#############################################################################
##  
##  the user interface for the help viewer choice
##  

#############################################################################
##  
#V  HELP_VIEWER_INFO
##  
##  This record  contains records  for each  possible help  viewer: each
##  stores the `.type' of the  output data (currently supported: "text",
##  "url", "pdf", "dvi")  and a function `.show' for  showing the output
##  data.
##    
##  The  output data  (from  handler.HelpData) must  have the  following
##  form:
##  
##  "text":   a format as allowed by `Pager' (usually rec(lines:=text,
##            start:=linenr, formatted:=true))
##  
##  "url":    an URL (usually local `file://' URL)
##  
##  "dvi":    a filename or a record rec(file:=filename, page:=pagenr)
##            where pagenr is the first page to show
##  
##  "pdf":    same as for "dvi"
##  
InstallValue(HELP_VIEWER_INFO, rec());

# text on screen
HELP_VIEWER_INFO.screen := rec(
type := "text",
show := Pager
);

# html version with netscape
HELP_VIEWER_INFO.netscape := rec(
type := "url",
show := function(url)
  Exec(Concatenation("netscape -remote \"openURL(file:", url, ")\""));
end
);

# html version with mozilla
HELP_VIEWER_INFO.mozilla := rec(
type := "url",
show := function(url)
  Exec(Concatenation("mozilla -remote \"openURL(file:", url, ")\""));
end
);

# html version with lynx
HELP_VIEWER_INFO.lynx := rec(
type := "url",
show := function(url)
  Exec(Concatenation("lynx \"", url, "\""));
end
);

# html version on MAC
HELP_VIEWER_INFO.("internet config") := rec(
type := "macurl",
show := function(data)
  if IsBound (data.path) then
     ExecuteProcess ("./", "Internet Config", 1, 0, [data.protocol, data.path, data.section]);
  else
     ExecuteProcess ("", "Internet Config", 1, 0, [data.url, "", data.section]);
  fi;
end
);

# Function to find the X-windows window ID of a program accessing file
# <bookf>. Used for a hack below: xdvi doesn't provide a -remote control.
# Having compiled GAPHOME/etc/xrmtcmd.c one can reuse running xdvi's for
# each help file. This was provided by Alexander Hulpke.
# 
# This may not work if several people on the same machine want to use it.
# 
# Set "XLSCLIENTSCMD := fail;" to turn this off.
FWITF:=fail;
XLSCLIENTSCMD:=false;
InstallGlobalFunction(FindWindowId, function(prog,bookf)
local s,l,a,e,n,c;
  if FWITF=fail then
    FWITF:=Filename(DirectoryTemporary(),"clients");
  fi;
  if XLSCLIENTSCMD=false then
    XLSCLIENTSCMD:=Filename(DirectoriesSystemPrograms(),"xlsclients");
  fi;
  if XLSCLIENTSCMD=fail then
    return fail;
  fi;
  Exec(Concatenation(XLSCLIENTSCMD," -l >",FWITF));
  s:=InputTextFile(FWITF);
  # find the proper jobs
  #T also get the right display/user. Probably this has to be done via the
  #T `Machine' parameter.
  while not IsEndOfStream(s) do
    l:=ReadLine(s);
    if l<>fail then
      e:=Length(l);
      if l[e]='\n' then
	e:=e-1;
      fi;
      a:=1;
      while l[a]=' ' do
	a:=a+1;
      od;
      if l{[a..a+6]}="Window " then
	n:=l{[a+7..e-1]};
      elif l{[a..a+7]}="Command:" then
	c:=l{[a+10..e]};
	a:=PositionSublist(c,prog);
	e:=Length(c);
	# does the program name occur and is called on the right file?
	if a<>fail and e>Length(bookf) 
	   and c{[e-Length(bookf)+1..e]}=bookf then
	  # now convert n in an integer
	  e:=0;
	  a:="0123456789abcdef";
	  c:=3; # first two characters are 0x
	  while c<=Length(n) do
	    e:=e*16+Position(a,n[c])-1;
	    c:=c+1;
	  od;
	  return e;
	fi;
      fi;
    fi;
  od;
  CloseStream(s);
  return fail;
end);

XRMTCMD:=false;

##  dvi version with xdvi
##  default options, can be adjusted in .gaprc file or by environment
##  variables
XDVI_OPTIONS := "";
##  longer example:
#XDVI_OPTIONS := " -geometry 739x577 -paper a4 -s 6 -fg \"#111111\" -bg \"#dddddd\" -margins 1cm -gamma 0.8";

HELP_VIEWER_INFO.xdvi := rec(
type := "dvi",
show := function(file)
  local   page,wnum;
  page := 1;
  if IsRecord(file) then
    if IsBound(file.page) then
      page := file.page;
    fi;
    file := file.file;
  fi;
  if XRMTCMD=false then
    XRMTCMD:=Filename(DirectoriesSystemPrograms(),"xrmtcmd");
  fi;
  if XRMTCMD<>fail then
    wnum:=FindWindowId("xdvi",file); # get the window ID of a running XDVI
                                     # for the right book
  else
    wnum:=fail;
  fi;
  if wnum=fail or XRMTCMD=fail then
    Exec(Concatenation("xdvi ", XDVI_OPTIONS, " +", String(page), " ",
	    file, " &"));
  else
    #Print("Window: ",wnum,"\n");
    # command for xdvi: a (to \relax), pagenumber, goto
    file:=Concatenation("a",String(page),"g");
    Exec(Concatenation(XRMTCMD," ",String(wnum)," ",file));
  fi;
end
);

# pdf version with xpdf (very good with well configured fonts!)
XPDF_OPTIONS := "";
HELP_VIEWER_INFO.xpdf := rec(
type := "pdf",
show := function(file)
  local   page;
  page := 1;
  if IsRecord(file) then
    if IsBound(file.page) then
      page := file.page;
    fi;
    file := file.file;
  fi;
  Exec(Concatenation("xpdf -remote gap4 -raise ", XPDF_OPTIONS, 
                        " ", file, " ", String(page), " 2>/dev/null &"));
end
);

# pdf version with acroread: less nice since there is no start page argument
# and no remote control.
# When accessing several sections of the same file in a row this viewer
# assumes that acroread is still running and only tells the page number 
# to visit.
ACROREAD_OPTIONS := "";
ACROREAD_FILE  := "";
HELP_VIEWER_INFO.acroread := rec(
type := "pdf",
show := function(file)
  local   page;
  # unfortunately one cannot (yet?) give a start page to acroread
  # it is currently ignored
  page := 1;
  if IsRecord(file) then
    if IsBound(file.page) then
      page := file.page;
    fi;
    file := file.file;
  fi;
  if file <> ACROREAD_FILE then
    Exec(Concatenation("acroread ", ACROREAD_OPTIONS, " ", file, " &"));
    ACROREAD_FILE := file;
  fi;
  Print("#  see page ", page, " in acroread window.\n");
end
);

#############################################################################
##
#F  SetHelpViewer(<viewer>):  Set the viewer used for help
##

##  This variable contains the list of preferred help viewers for a user.
##  It should be set by using `SetHelpViewer'.  The default is  "screen".
HELP_VIEWER := ["screen"];

# Can give one or more strings for the preferred help viewer;
# the HELP tries to get the data for the viewer in the order given here.
# No argument shows current setting.
InstallGlobalFunction(SetHelpViewer, function(arg)
  local   view,  i,  a;
  view := List(arg, LowercaseString);
  
  for i in [1..Length(view)] do 
    a := view[i];
    # special handling of help viewer `less'
    if a = "less" then
      Info(InfoWarning, 1, 
      "Help viewer \"less\": interpreted as ",
      "viewer \"screen\" and setting:\n#I  ",
      "PAGER := \"less\"; ",
      "PAGER_OPTIONS := [\"-f\", \"-r\", \"-a\", \"-i\", \"-M\", \"-j2\"];");
      PAGER := "less";
      PAGER_OPTIONS := ["-f", "-r", "-a", "-i", "-M", "-j2"];
      view[i] := "screen";
    elif a = "more" then
      Info(InfoWarning, 1, 
      "Help viewer \"more\": interpreted as ",
      "viewer \"screen\" and setting:\n#I  ",
      "PAGER := \"more\"; PAGER_OPTIONS := [];");
      PAGER := "more";
      PAGER_OPTIONS := [];
      view[i] := "screen";
    elif not IsBound(HELP_VIEWER_INFO.(a)) then
      Info(InfoWarning, 1, Concatenation(
           "GAP's help system has NO support for help viewer ",a,"!\n"));
      view[i] := fail;
    fi;
  od;
  if Length(view) = 0 or view[Length(view)] <> "screen" then
    Add(view, "screen");
  fi;
  if Length(arg) > 0 then
    HELP_VIEWER := Filtered(view, a-> a<>fail);  
  fi;
  if Length(HELP_VIEWER) > 1 then
    Info(InfoWarning, 1, "Trying to use\n#I  ", HELP_VIEWER, 
          "\n#I  (in this order) as help viewer.");
  else
    Info(InfoWarning, 1, Concatenation(
          "Using ", HELP_VIEWER[1], " as help viewer."));
  fi;
end);


