#############################################################################
##
#W  hurwitzUtils.g                  FR Package               Jakob Kroeker
##
#H  @(#)$Id: hurwitzUtils.g,v 1.1 2012/05/10 23:43:49 gap Exp $
##
#Y  Copyright (C) 2012,  Laurent Bartholdi
##
#############################################################################
##
##  This file containts utility function for the hurwitz package
##
#############################################################################


# transform values to homogen coordinates
BindGlobal("HOMOGENIZE_VALUES@", function( values, field )
	local ValuesHom,i;
	 ValuesHom:= List ( [0..Size(values)],n->0 );
	    for i in [1..Length(values)] do
		if values[i]=infinity then       	
			 ValuesHom[i] := [One(field),Zero(field)]; 
		else 
			ValuesHom[i] := [values[i],One(field)]; 
		fi;
			
	    od;
	    return ValuesHom;
end);


# transform homogen coordinates to ordinary coordinates
BindGlobal("DEHOMOGENIZE_VALUES@", function( ValuesHom, field )
	local values,i;
	 values := List ( [0..Size(ValuesHom)], n->0 );
	    for i in [1..Length(values)] do
		if ValuesHom[i][2]=Zero(field) then       	
			 values[i] := infinity;
		else 
			values[i] := ValuesHom[i][1]/ValuesHom[i][2]; 
		fi;
			
	    od;
	    return values;
end);

# compute a map which transforms first three critical values to (infinity, 0, 1).
BindGlobal("GET_NORMALIZATION_MAP@", function( criticalValuesHom )
	local mat, i;
	 mat := [ [ criticalValuesHom[2][2], -criticalValuesHom[2][1]  ] , [ criticalValuesHom[1][2],-criticalValuesHom[1][1]] ];
  	 i := mat*criticalValuesHom[3];
    	 mat := -[ mat[1]*i[2], mat[2]*i[1] ];   
    	 return mat;
end);

# normalize critical values (map first three to (infinity, 0, 1)
BindGlobal("GET_TRANSFORMED_CRITICAL_VALUES@", function( criticalValues,finiteField )
	local criticalValuesHom, mat, criticalValuesHomTrans, criticalValuesTrans, i;
	criticalValuesHom:=HOMOGENIZE_VALUES@FR(criticalValues,finiteField);
	mat := GET_NORMALIZATION_MAP@FR(criticalValuesHom);	
	criticalValuesHomTrans:= List(criticalValuesHom,x->mat*x);
	criticalValuesTrans:=DEHOMOGENIZE_VALUES@FR(criticalValuesHomTrans,finiteField);
    	 return criticalValuesTrans;
end);


# compare two shapes
BindGlobal("SHAPES_EQUAL@", function(  shape1, shape2 )
	local shapeCopy1,shapeCopy2;
	shapeCopy1:=ShallowCopy(shape1);
	shapeCopy2:=ShallowCopy(shape2);
	Sort(shapeCopy1);
	Sort(shapeCopy2);
	return (Reversed(shapeCopy1) = Reversed(shapeCopy2) ) ;
end );

# make polynomial monic.
# only possible if coefficients are invertible.
BindGlobal("NORMALIZE_POLYNOMIAL@", function( polynomial)
	
	return polynomial*LeadingCoefficient(polynomial)^-1;
end );

# normalize a list of polynomials.
BindGlobal("NORMALIZE_FACTORS@", function(factors)
	local resFactors,factor;
	resFactors := [];
	for factor in factors do
		Append( resFactors, [ NORMALIZE_POLYNOMIAL@(factor) ] );
	od;
	return resFactors;
end );

# return factors of a polynomial with the property that for each pair of the factors their Gcd is always at most a constant.
 BindGlobal("UNIQUE_FACTORS@",function(polynomial)
 	local factors, factor1, factor2 ;
	factors:= Set (NORMALIZE_FACTORS@( Factors( polynomial) ) );
	for factor1 in factors do
		for factor2 in factors do
			if not factor1=factor2 then	
				Assert (0, Degree( Gcd( factor1,factor2) )<1   );
			fi;
		od;
	od;
	return factors;
end );


# compute the shape of an univariate polynomial 
# the parameter 'expected degree' is required to determine the shape correctly even the polynomial has infinity as a factor
  BindGlobal("COMPUTE_SHAPE@", function( polynomial, expectedDegree )
	local shape,factors,factor,i,multiplicity,tmp;
	shape := [];
	factors:= UNIQUE_FACTORS@( polynomial) ;
	Degree(polynomial);
	for factor in factors do
		tmp:=polynomial;
		multiplicity := 0;
		tmp:=tmp/factor;
		while Degree( DenominatorOfRationalFunction(tmp) )<=0 do
			tmp := tmp/factor;
			multiplicity:=multiplicity+1;
		od;
		
		for i in [ 1..Degree(factor) ] do
			Append( shape, [multiplicity] );
		od;
	od;
	if Sum(shape)<expectedDegree then
		Append( shape,  [expectedDegree- Sum(shape)] );
	fi;
	Sort(shape);
	return Reversed(shape);
end );

# compute the shape of an univariate polynomial 
# the parameter 'expected degree' is required to determine the shape correctly even the polynomial has infinity as a factor
  BindGlobal("UNIQUE_PRODUCT@", function( polynomial )
    local uniqueProduct, factors, factor, multiplicity, tmp;
   
    uniqueProduct := [];
    factors := UNIQUE_FACTORS@( polynomial) ;
    Degree(polynomial);
    for factor in factors do
        tmp:=polynomial;
        multiplicity := 0;
        tmp:=tmp/factor;
        while Degree( DenominatorOfRationalFunction(tmp) )<=0 do
            tmp := tmp/factor;
            multiplicity:=multiplicity+1;
        od;
        Append( uniqueProduct, [ [factor, multiplicity] ] );
    od;
    return uniqueProduct;
end );


  BindGlobal("PRODUCT_VALUE@", function( product )
    local value, power;
   
    value := 1 ;
    for power in product do
        value := value* power[1]^power[2];
    od;
    return value;
end );

# get the multiplicity of a root in a polynomial.
# poldegree is passed to get the correct multiplicity of the infinity root.
BindGlobal("GET_ROOT_MULTIPLICITY@",function(polynomial,poldegree, root) 
	local mapFactors, rootMultiplicity, factor;
	if Degree(polynomial)<poldegree and root=infinity then 
		return poldegree-Degree(polynomial);
	fi;
	mapFactors:= Factors( polynomial );	 
	rootMultiplicity := 0;
	for factor in mapFactors do	
		if IsZero(Value(factor, root)) then
			rootMultiplicity := rootMultiplicity+Degree(factor);	
		fi;
	od;	 
	return rootMultiplicity;
end );



# restrictions: test probably not correct for extension fields ( e.g. line 'fam:=' ...
BindGlobal("CHECK_FINITE_FIELD_MAP@", function( mapData, partitions, criticalValues,criticalValuesTrans, strictNormalization )
	local  degree, polynomial, shape, i, polSetData, fam, rm, map, W1, W2, Wi, expected;
	
	degree := Sum( partitions[1] );
	map := mapData[1];
	polynomial := NumeratorOfRationalFunction( map ) ;
	shape := COMPUTE_SHAPE@( polynomial, degree ); 
	Assert(0, SHAPES_EQUAL@( COMPUTE_SHAPE@(polynomial,degree ), partitions[2] ));

	polynomial := DenominatorOfRationalFunction( map ) ;
	Assert(0, SHAPES_EQUAL@( COMPUTE_SHAPE@(polynomial,degree ), partitions[1] ));
	
	polynomial := NumeratorOfRationalFunction( map-1 ) ;
	Assert(0, SHAPES_EQUAL@( COMPUTE_SHAPE@(polynomial,degree ), partitions[3] ));
	
	#check if normalization is correct
	if strictNormalization then	
		polynomial  :=  NumeratorOfRationalFunction( map );
		rm := GET_ROOT_MULTIPLICITY@(polynomial, degree, criticalValues[2] );
		Assert(0, rm = partitions[2][1] ); # expected zero root with  multiplicity shapes[2][1](=1).
		polynomial :=  DenominatorOfRationalFunction( map );
		rm := GET_ROOT_MULTIPLICITY@(polynomial,degree, criticalValues[1] );
		Assert(0, rm = partitions[1][1] ); # expected infinity root with  multiplicity shapes[1][1](=2).

		polynomial  :=  NumeratorOfRationalFunction( map-1 );
		rm := GET_ROOT_MULTIPLICITY@(polynomial, degree, criticalValues[3]  );
		Assert(0, rm = partitions[3][1] ); # expected one root with  multiplicity shapes[3][1](=3).
		
	fi;
	polSetData := mapData[2];
	# fam:= FamilyObj(One(finiteField));
	fam:= FamilyObj( One( LeadingCoefficient(polynomial)^-1*LeadingCoefficient(polynomial) ));
	W1 := UnivariatePolynomialByCoefficients( fam, polSetData[1] );
	W2 := UnivariatePolynomialByCoefficients( fam, polSetData[2] );
	
	# check shapes and critical values.
	for i in [3..Size(polSetData)] do
		Wi  := UnivariatePolynomialByCoefficients( fam, polSetData[i] );
		Assert(0, SHAPES_EQUAL@( COMPUTE_SHAPE@(Wi,degree ), partitions[i] ));
		
		expected := W2 - criticalValuesTrans[i]*W1;
		Assert(0, expected = Wi );
	od;
end );

