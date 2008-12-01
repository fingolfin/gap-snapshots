#############################################################################
##
#W  teachm2.g                GAP library                   Alexander Hulpke
##
#H  @(#)$Id: teachm2.g,v 4.1.2.2 2008/10/14 20:57:58 gap Exp $
##
#Y  Copyright (C) 2008 The GAP Group
##
##  This  file contains rotines for turning teaching mode on and off.
##
Revision.teachm2_g:=
  "@(#)$Id: teachm2.g,v 4.1.2.2 2008/10/14 20:57:58 gap Exp $";

TEACHMODE:=fail;


BindGlobal("TeachingMode",function(arg)
local s;
  if Length(arg)>0 then
    if arg[1]=true and TEACHMODE=fail then
      ReadLib("teachmod.g");
    fi;
    TEACHMODE:=arg[1]=true;
  fi;
  if TEACHMODE=true then
    s:="ON";
  else
    s:="OFF";
  fi;
  Info(InfoWarning,1,"Teaching mode is turned ",s);
end);

