#############################################################################
##
##                             orb package
##  transform.gi
##                                                        by Juergen Mueller
##                                                       and Max Neunhoeffer
##                                                          and Felix Noeske
##
##  Copyright 2005-2010 by the authors.
##  This file is free software, see license information at the end.
##
##  Optimisations for transformations.
##
#############################################################################


if not(IsBound(ImageAndKernelOfTransformation_C)) then
  InstallGlobalFunction( ImageAndKernelOfTransformation,
    function( t )
      local buf,comps,i,image,j,kernel,l,ll,n;
      if IsTransformation(t) then l := t![1]; else l := t; fi;
      n := Length(l);
      buf := 0*[1..n];   # 0 if image does not occur, otherwise equal to first
                         # preimage x, the list is collected in kernel[x]
      kernel := EmptyPlist(n);
      comps := 0;
      for i in [1..Length(l)] do
          j := l[i];
          if buf[j] = 0 then
              comps := comps + 1;
              kernel[i] := [i];
              buf[j] := i;
          else
              Add(kernel[buf[j]],i);
          fi;
      od;
      image := EmptyPlist(comps);
      for j in [1..n] do
          i := buf[j];
          if i > 0 then
              image[Length(image)+1] := j;
          fi;
      od;
      ll := [image,Compacted(kernel)];
      MakeImmutable(ll);
      return ll;
    end );
else
    InstallGlobalFunction( ImageAndKernelOfTransformation,
                           ImageAndKernelOfTransformation_C );
fi;

InstallMethod( ImageSetOfTransformation, "for a transformation",
  [ IsTransformation and IsTransformationRep ], 1,    # to beat the library one
  function( t )
    local tmp;
    if IsBound(t![2]) then return t![2]; fi;
    tmp := ImageAndKernelOfTransformation(t);
    t![2] := tmp[1];
    t![3] := tmp[2];
    return tmp[1];
  end );

InstallMethod( KernelOfTransformation, "for a transformation",
  [ IsTransformation and IsTransformationRep ], 1,    # to beat the library one
  function( t )
    local tmp;
    if IsBound(t![3]) then return t![3]; fi;
    tmp := ImageAndKernelOfTransformation(t);
    t![2] := tmp[1];
    t![3] := tmp[2];
    return tmp[2];
  end );


## The version below is worse, the above one has better complexity.
##  ImageAndKernelOfTransformation2 :=
##    function( t )
##      local buf,comps,i,image,j,kernel,l,ll,n;
##      l := t![1];
##      n := Length(l);
##      buf := 0*[1..n];
##      comps := 0;
##      for i in l do
##          if buf[i] = 0 then
##              comps := comps + 1;
##          fi;
##          buf[i] := buf[i] + 1;
##      od;
##      kernel := EmptyPlist(comps);
##      image := EmptyPlist(comps);
##      j := 1;
##      for i in [1..n] do
##          if buf[i] > 0 then
##              image[j] := i;
##              kernel[j] := EmptyPlist(buf[i]);
##              buf[i] := j;
##              j := j + 1;
##          fi;
##      od;
##      for i in [1..n] do
##          ll := kernel[buf[l[i]]];
##          ll[Length(ll)+1] := i;
##      od;
##      Sort(kernel);
##      ll := [image,kernel];
##      MakeImmutable(ll);
##      return ll;
##    end;

if not(IsBound(PermLeftQuoTransformationNC_C)) then
    InstallMethod( PermLeftQuoTransformationNC, "GAP version",
      [IsTransformation and IsTransformationRep,
       IsTransformation and IsTransformationRep],
    function ( t1, t2 )
      local  pl, i, deg;
      deg := DegreeOfTransformation( t1 );
      pl := [ 1 .. deg ];
      for i  in [ 1 .. deg ]  do
          pl[i ^ t1] := i ^ t2;
      od;
      return PermList( pl );
    end );
else
    InstallMethod( PermLeftQuoTransformationNC, "C version",
      [IsTransformation and IsTransformationRep,
       IsTransformation and IsTransformationRep],
      PermLeftQuoTransformationNC_C );
fi;
if not(IsBound(PermLeftQuoTransformationNC_C)) then
    InstallOtherMethod( PermLeftQuoTransformationNC, "GAP version",
      [IsList,IsList],
    function ( t1, t2 )
      local  pl, i, deg;
      deg := Length(t1);
      pl := [ 1 .. deg ];
      for i  in [ 1 .. deg ]  do
          pl[t1[i]] := t2[i];
      od;
      return PermList( pl );
    end );
else
    InstallOtherMethod( PermLeftQuoTransformationNC, "C version",
      [IsList,IsList],
      PermLeftQuoTransformationNC_C );
fi;

# Install our C function if we are compiled:
if IsBound( MappingPermListList_C ) then
    MakeReadWriteGVar("MappingPermListList");
    MappingPermListList := MappingPermListList_C;
    MakeReadOnlyGVar("MappingPermListList");
fi;

if IsBound( MappingPermSetSet_C ) then
    InstallGlobalFunction( MappingPermSetSet, MappingPermSetSet_C );
else
    InstallGlobalFunction( MappingPermSetSet,
      function(src, dst)
        local l, d, out, i, j, next, k;
        l:=Length(src);
        if l <> Length(dst) then
            Error("both arguments must be lists of the same length");
            return;
        fi;
        d:=Maximum(src[l], dst[l]);
        out:=EmptyPlist(d);

        i:=1;
        j:=1;
        next:=1;   # the next candidate, possibly prevented from being in dst

        for k in [1..d] do
          if i<=l and k=src[i] then
            out[k]:=dst[i];
            i:=i+1;
          else
            # Skip things in dst:
            while j<=l and next>=dst[j] do
              if next = dst[j] then next:=next+1; fi;
              j:=j+1;
            od;
            out[k]:=next;
            next:=next+1;
          fi;
        od;

        return PermList(out);
      end ); 
fi;

if IsBound(CANONICAL_TRANS_SAME_KERNEL) then
  InstallGlobalFunction( "CanonicalTransSameKernel",
                         CANONICAL_TRANS_SAME_KERNEL );
else
    InstallGlobalFunction( "CanonicalTransSameKernel", 
      function( t )
        local i,l,n,next,res,tab;
        if IsTransformation(t) then
            l := t![1];
        else
            l := t;
        fi;
        n := Length(l);
        tab := 0*[1..n];
        res := EmptyPlist(n);
        next := 1;
        for i in [1..n] do
            if tab[l[i]] <> 0 then
                res[i] := tab[l[i]];
            else
                tab[l[i]] := next;
                res[i] := next;
                next := next + 1;
            fi;
        od;
        return res;
      end );
fi;

if IsBound(IS_INJECTIVE_TRANS_ON_LIST) then
  InstallGlobalFunction( "IsInjectiveTransOnList",
                         IS_INJECTIVE_TRANS_ON_LIST );
else
    InstallGlobalFunction( "IsInjectiveTransOnList",
      function( t, l )
        local i,li,n,tab;
        if IsTransformation(t) then li := t![1]; else li := t; fi;
        n := Length(l);
        tab := EmptyPlist(n);
        for i in l do
            if IsBound(tab[li[i]]) then
                return false;
            else
                tab[li[i]] := 1;
            fi;
        od;
        return true;
      end );
fi;

##
##  This program is free software: you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation, either version 3 of the License, or
##  (at your option) any later version.
##
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU General Public License for more details.
##
##  You should have received a copy of the GNU General Public License
##  along with this program.  If not, see <http://www.gnu.org/licenses/>.
##
