#############################################################################
##
##  ToDoListEntry.gi                                 ToolsForHomalg package
##
##  Copyright 2007-2012, Mohamed Barakat, University of Kaiserslautern
##                       Sebastian Gutsche, RWTH-Aachen University
##                  Markus Lange-Hegermann, RWTH-Aachen University
##
##  Entries for ToDo-Lists.
##
#############################################################################

InstallValue( TODO_LIST_ENTRIES,
              rec( 
                   already_installed_immediate_methods := [ ]
                   
              )
);

DeclareRepresentation( "IsToDoListEntryRep",
                       IsToDoListEntry and IsAttributeStoringRep,
                       []
                     );

DeclareRepresentation( "IsToDoListEntryWithDefinedTargetRep",
                       IsToDoListEntryRep,
                       []
                     );

DeclareRepresentation( "IsToDoListEntryWithWeakPointersRep",
                       IsToDoListEntryWithDefinedTargetRep,
                       []
                     );

DeclareRepresentation( "IsToDoListEntryWithPointersRep",
                       IsToDoListEntryWithDefinedTargetRep,
                       []
                     );

DeclareRepresentation( "IsToDoListEntryForEquivalentPropertiesRep",
                       IsToDoListEntryWithDefinedTargetRep,
                       []
                     );

DeclareRepresentation( "IsToDoListEntryMadeFromOtherToDoListEntriesRep",
                       IsToDoListEntryWithDefinedTargetRep,
                       []
                     );

DeclareRepresentation( "IsToDoListEntryWithListOfSourcesRep",
                       IsToDoListEntryWithDefinedTargetRep,
                       []
                     );

DeclareRepresentation( "IsToDoListEntryWhichLaunchesAFunctionRep",
                       IsToDoListEntryRep,
                       []
                     );

BindGlobal( "TheFamilyOfToDoListEntries",
        NewFamily( "TheFamilyOfToDoListEntries" ) );

BindGlobal( "TheTypeToDoListEntryWithWeakPointers",
        NewType( TheFamilyOfToDoListEntries,
                IsToDoListEntryWithWeakPointersRep ) );

BindGlobal( "TheTypeToDoListEntryWithPointers",
        NewType( TheFamilyOfToDoListEntries,
                IsToDoListEntryWithPointersRep ) );

BindGlobal( "TheTypeToDoListEntryForEquivalentProperties",
        NewType( TheFamilyOfToDoListEntries,
                IsToDoListEntryForEquivalentPropertiesRep ) );

BindGlobal( "TheTypeToDoListEntryMadeFromOtherToDoListEntries",
        NewType( TheFamilyOfToDoListEntries,
                IsToDoListEntryMadeFromOtherToDoListEntriesRep ) );

BindGlobal( "TheTypeToDoListEntryWithListOfSources",
        NewType( TheFamilyOfToDoListEntries,
                IsToDoListEntryWithListOfSourcesRep ) );

BindGlobal( "TheTypeToDoListWhichLaunchesAFunction",
        NewType( TheFamilyOfToDoListEntries,
                IsToDoListEntryWhichLaunchesAFunctionRep ) );
            

##########################################
##
## Methods
##
##########################################

##
InstallMethod( ProcessAToDoListEntry,
               [ IsToDoListEntryWithDefinedTargetRep ],
               
  function( entry )
    local source_list, source, pull_attr, target, push_attr, tester_var;
    
    source_list := SourcePart( entry );
    
    if source_list = fail then
        
        return fail;
        
    fi;
    
    target := TargetPart( entry );
    
    if target = fail then
    
        return fail;
    
    fi;
    
    tester_var := true;
    
    for source in source_list do
          
        pull_attr := ValueGlobal( source[ 2 ] );
        
        if not Tester( pull_attr )( source[ 1 ] ) then
            
            tester_var := false;
            
            break;
            
        elif not pull_attr( source[ 1 ] ) = source[ 3 ] then
            
            SetFilterObj( entry, PreconditionsDefinitelyNotFulfilled );
            
            return true;
        fi;
        
    od;
    
    if tester_var then
        
        push_attr := ValueGlobal( target[ 2 ] );
        
        Setter( push_attr )( target[ 1 ], target[ 3 ] );
        
        Remove( ToDoList( target[ 1 ] )!.maybe_from_others, Position( ToDoList( target[ 1 ] )!.maybe_from_others, entry ) );
        
        Add( ToDoList( target[ 1 ] )!.from_others, entry );
        
        return true;
        
    fi;
    
    return false;
    
end );

##
InstallMethod( AreCompatible,
               "for todo-list entries",
               [ IsToDoListEntryWithDefinedTargetRep, IsToDoListEntry ],
               
  function( entry1, entry2 )
    
    return  Position( SourcePart( entry2 ), TargetPart( entry1 ) ) <> fail;
    
end );

##
InstallMethod( ToDoListEntryWithWeakPointers,
               "for 6 arguments",
               [ IsObject, IsString, IsObject, IsObject, IsString, IsObject ],
               
  function( M, attr_to_pull, val_to_pull, obj_to_push, attr_to_push, val_to_push )
    local string_list, value_list, entry;
    
    value_list := WeakPointerObj( [ M, val_to_pull, obj_to_push, val_to_push ] );
    
    string_list := [ attr_to_pull, attr_to_push ];
    
    entry := rec( );
    
    ObjectifyWithAttributes( entry, TheTypeToDoListEntryWithWeakPointers );
    
    entry!.value_list := value_list;
    
    entry!.string_list := string_list;
    
    CreateImmediateMethodForToDoListEntry( entry );
    
    return entry;
    
end );

##
InstallMethod( SourcePart,
               "for weak pointer entries",
               [ IsToDoListEntryWithWeakPointersRep ],
               
  function( entry )
    
    if not IsBoundElmWPObj( entry!.value_list, 1 ) or not IsBoundElmWPObj( entry!.value_list, 2 ) then
        
        return fail;
        
    fi;
    
    return [ [ ElmWPObj( entry!.value_list, 1 ), entry!.string_list[ 1 ], ElmWPObj( entry!.value_list, 2 ) ] ];
    
end );

##
InstallMethod( TargetPart,
               "for weak pointer entries",
               [ IsToDoListEntryWithWeakPointersRep ],
               
  function( entry )
    
    if not IsBoundElmWPObj( entry!.value_list, 3 ) or not IsBoundElmWPObj( entry!.value_list, 4 ) then
        
        return fail;
        
    fi;
    
    return [ ElmWPObj( entry!.value_list, 3 ), entry!.string_list[ 2 ], ElmWPObj( entry!.value_list, 4 ) ];
    
end );

##
InstallMethod( ToDoListEntryWithPointers,
               "for 6 arguments",
               [ IsObject, IsString, IsObject, IsObject, IsString, IsObject ],
               
  function( M, attr_to_pull, val_to_pull, obj_to_push, attr_to_push, val_to_push )
    local entry;
    
    entry := rec( );
    
    ObjectifyWithAttributes( entry, TheTypeToDoListEntryWithPointers );
    
    entry!.list := [ M, attr_to_pull, val_to_pull, obj_to_push, attr_to_push, val_to_push ];
    
    CreateImmediateMethodForToDoListEntry( entry );
    
    return entry;
    
end );

##
InstallMethod( SourcePart,
               "for entries with pointers",
               [ IsToDoListEntryWithPointersRep ],
               
  function( entry )
    
    return [ entry!.list{ [ 1, 2, 3 ] } ];
    
end );

##
InstallMethod( TargetPart,
               "for entries with pointers",
               [ IsToDoListEntryWithPointersRep ],
               
  function( entry )
    
    return entry!.list{ [ 4, 5, 6 ] };
    
end );

InstallMethod( GenesisOfToDoListEntry,
               "for atomic entries",
               [ IsToDoListEntry ],
               
  function( entry )
    
    return [ entry ];
    
end );

##
InstallMethod( JoinToDoListEntries,
               "for a list of ToDo-list entries",
               [ IsList ],
               
  function( list )
    local new_entry;
    
    if list = [ ] then
        
        return [ ];
        
    fi;
    
    if not ForAll( list, IsToDoListEntry ) then
        
        Error( "must be a list of ToDo-list entries\n" );
        
    fi;
    
    if not ForAll( [ 1 .. Length( list ) - 1 ], i -> AreCompatible( list[ i ], list[ i + 1 ] ) ) then
        
        Error( "entries are not compatible\n" );
        
    fi;
    
    if not ForAll( [ 1 .. Length( list ) - 1 ], i -> IsToDoListEntryWithDefinedTargetRep( list[ i ] ) ) then
        
        Error( "entries without targets cannot be composed\n" );
        
    fi;
    
    new_entry := rec ( );
    
    ObjectifyWithAttributes( new_entry, TheTypeToDoListEntryMadeFromOtherToDoListEntries );
    
    SetGenesisOfToDoListEntry( new_entry, Concatenation( List( list, GenesisOfToDoListEntry ) ) );
    
    return new_entry;
    
end );

##
InstallMethod( SourcePart,
               "for concatenation",
               [ IsToDoListEntryMadeFromOtherToDoListEntriesRep ],
               
  function( entry )
    local gen;
    
    gen := GenesisOfToDoListEntry( entry );
    
    return SourcePart( gen[ 1 ] );
    
end );

##
InstallMethod( TargetPart,
               "for concatenation",
               [ IsToDoListEntryMadeFromOtherToDoListEntriesRep ],
               
  function( entry )
    local gen;
    
    gen := GenesisOfToDoListEntry( entry );
    
    return TargetPart( gen[ Length( gen ) ] );
    
end );

##
InstallMethod( CreateImmediateMethodForToDoListEntry,
               "for a ToDo-list entry",
               [ IsToDoListEntry ],
               
  function( entry )
    local source_list, source, cat, tester;
    
    source_list := SourcePart( entry );
    
    if source_list = fail then
        
        return;
        
    fi;
    
    for source in source_list do
        
        cat := CategoriesOfObject( source[ 1 ] );
        
        cat := ValueGlobal( cat[ Length( cat ) ] );
        
        tester := Tester( ValueGlobal( source[ 2 ] ) );
        
        tester := cat and tester;
        
        if Position( TODO_LIST_ENTRIES.already_installed_immediate_methods, tester ) <> fail then
            
            return;
            
        else
            
            Add( TODO_LIST_ENTRIES.already_installed_immediate_methods, tester );
            
        fi;
        
        InstallImmediateMethod( ProcessToDoList,
                                HasSomethingToDo and tester,
                                0,
                                
          function( object )
              
              if not HasSomethingToDo( object ) then
                  
                  TryNextMethod();
                  
              fi;
              
              ProcessToDoList_Real( object );
              
              TryNextMethod();
              
        end );
        
    od;
    
end );

######################
##
## ToDoListEntryWithListOfSources
##
######################

##
InstallMethod( ToDoListEntryWithListOfSources,
               "todo list entry with list of sources",
               [ IsList, IsObject, IsString, IsObject ],
               
  function( source_list, obj_to_push, attr_to_push, val_to_push )
    local entry;
    
    if not ForAll( source_list, i -> IsString( i[ 2 ] ) and Length( i ) = 3 ) then
        
        Error( "wrong input format" );
        
    fi;
    
    entry := rec( source_list := source_list, targetlist := [ obj_to_push, attr_to_push, val_to_push ] );
    
    ObjectifyWithAttributes( entry, TheTypeToDoListEntryWithListOfSources );
    
    return entry;
    
end );

##
InstallMethod( SourcePart,
               "for entries with lists of sources",
               [ IsToDoListEntryWithListOfSourcesRep ],
               
  function( entry )
    
    return entry!.source_list;
    
end );

##
InstallMethod( TargetPart,
               "for entries with lists of sources",
               [ IsToDoListEntryWithListOfSourcesRep ],
               
  function( entry )
    
    return entry!.targetlist;
    
end );

######################
##
## ToDoListEntryWhichLaunchesAFunction
##
######################

##
InstallMethod( ToDoListEntryWhichLaunchesAFunction,
               "constructor",
               [ IsList, IsFunction ],
               
  function( source_list, func )
    local entry;
    
    if not ForAll( source_list, i -> IsString( i[ 2 ] ) and Length( i ) = 3 ) then
        
        Error( "wrong input format" );
        
    fi;
    
    entry := rec( source_list := source_list, func := func );
    
    ObjectifyWithAttributes( entry, TheTypeToDoListWhichLaunchesAFunction );
    
    return entry;
    
end );

##
InstallMethod( SourcePart,
               "for entries that launches functions",
               [ IsToDoListEntryWhichLaunchesAFunctionRep ],
               
  function( entry )
    
    return entry!.source_list;
    
end );

##
InstallMethod( TargetPart,
               "for entries that launches functions",
               [ IsToDoListEntryWhichLaunchesAFunctionRep ],
               
  function( entry )
    
    return entry!.func;
    
end );

##
InstallMethod( ProcessAToDoListEntry,
               [ IsToDoListEntryWhichLaunchesAFunctionRep ],
               
  function( entry )
    local source_list, source, pull_attr, target, push_attr, tester_var;
    
    source_list := SourcePart( entry );
    
    if source_list = fail then
        
        return fail;
        
    fi;
    
    target := TargetPart( entry );
    
    if target = fail then
    
        return fail;
    
    fi;
    
    tester_var := true;
    
    for source in source_list do
          
        pull_attr := ValueGlobal( source[ 2 ] );
        
        if not Tester( pull_attr )( source[ 1 ] ) then
            
            tester_var := false;
            
            break;
            
        elif not pull_attr( source[ 1 ] ) = source[ 3 ] then
            
            SetFilterObj( entry, PreconditionsDefinitelyNotFulfilled );
            
            return true;
        fi;
        
    od;
    
    if tester_var then
        
        target();
        
        return true;
        
    fi;
    
    return false;
    
end );

######################
##
## Display & View
##
######################

##
InstallMethod( ViewObj,
               "for todo-list entries",
               [ IsToDoListEntry ],
               
  function( entry )
    local source_list, source, i, target, string;
    
    source_list := SourcePart( entry );
    
    target := TargetPart( entry );
    
    if source_list <> fail and target <> fail then
        
        source := source_list[ 1 ];
        
        Print( "<The ToDo-list entry: " );
        
        Print( Concatenation( source[ 2 ], "( ", String( source[ 1 ] ), " ) = ", String( source[ 3 ] ) ) );
        
        for i in [ 2 .. Length( source_list ) ] do
            
            source := source_list[ i ];
            
            Print( " and " );
            
            Print( Concatenation( source[ 2 ], "( ", String( source[ 1 ] ), " ) = ", String( source[ 3 ] ) ) );
            
        od;
        
        Print( " => " );
        
        if IsFunction( target ) then
            
            Print( target );
            
        else
            
            Print( Concatenation( target[ 2 ], "( ", String( target[ 1 ] ), " ) = ", String( target[ 3 ] ) ) );
            
        fi;
        
        Print( ">" );
        
    else
        
        Print( "<An incomplete ToDo-list entry>" );
        
    fi;
    
end );

##
InstallMethod( Display,
               "for todo-list entry",
               [ IsToDoListEntry ],
               
  function( entry )
    local source_list, i, source, target, string;
    
    source_list := SourcePart( entry );
    
    target := TargetPart( entry );
    
    if source_list <> fail and target <> fail then
        
        source := source_list[ 1 ];
        
        Print( "<The ToDo-list entry: " );
        
        Print( Concatenation( source[ 2 ], "( ", String( source[ 1 ] ), " ) = ", String( source[ 3 ] ) ) );
        
        for i in [ 2 .. Length( source_list ) ] do
            
            source := source_list[ i ];
            
            Print( " and " );
            
            Print( Concatenation( source[ 2 ], "( ", String( source[ 1 ] ), " ) = ", String( source[ 3 ] ) ) );
            
        od;
        
        if HasDescriptionOfImplication( entry ) then
            
            Print( "\n" );
            
            Print( Concatenation( "because ", DescriptionOfImplication( entry ), "\n" ) );
            
        fi;
        
        Print( " => " );
        
        if IsFunction( target ) then
            
            Print( target );
            
        else
            
            Print( Concatenation( target[ 2 ], "( ", String( target[ 1 ] ), " ) = ", String( target[ 3 ] ) ) );
            
        fi;
        
        Print( ".\n" );
        
    else
        
        Print( "An incomplete ToDo-list entry.\n" );
        
    fi;
    
end );

##
InstallMethod( Display,
               "for concatenated ToDo-list entries",
               [ IsToDoListEntryMadeFromOtherToDoListEntriesRep ],
               
  function( entry )
    local gen, sourcelist, targetlist, target;
    
    gen := GenesisOfToDoListEntry( entry );
    
    sourcelist := List( gen, SourcePart );
    
    targetlist := List( gen, TargetPart );
    
    if ForAny( sourcelist, i -> i = fail ) or ForAny( targetlist, i -> i = fail ) then
        
        Print( "An incomplete ToDo-list entry.\n" );
        
    fi;
    
    Print( "The ToDo-list entry:\n" );
    
    ## FIXME: This needs to be done more accurate, once the new structure is fully functional
    Print( Concatenation( sourcelist[ 1 ][ 1 ][ 2 ], "( ", String( sourcelist[ 1 ][ 1 ][ 1 ] ), " ) = ", String( sourcelist[ 1 ][ 1 ][ 3 ] ) ) );
    
    for target in [ 1 .. Length( targetlist ) ] do
        
        Print( "\n" );
        
        if HasDescriptionOfImplication( gen[ target ] ) then
            
            Print( Concatenation( "because ", DescriptionOfImplication( gen[ target ] ), "\n" ) );
        fi;
        
        Print( " => " );
        
        target := targetlist[ target ];
        
        if IsFunction( target ) then
            
            Print( target );
            
        else
            
            Print( Concatenation( target[ 2 ], "( ", String( target[ 1 ] ), " ) = ", String( target[ 3 ] ) ) );
            
        fi;
        
    od;
    
    Print( ".\n" );
    
end );
