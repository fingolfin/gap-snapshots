#############################################################################
##
#W hurwitz.g                                                Laurent Bartholdi
##                                                               Jakob Kröker
##
#H   @(#)$Id: hurwitz.g,v 1.4 2012/05/13 19:11:57 gap Exp $
##
#Y Copyright (C) 2012, Laurent Bartholdi
##
#############################################################################
##
##  Solutions to the Hurwitz problem
##
#############################################################################

# hack: todo: fix!
HURWITZMAPSEARCHBIN@:="hurwitzMapSearch";

ReadPackage("fr","gap/hurwitzUtils.g");
ReadPackage("fr","gap/padicLift.g");

# Jacob: I would prefer everything to be in this file, so that it will be easier to maintain / separate our contributions.

BindGlobal("SOLVEHURWITZMODPBYSHAPE@", function(field,shapes,criticalValues,count,strictNormalization)
    local convayPolynomial, flags, input, output, f, degree, i, mat, p, poly, rat,criticalValuesHom,criticalValuesHomTrans;
    
    while not ( IsField(field)  and ForAll(criticalValues,x->x in field or x=infinity) 
                and IsDuplicateFree(criticalValues) and IsBool(count)
              ) do
        Error("Arguments should be <field>(IsField), <perms>(IsPerm), <criticalValues>, <count>(boolean) ");
    od;
    while Length(criticalValues)<>Length(shapes) do
        Error("Fields <shapes> and <criticalValues> should have same length");
    od;
    degree := Sum(shapes[1]);
    while Sum(List(shapes,x->Sum(x-1)))<>2*degree-2 do
        Error("Sum of local degrees does not add to 2*degree-2 = ",2*degree-2);
    od;

    input := "";
    f := OUTPUTTEXTSTRING@(input);
    flags := 0;
    if InfoLevel(InfoFR)>1 then
        flags := flags+1;
    fi;
    if count then
        flags := flags+2;
    fi;
     if strictNormalization then
        flags := flags+4;
    fi;
    convayPolynomial:= ConwayPolynomial( Characteristic(field),DegreeOverPrimeField(field) );
    PrintTo(f, flags," ",
            Characteristic(field)," ",
            DegreeOverPrimeField(field),"\n",
            JoinStringsWithSeparator( List(CoefficientsOfUnivariatePolynomial( convayPolynomial ),IntFFE )," "),"\n",
            degree," ",
            Length(criticalValues),"\n"
            );
    for i in shapes do
        PrintTo(f,JoinStringsWithSeparator(i," ")," 0\n");
    od;
    criticalValuesHom := HOMOGENIZE_VALUES@(criticalValues, field);    
    mat := GET_NORMALIZATION_MAP@(criticalValuesHom);
  
    criticalValuesHomTrans := List(criticalValuesHom,x->mat*x);
    for i in [4..Length(criticalValuesHomTrans)] do
        PrintTo( f, LogFFE( criticalValuesHomTrans[i][1]/criticalValuesHomTrans[i][2], PrimitiveElement(field) ) );
    od;
    CloseStream(f);
    Info( InfoFR,2,"hurwitzMapSearch called with:\n", input );
    output := "";
    f := Filename( DirectoriesPackagePrograms("fr"), HURWITZMAPSEARCHBIN@ );
    while f=fail do
        Error("Could not find the executable hurwitzMapSearch. Did you compile it?");
    od;
    i := Process(DirectoryCurrent(), f, InputTextString(input), OUTPUTTEXTSTRING@(output), []);
    Info(InfoFR,2,"hurwitzMapSearch returned:\n",output);
    while i<>0 do
        Error("hurwitzMapSearch returned error code ",i,". Repent.");
    od;
    if count then
        return EvalString(output);
    fi;
    poly := EvalString(output);
   
    for i in [1..Length(poly)] do
        p := poly[i];
        rat := mat^-1*[p[2],p[1]];
        poly[i] := [UnivariateRationalFunctionByCoefficients(FamilyObj(One(field)),rat[1],rat[2],0),p];
    od;
    return poly;
end);


BindGlobal("SOLVEHURWITZMODP@", function(field,perms,criticalValues,count)
    local degree,shapes;
    
    while not ( IsField(field) and ForAll(perms,IsPerm) and ForAll(criticalValues,x->x in field or x=infinity) 
                and IsDuplicateFree(criticalValues) and IsBool(count)
              ) do
        Error("Arguments should be <field>,<perms>,<criticalValues>,<count>");
    od;
    while Length(criticalValues)<>Length(perms) do
        Error("Fields <perms> and <criticalValues> should have same length");
    od;
    degree := Maximum(List( perms,LargestMovedPoint ));
    shapes := List(perms, p->CycleLengths( p,[1..degree]) );
    while Sum( List(shapes,x->Sum(x-1)))<>2*degree-2 do
        Error("Sum of local degrees does not add to 2*degree-2 = ",2*degree-2);
    od;
    return SOLVEHURWITZMODPBYSHAPE@( field, shapes, criticalValues, count ,false );
end );

   

ReadPackage("fr","gap/hurwitzTests.g");
# Jacob: never put tests directly here! They should go in the tst/ directory, and
# are automatically accessed by "ReadTest" commands from the GAP maintainers.

#############################################################################

  
#E hurwitz.g . . . . . . . . . . . . . . . . . . . . . . . . . . . .ends here
