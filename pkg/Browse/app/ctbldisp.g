#############################################################################
##
#W  ctbldisp.g            GAP 4 package `browse'                Thomas Breuer
##
#Y  Copyright (C)  2006,  Lehrstuhl D für Mathematik,  RWTH Aachen,  Germany
##
##  <#GAPDoc Label="Ctbl_section">
##  <Section Label="sec:ctbldisp">
##  <Heading>Character Table Display</Heading>
##
##  The &GAP; library provides a <Ref Oper="Display" BookName="ref"/> method
##  for character tables
##  that breaks the table into columns fitting on the screen.
##  &Browse; provides an alternative,
##  using the standard facilities of the function
##  <Ref Func="NCurses.BrowseGeneric"/>, i.&nbsp;e.,
##  one can scroll in the matrix of character values,
##  searching and sorting are provided etc.
##  <P/>
##  The <Ref Oper="Browse"/> method for character tables can be called
##  instead of <Ref Oper="Display" BookName="ref"/>.
##  For convenience, one can additionally make this function the default
##  <Ref Oper="Display" BookName="ref"/> method for character tables,
##  by assigning it to the <C>Display</C> component in the global record
##  <C>CharacterTableDisplayDefaults.User</C>,
##  see&nbsp;<Ref Sect="Printing Character Tables" BookName="ref"/>;
##  for example, one can do this in one's <F>gaprc</F> file,
##  see&nbsp;<Ref Sect="The gap.ini and gaprc files" BookName="ref"/>.
##  (This can be undone by unbinding the component
##  <C>CharacterTableDisplayDefaults.User.Display</C>.)
##  <P/>
##  The function <Ref Func="BrowseDecompositionMatrix"/> can be used to
##  display decomposition matrices for Brauer character tables.
##
##  <#Include Label="Browse_Ctbl">
##  <#Include Label="BrowseDecompositionMatrix">
##
##  </Section>
##  <#/GAPDoc>
##


#############################################################################
##
#M  Browse( <tbl>[, <options>] )
##
##  <#GAPDoc Label="Browse_Ctbl">
##  <ManSection>
##  <Meth Name="Browse" Arg="tbl[, options]" Label="for character tables"/>
##
##  <Description>
##  This method displays the character table <A>tbl</A> in a window.
##  The optional record <A>options</A> describes what shall be displayed,
##  the supported components and the default values are described
##  in&nbsp;<Ref Sect="Printing Character Tables" BookName="ref"/>.
##  <P/>
##  The full functionality of the function
##  <Ref Func="NCurses.BrowseGeneric"/> is available.
##  <P/>
##  <Example><![CDATA[
##  gap> BrowseData.SetReplay( Concatenation(
##  >         # scroll in the table
##  >         "DRULdddddrrrrrlluu",
##  >         # select an entry and move it around
##  >         "seddrruuuddlll",
##  >         # search for the pattern 135 (six times)
##  >         "/135", [ NCurses.keys.ENTER ], "nnnnn",
##  >         # deselect the entry, select the first column
##  >         "qLsc",
##  >         # sort and categorize by this column
##  >         "sc",
##  >         # select the first row, move down the selection
##  >         "srdddd",
##  >         # expand the selected category, scroll the selection down
##  >         "xd",
##  >         # and quit the application
##  >         "Q" ) );
##  gap> Browse( CharacterTable( "HN" ) );
##  gap> BrowseData.SetReplay( false );
##  ]]></Example>
##  <P/>
##  <E>Implementation remarks</E>:
##  The first part of the code in the <Ref Oper="Browse"/> method
##  for character tables is almost identical with the code for extracting
##  the data to be displayed from the input data in the &GAP; library
##  function <C>CharacterTableDisplayDefault</C>.
##  The second part of the code transforms these data into a browse table.
##  Character names and (if applicable) indicator values are used as row
##  labels,
##  and centralizer orders, power maps, and class names are used as column
##  labels.
##  The identifier of the table is used as the static header.
##  When an irrational entry is selected, a description of this entry is
##  shown in the dynamic footer.
##  <P/>
##  The standard modes in <Ref Var="BrowseData"/> (except the <C>help</C>
##  mode) have been extended by three new actions.
##  The first two of them open pagers giving an overview of all
##  irrationalities in the table, or of all those irrationalities that have
##  been shown on the screen in the current call, respectively.
##  The corresponding user inputs are the <B>I</B> and the <B>i</B> key.
##  (The names assigned to the irrationalities are generated column-wise.
##  If one just scrolls through the table, without jumping,
##  then these names coincide with the names generated by the default
##  <Ref Oper="Display" BookName="ref"/> method for character tables;
##  this is in general <E>not</E> the case,
##  for example when a row-wise search in the table is performed.)
##  The third new action, which is associated with the <B>p</B> key,
##  toggles the visibility status of the column label rows for centralizer
##  orders and power maps.
##  <P/>
##  An individual <C>minyx</C> function does not only check whether the
##  desired table fits into the window but also whether a table with too high
##  column labels (centralizer orders and power maps) would fit if these
##  labels get collapsed via the <B>p</B> key.
##  In this case, the labels are automatically collapsed, and the <B>p</B>
##  key is disabled.
##  <P/>
##  In order to keep the required space small also for large character
##  tables, caching of formatted matrix entries is disabled,
##  and the strings to be displayed are computed on demand with a
##  <C>Main</C> function in the <C>work</C> component of the browse table.
##  For the same reason, the constant height one for all table rows is set
##  in advance, so one need not inspect a whole character if only a few
##  values of it shall be shown.
##  <P/>
##  Special functions are provided for
##  sorting (concerning the comparison of character values,
##  which can be integers or irrationalities) and
##  categorizing the table by a column (the value in the category row
##  involves the class name of the column in question).
##  <P/>
##  The code can be found in the file <F>app/ctbldisp.g</F> of the package.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
if not IsBound( CambridgeMaps ) then
  CambridgeMaps:= "dummy";
fi;

InstallMethod( Browse,
    [ "IsNearlyCharacterTable" ],
    function( tbl )
    if   HasDisplayOptions( tbl ) then
      Browse( tbl, DisplayOptions( tbl ) );
    elif IsBound( CharacterTableDisplayDefaults.User ) then
      Browse( tbl, CharacterTableDisplayDefaults.User );
    else
      Browse( tbl, CharacterTableDisplayDefaults.Global );
    fi;
    end );


InstallMethod( Browse,
    [ "IsNearlyCharacterTable", "IsRecord" ],
    function( tbl, options )
    local log, replay, record, stringEntry, stringEntryData, legend,
          cletter, centralizers, chars_from_irr, cnr, chars, charnames,
          classes, tbl_powermap, powermap, indicator, nam, indic, i, heights,
          modes, table, ind, j, list, hidecollabelspos, p, mode, pos;

    # Use only the argument record for the history.
    if IsBound( options.log ) and IsBound( options.replay ) then
      log:= options.log;
      replay:= options.replay;
    else
      log:= fail;
    fi;

    # Prepare a list of the available options records.
    options:= [ options ];
    if HasDisplayOptions( tbl ) and
       not IsIdenticalObj( options[1], DisplayOptions( tbl ) ) then
      Add( options, DisplayOptions( tbl ) );
    fi;
    if IsBound( CharacterTableDisplayDefaults.User ) and
       not IsIdenticalObj( options[1],
               CharacterTableDisplayDefaults.User ) then
      Add( options, CharacterTableDisplayDefaults.User );
    fi;
    if not IsIdenticalObj( options[1],
                CharacterTableDisplayDefaults.Global ) then
      Add( options, CharacterTableDisplayDefaults.Global );
    fi;

    # Get the options that are in at least one record.
    for record in options do
      if IsBound( record.StringEntry ) then
        stringEntry:= record.StringEntry;
        break;
      fi;
    od;
    for record in options do
      if IsBound( record.StringEntryData ) then
        stringEntryData:= record.StringEntryData( tbl );
        break;
      fi;
    od;
    for record in options do
      if IsBound( record.Legend ) then
        legend:= record.Legend;
        break;
      fi;
    od;
    for record in options do
      if IsBound( record.letter ) and Length( record.letter ) = 1 then
        cletter:= record.letter;
        break;
      fi;
    od;
    for record in options do
      if IsBound( record.centralizers ) then
        centralizers:= record.centralizers;
        break;
      fi;
    od;

    # Get the options that have no global default.
    # choice of characters and character names
    chars_from_irr:= true;
    for record in options do
      if IsBound( record.chars ) then
        if IsList( record.chars ) and ForAll( record.chars, IsPosInt ) then
          cnr:= record.chars;
          chars:= List( Irr( tbl ){ cnr }, ValuesOfClassFunction );
        elif IsInt( record.chars ) then
          cnr:= [ record.chars ];
          chars:= List( Irr( tbl ){ cnr }, ValuesOfClassFunction );
        elif IsHomogeneousList( record.chars ) then
          chars:= record.chars;
          cnr:= [ 1 .. Length( chars ) ];
          chars_from_irr:= false;
          if not IsBound( cletter ) then
            cletter:= "Y";
          fi;
        else
          cnr:= [];
          chars:= [];
        fi;
        break;
      fi;
    od;
    if not IsBound( chars ) then
      # Perhaps the irreducibles have to be computed here,
      # so we do not use this before evaluating the options.
      chars:= List( Irr( tbl ), ValuesOfClassFunction );
      cnr:= [ 1 .. Length( chars ) ];
      if HasCharacterNames( tbl ) then
        charnames:= CharacterNames( tbl );
      fi;
    fi;
    if not IsBound( cletter ) then
      cletter:= "X";
    fi;
    if not IsBound( charnames ) then
      charnames:= List( cnr,
          i -> Concatenation( cletter, ".", String( i ) ) );
    fi;

    # choice of classes
    classes:= [ 1 .. NrConjugacyClasses( tbl ) ];
    for record in options do
      if IsBound( record.classes ) then
        if IsInt( record.classes ) then
          classes:= [ record.classes ];
        else
          classes:= record.classes;
        fi;
        break;
      fi;
    od;

    # choice of power maps
    tbl_powermap:= ComputedPowerMaps( tbl );
    powermap:= Filtered( [ 2 .. Length( tbl_powermap ) ],
                         x -> IsBound( tbl_powermap[x] ) );
    for record in options do
      if IsBound( record.powermap ) then
        if IsInt( record.powermap ) then
          IntersectSet( powermap, [ record.powermap ] );
        elif record.powermap = "ATLAS" and IsBound( CambridgeMaps ) then
          powermap:= "ATLAS";
          powermap:= CambridgeMaps( tbl );
        elif IsList( record.powermap ) then
          IntersectSet( powermap, record.powermap );
        elif record.powermap = false then
          powermap:= [];
        fi;
        break;
      fi;
    od;

    # print Frobenius-Schur indicators?
    indicator:= [];
    for record in options do
      if IsBound( record.indicator ) then
        if record.indicator = true then
          indicator:= [ 2 ];
        elif IsList( record.indicator ) then
          indicator:= Set( Filtered( record.indicator, IsPosInt ) );
        fi;
        break;
      fi;
    od;

    # (end of options handling)

    # prepare classnames
    if powermap = "ATLAS" then
      nam:= ClassNames( tbl, "ATLAS" );
    else
      nam:= ClassNames( tbl );
    fi;

    # prepare indicator
    if indicator <> [] then
      indic:= [];
      for i in indicator do
        if chars_from_irr and IsBound( ComputedIndicators( tbl )[i] ) then
          indic[i]:= ComputedIndicators( tbl )[i]{ cnr };
        else
          indic[i]:= Indicator( tbl, Irr( tbl ){ cnr }, i );
        fi;
      od;
    fi;

    heights:= ListWithIdenticalEntries( 2 * Length( chars ) + 1, 0 );
    for i in [ 2, 4 .. 2 * Length( chars ) ] do
      heights[i]:= 1;
    od;

    # Construct the extended modes if necessary.
    if not IsBound( BrowseData.defaults.work.customizedModes.ctbldisp ) then
      # Create a shallow copy of each default mode for `Browse',
      # and add new actions to all available modes (except the help mode):
      # - i: Show a pager with the irrationalities that have been shown.
      # - I: Show a pager with all irrationalities in the table.
      # - p: Toggle power maps and centralizer orders (but not class names).
      modes:= List( BrowseData.defaults.work.availableModes,
                    BrowseData.ShallowCopyMode );
      BrowseData.defaults.work.customizedModes.ctbldisp:= modes;
      for mode in modes do
        if mode.name <> "help" then
          BrowseData.SetActions( mode, [
            [ [ "i" ], rec( helplines := [
                 "show an overview of those irrationalities in the table",
                 "that have been displayed in the current call" ],
              action := function( t )
                local str;
  
                str:= legend( t.work.legend );
                if IsEmpty( str ) then
                  str:= "(no irrationalities yet in this table)";
                fi;
                if BrowseData.IsDoneReplay( t.dynamic.replay ) then
                  NCurses.Pager( str );
                  NCurses.update_panels();
                  NCurses.doupdate();
                  NCurses.curs_set( 0 );
                fi;
                return t.dynamic.changed;
              end ) ],
            [ [ "I" ], rec( helplines := [
                 "show an overview of all irrationalities in the table" ],
              action := function( t )
                local j, i, str;
  
                # We proceed column-wise, like the traditional `Display'.
                for j in [ 1 .. t.work.n ] do
                  for i in [ 1 .. t.work.m ] do
                    stringEntry( t.dynamic.chars[i][j], t.work.legend );
                  od;
                od;
                str:= legend( t.work.legend );
                if IsEmpty( str ) then
                  str:= "(no irrationalities in this table)";
                fi;
                if BrowseData.IsDoneReplay( t.dynamic.replay ) then
                  NCurses.Pager( str );
                  NCurses.update_panels();
                  NCurses.doupdate();
                  NCurses.curs_set( 0 );
                fi;
                return t.dynamic.changed;
              end ) ],
            [ [ "p" ], rec( helplines := [
                 "toggle power maps and centralizer orders" ],
              action := function( t )
                local i;

                if t.dynamic.togglePowerMaps then
                  for i in t.dynamic.hidecollabelspos do
                    t.dynamic.isRejectedLabelsCol[i]:=
                        not t.dynamic.isRejectedLabelsCol[i];
                  od;
                  t.dynamic.changed:= true;
                else
                  BrowseData.AlertWithReplay( t,
                      "The screen is too small for expanding power maps.",
                      NCurses.attrs.BOLD );
                fi;
                return t.dynamic.changed;
              end ) ],
          ] );
        fi;
      od;
    else
      modes:= BrowseData.defaults.work.customizedModes.ctbldisp;
    fi;

    # Store the positions of centralizer orders and power maps.
    hidecollabelspos:= [];

    # Construct the browse table.
    table:= rec(
      work:= rec(
        align:= "ct",
        header:= [ Identifier( tbl ) ],
        footer:= rec(
          # Show a description of a selected irrational value.
          select_entry:= function( t )
            local entry, result, pos, q;

            if t.dynamic.selectedEntry = [ 0, 0 ] then
              entry:= First( t.dynamic.categories[2],
                x -> [ x.pos, x.level ] = t.dynamic.selectedCategory ).value;
              pos:= PositionSublist( entry, " = " );
              entry:= entry{ [ pos+3 .. Length( entry ) ] };
            else
              entry:= t.work.Main( t,
                t.dynamic.indexRow[ t.dynamic.selectedEntry[1] ] / 2,
                t.dynamic.indexCol[ t.dynamic.selectedEntry[2] ] / 2 );
            fi;
            result:= [ "", "", "" ];
            if Int( entry ) = fail then
              while 0 < Length( entry ) and entry[1] in "-/*" do
                entry:= entry{ [ 2 .. Length( entry ) ] };
              od;
              pos:= Position( t.work.legend.irrnames, entry );
              if pos <> fail then
                result[2]:= Concatenation( t.work.legend.irrnames[ pos ],
                    " = ", String( t.work.legend.irrstack[ pos ] ) );
                q:= Quadratic( t.work.legend.irrstack[ pos ] );
                if q = fail then
                  result[3]:= "";
                else
                  result[3]:= Concatenation( RepeatedString( " ",
                        Length( t.work.legend.irrnames[ pos ] ) ), " = ",
                      q.display, " = ", q.ATLAS );
                fi;
              fi;
            fi;
            return result;
          end ),
        CategoryValues:= function( t, i, j )
          return [ Concatenation( nam[ j/2 ], " = ",
                       t.work.Main( t, i/2, j/2 ) ) ];
          end,
        availableModes:= modes,

        # Avoid computing strings for all character values in advance.
        main:= [],
        Main:= function( t, i, j )
          return stringEntry( t.dynamic.chars[i][j], t.work.legend );
        end,
        m:= Length( chars ),
        n:= Length( classes ),

        # The labels lists will be filled below.
        labelsRow:= [ List( charnames,
                        x -> rec( rows:= [ String( x ) ], align:= "l" ) ) ],
        labelsCol:= [],
        sepLabelsRow:= [ "" ],
        sepLabelsCol:= [],
        sepCol:= [ " " ],
        corner:= [],

        # Avoid computing all entries in a row for determining the heights.
        heightRow:= heights,

        legend:= stringEntryData,
      ),
      dynamic:= rec(
        activeModes:= [ First( modes, x -> x.name = "browse" ) ],
        sortFunctionForTableDefault:= BrowseData.CompareCharacterValues,
        sortFunctionForColumnsDefault:= BrowseData.CompareCharacterValues,
        sortFunctionForRowsDefault:= BrowseData.CompareCharacterValues,

        chars:= chars,

        # Store the indices relevant for hiding power maps.
        hidecollabelspos:= hidecollabelspos,

        # On small screens, it may be forbidden to expand power maps.
        togglePowerMaps:= true,
      ),
    );

    # Provide indicator columns.
    ind:= ListWithIdenticalEntries( Maximum( 1, Length( indicator ) ), "" );
    for i in indicator do
      Add( table.work.sepLabelsRow, " " );
      if i = 2 then
        list:= [];
        for j in cnr do
          if   indic[i][j] = 0 then
            Add( list, "o" );
          elif indic[i][j] = 1 then
            Add( list, "+" );
          else
            Add( list, "-" );
          fi;
        od;
        Add( table.work.labelsRow, list );
      else
        Add( table.work.labelsRow, List( indic[i]{ cnr }, String ) );
      fi;
    od;
    table.work.labelsRow:= TransposedMat( table.work.labelsRow );
    if indicator = [] then
      Append( table.work.sepLabelsRow, [ "", "" ] );
    else
      Append( table.work.sepLabelsRow, [ "" ] );
    fi;

    if centralizers = "ATLAS" then
      # Add centralizers themselves as column labels.
      Add( table.work.sepLabelsCol, " " );
      Add( table.work.corner, [ "" ] );
      Add( table.work.labelsCol,
           List( SizesCentralizers( tbl ){ cnr }, String ) );
#T admit splitting into two rows!
      Append( hidecollabelspos,
              2 * Length( table.work.labelsCol ) + [ 0, 1 ] );
    elif centralizers = true then
      # Add factored centralizer orders to the column labels.
      Add( table.work.sepLabelsCol, " " );
      for p in Set( FactorsInt( Size( tbl ) ) ) do
        Add( table.work.labelsCol, List( SizesCentralizers( tbl ){ cnr },
               x -> stringEntry( Number( Factors( x ), y -> y = p ),
                                 stringEntryData ) ) );
        Append( hidecollabelspos,
                2 * Length( table.work.labelsCol ) + [ 0, 1 ] );
        Add( table.work.corner,
             Concatenation( ind, [ stringEntry( p, stringEntryData ) ] ) );
        Add( table.work.sepLabelsCol, "" );
      od;
      Unbind( table.work.sepLabelsCol[ Length( table.work.sepLabelsCol ) ] );
    fi;

    # class names and power maps
    if IsRecord( powermap ) then

      # three lines: power maps, p' part, and class names
      Append( table.work.sepLabelsCol, [ " ", "", "", " " ] );
      Append( hidecollabelspos,
              2 * Length( table.work.labelsCol ) + [ 2 .. 7 ] );
      Append( table.work.labelsCol, [ powermap.power,
                                      powermap.prime,
                                      powermap.names ] );
      Append( table.work.corner, [ Concatenation( ind, [ "p " ] ),
                                   Concatenation( ind, [ "p'" ] ) ] );
      if   indicator = [] then
        Add( table.work.corner, [ "", "" ] );
      elif indicator = [ 2 ] then
        Add( table.work.corner, [ "", "ind" ] );
      else
        Add( table.work.corner,
             Concatenation( [ "ind" ], List( indicator, String ) ) );
      fi;

    else

      # first class names, then a row for each power map
      Add( table.work.sepLabelsCol, " " );
      Add( table.work.labelsCol, List( nam, String ) );
      Add( table.work.corner, Concatenation( ind, [ "" ] ) );

      for p in powermap do
        list:= CompositionMaps( nam, tbl_powermap[p] );
        for i in [ 1 .. Length( list ) ] do
          if not IsString( list[i] ) then
            list[i]:= "?";
          fi;
        od;
        Add( table.work.labelsCol, list );
        Append( hidecollabelspos,
                2 * Length( table.work.labelsCol ) + [ 0, 1 ] );
        Add( table.work.corner,
             Concatenation( ind, [ Concatenation( String( p ), "P" ) ] ) );
        Add( table.work.sepLabelsCol, "" );
      od;

      # Add a data row showing the indicator header (may be empty).
      Add( table.work.sepLabelsCol, "" );
      Add( table.work.sepLabelsCol, "" );
      Add( table.work.corner,
           Concatenation( [ "" ], List( indicator, String ) ) );

    fi;

    if indicator <> [] then
      # Replace the separator before the last indicator by empty
      # if its column is only one character wide.
      pos:= Length( indicator ) + 1;
      if indicator[ Length( indicator ) ] < 10 and
         ForAll( table.work.labelsRow, x -> Length( x[ pos ] ) <= 1 ) then
        table.work.sepLabelsRow[ pos ]:= "";
      fi;
    fi;

    # Check whether at least one character and at least the degree column
    # fit into the window (the footer needs at most three lines).
    # If the window is not high enough for the column labels then hide them
    # and forbid expanding them.
    table.work.minyx:= [ function( t )
      local maxyx, minyx;

      maxyx:= NCurses.getmaxyx( 0 );
      minyx:= BrowseData.MinimalWindowHeight( t ) + 3;
      if maxyx[1] < minyx then
        # Try to collapse power maps.
        if t.dynamic.togglePowerMaps then
        
          for i in t.dynamic.hidecollabelspos do
            t.dynamic.isRejectedLabelsCol[i]:= true;
          od;
          t.dynamic.togglePowerMaps:= false;
          minyx:= BrowseData.MinimalWindowHeight( t ) + 3;
        fi;
      fi;

      return minyx;
      end,
      BrowseData.MinimalWindowWidth ];

    # Enter the history if available.
    if log <> fail then
      table.dynamic.log:= log;
      table.dynamic.replay:= replay;
    fi;

    # Show the table.
    NCurses.BrowseGeneric( table );
end );

if CambridgeMaps = "dummy" then
  Unbind( CambridgeMaps );
fi;


#############################################################################
##
#F  BrowseDecompositionMatrix( <modtbl>[, <b>][, <options>] )
##
##  <#GAPDoc Label="BrowseDecompositionMatrix">
##  <ManSection>
##  <Func Name="BrowseDecompositionMatrix" Arg="modtbl[, b][, options]"/>
##
##  <Description>
##  This method displays the decomposition matrix of (the <A>b</A>-th block
##  of) the Brauer character table <A>modtbl</A> in a window.
##  The arguments are the same as for
##  <Ref Func="LaTeXStringDecompositionMatrix" BookName="ref"/>.
##  <P/>
##  The positions of the ordinary and modular irreducible characters
##  are shown in the labels of the rows and columns, respectively,
##  that are indexed by these characters.
##  When an entry in the decomposition matrix is selected then information
##  about the degrees of these characters is shown in the table footer.
##  <P/>
##  The full functionality of the function
##  <Ref Func="NCurses.BrowseGeneric"/> is available.
##  <P/>
##  <Example><![CDATA[
##  gap> BrowseData.SetReplay( Concatenation(
##  >         # select the first entry
##  >         "se",
##  >         # scroll in the table
##  >         "drrrr",
##  >         # keep the table open for a while
##  >         [ 14, 14, 14, 14, 14 ],
##  >         # and quit the application
##  >         "Q" ) );
##  gap> BrowseDecompositionMatrix( CharacterTable( "J1" ) mod 2 );
##  gap> BrowseData.SetReplay( false );
##  ]]></Example>
##  <P/>
##  The code can be found in the file <F>app/ctbldisp.g</F> of the package.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
BindGlobal( "BrowseDecompositionMatrix", function( arg )
    local options,       # record with labels, optional third argument
          blocknr,       # number of the block, optional second argument
          modtbl,        # Brauer character table, first argument
          decmat,        # decomposition matrix
          r, j,
          phi,           # string used for Brauer characters
          chi,           # string used for ordinary irreducibles
          collabels,     # indices of Brauer characters
          rowlabels,     # indices of ordinary characters
          block,         # block information on `modtbl'
          ordtbl, p, irr, orddegrees, moddegrees, extrowlabels, extcollabels,
          header, table;

    # Get and check the arguments.
    if   Length( arg ) = 2 and IsBrauerTable( arg[1] )
                           and IsRecord( arg[2] ) then
      options := arg[2];
    elif Length( arg ) = 2 and IsBrauerTable( arg[1] )
                           and IsInt( arg[2] ) then
      blocknr := arg[2];
      options := rec();
    elif Length( arg ) = 3 and IsBrauerTable( arg[1] )
                           and IsInt( arg[2] )
                           and IsRecord( arg[3] ) then
      blocknr := arg[2];
      options := arg[3];
    elif Length( arg ) = 1 and IsBrauerTable( arg[1] ) then
      options := rec();
    else
      Error( "usage: BrowseDecompositionMatrix(",
             " <modtbl>[, <blocknr>][, <options>] )" );
    fi;

    # Compute the decomposition matrix.
    modtbl:= arg[1];
    if IsBound( options.decmat ) then
      decmat:= options.decmat;
    elif IsBound( blocknr ) then
      decmat:= DecompositionMatrix( modtbl, blocknr );
    else
      decmat:= DecompositionMatrix( modtbl );
    fi;
    decmat:= List( decmat, ShallowCopy );
    for r in decmat do
      for j in [ 1 .. Length( r ) ] do
        if r[j] = 0 then
          r[j]:= ".";
        else
          r[j]:= String( r[j] );
        fi;
      od;
    od;

    # Choose default labels if necessary.
    phi:= "Y";
    chi:= "X";

    # Construct the labels if necessary.
    if IsBound( options.phi ) then
      phi:= options.phi;
    fi;
    if IsBound( options.chi ) then
      chi:= options.chi;
    fi;
    if IsBound( options.collabels ) then
      collabels:= options.collabels;
      if ForAll( collabels, IsInt ) then
        collabels:= List( collabels,
            i -> Concatenation( phi, "_", String(i) ) );
      fi;
    fi;
    if IsBound( options.rowlabels ) then
      rowlabels:= options.rowlabels;
      if ForAll( rowlabels, IsInt ) then
        rowlabels:= List( rowlabels,
            i -> Concatenation( chi, "_", String(i) ) );
      fi;
    fi;

    # Construct the labels if they are still missing.
    if not IsBound( collabels ) then
      if IsBound( blocknr ) then
        block     := BlocksInfo( modtbl )[ blocknr ];
        collabels := List( block.modchars, String );
      else
        collabels := List( [ 1 .. Length( decmat[1] ) ], String );
      fi;
      collabels:= List( collabels, i -> Concatenation( phi, "_", i ) );
    fi;
    if not IsBound( rowlabels ) then
      if IsBound( blocknr ) then
        block     := BlocksInfo( modtbl )[ blocknr ];
        rowlabels := List( block.ordchars, String );
      else
        rowlabels := List( [ 1 .. Length( decmat ) ], String );
      fi;
      rowlabels:= List( rowlabels, i -> Concatenation( chi, "_", i ) );
    fi;

    # Construct the information to be shown in the footer.
    ordtbl:= OrdinaryCharacterTable( modtbl );
    p:= UnderlyingCharacteristic( modtbl );
    irr:= List( Irr( ordtbl ), x -> x[1] );
    orddegrees:= List( [ 1 .. Length( irr ) ],
                       i -> Concatenation( String( irr[i] ), "_",
                                String( Number( [ 1 .. i ],
                                              x -> irr[x] = irr[i] ) ) ) );
    irr:= List( Irr( modtbl ), x -> x[1] );
    moddegrees:= List( [ 1 .. Length( irr ) ],
                       i -> Concatenation( String( irr[i] ), "_",
                                String( Number( [ 1 .. i ],
                                              x -> irr[x] = irr[i] ) ) ) );
    if IsBound( blocknr ) then
      orddegrees:= orddegrees{ block.ordchars };
      moddegrees:= moddegrees{ block.modchars };
    fi;
    extcollabels:= List( [ 1 .. Length( collabels ) ],
        i -> Concatenation( collabels[i], " = ", moddegrees[i] ) );
    extrowlabels:= List( [ 1 .. Length( rowlabels ) ],
        i -> Concatenation( rowlabels[i], " = ", orddegrees[i] ) );

    header:= Concatenation( Identifier( ordtbl ), " mod ", String( p ) );
    if IsBound( blocknr ) then
      Append( header, ", block " );
      Append( header, String( blocknr ) );
      Append( header, ", defect " );
      Append( header, String( PrimeBlocks( ordtbl, p ).defect[ blocknr ] ) );
    fi;

    # Construct the browse table.
    table:= rec(
      work:= rec(
        align:= "ct",
        header:= [ header, "" ],
        footer:= rec(
          # Show the degrees of the two irreducibles involved.
          select_entry:= function( t )
            local pos;

            if t.dynamic.selectedEntry = [ 0, 0 ] then
              return [ "", "", "" ];
            else
              pos:= [ t.dynamic.indexRow[ t.dynamic.selectedEntry[1] ] / 2,
                      t.dynamic.indexCol[ t.dynamic.selectedEntry[2] ] / 2 ];
              return [ "", extrowlabels[ pos[1] ], extcollabels[ pos[2] ] ];
            fi;
          end ),
        main:= decmat,
        labelsRow:= List( rowlabels,
                          x -> [ rec( rows:= [ x ], align:= "l" ) ] ),
        labelsCol:= [ List( collabels,
                            x -> rec( rows:= [ x ], align:= "l" ) ) ],
        sepLabelsRow:= [ "", "|" ],
        sepLabelsCol:= [ "", "-" ],
        sepCol:= [ " " ],
        corner:= [],
        SpecialGrid:= BrowseData.SpecialGridLineDrawPlus,
      ),
      dynamic:= rec(
      ),
    );

    # Enter the history if available.
    if IsBound( options.log ) and IsBound( options.replay ) then
      table.dynamic.log:= options.log;
      table.dynamic.replay:= options.replay;
    fi;

    NCurses.BrowseGeneric( table );
end );


#############################################################################
##
#E

