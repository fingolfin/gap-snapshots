Sort(TEST_RESULTS);
for i in TEST_RESULTS do
  n:=i[1];
  t:=i[3];
  if t>0 then
    i[3]:=Int(i[2]*100000/t);
    # print only if at least 2 percent off -- saves editing work
    if i[3]/i[2]>105/100 or i[3]/i[2]<95/100 then
      Print("gap> STOP_TEST( \"",i[1],"\",",i[3],");\n");
    fi;
  else
    i[3]:=i[2];
  fi;
od;
