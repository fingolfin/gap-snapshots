#############################################################################
##
#W  automfam.gi              automgrp package                  Yevgen Muntyan
#W                                                             Dmytro Savchuk
##
#Y  Copyright (C) 2003 - 2018 Yevgen Muntyan, Dmytro Savchuk
##


###############################################################################
##
#R  IsAutomFamilyRep
##
##  Any object from category AutomFamily which is created here, lies in a
##  category IsAutomFamilyRep.
##  Family of Autom object <a> contains all essential information about
##  (mathematical) automaton which generates group containing <a>:
##  it contains automaton, properties of automaton and group generated by it,
##  etc.
##  Also family contains group generated by states of underlying automaton.
##
DeclareRepresentation("IsAutomFamilyRep",
                      IsComponentObjectRep and IsAttributeStoringRep,
                      [ "freegroup",      # IsAutom objects store words from this group
                        "freegens",       # list [f1, f2, ..., fn, f1^-1, ..., fn^-1, 1]
                                          # where f1..fn are generators of freegroup,
                                          # n is numstates; 1 is stored if and only if
                                          # trivstate is not zero.
                                          # Some fi^-1 may be missing if corresponding
                                          # generator is not invertible (but the list still
                                          # has the length of 2n+1).
                        "automgens",      # Generators of the group, list of length n.
                        "numstates",      # number of non-trivial generating states
                        "deg",
                        "trivstate",      # 0 or 2*numstates+1
                        "isgroup",        # whether all generators are invertible
                        "names",          # list of non-trivial generating states
                        "automatonlist",  # the automaton table, states correspond to freegens
                        "oldstates",      # mapping from states in the original table used to
                                          # define the group to the states in automatonlist:
                                          # Autom(fam!.freegens[oldtstates[k]], fam) is the element
                                          # which corresponds to k-th state in the original automaton
                        "rws",            # rewriting system
                        "use_rws",        # whether to use rewriting system in multiplication
                        "use_contraction" # whether to use contraction in IsOne
                      ]);


BindGlobal("AG_FixAutomList",
function(list, oldstates, names)
  local i, j, deg, isgroup, numstates, perm, trivstate;

  deg := Length(list[1]) - 1;
  isgroup := true;
  trivstate := 0;
  numstates := Length(list);

  for i in [1..Length(list)] do
    if AG_IsTrivialStateInList(i, list) then
      trivstate := i;
      numstates := numstates - 1;
      break;
    fi;
  od;

  # make sure trivial state in oldstates is right
  if trivstate <> 0 then
    for i in [1..Length(oldstates)] do
      if oldstates[i] = trivstate then
        oldstates[i] := 2*numstates + 1;
      elif oldstates[i] > trivstate then
        oldstates[i] := oldstates[i] - 1;
      fi;
    od;

    Remove(names, trivstate);
  fi;

  # move trivial state to the end
  if trivstate <> 0 then
    for i in [1..Length(list)] do
      for j in [1..deg] do
        if list[i][j] = trivstate then
          list[i][j] := 2*numstates + 1;
        elif list[i][j] > trivstate then
          list[i][j] := list[i][j] - 1;
        fi;
      od;
    od;

    list := Concatenation(list{[1..(trivstate-1)]},
                          list{[(trivstate+1)..Length(list)]});
    trivstate := 2*numstates + 1;
    list[trivstate] := List([1..deg], k -> trivstate);
    list[trivstate][deg+1] := ();
  fi;

  # add inverses of states
  for i in [1..numstates] do
    if AG_IsInvertibleStateInList(i, list) then
      list[i+numstates] := [];

      list[i][deg+1] := AG_PermFromTransformation(list[i][deg+1]);

      perm := list[i][deg+1];
      list[i+numstates][deg+1] := perm^-1;
      for j in [1..deg] do
        list[i+numstates][j] := list[i][j^(perm^-1)];
        if list[i+numstates][j] <> trivstate then
          list[i+numstates][j] := list[i+numstates][j] + numstates;
        fi;
      od;
    else
      isgroup := false;
      if list[i][deg+1]^-1<>fail then
        list[i][deg+1] := AG_PermFromTransformation(list[i][deg+1]);
      fi;
    fi;
  od;

  return [list, numstates, trivstate, isgroup];
end);


###############################################################################
##
#M  AutomFamily(<list>, <names>, <bind_vars>)
##
InstallMethod(AutomFamily, "for [IsList, IsList, IsBool]",
              [IsList, IsList, IsBool],
function (list, names, bind_global)
  local deg, tmp, trivstate, numstates, i,
        freegroup, freegens, a, family, oldstates,
        isgroup;

  if not AG_IsCorrectAutomatonList(list, false) then
    Error("in AutomFamily(IsList, IsList, IsString):\n",
          "  given list is not a correct list representing automaton\n");
  fi;

# 1. make a local copy of arguments, since they will be modified and put into the result

  list := StructuralCopy(list);
  names := StructuralCopy(names);
  deg := Length(list[1]) - 1;

# 2. Reduce automaton, find trivial state, permute states

  tmp := AG_ReducedAutomatonInList(list);
  list := tmp[1];
  oldstates := tmp[3];
  names := List(tmp[2], x -> names[x]);

  tmp := AG_FixAutomList(list, oldstates, names);
  list := tmp[1];
  numstates := tmp[2];
  trivstate := tmp[3];
  isgroup := tmp[4];

# 3. Create FreeGroup and FreeGens

  freegroup := FreeGroup(names);
  freegens := ShallowCopy(FreeGeneratorsOfFpGroup(freegroup));
  for i in [1..numstates] do
    if IsBound(list[i+numstates]) then
      freegens[i+numstates] := freegens[i]^-1;
    fi;
  od;
  if trivstate <> 0 then
    freegens[trivstate] := One(freegroup);
  fi;

# 4. Create family

  if isgroup then
    family := NewFamily("AutomFamily",
                        IsInvertibleAutom,
                        IsInvertibleAutom,
                        IsAutomFamily and IsAutomFamilyRep);
  else
    family := NewFamily("AutomFamily",
                        IsAutom,
                        IsAutom,
                        IsAutomFamily and IsAutomFamilyRep);
  fi;

  family!.isgroup := isgroup;
  family!.deg := deg;
  family!.numstates := numstates;
  family!.trivstate := trivstate;
  family!.names := names;
  family!.freegroup := freegroup;
  family!.freegens := freegens;
  family!.automatonlist := list;
  family!.oldstates := oldstates;
  family!.use_rws := false;
  family!.rws := fail;
  family!.use_contraction := false;

  SetIsActingOnBinaryTree(family, deg = 2);
  SetDegreeOfTree(family, deg);
  SetTopDegreeOfTree(family, deg);

  family!.automgens := [];
  for i in [1..Length(list)] do
    if IsBound(list[i]) then
      family!.automgens[i] :=
        __AG_CreateAutom(family, freegens[i],
                        List([1..deg], j -> freegens[list[i][j]]),
                        list[i][deg+1],
                        i > numstates or IsBound(list[i+numstates]));
    fi;
  od;

  # XXX It's evil to bind global names, consider AssignGeneratorVariables
  # XXX Check whether names are actually valid names for variables
  if bind_global then
    for i in [1..family!.numstates] do
      if IsBoundGlobal(family!.names[i]) then
        UnbindGlobal(family!.names[i]);
      fi;
      BindGlobal(family!.names[i], family!.automgens[i]);
      MakeReadWriteGlobal(family!.names[i]);
    od;
    #BindGlobal(AG_Globals.identity_symbol, One(family));
    #MakeReadWriteGlobal(AG_Globals.identity_symbol);
  fi;

  return family;
end);


###############################################################################
##
#M  AutomFamily(<list>)
##
InstallMethod(AutomFamily, "for [IsList]", [IsList],
function(list)
  return AutomFamily(list, false);
end);


###############################################################################
##
#M  AutomFamily(<list>, <bind_vars>)
##
InstallMethod(AutomFamily, "for [IsList, IsBool]", [IsList, IsBool],
function(list, bind_vars)
  if not AG_IsCorrectAutomatonList(list, false) then
    Error("in AutomFamily(IsList):\n",
          "  given list is not a correct list representing automaton\n");
  fi;

  return AutomFamily(list,
                     List([1..Length(list)],
                          i -> Concatenation(AG_Globals.state_symbol, String(i))),
                     bind_vars);
end);


###############################################################################
##
#M  AutomFamily(<list>, <names>)
##
InstallMethod(AutomFamily, [IsList, IsList],
function(list, names)
  if not AG_IsCorrectAutomatonList(list, false) then
    Error("in AutomFamily(IsList, IsList):\n",
          "  given list is not a correct list representing automaton\n");
  fi;

  return AutomFamily(list, names, AG_Globals.bind_vars_autom_family);
end);


###############################################################################
##
#M  DualAutomFamily(<fam>)
##
InstallMethod(DualAutomFamily, "for [IsAutomFamily]",
              [IsAutomFamily],
function(fam)
  local list, dual;
  list := [1..fam!.numstates];
  if fam!.trivstate <> 0 then
    Add(list, fam!.trivstate);
  fi;
  list := AG_MinimalSubAutomatonInlist(list, fam!.automatonlist)[1];
  if not AG_HasDualInList(list) then
    return 0;
  fi;
  dual := AutomFamily(AG_DualAutomatonList(list),
                      List([1..DegreeOfTree(fam)],
                           i -> Concatenation(AG_Globals.state_symbol_dual, String(i))));
  SetDualAutomFamily(dual, fam);
  return dual;
end);


###############################################################################
##
#M  One(<fam>)
##
InstallMethod(One, "for [IsAutomFamily]", [IsAutomFamily],
function(fam)
  return __AG_CreateAutom(fam, One(fam!.freegroup),
                         List([1..fam!.deg], i -> One(fam!.freegroup)),
                         (), true);
end);


###############################################################################
##
#M  GroupOfAutomFamily(<fam>)
##
InstallMethod(GroupOfAutomFamily, "for [IsAutomFamily]",
              [IsAutomFamily],
function(fam)
  local g;

  if not fam!.isgroup then
    return fail;
  fi;

  if fam!.numstates > 0 then
    g := GroupWithGenerators(fam!.automgens{[1..fam!.numstates]});
  else
    g := Group(One(fam));
  fi;

  SetUnderlyingAutomFamily(g, fam);
  SetIsGroupOfAutomFamily(g, true);
  # XXX
  SetGeneratingAutomatonList(g, fam!.automatonlist);
  SetAutomatonList(g, fam!.automatonlist);
  SetDegreeOfTree(g, fam!.deg);
  SetTopDegreeOfTree(g, fam!.deg);
  SetIsActingOnBinaryTree(g, fam!.deg = 2);
  SetIsAutomatonGroup(g, true);

  return g;
end);

###############################################################################
##
#M  SemigroupOfAutomFamily( <fam> )
##
InstallMethod(SemigroupOfAutomFamily, "for [IsAutomFamily]",
              [IsAutomFamily],
function(fam)
  local g;

  if fam!.trivstate <> 0 then
    if fam!.numstates = 0 then
      g := Group(One(fam!.automgens[fam!.trivstate]));
    else
      g := MonoidByGenerators(fam!.automgens{[1..fam!.numstates]});
    fi;
  else
    g := SemigroupByGenerators(fam!.automgens{[1..fam!.numstates]});
  fi;

  SetUnderlyingAutomFamily(g, fam);

  # XXX
  SetGeneratingAutomatonList(g, fam!.automatonlist);
  SetAutomatonList(g, fam!.automatonlist);

  SetDegreeOfTree(g, fam!.deg);
  SetTopDegreeOfTree(g, fam!.deg);
  SetIsActingOnBinaryTree(g, fam!.deg = 2);
  SetIsAutomatonSemigroup(g, true);

  return g;
end);


###############################################################################
##
#M  UnderlyingFreeMonoid( <G> )
##
InstallMethod(UnderlyingFreeMonoid, "for [IsAutomFamily]",
              [IsAutomFamily],
function(fam)
  local monoid;

  if fam!.numstates <> 0 then
    monoid := MonoidByGenerators(GeneratorsOfGroup(fam!.freegroup));
    SetSize(monoid, infinity);
  else
    monoid := MonoidByGenerators(fam!.freegens[1]);
    SetSize(monoid, 1);
  fi;

  return monoid;
end);

###############################################################################
##
#M  UnderlyingFreeGroup( <G> )
##
InstallMethod(UnderlyingFreeGroup, "for [IsAutomFamily]",
              [IsAutomFamily],
function(fam)
  return fam!.freegroup;
end);


###############################################################################
##
##  AG_AbelImagesGenerators(<fam>)
##
InstallMethod(AG_AbelImagesGenerators, "for [IsAutomFamily]",
              [IsAutomFamily],
function(fam)
  if not fam!.isgroup then
    Error("the group is not generated by an invertible automaton");
  fi;
  return AG_AbelImageAutomatonInList(fam!.automatonlist);
end);


###############################################################################
##
#M  DiagonalPowerOp(<fam>, <n>)
##
InstallMethod(DiagonalPowerOp, "for [IsAutomFamily, IsPosInt]",
              [IsAutomFamily, IsPosInt],
function(fam, n)
  local names, list, states, dlist;

  if not fam!.isgroup then
    Error("the group is not generated by an invertible automaton");
  fi;

  list := fam!.automatonlist;
  states := [1..fam!.numstates];
  names := fam!.names;
  if fam!.trivstate <> 0 then
    Add(states, fam!.trivstate);
    Add(names, AG_Globals!.identity_symbol);
  fi;
  dlist := AG_MinimalSubAutomatonInlist(states, list)[1];
  return AutomatonGroup(AG_DiagonalPowerInList(dlist, n, names)[1],
                    AG_DiagonalPowerInList(dlist, n, names)[2]);
end);


###############################################################################
##
#M  DiagonalPower(<obj>)
##
InstallOtherMethod(DiagonalPower, "for [IsObject]", [IsObject],
function(obj)
  return DiagonalPower(obj, 2);
end);


###############################################################################
##
#M  MultAutomAlphabet(<fam>, <n>)
##
InstallMethod(MultAutomAlphabetOp, "for [IsAutomFamily, IsPosInt]",
              [IsAutomFamily, IsPosInt],
function(fam, n)
  local list, states, dlist;
  list := fam!.automatonlist;
  states := [1..fam!.numstates];
  if fam!.trivstate <> 0 then Add(states, fam!.trivstate); fi;
  dlist := AG_MinimalSubAutomatonInlist(states, list)[1];
  return AutomatonGroup(AG_MultAlphabetInList(dlist, n));
end);


###############################################################################
##
#M  MultAutomAlphabet(<obj>)
##
InstallOtherMethod(MultAutomAlphabet, "for [IsObject]", [IsObject],
function(obj)
  return MultAutomAlphabet(obj, 2);
end);


#############################################################################
##
#M  GeneratorsOfOrderTwo(<fam>)
##
InstallMethod(GeneratorsOfOrderTwo, "for [IsAutomFamily]", [IsAutomFamily],
function(fam)
  if not fam!.isgroup then
    Error("the group is not generated by an invertible automaton");
  fi;
  return Filtered(GeneratorsOfGroup(GroupOfAutomFamily(fam)), g -> IsOne(g^2));
end);


#E
