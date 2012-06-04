#############################################################################
##
#W  hurwitzTests.g                  FR Package               Jakob Kroeker
##
#H  @(#)$Id: hurwitzTests.g,v 1.1 2012/05/10 23:43:49 gap Exp $
##
#Y  Copyright (C) 2012,  Laurent Bartholdi
##
#############################################################################
##
##  This file containts tests for the hurwitz package
##
#############################################################################


#test GAPRenormalization 
BindGlobal("HURWITZTEST_RENORMALIZATION_@", function()
	local fieldSize, finiteField, criticalValues,criticalValuesTrans;
	fieldSize := 7;
	finiteField :=GF(fieldSize);	
	criticalValues := [ 0*Z(fieldSize), Z(fieldSize)^1, Z(fieldSize)^6 ,infinity];
	criticalValuesTrans:= GET_TRANSFORMED_CRITICAL_VALUES@FR(criticalValues,finiteField);
	Assert(0, criticalValuesTrans[0]=infinity);
	Assert(0, criticalValuesTrans[1]=Zero(finiteField) );
	Assert(0, criticalValuesTrans[2]=One(finiteField) );	
end);


# test search space size counting
BindGlobal("HURWITZTEST_SEARCH_SPACE_SIZE_@", function()
	local fieldSize, finiteField, permutations,  criticalValues, countonly;

	fieldSize:=11;
	finiteField:= Field( Z(fieldSize) );
	permutations:=[ (1,5,11,6)(2,3)(4,10)(7,12)(8,13,9),
			 (1,7,13,2)(3,8)(4,5)(6,12)(9,11,10),
			 (1,3,9,4)(2,8)(5,10)(6,7)(11,13,12) ];

	criticalValues := [infinity, 0*Z(fieldSize),Z(fieldSize)^1];
	countonly:=true;

	SOLVEHURWITZMODP@FR( finiteField, permutations, criticalValues, countonly);
end );



# test default configuration (three branch values, no strict normalization)
BindGlobal("HURWITZTEST_THREE_CV_@", function()
	local fieldSize, finiteField, permutations, degree, partitions,  criticalValues,criticalValuesTrans, countonly, maps;
	
	fieldSize := 11;
	finiteField := GF(fieldSize);
	permutations := [(1,2),(2,3),(1,2,3)];
	degree := Maximum(List(permutations,LargestMovedPoint));
	partitions := List(permutations,p->CycleLengths(p,[1..degree]));
	criticalValues := [ infinity, 0*Z(fieldSize), Z(fieldSize)^0 ];
	countonly := false;
	
	maps := SOLVEHURWITZMODP@FR(finiteField ,permutations,criticalValues, countonly );
	criticalValuesTrans:= GET_TRANSFORMED_CRITICAL_VALUES@( criticalValues,finiteField );
	CHECK_FINITE_FIELD_MAP@(  maps[1], partitions, criticalValues,criticalValuesTrans, false );
	
	maps:=[];
	criticalValues := [ 0*Z(fieldSize), infinity, Z(fieldSize)^0 ];
	maps := SOLVEHURWITZMODP@FR( finiteField, permutations ,criticalValues, countonly );
	criticalValuesTrans:= GET_TRANSFORMED_CRITICAL_VALUES@(criticalValues,finiteField);
	CHECK_FINITE_FIELD_MAP@(  maps[1], partitions, criticalValues,criticalValuesTrans, false );
	# kept an example for CoefficientsOfUnivariatePolynomial and IntFFESymm usage:
	# List( last, p->List( CoefficientsOfUnivariatePolynomial(p), IntFFESymm) );
end );


# test strict normalization
BindGlobal("HURWITZTEST_STRICT_NORMALIZATION_@", function()
	local fieldSize, finiteField, permutations, degree, partitions,  criticalValues, criticalValuesTrans,countonly,strictNormalization, maps;
	
	fieldSize := 11;
	finiteField := GF(fieldSize);
	permutations := [(1,2),(2,3),(1,2,3)];
	degree := Maximum(List(permutations,LargestMovedPoint));
	partitions := List(permutations,p->CycleLengths(p,[1..degree]));
	partitions := [ [2,1], [1,2], [3] ];
	criticalValues := [  infinity, 0*Z(fieldSize), Z(fieldSize)^0 ];
	countonly := false;
	strictNormalization := true;

	maps := SOLVEHURWITZMODPBYSHAPE@FR( finiteField, partitions ,criticalValues, countonly, strictNormalization );
	criticalValuesTrans:= GET_TRANSFORMED_CRITICAL_VALUES@(criticalValues,finiteField);
	CHECK_FINITE_FIELD_MAP@(  maps[1], partitions, criticalValues,criticalValuesTrans, strictNormalization );
end );


# test more than 3 critical values; default normalization
BindGlobal("HURWITZTEST_FOUR_CRITICAL_VALUES_@", function()
	local fieldSize, finiteField, permutations, degree, partitions,  criticalValues,criticalValuesTrans, countonly, strictNormalization, maps;
	
	fieldSize := 7;
	finiteField :=GF(fieldSize);	 
	partitions := [ [2,1],[2,1],[2,1],[2,1] ]; 
	criticalValues := [infinity, 0*Z(fieldSize), Z(fieldSize)^0, Z(fieldSize)^5 ];
	countonly :=false;
	strictNormalization := false;
	
	maps  := SOLVEHURWITZMODPBYSHAPE@FR(finiteField,partitions,criticalValues, countonly, strictNormalization);

	criticalValuesTrans:= GET_TRANSFORMED_CRITICAL_VALUES@(criticalValues,finiteField);
	CHECK_FINITE_FIELD_MAP@(  maps[1], partitions, criticalValues,criticalValuesTrans, strictNormalization );
end );


# test more than 3 critical values, different normalization.
BindGlobal("HURWITZTEST_UNCOMMON_CV_@", function()
	local fieldSize, finiteField, permutations, degree, partitions,  criticalValues, criticalValuesTrans,countonly,  strictNormalization, maps;
	
	fieldSize := 7;
	finiteField :=GF(fieldSize);	 
	partitions := [ [2,1],[2,1],[2,1],[2,1] ]; 
	criticalValues := [infinity, 0*Z(fieldSize), Z(fieldSize)^1, Z(fieldSize)^6 ];
	
	
	countonly :=false;
	strictNormalization := false;
	
	maps  := SOLVEHURWITZMODPBYSHAPE@FR(finiteField,partitions,criticalValues, countonly, strictNormalization);
	criticalValuesTrans:= GET_TRANSFORMED_CRITICAL_VALUES@(criticalValues,finiteField);
	CHECK_FINITE_FIELD_MAP@(  maps[1], partitions, criticalValues,criticalValuesTrans, strictNormalization );
	
	maps:=[];
	criticalValues := [ 0*Z(fieldSize), infinity, Z(fieldSize)^0, Z(fieldSize)^1 ];
	maps  := SOLVEHURWITZMODPBYSHAPE@FR(finiteField,partitions,criticalValues, countonly, strictNormalization);
	criticalValuesTrans:= GET_TRANSFORMED_CRITICAL_VALUES@(criticalValues,finiteField);
	CHECK_FINITE_FIELD_MAP@(  maps[1], partitions, criticalValues,criticalValuesTrans, strictNormalization );
	
end );



