# SPDX-License-Identifier: GPL-2.0-or-later
# CAP: Categories, Algorithms, Programming
#
# Implementations
#

##
InstallMethod( DummyCategory,
        "for a record of options",
        [ IsRecord ],
        
  function( options )
    local category_constructor_options, dummy_function, C;
    
    category_constructor_options := ShallowCopy( options );
    category_constructor_options.category_filter := IsDummyCategory;
    category_constructor_options.category_object_filter := IsDummyCategoryObject;
    category_constructor_options.category_morphism_filter := IsDummyCategoryMorphism;
    category_constructor_options.supports_empty_limits := true;
    
    if "ObjectConstructor" in options.list_of_operations_to_install then
        
        category_constructor_options.object_constructor := function ( cat, object_datum )
            
            Error( "this is a dummy category without actual implementation" );
            
        end;
        
    fi;
    
    if "MorphismConstructor" in options.list_of_operations_to_install then
        
        category_constructor_options.morphism_constructor := function ( cat, source, morphism_datum, range )
            
            Error( "this is a dummy category without actual implementation" );
            
        end;
        
    fi;
    
    if "ObjectDatum" in options.list_of_operations_to_install then
        
        category_constructor_options.object_datum := function ( cat, object )
            
            Error( "this is a dummy category without actual implementation" );
            
        end;
        
    fi;
    
    if "MorphismDatum" in options.list_of_operations_to_install then
        
        category_constructor_options.morphism_datum := function ( cat, morphism )
            
            Error( "this is a dummy category without actual implementation" );
            
        end;
        
    fi;
    
    dummy_function := { operation_name, dummy } -> """
        function ( input_arguments... )
            
            Error( "this is a dummy category without actual implementation" );
            
        end
    """;
    
    category_constructor_options.create_func_bool := dummy_function;
    category_constructor_options.create_func_object := dummy_function;
    category_constructor_options.create_func_object_or_fail := dummy_function;
    category_constructor_options.create_func_morphism := dummy_function;
    category_constructor_options.create_func_morphism_or_fail := dummy_function;
    category_constructor_options.create_func_list_of_objects := dummy_function;
    
    C := CategoryConstructor( category_constructor_options );
    
    Finalize( C );
    
    return C;
    
end );
