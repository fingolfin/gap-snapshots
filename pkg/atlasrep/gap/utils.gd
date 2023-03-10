#############################################################################
##
#W  utils.gd             GAP 4 package AtlasRep                 Thomas Breuer
##
#Y  Copyright (C)  2001,   Lehrstuhl D für Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the declarations of utility functions for the
##  &ATLAS; of Group Representations.
##


#############################################################################
##
##  Class Names Used in the AtlasRep Package
##
##  <#GAPDoc Label="classnames">
##  <Subsection Label="subsect:Definition of ATLAS Class Names">
##  <Heading>Definition of &ATLAS; Class Names</Heading>
##
##  For the definition of class names of an almost simple group,
##  we assume that the ordinary character tables of all nontrivial normal
##  subgroups are shown in
##  the &ATLAS; of Finite Groups&nbsp;<Cite Key="CCN85"/>.
##  <P/>
##  Each class name is a string consisting of the element order of the class
##  in question followed by a combination of capital letters, digits, and
##  the characters <C>'</C> and <C>-</C> (starting with a capital letter).
##  For example, <C>1A</C>, <C>12A1</C>, and <C>3B'</C> denote
##  the class that contains the identity element,
##  a class of element order <M>12</M>,
##  and a class of element order <M>3</M>, respectively.
##  <P/>
##  <Enum>
##  <Item>
##      For the table of a <E>simple</E> group, the class names are the same
##      as returned by the two argument version of the &GAP; function
##      <Ref Func="ClassNames" BookName="ref"/>,
##      cf.&nbsp;<Cite Key="CCN85" Where="Chapter 7, Section 5"/>:
##      The classes are arranged w.&nbsp;r.&nbsp;t.&nbsp;increasing element
##      order and for each element order w.&nbsp;r.&nbsp;t.&nbsp;decreasing
##      centralizer order, the conjugacy classes that contain elements of
##      order <M>n</M> are named <M>n</M><C>A</C>, <M>n</M><C>B</C>,
##      <M>n</M><C>C</C>, <M>\ldots</M>;
##      the alphabet used here is potentially infinite, and reads
##      <C>A</C>, <C>B</C>, <C>C</C>, <M>\ldots</M>, <C>Z</C>, <C>A1</C>,
##      <C>B1</C>, <M>\ldots</M>, <C>A2</C>, <C>B2</C>, <M>\ldots</M>.
##      <P/>
##      For example, the classes of the alternating group <M>A_5</M> have the
##      names <C>1A</C>, <C>2A</C>, <C>3A</C>, <C>5A</C>, and <C>5B</C>.
##  </Item>
##  <Item>
##      Next we consider the case of an <E>upward extension</E> <M>G.A</M>
##      of a simple group <M>G</M> by a <E>cyclic</E> group of order
##      <M>A</M>.
##      The &ATLAS; defines class names for each element <M>g</M> of
##      <M>G.A</M> only w.&nbsp;r.&nbsp;t.&nbsp;the group <M>G.a</M>, say,
##      that is generated by <M>G</M> and <M>g</M>;
##      namely, there is a power of <M>g</M> (with the exponent coprime to
##      the order of <M>g</M>) for which the class has a name of the same
##      form as the class names for simple groups,
##      and the name of the class of <M>g</M>
##      w.&nbsp;r.&nbsp;t.&nbsp;<M>G.a</M> is then
##      obtained from this name by appending a suitable number of
##      dashes&nbsp;<C>'</C>.
##      So dashed class names refer exactly to those classes that are not
##      printed in the &ATLAS;.
##      <P/>
##      For example, those classes of the symmetric group <M>S_5</M> that do
##      not lie in <M>A_5</M> have the names <C>2B</C>, <C>4A</C>,
##      and <C>6A</C>.
##      The outer classes of the group <M>L_2(8).3</M> have the names
##      <C>3B</C>, <C>6A</C>, <C>9D</C>, and <C>3B'</C>, <C>6A'</C>,
##      <C>9D'</C>.
##      The outer elements of order <M>5</M> in the group <M>Sz(32).5</M>
##      lie in the classes with names <C>5B</C>, <C>5B'</C>, <C>5B''</C>,
##      and <C>5B'''</C>.
##      <P/>
##      In the group <M>G.A</M>, the class of <M>g</M> may fuse with other
##      classes.
##      The name of the class of <M>g</M> in <M>G.A</M> is obtained from the
##      names of the involved classes of <M>G.a</M> by concatenating their
##      names after removing the element order part from all of them except
##      the first one.
##      <P/>
##      For example, the elements of order <M>9</M> in the group
##      <M>L_2(27).6</M> are contained in the subgroup <M>L_2(27).3</M>
##      but not in <M>L_2(27)</M>.
##      In <M>L_2(27).3</M>, they lie in the classes <C>9A</C>, <C>9A'</C>,
##      <C>9B</C>, and <C>9B'</C>;
##      in <M>L_2(27).6</M>, these classes fuse to <C>9AB</C> and
##      <C>9A'B'</C>.
##  </Item>
##  <Item>
##      Now we define class names for <E>general upward extensions</E>
##      <M>G.A</M> of a simple group <M>G</M>.
##      Each element <M>g</M> of such a group lies in an upward extension
##      <M>G.a</M> by a cyclic group, and the class names
##      w.&nbsp;r.&nbsp;t.&nbsp;<M>G.a</M> are already defined.
##      The name of the class of <M>g</M> in <M>G.A</M> is obtained by
##      concatenating the names of the classes in the orbit of <M>G.A</M> on
##      the classes of cyclic upward extensions of <M>G</M>,
##      after ordering the names lexicographically and removing the element
##      order part from all of them except the first one.
##      An <E>exception</E> is the situation where dashed and non-dashed
##      class names appear in an orbit;
##      in this case, the dashed names are omitted.
##      <P/>
##      For example, the classes <C>21A</C> and <C>21B</C> of the group
##      <M>U_3(5).3</M> fuse in <M>U_3(5).S_3</M> to the class <C>21AB</C>,
##      and the class <C>2B</C> of <M>U_3(5).2</M> fuses with the involution
##      classes <C>2B'</C>, <C>2B''</C> in the groups
##      <M>U_3(5).2^{\prime}</M> and <M>U_3(5).2^{{\prime\prime}}</M>
##      to the class <C>2B</C> of <M>U_3(5).S_3</M>.
##      <P/>
##      It may happen that some names in the <C>outputs</C> component of a
##      record returned by <Ref Func="AtlasProgram"/>
##      do not uniquely determine the classes of the corresponding elements.
##      For example, the (algebraically conjugate) classes <C>39A</C> and
##      <C>39B</C> of the group <M>Co_1</M> have not been distinguished yet.
##      In such cases, the names used contain a minus sign <C>-</C>,
##      and mean <Q>one of the classes in the range described by the name
##      before and the name after the minus sign</Q>;
##      the element order part of the name does not appear after the minus
##      sign.
##      So the name <C>39A-B</C> for the group <M>Co_1</M> means
##      <C>39A</C> or <C>39B</C>,
##      and the name <C>20A-B'''</C> for the group <M>Sz(32).5</M> means
##      one of the classes of element order <M>20</M> in this group
##      (these classes lie outside the simple group <M>Sz</M>).
##  </Item>
##  <Item>
##      For a <E>downward extension</E> <M>m.G.A</M> of an almost simple
##      group <M>G.A</M> by a cyclic group of order <M>m</M>,
##      let <M>\pi</M> denote the natural epimorphism from <M>m.G.A</M>
##      onto <M>G.A</M>.
##      Each class name of <M>m.G.A</M> has the form <C>nX_0</C>,
##      <C>nX_1</C> etc.,
##      where <C>nX</C> is the class name of the image under <M>\pi</M>,
##      and the indices <C>0</C>, <C>1</C> etc. are chosen according to the
##      position of the class in the lifting order rows for <M>G</M>,
##      see&nbsp;<Cite Key="CCN85" Where="Chapter 7, Section 7,
##      and the example in Section 8"/>).
##      <P/>
##      For example, if <M>m = 6</M> then <C>1A_1</C> and <C>1A_5</C> denote
##      the classes containing the generators of the kernel of <M>\pi</M>,
##      that is, central elements of order <M>6</M>.
##  </Item>
##  </Enum>
##
##  </Subsection>
##  <#/GAPDoc>
##
#T  missing:
#T  general central downward extensions (<M>2^2</M>, <M>2 \times 4</M>, ...)
##


#############################################################################
##
#F  AtlasClassNames( <tbl> )
##
##  <#GAPDoc Label="AtlasClassNames">
##  <ManSection>
##  <Func Name="AtlasClassNames" Arg='tbl'/>
##
##  <Returns>
##  a list of class names.
##  </Returns>
##  <Description>
##  Let <A>tbl</A> be the ordinary or modular character table of a group
##  <M>G</M>, say, that is almost simple or a downward extension of an
##  almost simple group and such that <A>tbl</A> is an &ATLAS; table
##  from the &GAP; Character Table Library,
##  according to its <Ref Func="InfoText" BookName="ref"/> value.
##  Then <Ref Func="AtlasClassNames"/> returns the list of class names for
##  <M>G</M>, as defined
##  in Section&nbsp;<Ref Subsect="subsect:Definition of ATLAS Class Names"/>.
##  The ordering of class names is the same as the ordering of the columns
##  of <A>tbl</A>.
##  <P/>
##  (The function may work also for character tables that are not
##  &ATLAS; tables,
##  but then clearly the class names returned are somewhat arbitrary.)
##  <P/>
##  <Example><![CDATA[
##  gap> AtlasClassNames( CharacterTable( "L3(4).3" ) );
##  [ "1A", "2A", "3A", "4ABC", "5A", "5B", "7A", "7B", "3B", "3B'", 
##    "3C", "3C'", "6B", "6B'", "15A", "15A'", "15B", "15B'", "21A", 
##    "21A'", "21B", "21B'" ]
##  gap> AtlasClassNames( CharacterTable( "U3(5).2" ) );
##  [ "1A", "2A", "3A", "4A", "5A", "5B", "5CD", "6A", "7AB", "8AB", 
##    "10A", "2B", "4B", "6D", "8C", "10B", "12B", "20A", "20B" ]
##  gap> AtlasClassNames( CharacterTable( "L2(27).6" ) );
##  [ "1A", "2A", "3AB", "7ABC", "13ABC", "13DEF", "14ABC", "2B", "4A", 
##    "26ABC", "26DEF", "28ABC", "28DEF", "3C", "3C'", "6A", "6A'", 
##    "9AB", "9A'B'", "6B", "6B'", "12A", "12A'" ]
##  gap> AtlasClassNames( CharacterTable( "L3(4).3.2_2" ) );
##  [ "1A", "2A", "3A", "4ABC", "5AB", "7A", "7B", "3B", "3C", "6B", 
##    "15A", "15B", "21A", "21B", "2C", "4E", "6E", "8D", "14A", "14B" ]
##  gap> AtlasClassNames( CharacterTable( "3.A6" ) );
##  [ "1A_0", "1A_1", "1A_2", "2A_0", "2A_1", "2A_2", "3A_0", "3B_0", 
##    "4A_0", "4A_1", "4A_2", "5A_0", "5A_1", "5A_2", "5B_0", "5B_1", 
##    "5B_2" ]
##  gap> AtlasClassNames( CharacterTable( "2.A5.2" ) );
##  [ "1A_0", "1A_1", "2A_0", "3A_0", "3A_1", "5AB_0", "5AB_1", "2B_0", 
##    "4A_0", "4A_1", "6A_0", "6A_1" ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AtlasClassNames" );


#############################################################################
##
#V  AtlasClassNamesOffsetInfo
##
##  <ManSection>
##  <Var Name="AtlasClassNamesOffsetInfo"/>
##
##  <Description>
##  This global variable describes the cyclic upwards extensions of those
##  simple groups whose ordinary character tables are contained in the
##  &ATLAS; of Finite Groups and for which the outer automorphism groups
##  are noncyclic.
##  </Description>
##  </ManSection>
##
DeclareGlobalVariable( "AtlasClassNamesOffsetInfo" );


#############################################################################
##
#F  AtlasCharacterNames( <tbl> )
##
##  <#GAPDoc Label="AtlasCharacterNames">
##  <ManSection>
##  <Func Name="AtlasCharacterNames" Arg='tbl'/>
##
##  <Returns>
##  a list of character names.
##  </Returns>
##  <Description>
##  Let <A>tbl</A> be the ordinary or modular character table of a simple
##  group.
##  <Ref Func="AtlasCharacterNames"/> returns a list of strings,
##  the <M>i</M>-th entry being the name of the <M>i</M>-th irreducible
##  character of <A>tbl</A>;
##  this name consists of the degree of this character followed by
##  distinguishing lowercase letters.
##  <P/>
##  <Example><![CDATA[
##  gap> AtlasCharacterNames( CharacterTable( "A5" ) );                   
##  [ "1a", "3a", "3b", "4a", "5a" ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AtlasCharacterNames" );


#############################################################################
##
#F  StringOfAtlasProgramCycToCcls( <prgstring>, <tbl>, <mode> )
##
##  <ManSection>
##  <Func Name="StringOfAtlasProgramCycToCcls" Arg='prgstring, tbl, mode'/>
##
##  <Description>
##  The purpose of this utility program is to construct a straight line
##  program for computing conjugacy class representatives of a group <M>G</M>
##  from a straight line program for computing representatives of classes
##  of maximally cyclic subgroups of <M>G</M>;
##  the latter program is assumed to be given by the string <A>prgstring</A>.
##  The second argument <A>tbl</A> must be the ordinary character table of
##  <M>G</M>.
##  The third argument <A>mode</A> must be one of the strings <C>"names"</C>
##  or <C>"numbers"</C>; in the former case, the labels used are class names,
##  in the latter case they are numbers.
##  (Note that the labels used for the inputs are the outputs of the program
##  given by <A>prgstring</A>, which may be names even if <C>"numbers"</C> is
##  chosen for <A>mode</A>.)
##  <P/>
##  <M>G</M> must be an &ATLAS; group, and the classes of <A>tbl</A> must be
##  sorted compatibly with the
##  &ATLAS; of Finite Groups&nbsp;<Cite Key="CCN85"/>,
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "StringOfAtlasProgramCycToCcls" );


#############################################################################
##
#F  CurrentDateTimeString( [<options>] )
##
##  <ManSection>
##  <Func Name="CurrentDateTimeString" Arg='[options]'/>
##
##  <Description>
##  If the system function <C>date</C> is available then the return value is
##  a string that describes the current date and time,
##  otherwise the string <C>"unknown"</C> is returned.
##  <P/>
##  If the argument <A>options</A> is given it must be a list of options for
##  <C>date</C>;
##  for example an empty list means the local time,
##  and the value <C>[ "-u" ]</C> means Greenwich mean time (UTC).
##  <P/>
##  If no argument is given then the format of the result refers to Greenwich
##  mean time and is compatible with <Ref Func="StringDate" BookName="ref"/>
##  and <Ref Func="StringTime" BookName="ref"/>;
##  in this case the option <C>+%s</C> is used.
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "CurrentDateTimeString" );


#############################################################################
##
#F  SendMail( <sendto>, <copyto>, <subject>, <text> )
##
##  <ManSection>
##  <Func Name="SendMail" Arg='sendto, copyto, subject, text'/>
##
##  <Description>
##  Let <A>sendto</A> and <A>copyto</A> be lists of email addresses,
##  and <A>subject</A> and <A>text</A> be strings.
##  <Ref Func="SendMail"/> sends email messages with subject <A>subject</A>
##  and body <A>text</A> to the addresses in <A>sendto</A> and <A>copyto</A>.
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "SendMail" );


#############################################################################
##
#F  ParseBackwards( <string>, <format> )
#F  ParseBackwardsWithPrefix( <string>, <format> )
#F  ParseForwards( <string>, <format> )
#F  ParseForwardsWithSuffix( <string>, <format> )
##
##  <ManSection>
##  <Func Name="ParseBackwards" Arg='string, format'/>
##  <Func Name="ParseBackwardsWithPrefix" Arg='string, format'/>
##  <Func Name="ParseForwards" Arg='string, format'/>
##  <Func Name="ParseForwardsWithSuffix" Arg='string, format'/>
##
##  <Description>
##  <!--  Remove this as soon as <C>gpisotyp</C> is available!-->
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "ParseBackwards" );
DeclareGlobalFunction( "ParseBackwardsWithPrefix" );
DeclareGlobalFunction( "ParseForwards" );
DeclareGlobalFunction( "ParseForwardsWithSuffix" );


#############################################################################
##
#F  AtlasRepIdentifier( <oldid> )
#F  AtlasRepIdentifier( <id>, "old" )
##
##  <#GAPDoc Label="AtlasRepIdentifier">
##  <ManSection>
##  <Heading>AtlasRepIdentifier</Heading>
##  <Func Name="AtlasRepIdentifier" Arg='oldid'
##   Label="convert an old type identifier to a new type one"/>
##  <Func Name="AtlasRepIdentifier" Arg='id, "old"'
##   Label="convert a new type identifier to an old type one"/>
##
##  <Description>
##  This function converts between the <Q>old format</Q> (the one used up to
##  version 1.5.1 of the package) and the <Q>new format</Q> (the one used
##  since version 2.0) of the <C>identifier</C> component of the records
##  returned by &AtlasRep; functions.
##  Note that the two formats differ only for <C>identifier</C> components
##  that describe data from non-core parts of the database.
##  <P/>
##  If the only argument is a list <A>oldid</A> that is an <C>identifier</C>
##  in old format then the function returns the corresponding
##  <C>identifier</C> in new format.
##  If there are two arguments, a list <A>id</A> that is an <C>identifier</C>
##  in new format and the string <A>"old"</A>,
##  then the function returns the corresponding <C>identifier</C> in old
##  format if this is possible, and <K>fail</K> otherwise.
##  <P/>
##  <Example><![CDATA[
##  gap> id:= [ "A5", [ "A5G1-p5B0.m1", "A5G1-p5B0.m2" ], 1, 5 ];;
##  gap> AtlasRepIdentifier( id ) = id;
##  true
##  gap> id:= [ "L2(8)", "L28G1-check1", 1, 1 ];;
##  gap> AtlasRepIdentifier( id ) = id;
##  true
##  gap> oldid:= [ [ "priv", "C4" ], [ "C4G1-p4B0.m1" ], 1, 4 ];;
##  gap> newid:= AtlasRepIdentifier( oldid );
##  [ "C4", [ [ "priv", "C4G1-p4B0.m1" ] ], 1, 4 ]
##  gap> oldid = AtlasRepIdentifier( newid, "old" );
##  true
##  gap> oldid:= [ [ "priv", "C4" ], "C4G1-max1W1", 1 ];;
##  gap> newid:= AtlasRepIdentifier( oldid );
##  [ "C4", [ [ "priv", "C4G1-max1W1" ] ], 1 ]
##  gap> oldid = AtlasRepIdentifier( newid, "old" );
##  true
##  gap> oldid:= [ [ "priv", "C4" ], "C4G1-Ar1aB0.g", 1, 1 ];;
##  gap> newid:= AtlasRepIdentifier( oldid );
##  [ "C4", [ [ "priv", "C4G1-Ar1aB0.g" ] ], 1, 1 ]
##  gap> oldid = AtlasRepIdentifier( newid, "old" );
##  true
##  gap> oldid:= [ [ "priv", "C4" ], "C4G1-XtestW1", 1 ];;
##  gap> newid:= AtlasRepIdentifier( oldid );
##  [ "C4", [ [ "priv", "C4G1-XtestW1" ] ], 1 ]
##  gap> oldid = AtlasRepIdentifier( newid, "old" );
##  true
##  gap> oldid:= [ [ "mfer", "2.M12" ],
##  >  [ "2M12G1-p264aB0.m1", "2M12G1-p264aB0.m2" ], 1, 264 ];;
##  gap> newid:= AtlasRepIdentifier( oldid );
##  [ "2.M12", 
##    [ [ "mfer", "2M12G1-p264aB0.m1" ], [ "mfer", "2M12G1-p264aB0.m2" ] ]
##      , 1, 264 ]
##  gap> oldid = AtlasRepIdentifier( newid, "old" );
##  true
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AtlasRepIdentifier" );


#############################################################################
##
#F  CompositionOfSLDAndSLP( <sld>, <slp> )
##
##  <ManSection>
##  <Func Name="CompositionOfSLDAndSLP" Arg='sld, slp'/>
##
##  <Description>
##  Return a straight line decision that first applies the straight line
##  program <A>slp</A> to its inputs and then returns the result of the
##  straight line decision <A>sld</A> on the outputs.
##  <P/>
##  A typical situation is that <A>slp</A> is a restandardization script
##  and <A>sld</A> is a presentation.
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "CompositionOfSLDAndSLP" );


#############################################################################
##
#F  AtlasRepComputedKernelGenerators( <gapname>, <std>,
#F                                    <factgapname>, <factstd>,
#F                                    <bound> )
##
##  <ManSection>
##  <Func Name="AtlasRepComputedKernelGenerators"
##   Arg='gapname, std, factgapname, factstd, bound'/>
##
##  <Description>
##  We assume that <A>gapname</A> and <A>factgapname</A> are valid arguments 
##  of <Ref Func="AtlasGroup"/>,
##  and that the <A>std</A>-th and <A>factstd</A>-th standard generators of
##  the two groups <M>G</M> and <M>F</M>, say, are compatible
##  in the sense that mapping the generators of <M>G</M> to those of <M>F</M>
##  defines an epimorphism.
##  <P/>
##  If representations for the two groups in the given standardizations
##  are locally available then the following happens.
##  <P/>
##  The function runs over the elements of a free monoid and collects those
##  elements that evaluate to elements of different orders in the two groups
##  and thus lie in the kernel of the epimorphism from <M>G</M> to <M>F</M>.
##  Only those words in the free generators are considered for which the
##  exponents of all syllables are smaller than the orders of the
##  corresponding generators of <M>G</M>.
##  <P/>
##  If <A>gapname</A> and <A>factgapname</A> are two identifiers of
##  character tables from the &GAP; Character Table Library such that 
##  a factor fusion from the table of <A>gapname</A> to that of 
##  <A>factgapname</A> is stored then the character tables are used 
##  to determine those orders of elements in <A>F</A> for which a preimage 
##  in <M>G</M> has larger order.
##  In this case, only those elements of <M>G</M> are computed for which 
##  the order of the corresponding element of <M>F</M> admits a preimage of
##  larger order in <M>G</M>.
##  <P/>
##  At most the first <A>bound</A> words in the free generators are checked
##  for which an element of <M>G</M> is actually computed according to these 
##  rules.
##  <P/>
##  The function returns <K>fail</K> if it finds out that the generators
##  are not compatible;
##  in this case, a message about the details is printed
##  if the info level of <Ref Var="InfoAtlasRep"/> is at least <M>3</M>.
##  Otherwise, the function returns a list <M>[ l, flag ]</M>,
##  where <M>l</M> is a list of pairs <M>[ w, o ]</M> such that <M>w^o</M>
##  describes an element in the kernel,
##  and <M>flag</M> is <K>true</K> if these words are known to generate
##  the kernel, and <K>false</K> otherwise.
##  <P/>
##  Yes, the strategy used is quite simpleminded:
##  First, although the words in the free monoid are checked in an ordering
##  that respects the length of the words, it may happen that some longer
##  word can be evaluated with a straight line program that needs less
##  multiplications.
##  Second, the checks of many words are unnecessary because these words
##  evaluate to the same elements as words that have been checked already.
##  <P/>
##  Moreover, the strategy is suitable only for computing <E>small</E>
##  kernels, since membership tests for the kernel are needed if it is not
##  cyclic.  Large kernels occur for example in maximal subgroups of the
##  Monster group; if such a kernel is an irreducible module then it is
##  a better approach to find one nontrivial element in the kernel and
##  suitable conjugating elements of the maximal subgroup.
##  <P/>
##  <Example><![CDATA[
##  gap> AtlasRepComputedKernelGenerators( "2.A5", 1, "A5", 1, 10^6 );
##  [ [ [ m1, 2 ] ], true ]
##  gap> g:= AtlasGroup( "A5" );;
##  gap> 2g:= AtlasGroup( "2.A5" );;
##  gap> List( GeneratorsOfGroup( g ), Order );
##  [ 2, 3 ]
##  gap> List( GeneratorsOfGroup( 2g ), Order );
##  [ 4, 3 ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "AtlasRepComputedKernelGenerators" );


#############################################################################
##
#E

