#############################################################################
##
#W  affine-def.gi           Manuel Delgado <mdelgado@fc.up.pt>
#W                          Pedro Garcia-Sanchez <pedro@ugr.es>
##
#Y  Copyright 2015-- Centro de Matemática da Universidade do Porto, Portugal and Universidad de Granada, Spain
#############################################################################
#################        Defining Affine Semigroups           ###############
###############################################################################
##
#F AffineSemigroupByGenerators(arg)
##
## Returns the affine semigroup generated by arg.
##
## The argument arg is either a list of lists of positive integers of equal length (a matrix) or consists of lists of integers with equal length
#############################################################################
InstallGlobalFunction(AffineSemigroupByGenerators, function(arg)
  local  gens, M;


  if Length(arg) = 1 then
    if ForAll(arg[1], x -> (IsPosInt(x) or x = 0)) then
      gens := Set(arg);
    else
      gens := Set(arg[1]);
    fi;
  else
    gens := Set(arg);
  fi;

  if not IsRectangularTable(gens) then
    Error("The arguments must be lists of non negative integers with the same length, or a list of such lists");
  elif not ForAll(gens, l -> ForAll(l,x -> (IsPosInt(x) or x = 0))) then
    Error("The arguments must be lists of non negative integers with the same length, or a list of such lists");
  fi;
  M:= Objectify( AffineSemigroupsType, rec());

  SetGenerators(M,gens);
  SetDimension(M,Length(gens[1]));

#  Setter(IsAffineSemigroupByGenerators)(M,true);
  return M;
end);

#############################################################################
##
#O  Generators(S)
##
##  Computes a set of generators of the affine semigroup S.
##  If a set of generators has already been computed, this
##  is the set returned.
############################################################################
InstallMethod(Generators,
         "Computes a set of generators of the affine semigroup",
         [IsAffineSemigroup],1,
        function(S)
  local  basis, eq, H, Corollary9;

  if HasGenerators(S) then
      return Generators(S);
  fi;
  if HasMinimalGenerators(S) then
      return MinimalGenerators(S);
  fi;

  if HasEquations(S) then
      eq:=Equations(S);
      basis := HilbertBasisOfSystemOfHomogeneousEquations(eq[1],eq[2]);
      SetMinimalGenerators(S,basis);
      return MinimalGenerators(S);
  elif HasInequalities(S) then
      basis := HilbertBasisOfSystemOfHomogeneousInequalities(AffineSemigroupInequalities(S));
      SetMinimalGenerators(S,basis);
      return MinimalGenerators(S);
  fi;
  if HasGaps(S) then
     H:=Gaps(S);
     #########################################################
     #F  Corollary9(<h>)
     # Returns if it is possible, a system of generators of 
     # \N^(|h[1]|) \setminus <h>, or [] if not.
     #
     Corollary9 := function(h)
        local lSi, lSip, lH, lHi, le, si, sp, se, MinimalElements;

        #########################################################
        #F  MinimalElements(<a>, <b>, <c>)
        #  Returns the minimal elements in <b> with respect to 
        #  <a> \cup <b> discarding every e in <b> such that 
        #  exists z \in <a> \cup <b> and e-z \notin <c> and  
        #  e-z is in the 1st ortant
        #
        MinimalElements := function(a, b, c)
          local slenA, slenB, si, lb, lminimals, ldif, bDiscard;

          slenA := Length(a);
          slenB := Length(b);
          lminimals := [];
          for lb in b do
            bDiscard := false;
            si := 1;
            while si<=slenA and not bDiscard do
              ldif := lb-a[si];
              if ForAll(ldif, v->v>=0) and not ldif in c then
                bDiscard := true;
              fi;
             si := si+1;
            od;
            if not bDiscard then
              si := 1;
              while si<=slenB and not bDiscard do
                if b[si]=lb then ## skip the same element
                  si := si+1;
                  continue;
                fi;
                ldif := lb-b[si];
                if ForAll(ldif, v->v>=0) and not ldif in c then
                  bDiscard := true;
                fi;
                si := si+1;
              od;
            fi;
            if not bDiscard then
              Append(lminimals, [lb]);
            fi;
          od;
          return lminimals;
          end;

        if not IsRectangularTable(h) then
          Error("The argument must be a list of list");
        fi;
        sp := Length(h[1]);
        lH := ShallowCopy(h);
        lSi := IdentityMat(sp);
        lHi := [];
        si := 1;
        while lH <> [] and si<=Length(lH) do
          se := First([1..Length(lSi)], v->lSi[v]=lH[si]);
          if se=fail then
            si := si+1;
            continue;
          fi;
          le := lH[si];
          Remove(lH, si);
          Add(lHi, le);
          lSip := [List(3*le)];
          Append(lSip, List(lSi, v->v+le));
          Remove(lSi, se);
          se := 1;
          while se <= Length(lSip) do
            if lSip[se] in lSi then
              Remove(lSip, se);
            else
              se := se+1;
            fi;
          od;
          Append(lSi, MinimalElements(lSi, lSip, lHi));
        od;
        #if lH <> [] then
        #  return [];
        #fi;
        return lSi;
      end; 
    SetMinimalGenerators(S,Corollary9(H));
    return MinimalGenerators(S); 
  fi;
end);

#############################################################################
##
#O  Generators(S)
##
##  Computes a set of generators of the affine semigroup S.
##  If a set of generators has already been computed, this
##  is the set returned.
############################################################################
InstallMethod(Generators,
         "Computes a set of generators of the affine semigroup",
         [IsAffineSemigroup and HasPMInequality],10,
        function(M)
  local MinimalGensAndMaybeGapsFromInequality, ineq;
  
MinimalGensAndMaybeGapsFromInequality:=function(f, b, g)
  local ComputeForGGreaterThanZero, ComputeForGGreaterLowerZero;

  if ForAll(g, v->v<0) then
    # Setter #######################
    SetMinimalGenerators(M, []);
    ################################
  elif ForAll(g, v->v>0) then
    ComputeForGGreaterThanZero := function()
      local sp, si, se, lH, lsH, lSi, lSip, lHi, le, MinimalElements;

      #########################################################
      #F  MinimalElements(<a>, <b>, <c>)
      #  Returns the minimal elements in <b> with respect to 
      #  <a> \cup <b> discarding every e in <b> such that 
      #  exists z \in <a> \cup <b> and e-z \notin <c> and  
      #  e-z is in the 1st ortant
      #
      MinimalElements := function(a, b, c)
        local slenA, slenB, si, lb, lminimals, ldif, bDiscard;

        slenA := Length(a);
        slenB := Length(b);
        lminimals := [];
        for lb in b do
          bDiscard := false;
          si := 1;
          while si<=slenA and not bDiscard do
            ldif := lb-a[si];
            if ForAll(ldif, v->v>=0) and not ldif in c then
              bDiscard := true;
            fi;
            si := si+1;
          od;
          if not bDiscard then
            si := 1;
            while si<=slenB and not bDiscard do
              if b[si]=lb then ## skip the same element
                si := si+1;
                continue;
              fi;
              ldif := lb-b[si];
              if ForAll(ldif, v->v>=0) and not ldif in c then
                bDiscard := true;
              fi;
              si := si+1;
            od;
          fi;
          if not bDiscard then
            Append(lminimals, [lb]);
          fi;
        od;
        return lminimals;
      end;

      sp := Length(g);
      lH := [];
      for si in [1..b-1] do
        lsH := FactorizationsIntegerWRTList(si, g);
        for se in lsH do
          if f*se mod b > g*se then
            Add(lH, se);
          fi;
        od;
      od;
      # Setter ###############
      SetGaps(M, lH);
      ########################
      lSi := IdentityMat(sp);
      lHi := [];
      si := 1;
      while lH <> [] do
        se := First([1..Length(lSi)], v->lSi[v]=lH[si]);
        if se<>fail then
          le := lH[si];
          Remove(lH, si);
          Add(lHi, le);
          lSip := [List(3*le)];
          Append(lSip, List(lSi, v->v+le));
          Remove(lSi, se);
          se := 1;
          while se <= Length(lSip) do
            if lSip[se] in lSi then
              Remove(lSip, se);
            else
              se := se+1;
            fi;
          od;
          Append(lSi, MinimalElements(lSi, lSip, lHi));
        else
          si := si+1;
        fi;
      od;
      return lSi;
    end;

    # Setter ######################################
    SetMinimalGenerators(M, ComputeForGGreaterThanZero());
    ###############################################
  else 
    ComputeForGGreaterLowerZero:=function()
      local sd, sk, lheqs, slenf, lCdash, lMdk, le, lee, ls, lr, lzero, 
            ComputeCdash;

      if b=1 then
        return HilbertBasisOfSystemOfHomogeneousInequalities(
                  Concatenation([g], IdentityMat(Length(g))));
      else
        slenf := Length(f);
        ComputeCdash:=function()
          local lzero, lw, lV, lU, lwzetas, lC, lCk, lomegas,
                SplitMGSC0, GenSysOfCk, Dash;

          ######################################################  
          #F SplitMGSC0(<v>, <c0>)
          #
          # Extracts from w \in <c0> those such that w \notin <v>, 
          # and <g>(w)<b or <g>(w)>=b,  
          # returning them in a list omegas of lists. 
          # w \in omegas[i-1], if _g(w) = i 
          # w \in omegas[b-1], if _g(w) >= _b 
          SplitMGSC0 := function(v, c0)

            local si, lC0minusV, lomegas, lw;

            lC0minusV := Difference(c0, v);

            lomegas := List([1..b], v->[]);
            for lw in lC0minusV do
              si := g*lw;
              if si > b then
                si := b;
              fi;
              Add(lomegas[si], lw);
            od;
            return lomegas;
          end;

          ######################################################
          #F GenSysOfCk( <omegask>, <v>, <ckm1>)
          #
          # Recursive construction of set 
          # C_k = <ckm1> \setminus <omegask> \cup
          # \{2<omegask>, 3<omegask>\} \cup 
          # \{<omegask>+s | s \in <ckm1>\setminus <v>\}
          GenSysOfCk := function(omegask, v, ckm1)
            local lv, lw, lCk, lCkm1minusV, lws;

            lCk := Difference(ckm1, omegask);
            lCkm1minusV := Difference(ckm1, v);

            lws := [];
            for lv in omegask do
              lw := 2*lv;
              if not lw in lCk then
                Add(lCk, lw);
              fi;
              lw := lw+lv;
              if not lw in lCk then
                Add(lCk, lw);
              fi;
              
              Append(lws, Filtered(lCkm1minusV+lv, e->not e in lws));
            od;
            Append(lCk, Filtered(lws, u->not u in lCk));
            return lCk;
          end;

          ## Compute $V$, $x$ such that $g(x) = 0$
          lV := HilbertBasisOfSystemOfHomogeneousEquations([g], []);

          ## Compute $C_0$, the mgs of $L(S)\cap\N^p$
          ## $g(x)\ge 0$, $x_i\ge 0$
          lC := HilbertBasisOfSystemOfHomogeneousInequalities(
                  Concatenation([g], IdentityMat(Length(g))));

          lomegas := SplitMGSC0(lV, lC);

          ## Compute C_k recursivelly
          lCk := [];
          Append(lCk, [lC]);
          for sk in [2..b] do
            Append(lCk, [GenSysOfCk(lomegas[sk-1], lV, lCk[sk-1])]);
          od;

          ## Compute $U$, $x$ such that
          ## $f(x) \mod b = 0$, and $g(x) = 0$
          lzero := List([1..Length(f)], v->0);
          lU := Filtered(List(HilbertBasisOfSystemOfHomogeneousEquations([f, g], [b]), 
                              u->u{[1..slenf]}), 
                          e->e<>lzero);

          ## Compute $(C_{b-1}\setminus V)\cup U$
          lC := Set(List(Difference(lCk[b], lV)));
          UniteSet(lC, lU);
          
          ## Take $w \in C$ such that $g(w)\ge b$
          lw := Filtered(lC, e->g*e >= b);

          ######################################################
          #F Dash( <w>, <d> )
          # Computes the set 
          # \cup_{<w>} \{z\in N^p | <w> < z <= <w> + <d>} 
          # and returns it as a set
          Dash := function(w, d)
            local slend, luz, lw, lrngs, lwmd;

            luz := Set([]);
            slend := Length(d);
            for lw in w do
              lwmd := lw + d;
              lrngs := List([1..slend], e->[lw[e]..lwmd[e]]);
              # TODO: avoid repeating Cartesian computations for overlapping
              # ranges
              UniteSet(luz, Cartesian(lrngs));
              RemoveSet(luz, lw);
            od;
            return luz;
          end;

          ## Compute $z\in \N^p, z!=w, z-w \in \N^p, w+\sum_{v\in V}b v - z \in \N^p$
          lwzetas := Dash(lw, Sum(List(lV, v->b*v)));
          ## \~C = C \cup wzetas
          UniteSet(lC, lwzetas);
          
          return lC;
        end;

        lCdash := ComputeCdash();
        lMdk := List([1..b-1], e->List([1..e+1], ee->[]));
        lzero := List([1..slenf], e->0);
        for sd in [1..b-1] do
          lheqs := [Concatenation(f, [0]), Concatenation(g, [-sd])];
          for sk in [0..sd] do
            lheqs[1][slenf+1] := -sk;
            lMdk[sd][sk+1] := Filtered(List(
                                        Filtered(
                                          HilbertBasisOfSystemOfHomogeneousEquations(lheqs, [b]), 
                                            r->r[slenf+1]=1), 
                                          e->e{[1..slenf]}), 
                                        ee->ee<>lzero);
            UniteSet(lCdash, lMdk[sd][sk+1]);
          od;
        od;
        sd := 1;
        while sd <= Length(lCdash) do
          le := lCdash[sd];
          sd := sd+1;
          lee := Filtered(lCdash, e->ForAll(le-e, v->v>=0) and e<>le);
          for ls in lee do
            lr := le - ls;
            if f*lr mod b <= g*lr then
              Unbind(lCdash[sd-1]);
              break;
            fi;
          od;
        od;
        return Compacted(lCdash);
      fi;
    end;

    # Setter #######################################
    SetMinimalGenerators(M, ComputeForGGreaterLowerZero());
    ################################################
  fi;
  return MinimalGenerators(M);
end;

  ineq := PMInequality(M);
  return MinimalGensAndMaybeGapsFromInequality(ineq[1], ineq[2], ineq[3]);
end);

#############################################################################
##
#O  MinimalGenerators(S)
##
##  Computes the set of minimal  generators of the affine semigroup S.
##  If a set of generators has already been computed, this
##  is the set returned.
############################################################################
InstallMethod(MinimalGenerators,
         "Computes the set of minimal generators of the affine semigroup",
         [IsAffineSemigroup],1,
        function(S)
  local  basis, eq, gen;

  if HasMinimalGenerators(S) then
      return MinimalGenerators(S);
  fi;

  if HasEquations(S) then
      eq:=Equations(S);
      basis := HilbertBasisOfSystemOfHomogeneousEquations(eq[1],eq[2]);
      SetMinimalGenerators(S,basis);
      return MinimalGenerators(S);
  elif HasInequalities(S) then
      basis := HilbertBasisOfSystemOfHomogeneousInequalities(AffineSemigroupInequalities(S));
      SetMinimalGenerators(S,basis);
      return MinimalGenerators(S);
  elif HasPMInequality(S) then
      SetMinimalGenerators(S, Generators(S));
      return MinimalGenerators(S);
  fi;
  gen:=Generators(S);
  basis:=Filtered(gen, y->ForAll(Difference(gen,[y]),x->not((y-x) in S)));
  SetMinimalGenerators(S,basis);
  return MinimalGenerators(S);

end);

#############################################################################
##
#F  AffineSemigroupByGaps(arg)
##
##  Returns the affine semigroup determined by the gaps arg.
##  If the given set is not a set of gaps, then an error is raised.
##
#############################################################################
InstallGlobalFunction(AffineSemigroupByGaps,

function(arg)
local P,E,h,H,e,M;

if Length(arg) = 1 then
    H := Set(arg[1]);
else
  H := Set(arg);
fi;

if H=[] then 
  Error("The dimension is ambiguous");
fi;

if not IsRectangularTable(H) then
  Error("The arguments must be lists of non negative integers with the same length, or a list of such lists");
elif not ForAll(H, l -> ForAll(l,x -> (IsPosInt(x) or x = 0))) then
  Error("The arguments must be lists of non negative integers with the same length, or a list of such lists");
fi;

if (Zero(H[1]) in H) then
  return Error("the given set is not a set of gaps");
fi;  
for h in H do
   P:=Cartesian(List(h,i->[0..i]));
   E:=Difference(P,H);
   for e in E do
     if (h<>e and not((h-e) in H)) then
       return Error("the given set is not a set of gaps");
     fi;
   od;    
od;
M:=Objectify(AffineSemigroupsType,rec());
SetGaps(M,H);
SetDimension(M,Length(H[1]));
return M;
end);

InstallMethod(Gaps,
  "for an affine semigroups",
  [IsAffineSemigroup],
  function( M )
  local i,j,k,d,sum,S,NS,N,V,vec,F,P,G,A,E,minA,ge,m,
        f, b, g, lH, si, lsH, se;

  if HasGaps(M) then
    return Gaps(M);
  fi;
  if HasPMInequality(M) then
    g := PMInequality(M)[3];
    if ForAll(g, v->v<0) then
      SetGaps(M, []);
      return [];
    elif ForAll(g, v->v>0) then
      f := PMInequality(M)[1];
      b := PMInequality(M)[2];
      lH := [];
      for si in [1..b-1] do
        lsH := FactorizationsIntegerWRTList(si, g);
        for se in lsH do
          if ((f*se) mod b) > g*se then
            Add(lH, se);
          fi;
        od;
      od;
      SetGaps(M, lH);
      return Gaps(M);
    else
      Info(InfoWarning,1,"The given affine semigroup has infinitely many gaps");
      return fail;
    fi;
  fi;

  A:=List(Generators(M));     #A will be modified
  S:=[];
  NS:=[];
  d:=Length(A[1]);
  if M=AffineSemigroup(IdentityMat(d)) then
    return []; # The semigroup N^d has no gaps
  fi;  
  #Let i in {1,..d}, I have to find in A the elements in which all coordinates 
  #different from i is zero, I need the nonzero coordinates of these elements and such 
  #coordinates must generate a numerical semigroup
  for i in [1..d] do
    S[i]:=Filtered(A,j->ForAll([1..d],k->(j[k]=0 or k=i)));
    NS[i]:=List(S[i],j->j[i]);
    A:=Difference(A,S[i]); #now A is no more the set of minimal generators (it is not needed)
    if NS[i]=[] or (Gcd(NS[i])<>1) then
      Info(InfoWarning,1,"The given affine semigroup has infinitely many gaps");
      return fail;
    fi;
  od;
  
  #I have to find in A all elements e(i)+n(i,k)e(k), since e(i) is the i-th standard basis
  #vector in N^d, with i different by k. Moreover I have to store the numbers n(i,k).
  #When i=k it is useless.
  N:=NullMat(d,d);
  for i in [1..d] do
    #If e(i) belong to S[i] then we can choose n(i,k)=0 for all k 
    if IdentityMat(d)[i] in S[i] then
      N[i]:=NullMat(1,d)[1];
    else  
      for k in [1..d] do
        if i<>k then
          V:=Filtered(Filtered(A,j->j[i]=1),r->ForAll([1..d],t->(r[t]=0 or (t=k or t=i))));
          if V=[] then
            Error("This affine semigroup has infinitely many gaps");
          fi;
          N[i,k]:=Minimum(List(V,j->j[k]));      
          #Taking the minimum above, it would reduce the successive computations.
        fi;
      od;
    fi;
  od;
  #if this point is reached, then the semigroup has finitely many gaps
  #
  #next the set of gaps is computed
  #
 #I have to build the vector V of the pseudocode;
 #F is the list of Frobenius numbers of the semigroups in the axes.
 #F:=List(NS,j->Maximum(FrobeniusNumber(NumericalSemigroup(j)),0);
 F:=List(NS,j->FrobeniusNumber(NumericalSemigroup(j)));
 for j in [1..d] do
   if F[j]=-1 then
     F[j]:=0;
    fi;
 od;
 vec:=[];
 for j in [1..d] do
   sum:=F[j];
    for i in [1..d] do
      if i<>j then
        sum:=sum+F[i]*N[i,j];
      fi;
    od;
    vec[j]:=sum; 
  od;
  #Now the gaps of the semiroup M are all contained in the set of all elements smaller
  #than the vector vec (with repsect to partial order). We check those not belonging to M. 
  P:=Cartesian(List(vec,i->[0..i]));
  G:=[];
  #G is the set of gaps and G:=Filtered(P,i->not(BelongsToAffineSemigroup(i,M)));
  #Or we eliminate succesively from P, many elements of the Semigroup, stored in E.
  for i in [1..d] do
    S[i]:=NumericalSemigroup(NS[i]);
    G:=Union(G,List(Gaps(S[i]),g->IdentityMat(d)[i]*g));
    NS[i]:=ElementsUpTo(S[i],vec[i]);     
  od;
  P:=Difference(P,Cartesian(List([1..d],i->[F[i]+1..vec[i]])));
  E:=Difference(Cartesian(NS),Cartesian(List([1..d],i->[F[i]+1..vec[i]])));
  A:=Filtered(A,i->i in P);
  A:=Union(A,Union(List(A,i->A+i)));
  E:=Union(E,Union(List(A,i->E+i)));
  m:=Cartesian(List([1..d],i->[0..Multiplicity(S[i])-1]));
  A:=Intersection(m,A);
  if IsEmpty(A) then
     G:=Union(G,Difference(m,NullMat(1,d)));
  else
    ge:=function(x,y)
      return ForAll([1..Length(x)], i->x[i]>=y[i]);
    end;;   
    minA:=Filtered(A, a->not(ForAny(A, aa-> ge(a,aa) and a<>aa)));
    G:=Union(G,Union(List(minA,a->Difference(Cartesian(List(a,i->[0..i])),[a]))));
    G:=Difference(G,NullMat(1,d));
  fi;
  P:=Difference(P,Union(E,G));
  G:=Union(G,Filtered(P,i->not(BelongsToAffineSemigroup(i,M))));
  SetGaps(M,G);
  return G;
end);

#####################################################
##
#F GenusOfAffineSemigroup:=function(S)
## Returns the number of gaps of an affine semigroup if it has finitely many and infinite otherwise.
#####################################################
InstallMethod(Genus,
        "for affine semigroups",[IsAffineSemigroup],
        function(S)
  local gaps;

  if not(IsAffineSemigroup(S)) then
    Error("The argument must be an affine semigroup");
  fi;
  gaps := Gaps(S);
  if gaps = fail then
    return infinity;
  else
    return Length(gaps);
  fi;
end);

##############################################################
#A PseudoFrobenius
# Computes the set of PseudoFrobenius
# Works only if the affine semigroup has finitely many gaps
##############################################################
InstallMethod(PseudoFrobenius, [IsAffineSemigroup],
function(s)
    local gaps, gens;
    gens:=Generators(s);
    gaps:=Gaps(s);
   return Filtered(gaps, g->not ForAny(gens, n -> n+g in gaps));
end);

##############################################################
#A SpecialGaps
# Computes the set of special gaps
# Works only if the affine semigroup has finitely many gaps
##############################################################
InstallMethod(SpecialGaps, [IsAffineSemigroup],
function(s)
  return Filtered(PseudoFrobenius(s), g->2*g in s);
end);

###############################################################################
#
# RemoveMinimalGeneratorFromAffineSemigroup(x,s)
#
# Compute the affine semigroup obtained by removing the minimal generator x from 
# the given affine semigroup s. If s has finite gaps, its set of gaps is setted 
# 
#################################################################################
InstallGlobalFunction(RemoveMinimalGeneratorFromAffineSemigroup, function(x,s)
  local H,t,gens;

  if not(ForAll(x,i -> (IsPosInt(i) or i = 0))) then
    Error("The first argument must be a list of non negative integers.\n");
  fi;

  if(not(IsAffineSemigroup(s))) then
    Error("The second argument must be an affine semigroup.\n");
  fi;

  gens:=MinimalGenerators(s);
  if x in gens then
    gens:=Difference(gens,[x]);
    gens:=Union(gens,gens+x);
    gens:=Union(gens,[2*x,3*x]);
    t:=AffineSemigroup(gens);
    if HasGaps(s) then
      H:=Gaps(s);
      H:=Union(H,[x]);
      SetGaps(t,H);
    fi;  
    return t;
  else
    return Error(x," must be a minimal generator of ",s,".\n");
  fi;
end);

############################################################################## 
#
#  AddSpecialGapOfAffineSemigroup(x,s)
#
# Let a an affine semigroup with finite gaps and x be a special gap of a.
# We compute the unitary extension of a with x.
################################################################################
InstallGlobalFunction(AddSpecialGapOfAffineSemigroup, function( x, a )
  local H,s,gens;

  if not(ForAll(x,i -> (IsPosInt(i) or i = 0))) then
    Error("The first argument must be a list of non negative integers.\n");
  fi;

  if(not(IsAffineSemigroup(a))) then
    Error("The second argument must be an affine semigroup.\n");
  fi;
  
  H:=Set(Gaps(a));
  if x in SpecialGaps(a) then
    RemoveSet(H,x);
    gens:=Union(Generators(a),[x]);
    s:=AffineSemigroup(gens);
    SetGaps(s,H);
    return s;
  else
    Error(x," must be a special gap of ",a,".\n");  
  fi;
end);

#############################################################################
##
#O  Inequalities(S)
##
##  If S is defined by inequalities, it returns them.
############################################################################
InstallMethod(Inequalities,
         "Computes the set of equations of S, if S is a affine semigroup",
         [IsAffineSemigroup and HasInequalities],1,
        function(S)
          return AffineSemigroupInequalities(S);
end);
#############################################################################
## Full affine semigroups
#############################################################################
##
#F  AffineSemigroupByEquations(ls,md)
##
##  Returns the (full) affine semigroup defined by the system A X=0 mod md, where the rows
## of A are the elements of ls.
##
#############################################################################
InstallGlobalFunction(AffineSemigroupByEquations, function(arg)
  local  ls, md, M;

  if Length(arg) = 1 then
    ls := arg[1][1];
    md := arg[1][2];
  else
    ls := arg[1];
    md := arg[2];
  fi;

  if not(IsHomogeneousList(ls)) or not(IsHomogeneousList(md)) then
    Error("The arguments must be homogeneous lists.");
  fi;

  if not(ForAll(ls,IsListOfIntegersNS)) then
    Error("The first argument must be a list of lists of integers.");
  fi;

  if not(md = [] or IsListOfIntegersNS(md)) then
    Error("The second argument must be a lists of integers.");
  fi;

  if not(ForAll(md,x->x>0)) then
    Error("The second argument must be a list of positive integers");
  fi;

  if not(Length(Set(ls, Length))=1) then
    Error("The first argument must be a list of lists all with the same length.");
  fi;

  M:= Objectify( AffineSemigroupsType, rec());
  SetEquations(M,[ls,md]);
  SetDimension(M,Length(ls[1]));

#  Setter(IsAffineSemigroupByEquations)(M,true);
#  Setter(IsFullAffineSemigroup)(M,true);
  return M;
end);

#############################################################################
##
#F  AffineSemigroupByInequalities(ls)
##
##  Returns the (full) affine semigroup defined by the system  ls*X>=0 over
##  the nonnegative integers
##
#############################################################################
InstallGlobalFunction(AffineSemigroupByInequalities, function(arg)
  local  ls, M;

  if Length(arg) = 1 then
    ls := Set(arg[1]);
  else
    ls := Set(arg);
  fi;

  if not IsRectangularTable(ls) then
    Error("The arguments must be lists of integers with the same length, or a list of such lists");
  fi;

  M:= Objectify( AffineSemigroupsType, rec());

  SetAffineSemigroupInequalities(M,ls);
  SetDimension(M,Length(ls[1]));
 # Setter(IsAffineSemigroupByEquations)(M,true);
 # Setter(IsFullAffineSemigroup)(M,true);
  return M;
end);

#############################################################################
##
#F  AffineSemigroupByPMInequality(f, b, g)
##
##  Returns the proportionally modular affine semigroup defined by the 
##  inequality f*x mod b <= g*x
##
#############################################################################
InstallGlobalFunction(AffineSemigroupByPMInequality, function(f, b, g)
  local M;

  if not (IsListOfIntegersNS(f) or IsListOfIntegersNS(g)) then
    Error("f and g must be lists\n");
  fi;
  if Length(f)<>Length(g) then
    Error("f and g must be equal length lists\n");
  fi;
  if b<=0 then
    Error("b should be greater than 0\n");
  fi;

  M:= Objectify( AffineSemigroupsType, rec());
  SetPMInequality(M, [f, b, g]);
  SetDimension(M, Length(g));
  return M;
end);

#############################################################################

#############################################################################
##
#F  AffineSemigroup(arg)
##
##  This function's first argument may be one of:
##  "generators", "equations", "inequalities"...
##
##  The following arguments must conform to the arguments of
##  the corresponding function defined above.
##  By default, the option "generators" is used, so,
##  gap> AffineSemigroup([1,3],[7,2],[1,5]);
##  <Affine semigroup in 3-dimensional space, with 3 generators>
##
##
#############################################################################
InstallGlobalFunction(AffineSemigroup, function(arg)

  if IsString(arg[1]) then
    if arg[1] = "generators" then
      return AffineSemigroupByGenerators(Filtered(arg, x -> not IsString(x))[1]);
    elif arg[1] = "equations" then
      return AffineSemigroupByEquations(Filtered(arg, x -> not IsString(x))[1]);
    elif arg[1] = "inequalities" then
      return AffineSemigroupByInequalities(Filtered(arg, x -> not IsString(x))[1]);
    elif arg[1] = "gaps" then
      return AffineSemigroupByGaps(Filtered(arg, x -> not IsString(x))[1]);
    elif arg[1] = "pminequality" then
      return AffineSemigroupByPMInequality(arg[2][1], arg[2][2], arg[2][3]);
    else
      Error("Invalid first argument, it should be one of: \"generators\", \"minimalgenerators\", \"gaps\" , \"pminequality\"");
    fi;
  elif Length(arg) = 1 and IsList(arg[1]) then
    return AffineSemigroupByGenerators(arg[1]);
  else
    return AffineSemigroupByGenerators(arg);
  fi;
  Error("Invalid argumets");
end);

#############################################################################
##
#P  IsAffineSemigroupByGenerators(S)
##
##  Tests if the affine semigroup S was given by generators.
##
#############################################################################
 # InstallMethod(IsAffineSemigroupByGenerators,
 #         "Tests if the affine semigroup S was given by generators",
 #         [IsAffineSemigroup],
 #         function( S )
 #   return(HasGeneratorsAS( S ));
 # end);
#############################################################################
##
#P  IsAffineSemigroupByMinimalGenerators(S)
##
##  Tests if the affine semigroup S was given by its minimal generators.
##
#############################################################################
 # InstallMethod(IsAffineSemigroupByMinimalGenerators,
 #         "Tests if the affine semigroup S was given by its minimal generators",
 #         [IsAffineSemigroup],
 #         function( S )
 #   return(HasIsAffineSemigroupByMinimalGenerators( S ));
 # end);
#############################################################################
##
#P  IsAffineSemigroupByEquations(S)
##
##  Tests if the affine semigroup S was given by equations or equations have already been computed.
##
 #############################################################################
 # InstallMethod(IsAffineSemigroupByEquations,
 #         "Tests if the affine semigroup S was given by equations",
 #         [IsAffineSemigroup],
 #         function( S )
 #   return(HasEquationsAS( S ));
 # end);

#############################################################################
##
#P  IsAffineSemigroupByInequalities(S)
##
##  Tests if the affine semigroup S was given by inequalities or inequalities have already been computed.
##
# #############################################################################
 # InstallMethod(IsAffineSemigroupByInequalities,
 #         "Tests if the affine semigroup S was given by inequalities",
 #         [IsAffineSemigroup],
 #         function( S )
 #   return(HasInequalitiesAS( S ));
 # end);

#############################################################################
##
#P  IsFullAffineSemigroup(S)
##
##  Tests if the affine semigroup S has the property of being full.
##
# Detects if the affine semigroup is full: the nonnegative
# of the the group spanned by it coincides with the semigroup
# itself; or in other words, if a,b\in S and a-b\in \mathbb N^n,
# then a-b\in S
#############################################################################
 InstallMethod(IsFullAffineSemigroup,
         "Tests if the affine semigroup S has the property of being full",
         [IsAffineSemigroup],1,
         function( S )
   local  gens, eq, h, dim;

   if HasEquations(S) then
     return true;
   fi;


   gens := GeneratorsOfAffineSemigroup(S);
   if gens=[] then
       return true;
   fi;
   dim:=Length(gens[1]);
   eq:=EquationsOfGroupGeneratedBy(gens);
   if eq[1]=[] then
       h:=IdentityMat(dim);
   else
       h:=HilbertBasisOfSystemOfHomogeneousEquations(eq[1],eq[2]);
   fi;
  if ForAll(h, x->BelongsToAffineSemigroup(x,S)) then
    SetEquations(S,eq);
    #Setter(IsAffineSemigroupByEquations)(S,true);
    #Setter(IsFullAffineSemigroup)(S,true);
    return true;
  fi;
  return false;

end);


#############################################################################
 ##
 #M  PrintObj(S)
 ##
 ##  This method for affine semigroups.
 ##
 #############################################################################
InstallMethod( PrintObj,
        "Prints an Affine Semigroup",
        [ IsAffineSemigroup],
        function( S )
  if HasGenerators(S) then
    Print("AffineSemigroup( ", Generators(S), " )\n");
  elif HasEquations(S) then
    Print("AffineSemigroupByEquations( ", Equations(S), " )\n");
  elif HasInequalities(S) then
    Print("AffineSemigroupByInequalities( ", Inequalities(S), " )\n");
  else
    Print("AffineSemigroup( ", GeneratorsOfAffineSemigroup(S), " )\n");
  fi;
end);



#############################################################################
##
#M  ViewString(S)
##
##  This method for affine semigroups.
##
#############################################################################
InstallMethod( ViewString,
        "Displays an Affine Semigroup",
        [IsAffineSemigroup],
        function( S )
  if HasMinimalGenerators(S) then
        return Concatenation("Affine semigroup in ", String(Length(MinimalGenerators(S)[1]))," dimensional space, with ", String(Length(MinimalGenerators(S))), " generators");
    elif HasGenerators(S) then
        return Concatenation("Affine semigroup in ", String(Length(Generators(S)[1]))," dimensional space, with ", String(Length(Generators(S))), " generators");
    else
        return ("<Affine semigroup>");
    fi;
end);

#############################################################################
##
#M  String(S)
##
##  This method for affine semigroups.
##
#############################################################################
InstallMethod(String,[IsAffineSemigroup],ViewString);

#############################################################################
##
#M  ViewObj(S)
##
##  This method for affine semigroups.
##
#############################################################################
InstallMethod( ViewObj,
        "Displays an Affine Semigroup",
        [IsAffineSemigroup],
        function( S )
  if HasMinimalGenerators(S) then
        Print("<Affine semigroup in ", Length(MinimalGenerators(S)[1])," dimensional space, with ", Length(MinimalGenerators(S)), " generators>");
    elif HasGenerators(S) then
        Print("<Affine semigroup in ", Length(Generators(S)[1])," dimensional space, with ", Length(Generators(S)), " generators>");
    else
        Print("<Affine semigroup>");
    fi;
end);



#############################################################################
##
#M  Display(S)
##
##  This method for affine semigroups. ## under construction... (= View)
##
#############################################################################
InstallMethod( Display,
        "Displays an Affine Semigroup",
        [IsAffineSemigroup],
        function( S )
    if HasMinimalGenerators(S) then
        Print("<Affine semigroup in ", Length(MinimalGenerators(S)[1]),"-dimensional space, with ", Length(MinimalGenerators(S)), " generators>");
    elif HasGenerators(S) then
        Print("<Affine semigroup in ", Length(Generators(S)[1]),"-dimensional space, with ", Length(Generators(S)), " generators>");
    else
        Print("<Affine semigroup>");
    fi;
end);



 ####################################################
 ####################################################


 ############################################################################
 ##
 #M Methods for the comparison of affine semigroups.
 ##
 InstallMethod( \=,
         "for two affine semigroups",
         [IsAffineSemigroup and IsAffineSemigroupRep,
          IsAffineSemigroup and IsAffineSemigroupRep],
         function(x, y )
   local  genx, geny;

   if Dimension(x) <> Dimension(y) then
     return false;
   fi;

   if  HasEquations(x) and HasEquations(y) and
       Equations(x) = Equations(y) then
     return true;

   elif HasInequalities(x) and HasInequalities(y) and
     AffineSemigroupInequalities(x) = AffineSemigroupInequalities(y) then
     return true;

   elif HasGenerators(x) and HasGenerators(y) and
     Generators(x) = Generators(y) then
     return  true;

   elif HasGaps(x) and HasGaps(y) and
     Gaps(x) = Gaps(y) then
     return  true;

   elif HasGenerators(x) and HasGenerators(y) and not(EquationsOfGroupGeneratedBy(Generators(x))=EquationsOfGroupGeneratedBy(Generators(y))) then
     return false;
   fi;
   genx:=GeneratorsOfAffineSemigroup(x);
   geny:=GeneratorsOfAffineSemigroup(y);
   return ForAll(genx, g-> g in y) and
          ForAll(geny, g-> g in x);
 end);

 ## x < y returns true if:  (dimension(x)<dimension(y)) or (x is (strictly) contained in y) or (genx < geny), where genS is the *current* set of generators of S...
 InstallMethod( \<,
         "for two affine semigroups",
         [IsAffineSemigroup,IsAffineSemigroup],
         function(x, y )
   local  genx, geny;

   if Dimension(x) < Dimension(y) then
     return true;
   fi;

   genx:=GeneratorsOfAffineSemigroup(x);
   geny:=GeneratorsOfAffineSemigroup(y);
   if ForAll(genx, g-> g in y) and not ForAll(geny, g-> g in x) then
     return true;
   fi;

   return genx < geny;
end );


#############################################################################
##
#F AsAffineSemigroup(S)
##
## Takes a numerical semigroup as argument and returns it as affine semigroup
##
#############################################################################
InstallGlobalFunction(AsAffineSemigroup, function(s)
    local msg;

    if not(IsNumericalSemigroup(s)) then
        Error("The argument must be a numerical semigroup");
    fi;

    msg:=MinimalGeneratingSystem(s);
    return AffineSemigroup(List(msg, x->[x]));

end);