#############################################################################
##
#W  randlist.tst                   GAP library                Frank Lübeck
##
##
#Y  Copyright (C)  2016, The GAP Group
##
gap> START_TEST("randlist.tst");
gap> l := [1..2^(8*GAPInfo.BytesPerVariable-4)-1];
[ 1 .. 1152921504606846975 ]
gap> Reset(GlobalMersenneTwister, 1);;
gap> List([1..10], i-> Random(1, 2^70));
[ 389420078096435786116, 1135477438879460122740, 425191437180319830675, 
  1083900231106243887320, 600872374094649387692, 39438917363375403157, 
  860639563472417594821, 1064153947161477828981, 140455377727366448871, 
  198677943275448576238 ]
gap> List([1..10], i-> Random(l));
[ 13449613059603563, 750280845826784809, 604497940593164266, 
  195957948672214877, 363541010878257, 252402567376707281, 370012941179900926,
  417909953390052908, 963123934602894316, 270776873282813509 ]
gap> List([1..10], i-> Random(1,10^(3*i)));
[ 200, 711160, 554290144, 155776019526, 905142534515704, 885417939216212735, 
  932340683886669498401, 455800814114634556722688, 
  791206551199537424739336406, 382559260149794825284857428764 ]
gap> Reset(GlobalRandomSource, 1);;
gap> List([1..10], i-> Random(GlobalRandomSource, 1, 2^70));
[ 1128431629504922105781, 1101744982711025966526, 975266616221323178376, 
  678285771456235093359, 337368903834409162500, 1067481644129172537859, 
  666712591436546208470, 471773889319658808870, 27293053954741592585, 
  894173925476383505759 ]
gap> List([1..10], i-> Random(GlobalRandomSource, l));
[ 172731053183754005, 399538608969287265, 528332786381188118, 
  719153818282315693, 341000865208262150, 994286057174428461, 
  975057260589483054, 343216463929586102, 60169085279927990, 
  236724101465774021 ]
gap> List([1..10], i-> Random(GlobalRandomSource, l)) mod 2^28;
[ 82408175, 222596625, 2843657, 140496253, 243545930, 128569490, 62441909, 
  102134268, 47094864, 154341103 ]
gap> List([1..10], i-> Random(GlobalRandomSource, 1,10^(3*i)));
[ 871, 264536, 392436441, 73737636655, 456525824458936, 890212987711716841, 
  234476903267325497175, 596997600529202583174722, 
  290628328961307271818818898, 17261260615457929009978390979 ]
gap> rs := RandomSource(IsMersenneTwister, 1);
<RandomSource in IsMersenneTwister>
gap> List([1..10], i-> Random(rs, 1, 2^70));
[ 389420078096435786116, 1135477438879460122740, 425191437180319830675, 
  1083900231106243887320, 600872374094649387692, 39438917363375403157, 
  860639563472417594821, 1064153947161477828981, 140455377727366448871, 
  198677943275448576238 ]
gap> List([1..10], i-> Random(rs, l));
[ 13449613059603563, 750280845826784809, 604497940593164266, 
  195957948672214877, 363541010878257, 252402567376707281, 370012941179900926,
  417909953390052908, 963123934602894316, 270776873282813509 ]
gap> List([1..10], i-> Random(rs, 1,10^(3*i)));
[ 200, 711160, 554290144, 155776019526, 905142534515704, 885417939216212735, 
  932340683886669498401, 455800814114634556722688, 
  791206551199537424739336406, 382559260149794825284857428764 ]
gap> rs := RandomSource(IsGAPRandomSource, 1);
<RandomSource in IsGAPRandomSource>
gap> List([1..10], i-> Random(rs, 1, 2^70));
[ 1128431629504922105781, 1101744982711025966526, 975266616221323178376, 
  678285771456235093359, 337368903834409162500, 1067481644129172537859, 
  666712591436546208470, 471773889319658808870, 27293053954741592585, 
  894173925476383505759 ]
gap> List([1..10], i-> Random(rs, l));
[ 172731053183754005, 399538608969287265, 528332786381188118, 
  719153818282315693, 341000865208262150, 994286057174428461, 
  975057260589483054, 343216463929586102, 60169085279927990, 
  236724101465774021 ]
gap> List([1..10], i-> Random(rs, l)) mod 2^28;
[ 82408175, 222596625, 2843657, 140496253, 243545930, 128569490, 62441909, 
  102134268, 47094864, 154341103 ]
gap> List([1..10], i-> Random(rs, 1,10^(3*i)));
[ 871, 264536, 392436441, 73737636655, 456525824458936, 890212987711716841, 
  234476903267325497175, 596997600529202583174722, 
  290628328961307271818818898, 17261260615457929009978390979 ]
gap> STOP_TEST( "randlist.tst", 1);
#############################################################################
##
#E  
