#############################################################################
##
#W  ghom.gi                  GAP library                        Thomas Breuer
#W                                                           Alexander Hulpke
#W                                                             Heiko Thei"sen
##
#H  @(#)$Id: ghom.gi,v 4.108 2003/08/23 18:59:19 gap Exp $
##
#Y  Copyright (C)  1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St.  Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  1. Functions for creating group general mappings by images
##  2. Functions for creating natural homomorphisms
##  3. Functions for conjugation action
##  4. Functions for ...
##
Revision.ghom_gi :=
    "@(#)$Id: ghom.gi,v 4.108 2003/08/23 18:59:19 gap Exp $";


#############################################################################
##
#F  GroupHomomorphismByImages( <G>, <H>, <Ggens>, <Hgens> )
##
InstallGlobalFunction( GroupHomomorphismByImages,
    function( G, H, Ggens, Hgens )
    local hom;
    if Length(Ggens)>0 then
      if not (IsDenseList(Ggens) and IsHomogeneousList(Ggens) and
	FamilyObj(Ggens)=FamilyObj(G)) then
        Error("The generators do not all belong to the source");
      fi;
    fi;
    if Length(Hgens)>0 then
      if not (IsDenseList(Hgens) and IsHomogeneousList(Hgens) and
	FamilyObj(Hgens)=FamilyObj(H)) then
        Error("The images do not all belong to the range");
      fi;
    fi;
    hom:= GroupGeneralMappingByImages( G, H, Ggens, Hgens );
    if IsMapping( hom ) and IsTotal( hom ) then
      return GroupHomomorphismByImagesNC( G, H, Ggens, Hgens );
    else
      return fail;
    fi;
end );


#############################################################################
##
#M  RestrictedMapping(<hom>,<U>)
##
InstallMethod(RestrictedMapping,"create new GHBI",
  CollFamSourceEqFamElms,[IsGroupHomomorphism,IsGroup],0,
function(hom,U)
local rest,gens,imgs,imgp;

  if ForAll(GeneratorsOfGroup(Source(hom)),i->i in U) then
    return hom;   
  fi;

  gens:=GeneratorsOfGroup(U);
  imgs:=List(gens,i->ImageElm(hom,i));

  if HasImagesSource(hom) then
    imgp:=ImagesSource(hom);
  else
    imgp:=Subgroup(Range(hom),imgs);
  fi;
  rest:=GroupHomomorphismByImagesNC(U,imgp,gens,imgs);
  if HasIsInjective(hom) and IsInjective(hom) then
    SetIsInjective(rest,true);
  fi;
  if HasIsTotal(hom) and IsTotal(hom) then
    SetIsTotal(rest,true);
  fi;

  return rest;
end);


#############################################################################
##
#M  <a> = <b> . . . . . . . . . . . . . . . . . . . . . . . . . .  via images
##
InstallMethod( \=, "compare source generator images", IsIdenticalObj,
    [ IsGroupGeneralMapping, IsGroupGeneralMapping ], 0,
    function( a, b )
    local i;

    # try to fall back on homomorphism routines
    if IsSingleValued(a) and IsSingleValued(b) then
      # As both are single valued (and the appropriate flags are now set)
      # we will automatically fall in the routines for homomorphisms.
      # So this is not an infinite recursion.
#T is this really safe?
      a:=MappingGeneratorsImages(a);
      return a[2]=List(a[1],i->ImagesRepresentative(b,i));
    fi;

    # now do the hard test
    if Source(a)<>Source(b) 
       or Range(a)<>Range(b)
       or PreImagesRange(a)<>PreImagesRange(b)
       or ImagesSource(a)<>ImagesSource(b) then
      return false;
    fi;
    for i in PreImagesRange(a) do
      if Set(Images(a,i))<>Set(Images(b,i)) then
        return false;
      fi;
    od;
    return true;
    end );


#############################################################################
##
#M  CompositionMapping2( <hom1>, <hom2> ) . . . . . . . . . . . .  via images
##
##  The composition of two group general mappings can be computed as
##  a group general mapping by images, *provided* that
##  - elements of the source of the first map can be cheaply decomposed 
##    in terms of the generators
##    (This is needed for computing images with a
##    group general mapping by images.)
##    and
##  - we are *not* in the situation of the composition of a general mapping
##    with a nice monomorphism.
##    (Here it will usually be better to store the explicit composition
##    of two mappings, think of an isomorphism from a matrix group to a
##    permutation group, where both the action homomorphism and the
##    isomorphism of two permutation groups can compute (pre)images
##    efficiently, contrary to the composition when this is written as
##    homomorphism by images.)
##
##  (If both general mappings know that they are in fact homomorphisms
##  then also the result will be constructed as a homomorphism.)
##
InstallMethod( CompositionMapping2,
    "for gp. hom. and gp. gen. mapp., using `MappingGeneratorsImages'",
    FamSource1EqFamRange2,
    [ IsGroupHomomorphism, IsGroupGeneralMapping ], 0,
function( hom1, hom2 )
local mapi;
  if (not KnowsHowToDecompose(Source(hom2))) or IsNiceMonomorphism(hom2) then
    TryNextMethod();
  fi;
  if not IsSubset(Source(hom1),ImagesSource(hom2)) then
    TryNextMethod();
  fi;
  mapi:=MappingGeneratorsImages(hom2);
  return GroupGeneralMappingByImages( Source( hom2 ), Range( hom1 ),
	    mapi[1], List( mapi[2], img ->
	    ImagesRepresentative( hom1, img ) ) );
end);


# thanks to `MappingGeneratorImages' this code is now obsolete.
# #############################################################################
# ##
# #M  InverseGeneralMapping( <hom> )  . . . . . . . . . . . . . . .  via images
# ##
# InstallMethod( InverseGeneralMapping,
#     "for PBG-Hom",
#     true,
#     [ IsPreimagesByAsGroupGeneralMappingByImages ], 0,
# function(hom)
#   return InverseGeneralMapping( AsGroupGeneralMappingByImages( hom ) );
# end );

InstallOtherMethod( SetInverseGeneralMapping,"transfer the AsGHBI", true,
     [ IsGroupGeneralMappingByAsGroupGeneralMappingByImages and
       HasAsGroupGeneralMappingByImages,
       IsGeneralMapping ], 0,
function( hom, inv )
   SetInverseGeneralMapping( AsGroupGeneralMappingByImages( hom ), inv );
   TryNextMethod();
end );


#############################################################################
##
#M  ImagesRepresentative( <hom>, <elm> )  . . . . . . . . . . . .  via images
##
InstallMethod( ImagesRepresentative, "for `ByAsGroupGeneralMapping' hom",
    FamSourceEqFamElm,
    [ IsGroupGeneralMappingByAsGroupGeneralMappingByImages,
      IsMultiplicativeElementWithInverse ], 0,
function( hom, elm )
  return ImagesRepresentative( AsGroupGeneralMappingByImages( hom ), elm );
end );


#############################################################################
##
#M  PreImagesRepresentative( <hom>, <elm> ) . . . . . . . . . . .  via images
##
InstallMethod( PreImagesRepresentative, "for PBG-Hom", FamRangeEqFamElm,
  [ IsPreimagesByAsGroupGeneralMappingByImages,
    IsMultiplicativeElementWithInverse ], 0,
function( hom, elm )
  if HasIsHandledByNiceMonomorphism(Source(hom)) then
    # if we use the `AsGGMBI' directly, it will be a composite through a big
    # group
    return ImagesRepresentative( InverseGeneralMapping( hom ), elm );
  else
    return PreImagesRepresentative( AsGroupGeneralMappingByImages( hom ), elm );
  fi;
end );

InstallAttributeMethodByGroupGeneralMappingByImages
  ( CoKernelOfMultiplicativeGeneralMapping, IsGroup );
InstallAttributeMethodByGroupGeneralMappingByImages
  ( KernelOfMultiplicativeGeneralMapping, IsGroup );
InstallAttributeMethodByGroupGeneralMappingByImages( PreImagesRange, IsGroup );
InstallAttributeMethodByGroupGeneralMappingByImages( ImagesSource, IsGroup );
InstallAttributeMethodByGroupGeneralMappingByImages( IsSingleValued, IsBool );
InstallAttributeMethodByGroupGeneralMappingByImages( IsInjective, IsBool );
InstallAttributeMethodByGroupGeneralMappingByImages( IsTotal, IsBool );
InstallAttributeMethodByGroupGeneralMappingByImages( IsSurjective, IsBool );


#############################################################################
##
#M  GroupGeneralMappingByImages( <G>, <H>, <gens>, <imgs> ) . . . . make GHBI
##
InstallMethod( GroupGeneralMappingByImages, "for group, group, list, list",
    true, [ IsGroup, IsGroup, IsList, IsList ], 0,
function( G, H, gens, imgs )
local   filter,  hom,pcgs,imgso,mapi;
  
  hom := rec();
  # generators := Immutable( gens ),
  # genimages  := Immutable( imgs ) );
  if Length(gens)<>Length(imgs) then
    Error("<gens> and <imgs> must be lists of same length");
  fi;

  mapi:=[Immutable(gens),Immutable(imgs)];
  filter := IsGroupGeneralMappingByImages and HasSource and HasRange 
            and HasMappingGeneratorsImages;

  if IsPermGroup( G )  then
      filter := filter and IsPermGroupGeneralMappingByImages;
  fi;
  if IsPermGroup( H )  then
      filter := filter and IsToPermGroupGeneralMappingByImages;
  fi;

  pcgs:=false; # default: no pc groups code
  if IsPcGroup( G ) and IsPrimeOrdersPcgs(Pcgs(G))  then
    filter := filter and IsPcGroupGeneralMappingByImages;
    pcgs  := CanonicalPcgsByGeneratorsWithImages( Pcgs(G), gens, imgs );
    if pcgs[1]=Pcgs(G) then
      filter:=filter and IsTotal;
    fi;
  elif IsPcgs( gens )  then
    filter := filter and IsGroupGeneralMappingByPcgs;
    pcgs:=[gens,imgs];
  fi;

  if pcgs<>false then
    hom.sourcePcgs       := pcgs[1];
    hom.sourcePcgsImages := pcgs[2];
  fi;

  if IsPcGroup( H )  then
    filter := filter and IsToPcGroupGeneralMappingByImages;
  fi;

  # Do we map a free group or an fp group by its standard generators?
  # (So we can used MappedWord for mapping)?
  if IsSubgroupFpGroup(G) then
    if HasIsWholeFamily(G) and IsWholeFamily(G) 
      and List(gens,UnderlyingElement)
          =List(GeneratorsOfGroup(G),UnderlyingElement) then
      filter := filter and IsFromFpGroupStdGensGeneralMappingByImages;
    else
      filter := filter and IsFromFpGroupGeneralMappingByImages;
    fi;
  fi;
  if IsSubgroupFpGroup(H) then
      filter := filter and IsToFpGroupGeneralMappingByImages;
  fi;

  if pcgs=false then
    ObjectifyWithAttributes( hom,
    NewType( GeneralMappingsFamily
    ( ElementsFamily( FamilyObj( G ) ),
      ElementsFamily( FamilyObj( H ) ) ), filter ), 
      Source,G,
      Range,H,
      MappingGeneratorsImages,mapi);
   else
    if HasGeneratorsOfGroup(H) 
       and IsIdenticalObj(GeneratorsOfGroup(H),mapi[2]) then
      
      imgso:=H;
    else
      imgso:=SubgroupNC( H, pcgs[2]);
    fi;
    # we can also get the ImagesSource quickly
    ObjectifyWithAttributes( hom,
    NewType( GeneralMappingsFamily
    ( ElementsFamily( FamilyObj( G ) ),
      ElementsFamily( FamilyObj( H ) ) ), filter and HasImagesSource ), 
      Source,G,
      Range,H,
      ImagesSource,imgso,
      MappingGeneratorsImages,mapi);
  fi;

  return hom;
end );

InstallMethod( GroupHomomorphismByImagesNC, "for group, group, list, list",
    true, [ IsGroup, IsGroup, IsList, IsList ], 0,
function( G, H, gens, imgs )
local   hom;
  hom := GroupGeneralMappingByImages( G, H, gens, imgs );
  SetIsMapping( hom, true );
  return hom;
end );


#############################################################################
##
#M  MappingGeneratorsImages( <map> )  . . . . .  for group homomorphism
##
InstallMethod( MappingGeneratorsImages, "for a group homomorphism",
    true, [ IsGroupHomomorphism ], 0,
function( map )
local gens;
  # temporary workaround for compatibility with external code.
  if IsBound(map!.generators) and IsBound(map!.genimages) then
    Info(InfoWarning,1,"still using !.gen(erators/images)");
    return [map!.generators,map!.genimages];
  fi;
  gens:= GeneratorsOfGroup( PreImagesRange( map ) );
  return [gens, List( gens, g -> ImagesRepresentative( map, g ) ) ];
end );

RedispatchOnCondition(MappingGeneratorsImages,true,
  [IsGeneralMapping],[IsGroupHomomorphism],0);


#############################################################################
##
#M  AsGroupGeneralMappingByImages( <map> )  . . . . .  for group homomorphism
##
InstallMethod( AsGroupGeneralMappingByImages, "for a group homomorphism",
    true, [ IsGroupHomomorphism ], 0,
function( map )
local mapi,hom;
  Range(map); # for surjective action homomorphisms thsi enforces
              # computation of the MappingGeneratorsImages as well
  mapi:=MappingGeneratorsImages(map);
  hom:=GroupHomomorphismByImagesNC(Source(map),Range(map),mapi[1],mapi[2]);
  CopyMappingAttributes(map,hom);
  return hom;
end );

InstallMethod( AsGroupGeneralMappingByImages, "for group general mapping",
    true, [ IsGroupGeneralMapping ], 0,
function( map )
local mapi, cok,hom;
  mapi:=MappingGeneratorsImages(map);
  cok := GeneratorsOfGroup( CoKernelOfMultiplicativeGeneralMapping( map ) );
  hom:=GroupGeneralMappingByImages( Source( map ), Range( map ),
    Concatenation( mapi[1],List(cok,g->One(Source(map)))),
    Concatenation( mapi[2],cok ) );
  CopyMappingAttributes(map,hom);
  return hom;
end );
    
#############################################################################
##
#M  AsGroupGeneralMappingByImages( <hom> )  . . . . . . . . . . . .  for GHBI
##
InstallMethod( AsGroupGeneralMappingByImages, "for GHBI", true,
    [ IsGroupGeneralMappingByImages ], 
    SUM_FLAGS, # better than everything else
    IdFunc );

#############################################################################
##
#M  MappingOfWhichItIsAsGGMBI
##
InstallMethod(SetAsGroupGeneralMappingByImages,
  "assign MappingOfWhichItIsAsGGMBI",true,
  [ IsGroupGeneralMapping and IsAttributeStoringRep,
    IsGroupGeneralMapping],0,
function(map,as)
  SetMappingOfWhichItIsAsGGMBI(as,map);
  TryNextMethod();
end);

#############################################################################
##
#M  <hom1> = <hom2> . . . . . . . . . . . . . . . . . . . . . . . .  for GHBI
##
InstallMethod( \=, 
    "homomorphism by images with homomorphism: compare generator images",
    IsIdenticalObj,
    [ IsGroupHomomorphism and IsGroupGeneralMappingByImages,
      IsGroupHomomorphism ], 1,
    function( hom1, hom2 )
    local   i,mapi;
    
    if    Source( hom1 ) <> Source( hom2 )
       or Range ( hom1 ) <> Range ( hom2 )  then
        return false;
    fi;
    mapi:=MappingGeneratorsImages(hom1);
    if   IsGroupGeneralMappingByImages( hom2 )
         and Length(MappingGeneratorsImages(hom2)[1]) < Length(mapi[1])  then
        return hom2 = hom1;
    fi;
    for i  in [ 1 .. Length( mapi[1] ) ]  do
        if ImagesRepresentative( hom2, mapi[1][i] ) <> mapi[2][ i ]  then
	  return false;
        fi;
    od;
    return true;
end );

InstallMethod( \=,
    "homomorphism with general mapping: test b=a",
    IsIdenticalObj,
    [ IsGroupHomomorphism,
      IsGroupHomomorphism and IsGroupGeneralMappingByImages ], 0,
    function( hom1, hom2 )
    return hom2 = hom1;
end );

InstallMethod( ImagesSmallestGenerators,"group homomorphisms", true,
 [ IsGroupHomomorphism ], 0,
function(a)
  return List(GeneratorsSmallest(Source(a)),i->Image(a,i));
end);

InstallMethod( \<,"group homomorphisms: Images of smallest generators",
    IsIdenticalObj, [ IsGroupHomomorphism, IsGroupHomomorphism ], 0,
function(a,b)
  if Source(a)<>Source(b) then
    return Source(a)<Source(b);
  elif Range(a)<>Range(b) then
    return Range(a)<Range(b);
  else
    return ImagesSmallestGenerators(a)<ImagesSmallestGenerators(b);
  fi;
end);


#############################################################################
##
#M  ImagesSource( <hom> ) . . . . . . . . . . . . . . . . . . . . .  for GHBI
##
InstallMethod( ImagesSource, "for GHBI", true,
    [ IsGroupHomomorphism ], 
    # 2, # rank higher than the next method to avoid infinite recursions
    0,
function(hom)
local G;
  G:=SubgroupNC( Range( hom ), MappingGeneratorsImages(hom)[2] );
  if IsPermGroup(G) and HasSource(hom) and HasSize(Source(hom)) then
    StabChainOptions(G).limit:=Size(Source(hom));
  fi;
  if HasIsInjective(hom) and HasSource(hom) and IsInjective(hom) then
    UseIsomorphismRelation( Source(hom), G );
  fi;
  return G;
end);


# thanks to `MappingGeneratorsImages' this method is obsolete now.
# #############################################################################
# ##
# #M  ImagesSource( <hom> ) . . . . . . . . . . . . . .  for group homomorphism
# ##
# ##  The generic method calls `ImagesSet' which computes the cokernel
# ##  and forms the group generated by generator images and cokernel images.
# #T Is it really reasonable to install a new method for avoiding the
# #T concatenation?
# #T Note that if a mapping knows to be a group homomorphism then it also knows
# #T that its cokernel is trivial.
# #T (And the existence of this method with `Image' instaed of
# #T `ImagesRepresentative' caused `Operation' to last forever ...)
# ##
# InstallMethod( ImagesSource, "group homomorphisms", true,
#     [ IsGroupHomomorphism ], 0,
#     hom -> SubgroupNC( Range( hom ),
#                        List( GeneratorsOfGroup( Source( hom ) ),
#                              i -> ImagesRepresentative( hom, i ) ) ) );


#############################################################################
##
#M  PreImagesRange( <hom> ) . . . . . . . . . . . . . . . . . . . .  for GHBI
##
InstallMethod( PreImagesRange, "for GHBI", true,
    [ IsGroupGeneralMappingByImages ], 0,
    hom -> SubgroupNC( Source( hom ), MappingGeneratorsImages(hom)[1] ) );


#############################################################################
##
#M  InverseGeneralMapping( <hom> )  . . . . . . . . . . . . . . . .  for GHBI
##
InstallMethod( InverseGeneralMapping, "via generators/images", true,
  [ IsGroupGeneralMapping ], 0,
function( hom )
local mapi;
  mapi:=MappingGeneratorsImages(hom);
  mapi:=GroupGeneralMappingByImages( Range( hom ),   Source( hom ),
				      mapi[2], mapi[1] );
  if HasIsSurjective(hom) and IsSurjective(hom) then
    SetIsTotal(mapi,true);
  fi;
  if HasIsTotal(hom) and IsTotal(hom) then
    SetIsSurjective(mapi,true);
  fi;
  if HasIsSingleValued(hom) and IsSingleValued(hom) then
    SetIsInjective(mapi,true);
  fi;
  if HasIsSingleValued(hom) and IsSingleValued(hom) then
    SetIsInjective(mapi,true);
  fi;
  if HasIsInjective(hom) and IsInjective(hom) then
    SetIsSingleValued(mapi,true);
  fi;
  return mapi;
end );

InstallMethod( InverseGeneralMapping, "for bijective GHBI", true,
  [ IsGroupGeneralMappingByImages and IsBijective ], 0,
function( hom )
local mapi;
  mapi:=MappingGeneratorsImages(hom);
  hom := GroupHomomorphismByImagesNC( Range( hom ),   Source( hom ),
				      mapi[2], mapi[1] );
  SetIsBijective( hom, true );
  return hom;
end );


#############################################################################
##
#F  MakeMapping( <hom> )  . . . . . . . . . . . . . . . . . . . . .  for GHBI
##
InstallGlobalFunction( MakeMapping, function( hom )
    local   elms,       # elements of subgroup of '<hom>.source'
            elmr,       # representatives of <elms> in '<hom>.elements'
            imgs,       # elements of subgroup of '<hom>.range'
            imgr,       # representatives of <imgs> in '<hom>.images'
            rep,        # one new element of <elmr> or <imgr>
	    mapi,	# generators and images
            i, j, k;    # loop variables

    # if necessary compute the mapping with a Dimino algorithm
    if not IsBound( hom!.elements )  then
        hom!.elements := [ One( Source( hom ) ) ];
        hom!.images   := [ One( Range ( hom ) ) ];
	mapi:=MappingGeneratorsImages(hom);
        for i  in [ 1 .. Length( mapi[1] ) ]  do
            elms := ShallowCopy( hom!.elements );
            elmr := [ One( Source( hom ) ) ];
            imgs := ShallowCopy( hom!.images );
            imgr := [ One( Range( hom ) ) ];
            j := 1;
            while j <= Length( elmr )  do
                for k  in [ 1 .. i ]  do
                    rep := elmr[j] * mapi[1][k];
                    if not rep in hom!.elements  then
                        Append( hom!.elements, elms * rep );
                        Add( elmr, rep );
                        rep := imgr[j] * mapi[2][k];
                        Append( hom!.images, imgs * rep );
                        Add( imgr, rep );
                    fi;
                od;
                j := j + 1;
            od;
            SortParallel( hom!.elements, hom!.images );
            IsSSortedList( hom!.elements );  # give a hint that this is a set
#T MakeImmutable!
        od;
    fi;
end );

#############################################################################
##
#M  CoKernelOfMultiplicativeGeneralMapping( <hom> ) . . . . . . . .  for GHBI
##
InstallMethod( CoKernelOfMultiplicativeGeneralMapping, "for GHBI", true,
    [ IsGroupGeneralMappingByImages ], 0,
    function( hom )
    local   C,          # co kernel of <hom>, result
            gen,        # one generator of <C>
	    mapi,	# generators/images
            i, k;       # loop variables

    # make sure we have the mapping
    if not IsBound( hom!.elements )  then
      MakeMapping( hom );
    fi;
    mapi:=MappingGeneratorsImages(hom);

    # start with the trivial co kernel
    C := TrivialSubgroup( Range( hom ) );

    # for each element of the source and each generator of the source
    for i  in [ 1 .. Length( hom!.elements ) ]  do
        for k  in [ 1 .. Length( mapi[1] ) ]  do

            # the co kernel must contain the corresponding Schreier generator
            gen := hom!.images[i] * mapi[2][k]
                 / hom!.images[ Position( hom!.elements,
                                         hom!.elements[i]*mapi[1][k])];
	    #NC is safe
            C := ClosureSubgroupNC( C, gen );

        od;
    od;

    # return the co kernel
    return C;
end );

#############################################################################
##
#M  KernelOfMultiplicativeGeneralMapping( <hom> ) . . . . . . . . .  for GHBI
##
InstallMethod( KernelOfMultiplicativeGeneralMapping,
    "for GHBI",
    true,
    [ IsGroupGeneralMappingByImages ], 0,
    hom -> CoKernelOfMultiplicativeGeneralMapping(
               InverseGeneralMapping( hom ) ) );

#############################################################################
##
#M  IsInjective( <hom> )  . . . . . . . . . . . . . . . . . . . . .  for GHBI
##
InstallMethod( IsInjective,
    "for GHBI",
    true,
    [ IsGroupGeneralMappingByImages ], 0,
    hom -> IsSingleValued( InverseGeneralMapping( hom ) ) );

#############################################################################
##
#F  ImagesRepresentativeGMBIByElementsList( <hom>, <elm> )
##
InstallGlobalFunction( ImagesRepresentativeGMBIByElementsList,
function( hom, elm )
local   p,mapi;
  if not IsBound( hom!.elements )  then
    mapi:=MappingGeneratorsImages(hom);
    # catch a few trivial cases
    if Length(mapi[1])>0 then
      if CanEasilyCompareElements(mapi[1][1]) then
        p:=Position(mapi[1],elm);
	if p<>fail then 
	  return mapi[2][p];
	fi;
      else
        p:=PositionProperty(mapi[1],i->IsIdenticalObj(i,elm));
	if p<>fail then 
	  return mapi[2][p];
	fi;
      fi;
    fi;

    MakeMapping( hom );
  fi;
  p := Position( hom!.elements, elm );
  if p <> fail  then  return hom!.images[ p ];
  else  return fail;             fi;
end );

#############################################################################
##
#M  ImagesRepresentative( <hom>, <elm> )  . . . . . . . . . . . . .  for GHBI
##
InstallMethod( ImagesRepresentative,
    "parallel enumeration of source and range",
    FamSourceEqFamElm,
    [ IsGroupGeneralMappingByImages,
          IsMultiplicativeElementWithInverse ], 0,
    ImagesRepresentativeGMBIByElementsList);

#############################################################################
##
#M  PreImagesRepresentative( <hom>, <elm> ) . . . . . . . . . . . .  for GHBI
##
InstallMethod( PreImagesRepresentative,
    "for GHBI and mult.-elm.-with-inverse",
    FamRangeEqFamElm,
    [ IsGroupGeneralMappingByImages,
          IsMultiplicativeElementWithInverse ], 0,
    function( hom, elm )
    if IsBound( hom!.images )  and elm in hom!.images  then
        return hom!.elements[ Position( hom!.images, elm ) ];
    else
        return ImagesRepresentative( InverseGeneralMapping( hom ), elm );
    fi;
end );


#############################################################################
##
#M  ViewObj( <hom> )  . . . . . . . . . . . . . . . . . . . . . . .  for GHBI
##
InstallMethod( ViewObj, "for GHBI", true,
    [ IsGroupGeneralMappingByImages ], 0,
function( hom )
local mapi;
  mapi:=MappingGeneratorsImages(hom);
  View(mapi[1]);
  Print(" -> ");
  View(mapi[2]);
end );

#############################################################################
##
#M  String( <hom> )  . . . . . . . . . . . . . . . . . . . . . . .  for GHBI
##
InstallMethod( String, "for GHBI", true,
    [ IsGroupGeneralMappingByImages ], 0,
function( hom )
local mapi;
  mapi:=MappingGeneratorsImages(hom);
  return Concatenation(String(mapi[1])," -> ",String(mapi[2]));
end );


#############################################################################
##
#M  PrintObj( <hom> ) . . . . . . . . . . . . . . . . . . . . . . .  for GHBI
##
InstallMethod( PrintObj, "for group general mapping b.i.", true,
  [ IsGroupGeneralMappingByImages ], 0,
function( hom )
local mapi;
  mapi:=MappingGeneratorsImages(hom);
  Print( "GroupGeneralMappingByImages( ",
	  Source( hom ), ", ", Range(  hom ), ", ",
	  mapi[1], ", ", mapi[2], " )" );
end );

InstallMethod( PrintObj, "for GHBI", true,
  [ IsGroupGeneralMappingByImages and IsMapping ], 0,
function( hom )
local mapi;
  mapi:=MappingGeneratorsImages(hom);
  Print( "GroupHomomorphismByImages( ",
	  Source( hom ), ", ", Range(  hom ), ", ",
	  mapi[1], ", ", mapi[2], " )" );
end );


#############################################################################
##
##  3. Functions for conjugation action
##


#############################################################################
##
#M  ConjugatorIsomorphism( <G>, <g> )
##
InstallMethod( ConjugatorIsomorphism,
    "for group and mult.-elm.-with-inverse",
    IsCollsElms,
    [ IsGroup, IsMultiplicativeElementWithInverse ], 0,
    function( G, g )
    local fam, hom;

    fam:= ElementsFamily( FamilyObj( G ) );
    hom:= Objectify( NewType( GeneralMappingsFamily( fam, fam ),
                                  IsConjugatorIsomorphism
                              and IsSPGeneralMapping
                              and IsAttributeStoringRep ),
                     rec() );
    SetConjugatorOfConjugatorIsomorphism( hom, g );
    SetSource( hom, G );
    SetRange(  hom, ConjugateGroup( G, g ) );
    return hom;
    end );


#############################################################################
##
#M  ConjugatorAutomorphismNC( <G>, <g> )
##
InstallMethod( ConjugatorAutomorphismNC,
    "group and mult.-elm.-with-inverse",
    IsCollsElms,
    [ IsGroup, IsMultiplicativeElementWithInverse ], 0,
    function( G, g )
    local fam, hom;

    fam:= ElementsFamily( FamilyObj( G ) );
    hom:= Objectify( NewType( GeneralMappingsFamily( fam, fam ),
                                  IsConjugatorAutomorphism
                              and IsSPGeneralMapping
                              and IsAttributeStoringRep ),
                     rec() );
    SetConjugatorOfConjugatorIsomorphism( hom, g );
    SetSource( hom, G );
    SetRange(  hom, G );
    return hom;
    end );


#############################################################################
##
#F  ConjugatorAutomorphism( <G>, <g> )
##
InstallGlobalFunction( ConjugatorAutomorphism, function( G, g )
    if     IsCollsElms( FamilyObj( G ), FamilyObj( g ) )
       and IsNormal( Group( g ), G ) then
      return ConjugatorAutomorphismNC( G, g );
    else
      return fail;
    fi;
end );


#############################################################################
##
#M  InnerAutomorphismNC( <G>, <g> ) . . . . . . . . . . .  inner automorphism
##
InstallMethod( InnerAutomorphismNC,
    "for group and mult.-elm.-with-inverse",
    IsCollsElms,
    [ IsGroup, IsMultiplicativeElementWithInverse ], 0,
    function( G, g )
    local hom;
    hom:= ConjugatorAutomorphismNC( G, g );
    SetIsInnerAutomorphism( hom, true );
    return hom;
    end );


#############################################################################
##
#F  InnerAutomorphism( <G>, <g> )
##
InstallGlobalFunction( InnerAutomorphism, function( G, g )
    if g in G then
      return InnerAutomorphismNC( G, g );
    else
      return fail;
    fi;
end );


#############################################################################
##
#M  MappingGeneratorsImages( <hom> )  . . .  for conjugator isomorphism
##
InstallMethod( MappingGeneratorsImages,
    "for conjugator isomorphism", true, [ IsConjugatorIsomorphism ], 0,
function( hom )
local gens;
  gens:= GeneratorsOfGroup( Source(hom) );
  return [gens,OnTuples( gens, ConjugatorOfConjugatorIsomorphism( hom ) )];
end );

#############################################################################
##
#M  AsGroupGeneralMappingByImages( <hom> )  . . .  for conjugator isomorphism
##
InstallMethod( AsGroupGeneralMappingByImages,
    "for conjugator isomorphism", true, [ IsConjugatorIsomorphism ], 0,
function( hom )
    local G, gens, map;
  
    G:= Source( hom );
    gens:= GeneratorsOfGroup( G );
    map:= GroupHomomorphismByImagesNC( G, Range( hom ), gens,
              OnTuples( gens, ConjugatorOfConjugatorIsomorphism( hom ) ) );
    SetIsBijective( map, true );
    return map;
end );


#############################################################################
##
#M  InverseGeneralMapping( <hom> )  . . . . . . .  for conjugator isomorphism
##
InstallMethod( InverseGeneralMapping,
    "for conjugator isomorphism",
    true,
    [ IsConjugatorIsomorphism ], 0,
    hom -> ConjugatorIsomorphism( Range( hom ), 
               Inverse( ConjugatorOfConjugatorIsomorphism( hom ) ) ) );


#############################################################################
##
#M  InverseGeneralMapping( <hom> )  . . . . . . . for conjugator automorphism
##
InstallMethod( InverseGeneralMapping,
    "for conjugator automorphism",
    true,
    [ IsConjugatorAutomorphism ], 0,
    hom -> ConjugatorAutomorphismNC( Range( hom ), 
               Inverse( ConjugatorOfConjugatorIsomorphism( hom ) ) ) );


#############################################################################
##
#M  InverseGeneralMapping( <inn> )  . . . . . . . . .  for inner automorphism
##
InstallMethod( InverseGeneralMapping,
    "for inner automorphism",
    true,
    [ IsInnerAutomorphism ], 0,
    inn -> InnerAutomorphismNC( Source( inn ), 
                     Inverse( ConjugatorOfConjugatorIsomorphism( inn ) ) ) );


#############################################################################
##
#M  CompositionMapping2( <hom1>, <hom2> ) . . for two conjugator isomorphisms
##
InstallMethod( CompositionMapping2,
    "for two conjugator isomorphisms",
    true,
    [ IsConjugatorIsomorphism, IsConjugatorIsomorphism ], 0,
    function( hom1, hom2 )
    if not IsIdenticalObj( Source( hom1 ), Range( hom2 ) )  then
      TryNextMethod();
    fi;
    return ConjugatorIsomorphism( Source( hom2 ),
                 ConjugatorOfConjugatorIsomorphism( hom2 )
               * ConjugatorOfConjugatorIsomorphism( hom1 ) );
    end );


#############################################################################
##
#M  CompositionMapping2( <aut1>, <aut2> ) .  for two conjugator automorphisms
##
InstallMethod( CompositionMapping2,
    "for two conjugator automorphisms",
    true,
    [ IsConjugatorAutomorphism, IsConjugatorAutomorphism ], 0,
    function( aut1, aut2 )
    if not IsIdenticalObj( Source( aut1 ), Range( aut2 ) )  then
      TryNextMethod();
    fi;
    return ConjugatorAutomorphismNC( Source( aut2 ),
                 ConjugatorOfConjugatorIsomorphism( aut2 )
               * ConjugatorOfConjugatorIsomorphism( aut1 ) );
    end );


#############################################################################
##
#M  CompositionMapping2( <inn1>, <inn2> ) . . . . for two inner automorphisms
##
InstallMethod( CompositionMapping2,
    "for two inner automorphisms",
    IsIdenticalObj,
    [ IsInnerAutomorphism, IsInnerAutomorphism ], 0,
    function( inn1, inn2 )
    if not IsIdenticalObj( Source( inn1 ), Source( inn2 ) )  then
      TryNextMethod();
    fi;
    return InnerAutomorphismNC( Source( inn1 ),
                 ConjugatorOfConjugatorIsomorphism( inn2 )
               * ConjugatorOfConjugatorIsomorphism( inn1 ) );
    end );


#############################################################################
##
#M  ImagesRepresentative( <hom>, <g> )  . . . . .  for conjugator isomorphism
##
InstallMethod( ImagesRepresentative,
    "for conjugator isomorphism",
    FamSourceEqFamElm,
    [ IsConjugatorIsomorphism, IsMultiplicativeElementWithInverse ], 0,
    function( hom, g )
    return g ^ ConjugatorOfConjugatorIsomorphism( hom );
    end );


#############################################################################
##
#M  ImagesSet( <hom>, <U> ) . . . . . . . . . . .  for conjugator isomorphism
##
InstallMethod( ImagesSet,
    "for conjugator isomorphism, and group",
    CollFamSourceEqFamElms,
    [ IsConjugatorIsomorphism, IsGroup ], 0,
    function( hom, U )
    return U ^ ConjugatorOfConjugatorIsomorphism( hom );
    end );


#############################################################################
##
#M  PreImagesRepresentative( <hom>, <g> ) . . . .  for conjugator isomorphism
##
InstallMethod( PreImagesRepresentative,
    "for conjugator isomorphism",
    FamRangeEqFamElm,
    [ IsConjugatorIsomorphism, IsMultiplicativeElementWithInverse ], 0,
    function( hom, g )
    return g ^ ( ConjugatorOfConjugatorIsomorphism( hom ) ^ -1 );
    end );


#############################################################################
##
#M  PreImagesSet( <hom>, <U> )  . . . . . . . . .  for conjugator isomorphism
##
InstallMethod( PreImagesSet,
    "for conjugator isomorphism, and group",
    CollFamRangeEqFamElms,
    [ IsConjugatorIsomorphism, IsGroup ], 0,
    function( hom, U )
    return U ^ ( ConjugatorOfConjugatorIsomorphism( hom ) ^ -1 );
    end );


#############################################################################
##
#M  ViewObj( <hom> )  . . . . . . . . . . . . . .  for conjugator isomorphism
##
InstallMethod( ViewObj, "for conjugator isomorphism",
    true, [ IsConjugatorIsomorphism ], 0,
function( hom )
  Print("^");
  View( ConjugatorOfConjugatorIsomorphism( hom ) );
end );

#############################################################################
##
#M  String( <hom> )  . . . . . . . . . . . . . .  for conjugator isomorphism
##
InstallMethod( String, "for conjugator isomorphism",
    true, [ IsConjugatorIsomorphism ], 0,
function( hom )
  return Concatenation("^",String(ConjugatorOfConjugatorIsomorphism( hom ) ));
end );


#############################################################################
##
#M  PrintObj( <hom> ) . . . . . . . . . . . . . .  for conjugator isomorphism
##
InstallMethod( PrintObj,
    "for conjugator isomorphism",
    true,
    [ IsConjugatorIsomorphism ], 0,
    function( hom )
    if IsIdenticalObj( Source( hom ), Range( hom ) ) then
      Print( "ConjugatorAutomorphism( ", Source( hom), ", ",
             ConjugatorOfConjugatorIsomorphism( hom ), " )" );
    else
      Print( "ConjugatorIsomorphism( ", Source( hom ), ", ",
             ConjugatorOfConjugatorIsomorphism( hom ), " )" );
    fi;
    end );


#############################################################################
##
#M  PrintObj( <inn> ) . . . . . . . . . . . . . . . .  for inner automorphism
##
InstallMethod( PrintObj,
    "for inner automorphism",
    true,
    [ IsInnerAutomorphism ], 0,
    function( inn )
    Print( "InnerAutomorphism( ", Source( inn ), ", ",
           ConjugatorOfConjugatorIsomorphism( inn ), " )" );
    end );


#############################################################################
##
#M  IsConjugatorIsomorphism( <hom> )
##
##  There are methods of higher rank for special kinds of groups.
##  The default method can only check whether <hom> is an inner automorphism,
##  and whether some necessary conditions are satisfied.
##
InstallMethod( IsConjugatorIsomorphism,
    "for a group general mapping",
    true,
    [ IsGroupGeneralMapping ], 0,
    function( hom )
    if not ( IsBijective( hom ) and IsGroupHomomorphism( hom ) ) then
      return false;
    elif IsEndoGeneralMapping( hom ) and IsInnerAutomorphism( hom ) then
      return true;
    else
      TryNextMethod();
    fi;
    end );


#############################################################################
##
#M  IsInnerAutomorphism( <hom> )
##
InstallMethod( IsInnerAutomorphism,
    "for a group general mapping",
    true,
    [ IsGroupGeneralMapping ], 0,
    function( hom )
    local s, gens, rep;
    if not ( IsEndoGeneralMapping( hom ) and IsBijective( hom )
             and IsGroupHomomorphism( hom ) ) then
      return false;
    fi;
    s:= Source( hom );
    gens:= GeneratorsOfGroup( s );
    rep:= RepresentativeAction( s, gens, 
              List( gens, i -> ImagesRepresentative( hom, i ) ), OnTuples );
    if rep <> fail then
      SetConjugatorOfConjugatorIsomorphism( hom, rep );
      return true;
    else
      return false;
    fi;
    end );


#############################################################################
##
##  4. Functions for ...
##


#############################################################################
##
#M  NaturalHomomorphismByNormalSubgroup( <G>, <N> ) check whether N \unlhd G?
##
InstallGlobalFunction( NaturalHomomorphismByNormalSubgroup, function(G,N)
  if not (IsSubgroup(G,N) and IsNormal(G,N)) then
    Error("<N> must be a normal subgroup of <G>");
  fi;
  return NaturalHomomorphismByNormalSubgroupNC(G,N);
end );

InstallMethod( NaturalHomomorphismByNormalSubgroupOp,
  "for group, and trivial group (delegate to `IdentityMapping')",
    IsIdenticalObj, [ IsGroup, IsGroup and IsTrivial ],
    SUM_FLAGS, # better than everything else
function( G, T )
  return IdentityMapping( G );
end );

#############################################################################
##
#M  IsomorphismPermGroup( <G> ) . . . . . . . . .  by right regular operation
##
InstallMethod( IsomorphismPermGroup, "right regular operation", true,
        [ IsGroup and IsFinite ], 0,
    function( G )
    local   nice;
    
    nice := ActionHomomorphism( G, G, OnRight,"surjective" );
    SetIsBijective( nice, true );
    return nice;
end );

#############################################################################
##
#M  IsomorphismPcGroup( <G> ) . . . . . . . .  via permutation representation
##
InstallMethod( IsomorphismPcGroup, "via permutation representation", true,
        [ IsGroup and IsFinite ], 0,
function( G )
local p,a;
  p:=IsomorphismPermGroup(G);
  a:=IsomorphismPcGroup(Image(p));
  if a=fail then
    return a;
  else
    return p*a;
  fi;
end);


#############################################################################
##
#F  GroupHomomorphismByFunction( <D>, <E>, <fun> )
#F  GroupHomomorphismByFunction( <D>, <E>, <fun>, <invfun> )
##
InstallGlobalFunction( GroupHomomorphismByFunction, function ( arg )
    local   map;        # mapping <map>, result

    # no inverse function given
    if Length(arg) in [3,5]  then

      # make the general mapping
      map:= Objectify(
        NewType(GeneralMappingsFamily(ElementsFamily(FamilyObj(arg[1])),
        ElementsFamily(FamilyObj(arg[2]))),
                               IsSPMappingByFunctionRep
                           and IsSingleValued
                           and IsTotal and IsGroupHomomorphism ),
                       rec( fun:= arg[3] ) );
      if Length(arg)=5 and IsFunction(arg[5]) then
        map!.prefun:=arg[5];
      fi;

    # inverse function given
    elif Length(arg) = 4  then

      # make the mapping
      map:= Objectify(
        NewType(GeneralMappingsFamily(ElementsFamily(FamilyObj(arg[1])),
        ElementsFamily(FamilyObj(arg[2]))),
                               IsSPMappingByFunctionWithInverseRep
                           and IsBijective
			   and IsGroupHomomorphism),
                       rec( fun    := arg[3],
                            invFun := arg[4],
			    prefun := arg[4]) );

    # otherwise signal an error
    else
      Error( "usage: GroupHomomorphismByFunction( <D>, <E>, <fun>[, <inv>] )" );
    fi;

    SetSource(map,arg[1]);
    SetRange(map,arg[2]);
    # return the mapping
    return map;
end );

InstallMethod(RegularActionHomomorphism,"generic",true,[IsGroup],0,
function(G)
local hom;
  Size(G);
  hom:=ActionHomomorphism(G,AsSSortedList(G),OnRight,"surjective");
  SetSize(Range(hom),Size(G));
  SetIsRegular(Range(hom),true);
  return hom;
end);

#############################################################################
##
#E

