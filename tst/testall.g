#############################################################################
##
#W  testall.g                   GAP library                      Frank Celler
##
#H  @(#)$Id: testall.g,v 4.50 2003/11/15 16:58:31 gap Exp $
##
#Y  Copyright (C)  1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##

#############################################################################
##
#F  START_TEST( <id> )  . . . . . . . . . . . . . . . . . . . start test file
##
start_TEST := START_TEST;

START_TIME := 0;
STONE_NAME := "";



START_TEST := function( name )
    FlushCaches();
    RANDOM_SEED(1);
    GASMAN("collect");
    START_TIME := Runtime();
    STONE_NAME := name;
end;


#############################################################################
##
#F  STOP_TEST( <file>, <fac> )  . . . . . . . . . . . . . . .  stop test file
##
stop_TEST := STOP_TEST;

TEST_RESULTS:=[];

STONE_RTIME := 0;
STONE_STONE := 0;
STONE_FILE  := 0;
STONE_SUM   := 0;
STONE_FSUM  := 0;
STONE_PROD  := 1;
STONE_COUNT := 0;

STOP_TEST := function( file, fac )
    local   time;

    STONE_FILE  := file;
    STONE_RTIME := Runtime() - START_TIME;
    if STONE_RTIME > 500  then
        STONE_STONE := QuoInt( fac, STONE_RTIME );
        STONE_SUM   := STONE_SUM + STONE_RTIME;
        STONE_FSUM  := STONE_FSUM + fac;
        STONE_PROD  := STONE_PROD*STONE_STONE;
        STONE_COUNT := STONE_COUNT + 1;
    else
        STONE_STONE := 0;
    fi;
    Add(TEST_RESULTS,[STONE_FILE,fac,STONE_STONE]);
end;


#############################################################################
##
#F  SHOW_STONES( <next> ) . . . . . . . . . . . . . . . . .  show GAP4 stones
##
STONE_ALL := [];

SHOW_STONES := function( next )
    Print( FormattedString(STONE_FILE,-16), "    ",
           FormattedString(STONE_STONE,8), "       ",
           FormattedString(STONE_RTIME,8) );
    Add( STONE_ALL, STONE_STONE );
    if 0 < next and STONE_FSUM <> 0  then
        Print( "    (next ~ ", Int(STONE_SUM*next*10/STONE_FSUM),
               " sec)\n" );
    else
        Print("\n");
    fi;
end;


#############################################################################
##
#F  TEST_FILES  . . . . . . . . . . . . . . . . . . . . .  list of test files
##
##  the following list contains the filename and  the scaling factor given to
##  `STOP_TEST' at the end of the test file.  The file  names are relative to
##  the test directory.
##
##  The list can be produced using:
##
##  grep -h "STOP_TEST" *.tst | sed -e 's:^gap> STOP_TEST( ":[ ":' | \
##  sed -e 's: );: ],:'
##
TEST_FILES := [
  [ "alghom.tst", 55000084 ],
  [ "algmat.tst", 1399012122 ], 
  [ "algsc.tst", 290001260 ],
  [ "combinat.tst", 27000000 ], 
  [ "ctblfuns.tst", 31000000 ],
  [ "ctblmoli.tst", 458004509 ], 
  [ "ctblmono.tst", 276000397 ],
  [ "ctblsolv.tst", 373001595 ], 
  [ "cyclotom.tst", 5832500 ],
  [ "ffe.tst", 18000000 ], 
  [ "gaussian.tst", 640000 ],
  [ "grpfree.tst", 5000000 ], 
  [ "grpmat.tst", 1552001004 ],
  [ "grppc.tst", 109000000 ], 
  [ "grppcnrm.tst", 1468011635 ],
  [ "listgen.tst", 1440000 ], 
  [ "mapping.tst", 31000000 ],
  [ "mgmring.tst", 19000000 ], 
  [ "modfree.tst", 36000000 ],
  [ "morpheus.tst", 639005411 ], 
  [ "onecohom.tst", 333000997 ],
  [ "oprt.tst", 23823519 ], 
  [ "ratfun.tst", 9000000 ],
  [ "rwspcgrp.tst", 250000000 ], 
  [ "semigrp.tst", 122000331 ],
  [ "semirel.tst", 360004330 ], 
  [ "vspchom.tst", 59318227 ],
  [ "vspcmat.tst", 64000142 ], 
  [ "vspcrow.tst", 194000056 ],
  [ "xgap.tst", 559003658 ], 
  [ "zlattice.tst", 136000 ],
  [ "zmodnz.tst", 21000000 ] ];

Sort( TEST_FILES, function(a,b) return a[2] < b[2]; end );

#############################################################################
##
#X  read all test files
##
Print("You should start GAP4 using:  `gap -N -A -x 80 -r -m 100m'. The more\n");
Print("GAP4stones you get, the faster your  system is.  The runtime of\n");
Print("the following tests (in general)  increases.  You should expect\n");
Print("about 100000 GAP4stones on a Pentium 3, 1GHz.\n");
Print("The `next' time is an approximation of the running time for the next test.\n");
Print("\n");
Print("Architecture: ", GAP_ARCHITECTURE, "\n");
Print("\n");
Print("test file         GAP4stones     time(msec)\n");
Print("-------------------------------------------\n");

infoRead1 := InfoRead1;  InfoRead1 := Ignore;
infoRead2 := InfoRead2;  InfoRead2 := Ignore;

TestDir := DirectoriesLibrary("tst");

for i  in [ 1 .. Length(TEST_FILES) ]  do
    name := Filename( TestDir, TEST_FILES[i][1] );
    if i < Length(TEST_FILES)  then
        next := TEST_FILES[i+1][2] / 10^4;
    else
        next := 0;
    fi;
    Print("testing: ",name,"\n");
    ReadTest(name);
    SHOW_STONES(next);
od;

Print("-------------------------------------------\n");
if STONE_COUNT=0 then
  STONE_COUNT:=1;
fi;
Print( FormattedString("total",-16), "    ",
       FormattedString(RootInt(STONE_PROD,STONE_COUNT),8), "       ",
       FormattedString(STONE_SUM,8), "\n" );
Print("\n");

InfoRead1  := infoRead1;
InfoRead2  := infoRead2;
START_TEST := start_TEST;
STOP_TEST  := stop_TEST;


#############################################################################
##
#E  testall.g . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
