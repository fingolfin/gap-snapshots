#############################################################################
##
#W  permdeco.gi                  GAP library                  Alexander Hulpke
##
##
#Y  Copyright (C) 2004 The GAP Group
##
##  This file contains functions that deal with action on chief factors or
##  composition factors and the representation of such groups in a nice way
##  as permutation groups.
##

InstallMethod( FittingFreeLiftSetup, "permutation", true, [ IsPermGroup ],0,
function( G )
local   pcgs,r,hom,A,iso;
  
  r:=RadicalGroup(G);
  hom:=NaturalHomomorphismByNormalSubgroup(G,r);
  
  pcgs := TryPcgsPermGroup( G,r, false, false, true );
  if not IsPcgs( pcgs )  then
    return fail;
  fi;
  if not HasPcgsElementaryAbelianSeries(r) then
    SetPcgsElementaryAbelianSeries(r,pcgs);
  fi;
  A := PermpcgsPcGroupPcgs( pcgs, IndicesEANormalSteps(pcgs), false );
  iso := GroupHomomorphismByImagesNC( G, A, pcgs, GeneratorsOfGroup( A ));
  SetIsBijective( iso, true );
  return rec(pcgs:=pcgs,
             depths:=IndicesEANormalSteps(pcgs),
	     radical:=r,
	     pcisom:=iso,
	     factorhom:=hom);

end );

InstallGlobalFunction(FittingFreeSubgroupSetup,function(G,U)
local cache,ffs,pcisom,rest,it,kpc,k,x,ker,r;
  ffs:=FittingFreeLiftSetup(G);

  # result cached?
  if not IsBound(U!.cachedFFS) then
    cache:=[];
    U!.cachedFFS:=cache;
  else
    cache:=U!.cachedFFS;
  fi;
  r:=First(cache,x->IsIdenticalObj(x[1],ffs));
  if r<>fail then
    return r[2];
  fi;

  pcisom:=ffs.pcisom;

  rest:=RestrictedMapping(ffs.factorhom,U);

  # in radical?
  if ForAll(MappingGeneratorsImages(rest)[2],IsOne) then
    ker:=U;
    k:=InducedPcgsByGeneratorsNC(ffs.pcgs,GeneratorsOfGroup(U));
  elif Length(ffs.pcgs)=0 then
    # no radical
    ker:=TrivialSubgroup(G);
    k:=ffs.pcgs;
  else

    it:=CoKernelGensIterator(InverseGeneralMapping(rest));
    kpc:=TrivialSubgroup(Image(pcisom));
    while not IsDoneIterator(it) do
      x:=ImagesRepresentative(pcisom,NextIterator(it));
      if not x in kpc then
	kpc:=ClosureGroup(kpc,x);
      fi;
    od;
    SetSize(U,Size(Image(rest))*Size(kpc));
    k:=InducedPcgs(FamilyPcgs(Image(pcisom)),kpc);
    k:=List(k,x->PreImagesRepresentative(pcisom,x));
    k:=InducedPcgsByPcSequenceNC(ffs.pcgs,k);
    ker:=SubgroupNC(G,k);
    SetSize(ker,Size(kpc));
  fi;

  SetPcgs(ker,k);
  SetKernelOfMultiplicativeGeneralMapping(rest,ker);
  if Length(ffs.pcgs)=0 then
    r:=[1];
  else
    r:=Concatenation(k!.depthsInParent,[Length(ffs.pcgs)+1]);
  fi;

  r:=rec(parentffs:=ffs,
            rest:=rest,
            ker:=ker,
	    pcgs:=k,
	    serdepths:=List(ffs.depths,y->First([1..Length(r)],x->r[x]>=y))
	    );
  Add(cache,[ffs,r]); # keep
  return r;

end);

InstallGlobalFunction(SubgroupByFittingFreeData,function(G,gens,imgs,ipcgs)
local ffs,hom,U,rest,ker,r;

  ffs:=FittingFreeLiftSetup(G);
  hom:=ffs.factorhom;

  U:=SubgroupNC(G,Concatenation(gens,ipcgs));

  gens:=Concatenation(gens,ipcgs);
  imgs:=Concatenation(imgs,List(ipcgs,x->One(Range(hom))));

  if IsPermGroup(U) and AssertionLevel()>0 then
    rest:=GroupHomomorphismByImages(U,Range(hom),gens,imgs);
  else
    RUN_IN_GGMBI:=true; # hack to skip Nice treatment
    rest:=GroupHomomorphismByImagesNC(U,Range(hom),gens,imgs);
    RUN_IN_GGMBI:=false;
  fi;
  if rest=fail then Error("can't build homomorphism"); fi;

  if HasRecogDecompinfoHomomorphism(hom) then
    SetRecogDecompinfoHomomorphism(rest,RecogDecompinfoHomomorphism(hom));
  fi;

  ker:=SubgroupNC(G,ipcgs);
  SetPcgs(ker,ipcgs);
  if Length(ipcgs)=0 then
    SetSize(ker,1);
  else
    SetSize(ker,Product(RelativeOrders(ipcgs)));
  fi;
  SetKernelOfMultiplicativeGeneralMapping(rest,ker);

  SetSize(U,Size(Group(imgs,One(Image(ffs.factorhom))))*Size(ker));

  if Length(ipcgs)=0 then
    r:=[Length(ffs.pcgs)+1];
  elif IsBound(ipcgs!.depthsInParent) then
    r:=Concatenation(ipcgs!.depthsInParent,[Length(ffs.pcgs)+1]);
  else
    r:=Concatenation(List(ipcgs,x->DepthOfPcElement(ffs.pcgs,x)),
      [Length(ffs.pcgs)+1]);
  fi;
  r:=rec(parentffs:=ffs,
            rest:=rest,
            ker:=ker,
	    pcgs:=ipcgs,
	    serdepths:=List(ffs.depths,y->First([1..Length(r)],x->r[x]>=y))
	    );

  U!.cachedFFS:=[[ffs,r]];
  return U;

end);


#testfunction for AutomorphismRepresentingGroup
#test:=function(start)
#local it,g,a,r;
#  it:=SimpleGroupsIterator(start:NOPSL2);
#  repeat
#    g:=NextIterator(it);
#    Print("@ Trying ",g," ",Size(g),"\n");
#    a:=AutomorphismGroup(g);
#    r:=AutomorphismRepresentingGroup(g,GeneratorsOfGroup(a));
#    Print("@ Got ",NrMovedPoints(r[1])," from ",NrMovedPoints(g),"\n");
#  until false;
#end;
InstallGlobalFunction(AutomorphismRepresentingGroup,function(G,autos)
local G0,a0,tryrep,sel,selin,a,s,dom,iso,stabs,outs,map,i,j,p,found,seln,
  sub,d;

  tryrep:=function(rep)
  local Gi,repi,maps,v,w;
     Gi:=Image(rep,G);
     Info(InfoGroup,2,"Trying degree ",NrMovedPoints(Gi));
     repi:=InverseGeneralMapping(rep);
     maps:=List(sel,x->repi*autos[x]*rep);
     for v in maps do
       SetIsBijective(v,true);
     od;
     if ForAll(maps,IsConjugatorAutomorphism) then
	# the representation extends
	v:=List( maps, ConjugatorOfConjugatorIsomorphism );
	w:=ClosureGroup(Gi,v);
	Info(InfoGroup,1,"all conjugator degree ",NrMovedPoints(w));
	if Size(Centralizer(w,Gi))=1 then
	  maps:=[];
	  maps{sel}:=v;
	  maps{selin}:=List(selin,x->
	    Image(rep,
	      ConjugatorOfConjugatorIsomorphism(autos[x])));
	  return [w,rep,maps];
	else
	  Info(InfoGroup,2,"but centre");
	fi;
     else
       Info(InfoGroup,2,"Does not work");
     fi;
     return fail;
  end;

  selin:=Filtered([1..Length(autos)],x->IsInnerAutomorphism(autos[x]));
  sel:=Difference([1..Length(autos)],selin);

  # first try given rep
  if not IsSubset(MovedPoints(G),[1..LargestMovedPoint(G)]) then
    a:=tryrep(ActionHomomorphism(G,MovedPoints(G),"surjective"));
  else
    a:=tryrep(IdentityMapping(G));
  fi;
  if a<>fail then return a;fi;

  # then (assuming G simple) try transitive action of small degree
  dom:=Set(Orbit(G,LargestMovedPoint(G)));
  s:=Blocks(G,dom);
  if Length(s)=1 then
    if Set(dom)=[1..Length(dom)] then
      Info(InfoGroup,2,"reduction is equal to G");
      iso:=fail;
    else
      Info(InfoHomClass,2,"point action");
      iso:=ActionHomomorphism(G,dom,"surjective");
    fi;
  else
    Info(InfoHomClass,2,"block refinement");
    iso:=ActionHomomorphism(G,s,OnSets,"surjective");
  fi;

  if iso<>fail then
    # try the new rep
    a:=tryrep(iso);
    if a<>fail then return a;fi;

    # otherwise go to new small deg rep
    G:=Image(iso,G);
    autos:=List(autos,x->InverseGeneralMapping(iso)*x*iso);
  fi;

  # test the automorphisms that are not conjugator
  seln:=Filtered(sel,x->not IsConjugatorAutomorphism(autos[x]));

  # autos{seln} generates the non-perm automorphism group. Enumerate
  # use that automorphism is conjugator is stabilizer is conjugate
  stabs:=[Stabilizer(G,1)];
  outs:=[IdentityMapping(G)];
  i:=1;
  while i<=Length(stabs) do
    for j in seln do
      map:=outs[i]*autos[j];
      sub:=Image(autos[j],stabs[i]);
      p:=0;
      found:=fail;
      while found=fail and p<Length(stabs) do
	p:=p+1;
	found:=RepresentativeAction(G,sub,stabs[p]);
      od;

      if found=fail then
	# new copy
	Add(stabs,sub);
	Add(outs,map);
      fi;

    od;
    i:=i+1;
  od;
  Info(InfoGroup,1,"Build ",Length(outs)," copies");
  if Length(stabs)=1 then Error("why only one -- should have found before");fi;

  d:=DirectProduct(List(stabs,x->G));
  p:=[];
  for i in GeneratorsOfGroup(G) do
    a:=One(d);
    for j in [1..Length(stabs)] do
      a:=a*Image(Embedding(d,j),Image(outs[j],i));
    od;
    Add(p,a);
  od;

  a:=Subgroup(d,p);
  SetSize(a,Size(G));
  p:=GroupHomomorphismByImagesNC(G,a,GeneratorsOfGroup(G),p);

  a:=tryrep(p);
  if a<>fail then 
    if iso<>fail then
      a[2]:=iso*a[2];
    fi;
    return a;
  fi;

  Info(InfoGroup,1,"Wreath embedding failed");
  Error("This should never happen");

end);

InstallGlobalFunction(EmbedAutomorphisms,function(arg)
local G,H,tg,th,hom, tga, Gemb, C, outs, auts, ar, Hemb;

  G:=arg[1];
  H:=arg[2];
  tg:=arg[3];
  th:=arg[4];
  if Length(arg)>4 then
    outs:=arg[4];
  else
    outs:=fail;
  fi;
  if th=tg then
    hom:=IdentityMapping(tg);
  else
    hom:=IsomorphismGroups(th,tg);
  fi;
  if hom=fail then
    Error("nonisomorphic simple groups!");
  fi;
  tga:=List(GeneratorsOfGroup(H),
	    i->GroupHomomorphismByImagesNC(tg,tg,
	       GeneratorsOfGroup(tg),
	       List(GeneratorsOfGroup(tg),
		    j->Image(hom,PreImagesRepresentative(hom,j)^i))));

  Gemb:=fail;
  if ForAll(tga,IsConjugatorAutomorphism) then
    Info(InfoHomClass,4,"All automorphism are conjugator");
    C:=ClosureGroup(G,List(tga,ConjugatorInnerAutomorphism));
    #reco:=ConstructiveRecognitionAlmostSimpleGroupTom(tg);
    if outs=fail then
      outs:=Size(AutomorphismGroup(tg))/Size(tg);
    fi;
    if Size(C)/Size(tg)=outs then
      Info(InfoHomClass,2,"Automorphisms realize full automorphism group");
      Gemb:=IdentityMapping(G);
      G:=C;
      tga:=List(tga,ConjugatorInnerAutomorphism);
    fi;
  fi;

  if Gemb=fail then
    # not all realizable or too small -> build new group
    Info(InfoHomClass,2,"Compute full automorphism group");
    auts:=AutomorphismGroup(tg);
    auts:=GeneratorsOfGroup(auts);
    ar:=AutomorphismRepresentingGroup(tg,Concatenation(
	   auts,
	   List(GeneratorsOfGroup(G),i->ConjugatorAutomorphism(tg,i)),
	   tga));

    tga:=ar[3]{[Length(ar[3])-Length(tga)+1..Length(ar[3])]};
    Gemb:=GroupHomomorphismByImagesNC(G,ar[1],GeneratorsOfGroup(G),
	  ar[3]{[Length(auts)+1..Length(auts)+Length(GeneratorsOfGroup(G))]});
    G:=ar[1];
  else
    Gemb:=IdentityMapping(G);
  fi;
  Hemb:=GroupHomomorphismByImagesNC(H,Group(tga),GeneratorsOfGroup(H),tga);
  return [G,Gemb,Hemb];
end);

InstallGlobalFunction(WreathActionChiefFactor,
function(G,M,N)
local cs,i,k,u,o,norm,T,Thom,autos,ng,a,Qhom,Q,E,Ehom,genimages,
      n,w,embs,reps,act,img,gimg;
  # get the simple factor(s)
  cs:=CompositionSeries(M);
  # the cs with N gives a cs for M/N.
  # take the first subnormal subgroup that is not  in N. This will be the
  # subgroup
  i:=Length(cs);
  u:=fail;
  while u=fail and i>0 do
    if not IsSubset(N,cs[i]) then
      u:=ClosureGroup(N,cs[i]);
    fi;
    i:=i-1;
  od;
  o:=OrbitStabilizer(G,u);
  norm:=o.stabilizer;
  o:=o.orbit;
  n:=Length(o);
  Info(InfoHomClass,1,"Factor: ",Index(u,N),"^",n);
  Qhom:=ActionHomomorphism(G,o,"surjective");
  Q:=Image(Qhom,G);
  Thom:=NaturalHomomorphismByNormalSubgroup(u,N);
  T:=Image(Thom);
  # get the induced automorphism action
  ng:=SmallGeneratingSet(norm); 
  autos:=List(ng,i->GroupHomomorphismByImagesNC(T,T,
	              GeneratorsOfGroup(T),
		      List(GeneratorsOfGroup(T),
		        j->Image(Thom,PreImagesRepresentative(Thom,j)^i))));
  a:=AutomorphismRepresentingGroup(T,autos);
  Thom:=GroupHomomorphismByImagesNC(norm,a[1],ng,a[3]);
  a:=a[1];

  # now embed into wreath
  w:=WreathProduct(a,Q);
  embs:=List([1..n+1],i->Embedding(w,i));

  # define isomorphisms between the components
  reps:=List([1..n],i->
	  PreImagesRepresentative(Qhom,RepresentativeAction(Q,1,i)));

  genimages:=[];
  for i in GeneratorsOfGroup(G) do
    img:=Image(Qhom,i);
    gimg:=Image(embs[n+1],img);
    for k in [1..n] do
      # look at part of i's action on the k-th factor.
      # we get this by looking at the action of
      #   reps[k] *   i    *   reps[k^img]^-1
      # 1   ->    k  ->  k^img    ->           1
      # on the first component. 
      act:=reps[k]*i*(reps[k^img]^-1);
      # this must be multiplied *before* permuting
      gimg:=ImageElm(embs[k],ImageElm(Thom,act))*gimg;
    od;
    #gimg:=RestrictedPermNC(gimg,MovedPoints(w)); 
    Add(genimages,gimg);
  od;

  E:=Subgroup(w,genimages);
  if AssertionLevel()>0 then
    Ehom:=GroupHomomorphismByImages(G,E,GeneratorsOfGroup(G),genimages);
    Assert(1,fail<>Ehom);
  else
    Ehom:=GroupHomomorphismByImagesNC(G,E,GeneratorsOfGroup(G),genimages);
  fi;

  return [w,Ehom,a,Image(Thom,u),n];
end);

#############################################################################
##
#F  PermliftSeries( <G> )
##
InstallGlobalFunction(PermliftSeries,function(G)
local limit, r, pcgs, ser, ind, m, p, l, l2, good, i, j,nser,hom;

  # Do we limit factor size?
  limit:=ValueOption("limit");

  if HasStoredPermliftSeries(G) then
    ser:=StoredPermliftSeries(G);
    if limit=fail or ForAll([2..Length(ser[1])],
      i->Size(ser[1][i-1])/Size(ser[1][i])<=limit) then
      return ser;
    fi;
  fi;

  # it seems to be cleaner (and avoids deferring abelian factors) if we
  # factor out the radical first. (Note: The radical method for perm groups
  # stores the nat hom.!)
  r:=RadicalGroup(G);

  if Size(r)=1 then
    return [[r],false];
  fi;

  # try to improve the representation of G/r
  hom:=NaturalHomomorphismByNormalSubgroup(G,r);
  if IsPermGroup(Range(hom)) then
    hom:=hom*SmallerDegreePermutationRepresentation(Range(hom));
  fi;
  AddNaturalHomomorphismsPool(G,r,hom);

  # first try whether the pcgs found
  # is good enough
  pcgs:=PcgsElementaryAbelianSeries(r);
  ser:=EANormalSeriesByPcgs(pcgs);
  if not ForAll(ser,i->IsNormal(G,i)) then
    # we have to get a better series

    # do we want to reduce the degree?
    m:=fail;
    if IsPermGroup(r) then
      m:=ReducedPermdegree(r);
    fi;
    if m<>fail then
      p:=Image(m);
      ser:=InvariantElementaryAbelianSeries(p, List( GeneratorsOfGroup( G ),
	      i -> GroupHomomorphismByImagesNC(p,p,GeneratorsOfGroup(p),
	             List(GeneratorsOfGroup(p),
		          j->Image(m,PreImagesRepresentative(m,j)^i)))),
	      TrivialSubgroup(p),true);
      ser:=List(ser,i->PreImage(m,i));
    else
      ser:=InvariantElementaryAbelianSeries(r, List( GeneratorsOfGroup( G ),
	      i -> ConjugatorAutomorphismNC( r, i ) ),
	      TrivialSubgroup(G),true);
    fi;

    # remember there is no universal parent pcgs
    pcgs:=false;
    ind:=false;
  else
    ind:=IndicesEANormalSteps(pcgs);
    pcgs:=List([1..Length(ind)],
      i->InducedPcgsByPcSequenceNC(pcgs,pcgs{[ind[i]..Length(pcgs)]}));
  fi;

  if limit<>fail then
    nser:=[ser[1]];
    for i in [2..Length(ser)] do
      if Size(ser[i-1])/Size(ser[i])>limit then
	m:=ModuloPcgs(ser[i-1],ser[i]);
	p:=RelativeOrders(m)[1];
	l:=GModuleByMats(LinearActionLayer(G,m),GF(p));
	l:=MTX.BasesCompositionSeries(l);
	l2:=[[]];
	good:=false;
	for j in [1..Length(l)] do
	  if p^(Length(l[j])-Length(l2[Length(l2)]))>limit then
	    if Length(good)>0 then
	      Add(l2,good);
	    fi;
	  fi;
	  good:=l[j];
	od;
	l2:=List(l2,i->List(i,j->PcElementByExponentsNC(m,j)));
	l2:=List(l2,j->ClosureGroup(ser[i],j));
	pcgs:=false; # if there was a pcgs is it wrong now
	Append(nser,Reversed(l2));
      else
	Add(nser,ser[i]);
      fi;
    od;
    if nser<>ser then
      ser:=nser;
    fi;
  fi;

  ser:=[ser,pcgs];
  if not HasStoredPermliftSeries(G) then
    SetStoredPermliftSeries(G,ser);
  fi;
  return ser;
end);

InstallMethod(StoredPermliftSeries,true,[IsGroup],0,PermliftSeries);

InstallGlobalFunction(EmbeddingWreathInWreath,function(wnew,w,emb,start)
local info, a, ai, n, gens, imgs, e, e2, shift, hom, i, j;
  info:=WreathProductInfo(w);
  a:=GeneratorsOfGroup(info.groups[1]);
  ai:=List(a,i->Image(emb,i));
  n:=Length(info.components);
  gens:=[];
  imgs:=[];
  # base
  for i in [1..n] do
    e:=Embedding(w,i);
    e2:=Embedding(wnew,i+start-1);
    for j in [1..Length(a)] do
      Add(gens,Image(e,a[j]));
      Add(imgs,Image(e2,ai[j]));
    od;
  od;
  # complement embeddings
  e:=Embedding(w,n+1);
  e2:=Embedding(wnew,Length(WreathProductInfo(wnew).components)+1);
  shift:=MappingPermListList([1..n],[start..start+n-1]);
  for j in GeneratorsOfGroup(info.groups[2]) do
    Add(gens,Image(e,j)); # component permutation in w
    Add(imgs,Image(e2,j^shift));
  od;
  hom:=GroupHomomorphismByImages(w,wnew,gens,imgs);
  return hom;
end);

InstallGlobalFunction(EmbedFullAutomorphismWreath,function(w,a,t,n)
local au, agens, agau, a2, w2, ogens, ngens, oe, ne, emb, i, j;
  IsNaturalAlternatingGroup(t);
  au:=AutomorphismGroup(t);
  agens:=GeneratorsOfGroup(a);
  agau:=List(agens,i->ConjugatorAutomorphism(t,i));
  a2:=AutomorphismRepresentingGroup(t,
       # this way we get the images easily
       Concatenation(agau,GeneratorsOfGroup(au)));
  agau:=a2[3]{[1..Length(agau)]};
  if Index(a,t)=1 then
    agau:=a2[2];
  else
    agau:=GroupHomomorphismByImagesNC(a,a2[1],agens,agau);
  fi;
  w2:=WreathProduct(a2[1],Image(Projection(w)));
  ogens:=[];
  ngens:=[];
  # for all w-generators take the corresponding w2 generators
  for i in [1..n+1] do
    oe:=Embedding(w,i);
    ne:=Embedding(w2,i);
    for j in GeneratorsOfGroup(Source(oe)) do
      Add(ogens,Image(oe,j));
      if i<=n then
	Add(ngens,Image(ne,Image(agau,j)));
      else
	Add(ngens,Image(ne,j));
      fi;
    od;
  od;
  emb:=GroupHomomorphismByImagesNC(w,w2,ogens,ngens);
  return [emb,w2,a2[1],Image(a2[2])];
end);

#############################################################################
##
#E  permdeco.gi . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
