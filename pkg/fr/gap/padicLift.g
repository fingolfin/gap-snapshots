
#LoadPackage("float");
# Jacob: never load a package within a package's loading!

#todo: tests. 
Jacobian := function( fktlist, indeterminants )
    local cols, mat, row, col;
    Assert( 0, IsList(fktlist) );
    Assert( 0, IsList(indeterminants) );
    mat:=   List( [1..Size(fktlist)], n->
                                        List( [1..Size(indeterminants)], l->0) 
                );
    for row in [1..Size(fktlist)] do 
        for col in  [1..Size( indeterminants)] do 
            mat[row][col] := Derivative( fktlist[row], indeterminants[col] ) ;
        od;
    od;
    return mat;
end;


EvalPolynomialTensor := function( vec, ind , solution )
    local pos,  evaluatedVec;

    if not IsList(vec) then
        return  EvalPolynomialTensor( [vec], ind , solution )[1];
    fi;

     evaluatedVec :=  List( [1..Size(vec)], n->0);
    for pos in [1..Size(vec)] do 
          if IsList( vec[pos] ) then
              evaluatedVec[pos]:= EvalPolynomialTensor (vec[pos], ind, solution);
          else
              evaluatedVec[pos]:= One(solution[1])* Value( vec[pos], ind, solution );
          fi;
    od;
  
    return evaluatedVec;
end;

# not used;
ReduceTensor := function( vec,  modRing )
    local reducedVec,polRepCopy, reducedPol, coordinate,pos,polRep,fam;

    fam := RationalFunctionsFamily(FamilyObj(One(modRing)));;
    #modPolRng := PolynomialRing( modRing ,indeterminates);
    #fam := FamilyObj(One(modPolRng));
    
    if not IsList(vec) then
        return  ReduceTensor( [vec], modRing)[1];
    fi;
    reducedVec := List( [0..Size(vec)], n->0 ) ;
        for coordinate in  [1..Size( vec)] do 
            if IsList( vec[coordinate] ) then
                 reducedVec[coordinate] := ReduceTensor(vec[coordinate],modRing);
            else
                polRep := ExtRepPolynomialRatFun(vec[coordinate]);
                polRepCopy := ShallowCopy(polRep);
                for pos in [1..Size(polRep)/2] do
                    polRepCopy[2*pos] := polRep[2*pos]*One(modRing);
                od;        
                reducedPol :=  PolynomialByExtRep(fam, polRepCopy);
                reducedVec[coordinate] :=  reducedPol;
            fi;
        od;
    return reducedVec;
end;


# only for scalars...
# it is not mandatory for the parameter to be a ring object, only the property 'One' should be applicable.
PromoteScalarTensor := function( tensor, modRing)
    local resSol,coordinate;
    
    if not IsList( tensor  ) then
        return Int( tensor)*One(modRing);
    fi;

    resSol :=  List( [1..Size(tensor)], n->0 );
       for coordinate in  [1..Size( tensor)] do
        if IsList( tensor[coordinate] ) then 
            resSol[ coordinate ] := PromoteScalarTensor( tensor[coordinate] , modRing );
        else
            resSol[ coordinate ] := Int( tensor[coordinate] )*One(modRing);
        fi;
      od;
   return resSol;
end;


liftStep := function ( ideal, indeterminates, jacobian, solutionApprox )
    local nextChar, higherSolutionApprox, JacobianAtSolution,  gens, rightHandSide, correction;
    gens := GeneratorsOfTwoSidedIdeal(ideal);   
    Assert(0, IsZero( EvalPolynomialTensor(gens, indeterminates, solutionApprox)) );
    if not IsZero( EvalPolynomialTensor(gens, indeterminates, solutionApprox) ) then
        Error("solution does not belong to ideal");
        return [];
    fi;
    if not Size(indeterminates)=Rank(jacobian) then
        Error("Jacobian is not invertible");
        return [];
    fi;

    nextChar := ( Characteristic(solutionApprox) )^2;
    higherSolutionApprox := PromoteScalarTensor( solutionApprox, ZmodnZ( nextChar ) ) ;
    JacobianAtSolution := EvalPolynomialTensor( jacobian, indeterminates, higherSolutionApprox);
        
    rightHandSide := EvalPolynomialTensor(gens, indeterminates, higherSolutionApprox);
    correction := -(JacobianAtSolution^-1) *rightHandSide;
    higherSolutionApprox := higherSolutionApprox + correction;
    Assert(0, IsZero( EvalPolynomialTensor(gens,indeterminates,higherSolutionApprox)) );
    return higherSolutionApprox;
end;


liftPoint := function( ideal,  solutionPoint , numLiftDepth)
    
    local charSolution, laring , indeterminates , gens , JacobianOfIdeal, currLiftDepth, localSolution;
    charSolution := Characteristic(solutionPoint);
    Assert( 0,not IsZero( charSolution ));
    Assert( 0, IsOne( Size( Set( Factors(charSolution) ))) ); # 

    #Assert(0, IsIdeal(ideal) ); # how to check ? 
    Assert( 0, IsZero( Characteristic (ideal)) );
    laring := LeftActingRingOfIdeal( ideal );
  
    Assert(0, IsPolynomialRing(laring) );
    indeterminates := IndeterminatesOfPolynomialRing(laring);
  
    gens := GeneratorsOfTwoSidedIdeal(ideal);   
    Assert(0, IsZero(EvalPolynomialTensor(gens, indeterminates, solutionPoint)));
    
    JacobianOfIdeal := Jacobian( gens, indeterminates);

    currLiftDepth := 0;
    localSolution := solutionPoint;
    while currLiftDepth < numLiftDepth do 
      localSolution := liftStep( ideal, indeterminates, JacobianOfIdeal, localSolution);
      currLiftDepth := currLiftDepth + 1;
    od;
    return localSolution;
end;



testLiftStep_1_ := function()
    local  rng,jac,ind,x,FZ,ideal,finiteField,solution,gens;
    rng := PolynomialRing( Rationals  ,["x"] );
    ind := IndeterminatesOfPolynomialRing(rng);
    x := ind[1];
    FZ := 33*x^3+19*x^2-81*x-4;
    ideal := Ideal(rng,[FZ]);
    ideal := Ideal([FZ],rng);
    jac := Jacobian( [FZ] ,ind );
    solution := [Z(11)^0];
    gens := GeneratorsOfTwoSidedIdeal( ideal );
    Assert(0, IsZero(Value(FZ,ind,solution)) );
    Assert(0, IsZero(EvalPolynomialTensor(gens,ind,solution)) );
    solution := liftStep( ideal, ind, jac, solution);
    Assert(0, IsZero(EvalPolynomialTensor(gens,ind,solution)) );
end;

testLiftStep_2_ := function()
    local  rng,jac,ind,x,y,FZ1,FZ2,ideal,finiteField,solution,gens;
    rng := PolynomialRing( Rationals  ,["x","y"] );
    ind := IndeterminatesOfPolynomialRing(rng);
    x := ind[1];
    y := ind[2];
    FZ1 := 33*x^3+19*x^2-81*x-4;
    FZ2 := y-1;
    ideal := Ideal(rng,[FZ1,FZ2]);
    gens := GeneratorsOfTwoSidedIdeal( ideal );
    jac := Jacobian( gens ,ind );
    solution := [ Z(11)^0, Z(11)^0 ];
    Assert(0, IsZero(EvalPolynomialTensor(gens,ind,solution)) );
    solution := liftStep( ideal, ind, jac, solution);
    Assert(0, IsZero(EvalPolynomialTensor(gens,ind,solution)) );
end;

testLiftPoint_2_ := function()
    local  rng,jac,ind,x,y,FZ1,FZ2,ideal,finiteField,solution,gens;
    rng := PolynomialRing( Rationals  ,["x","y"] );
    ind := IndeterminatesOfPolynomialRing(rng);
    x := ind[1];
    y := ind[2];
    FZ1 := 33*x^3+19*x^2-81*x-4;
    FZ2 := y-1;
    ideal := Ideal(rng,[FZ1,FZ2]);
    solution := [ Z(11)^0, Z(11)^0 ];
    solution := liftPoint( ideal,  solution, 3);
    gens := GeneratorsOfTwoSidedIdeal( ideal );
    Assert(0, IsZero(EvalPolynomialTensor(gens,ind,solution)) );
    return solution;
end;

 

createLiftOptions := function()
    local liftOptions;
    liftOptions:=rec();
    liftOptions.latticeDimIncrementFkt := function(latticeDim)
                                        return latticeDim+1;
                                    end;
    liftOptions.maxLiftDepth := infinity;
    liftOptions.maxLatticeDim := infinity;
    liftOptions.verbose := false;
    liftOptions.minColumnNormDistanceFactor := 100;
    liftOptions.decimalPrecision := 16;
    liftOptions.initialLatticeDim:=1;
    liftOptions.startingLiftDepth:=0;

    return liftOptions;
end;


checkLiftOptions := function(liftOptions)
    Assert(0, liftOptions.verbose=true or liftOptions.verbose=false);
    Assert(0,  liftOptions.decimalPrecision in PositiveIntegers);
    Assert(0,  liftOptions.minColumnNormDistanceFactor in PositiveIntegers);
    Assert(0,  liftOptions.startingLiftDepth in NonnegativeIntegers);
    Assert(0,  liftOptions.maxLiftDepth in PositiveIntegers or liftOptions.maxLiftDepth=infinity );
    Assert(0,  liftOptions.maxLatticeDim in PositiveIntegers or liftOptions.maxLatticeDim=infinity );
    Assert(0,  liftOptions.latticeDimIncrementFkt(5) > 5 );
end;



# input is a Integer Matrix where the rows form the Basis of the lattice.
computeRowNorms := function(mat)
    local MM;
    MM  := PromoteScalarTensor( mat, Rationals);
    MM := MM*TransposedMat(MM);
    return  List( [1..Size(MM)], n->MM[n][n] );
end;

computeColumnNorms := function(mat)
    local MM;
    MM  := PromoteScalarTensor( mat, Rationals);
    MM := TransposedMat(MM)*MM;
    return  List( [1..Size(MM)], n->MM[n][n] );
end;




computeNormalizedBasisNorms :=function (mat)
    local rowNormlist, minM, maxM, normalizedRowNormList, result,pos;
    rowNormlist := computeRowNorms( mat );
    minM := Minimum( rowNormlist );
    maxM := Maximum( rowNormlist );
    #normalizedRowNormList :=  List( [ 1..Size(rowNormlist) ], pos-> rowNormlist[pos]*1.0/minM );
    normalizedRowNormList :=  List( [ 1..Size(rowNormlist) ], pos-> rowNormlist[pos]/minM );
    result := rec();
    result.unchanged := rowNormlist;
    result.normalized := normalizedRowNormList;
    result.max := maxM;
    result.min := minM;
    return result;  
end;


createLiftInfo := function(maxLiftDepth,maxLatticeDimension,requiredLatticeDimension)
    local liftInfo;
    liftInfo := rec();
    liftInfo.dataType := "liftInfo";
    liftInfo.maxLiftDepth := maxLiftDepth;
    liftInfo.maxLatticeDimension := maxLatticeDimension;
    liftInfo.requiredLatticeDimension := requiredLatticeDimension;
    return liftInfo;
end;


mergeLiftInfo := function( liftInfo1, liftInfo2 )
    local maxLiftDepth, maxLatticeDimension, requiredLatticeDimension;

    maxLiftDepth := Maximum ( liftInfo1.maxLiftDepth,liftInfo2.maxLiftDepth );
    maxLatticeDimension := Maximum ( liftInfo1.maxLatticeDimension, liftInfo2.maxLatticeDimension );
    requiredLatticeDimension := fail;
    if ( not liftInfo1.requiredLatticeDimension=fail  and not liftInfo2.requiredLatticeDimension=fail ) then 
        requiredLatticeDimension :=  Maximum ( liftInfo1.requiredLatticeDimension, liftInfo2.requiredLatticeDimension );
    fi;
    return createLiftInfo( maxLiftDepth, maxLatticeDimension, requiredLatticeDimension );
end;



constructLLLInputFromLift := function(unknown, indeterminates, liftResult, currentLatticeDim )
    local liftResultOverZZ, M, sM, idx, result;

    liftResultOverZZ := PromoteScalarTensor( liftResult, Rationals ); 
    M :=  EvalPolynomialTensor( [ List( [0..currentLatticeDim-1], i->unknown^i) ], indeterminates, liftResultOverZZ );
    Append( M[1], [ Characteristic(liftResult) ] );
    
    sM := List( [1..currentLatticeDim+1] , n-> List( [1..currentLatticeDim],l->0));
    
    # write kernel(M) : (each 'sM' column is a kernel element)
    for idx in [1..Size(M[1])-1] do
        sM[1][idx ] := -M[1][idx+1];
        sM[idx+1][idx] := M[1][1];
    od;
    # remove last 'sM' row and transpose the result.
    result := TransposedMat( List( [1..Size(sM)-1], n->sM[n] ) );
   
    return  PromoteScalarTensor( result, Rationals );
end;


# LoadPackage("float");
testLLL := function()
    local mat;
    mat:=[[1,2],[2,1]];
    return FPLLLReducedBasis(mat);
end;

# try to find for a given lift the minimal Polynomial in variable 'unknown' by guessing its degree (heurustic method)
# LLLBasisNormList is evaluated by the heuristic method
tryLLLReduction:=function (unknown, indeterminates, liftResult, nextLiftResult, reductionOpts ) 
     
   local opts , result, currentLatticeDim, lastColumnNormMin, LLLInput, bvec, basisNormRecord, nextLiftResultZZ;
    opts := reductionOpts;

    result := rec();
    result.foundLiftCandidate := false;
    result.LLLBasisNormList := [];
    result.LLLBasis := fail;

    currentLatticeDim  := opts.initialLatticeDim;
    
    lastColumnNormMin := -1;
    nextLiftResultZZ :=  PromoteScalarTensor(nextLiftResult,Integers);

    while currentLatticeDim <= opts.maxLatticeDim  do 
        LLLInput := constructLLLInputFromLift(unknown, indeterminates, liftResult, currentLatticeDim );
        result.LLLBasis := FPLLLReducedBasis( LLLInput );
     
        # test, if a solution have been found in this step (result.foundLiftCandidate):
            bvec :=   EvalPolynomialTensor(  List([0..currentLatticeDim-1],n->unknown^n ),  indeterminates, nextLiftResultZZ ) ;
    
            basisNormRecord := computeNormalizedBasisNorms( result.LLLBasis );
            if  IsZero( PromoteScalarTensor( bvec*( result.LLLBasis [1] ), nextLiftResult[1] ) ) and 
                EuclideanQuotient( basisNormRecord.max, basisNormRecord.min )> opts.minColumnNormDistanceFactor  then 
                 result.foundLiftCandidate := true;
            fi;
        #TODO: sometimes first condition ( "IsZero (PromoteScalarTensor( bvec*firstBasisRow, nextLiftResult[1] ) )" ) passes, 
        #      but we do not have a solution. Due to HC if we will use a higher lift, this could be detected at the end.
        #
        #TODO: instead of hardcoding, parametrize lllReduction with a stop condition for increasing lattice dimension: 
        #       is it sufficient for a generic stop condition to pass as input previous and current LLLBasis ?
        
        Append (result.LLLBasisNormList , [ basisNormRecord ]) ;
        if opts.verbose then  
            Print( "column norms: "); Print ( String( basisNormRecord.normalized ) ); Print(","); 
            Print(String( basisNormRecord.min)); 
        fi;
        if   lastColumnNormMin=basisNormRecord.min  or  result.foundLiftCandidate  then  
               break;
        fi;
        lastColumnNormMin := basisNormRecord.min;
        Assert(0,  (opts.latticeDimIncrementFkt ( currentLatticeDim )) > currentLatticeDim or currentLatticeDim = infinity );
        currentLatticeDim := opts.latticeDimIncrementFkt( currentLatticeDim );
    od;
    # todo: Typ für Rückgabe einfuehren.
    result.currentLatticeDim   := currentLatticeDim;

    if opts.verbose then 
        Print ("tryLLLReduction result:");
        Print (result);
    fi;
    return result;
end;


testLLLReduction := function()
  local  rng,jac,ind,x,y,FZ1,FZ2,ideal,finiteField,solution, liftResult, nextLiftResult, gens, reductionOpts;
    rng := PolynomialRing( Rationals  ,["x","y"] );
    ind := IndeterminatesOfPolynomialRing(rng);
    x := ind[1];
    y := ind[2];
    FZ1 := 33*x^3+19*x^2-81*x-4;
    FZ2 := y-1;
    ideal := Ideal(rng,[FZ1,FZ2]);
    solution := [ Z(11)^0, Z(11)^0 ];
    liftResult := liftPoint( ideal,  solution, 3);
    nextLiftResult := liftPoint( ideal,  solution, 4);

    gens := GeneratorsOfTwoSidedIdeal( ideal );
    Assert(0, IsZero(EvalPolynomialTensor(gens,ind,liftResult)) );
    Assert(0, IsZero(EvalPolynomialTensor(gens,ind,nextLiftResult)) );
    
    reductionOpts := createLiftOptions();
    tryLLLReduction (ind[1], ind, liftResult, nextLiftResult, reductionOpts );

end;


LLLBasisToPolynomial := function (LLLBasis, variable)
    local localVar, nrows, pol;
    localVar := fail;
    if variable = fail then 
         localVar := Indeterminate(Rationals);
    else
       # TODO: ensure that variable is an indeterminate  ( either of rationals or of Integers ) 
       localVar :=variable;    
    fi;
    nrows := Size( LLLBasis );
    pol :=  List( [0..nrows-1] , exp->localVar^exp) *( PromoteScalarTensor( LLLBasis[1], localVar) );
    return pol;
end;


tryLiftAndComputeMinPolynomialsForSingleVariable := function(ideal, indeterminates, solution, unknown, minimalPolynomialVariable, liftAndLLLOptions)

    local opts, gens, jacobianOfIdeal, result, currLiftDepth, liftResult, nextLiftResult, localLiftOptions,  minimalPolynomialCandidateFactors;
    opts := liftAndLLLOptions;
    checkLiftOptions (opts);
    
    # assert( ring IZ === ring unknown); TODO: how to check?
    # FamilyObj( CoefficientsRing(LeftActingRingOfIdeal(ideal)));

    gens := GeneratorsOfTwoSidedIdeal( ideal );    
    Assert(0, IsZero( EvalPolynomialTensor( gens, indeterminates, solution ) ) );

    jacobianOfIdeal := Jacobian ( gens, indeterminates) ;
    
    # todo: create data type 'reducedPadicLiftResult' !
    result :=  rec();
    result.dataType := "reducedPadicLiftResult";
    result.LLLBasis := fail;
    result.LLLBasisNormList := fail;
    result.foundLiftCandidate := false;
    result.currentLatticeDim := -1;
    result.unknown := unknown;


    currLiftDepth := 0;
    liftResult :=  solution ;
    
    nextLiftResult :=    liftStep( ideal, indeterminates, jacobianOfIdeal, liftResult);
    
    # increase lift depth and perform LLL until a solution is found or maxLiftDepth is reached.
    while currLiftDepth <= opts.maxLiftDepth  do 
    
        if opts.verbose then 
            Print ( "#\n # currLiftDepth: " );  Print ( currLiftDepth);
        fi;     
        
        # perform LLL only if (currLiftDepth >= startingLiftDepth ). 
        # The condition is useful in case minimalLiftDepth (=startingLiftDepth ) is known (e.g. from similar previous computations )
        if ( currLiftDepth >= opts.startingLiftDepth ) then   
        
            result := tryLLLReduction(   unknown, indeterminates, liftResult,  nextLiftResult, liftAndLLLOptions );
            
            if  result.foundLiftCandidate  then  
                
                if opts.verbose then 
                    Print ("#FinalLiftDepth: " ); Print(currLiftDepth);
                fi;
                break;
            fi;
        fi;
        currLiftDepth := currLiftDepth+1;    
        liftResult := nextLiftResult;
        nextLiftResult :=     liftStep( ideal, indeterminates, jacobianOfIdeal, liftResult);
    od;
  
    if not result.foundLiftCandidate   then  
        result.polynomial := fail;
        result.liftInfo := fail;
        return result;
    fi;
  
    result.polynomial :=  LLLBasisToPolynomial( result.LLLBasis, minimalPolynomialVariable );
    minimalPolynomialCandidateFactors :=   Factors( result.polynomial) ;

    if ( Size( minimalPolynomialCandidateFactors) >1) then
       localLiftOptions := ShallowCopy( liftAndLLLOptions);
       localLiftOptions.initialLatticeDim := localLiftOptions.initialLatticeDim - Size(minimalPolynomialCandidateFactors )+1;
       return tryLiftAndComputeMinPolynomialsForSingleVariable( ideal, indeterminates, solution, unknown, minimalPolynomialVariable, localLiftOptions );
    fi;

    result.liftInfo := createLiftInfo( currLiftDepth, result.currentLatticeDim, (Degree (result.polynomial) + 1)  );
  
    # reducedPadicLiftResult := result;
    return result;
end;



testLiftAndLLLForSingleVariable := function()
  local  rng,indeterminates,x,y,FZ1,FZ2,ideal, solution, liftAndLLLOptions, unknown, minimalPolynomialVariable, liftAndLLLRes;
    rng := PolynomialRing( Rationals  ,["x","y"] );
    indeterminates := IndeterminatesOfPolynomialRing(rng);
    x := indeterminates[1];
    y := indeterminates[2];
    FZ1 := 33*x^3+19*x^2-81*x-4;
    FZ2 := y-1;
    ideal := Ideal(rng,[FZ1,FZ2]);
    solution := [ Z(11)^0, Z(11)^0 ];
      
    liftAndLLLOptions := createLiftOptions();
    unknown := indeterminates[1];
    minimalPolynomialVariable := Indeterminate(Rationals);

    liftAndLLLRes := tryLiftAndComputeMinPolynomialsForSingleVariable (ideal, indeterminates, solution, unknown, minimalPolynomialVariable, liftAndLLLOptions );

    unknown := indeterminates[2];
    liftAndLLLRes := tryLiftAndComputeMinPolynomialsForSingleVariable (ideal, indeterminates, solution, unknown, minimalPolynomialVariable, liftAndLLLOptions );
end;

 

tryComputeMinPolynomials := function( solutionIdeal, indeterminates, solutionPoint, unknowns,  liftAndLLLOptions )

    local opts , solutionChar, unknown, liftResult, liftAndLLLResult, liftInfo, minPolVar, optsCopy;
    opts := liftAndLLLOptions;
    checkLiftOptions (opts);

    solutionChar := Characteristic(solutionPoint);
    Assert(0, solutionChar>0 );
  
    liftResult  := fail; 
    liftInfo := createLiftInfo(0,0,0);

    liftAndLLLResult := rec(); 
    liftAndLLLResult.unknowns := [] ; # TODO maybe wanna to use a Hashtable in unknowns.

    for unknown in unknowns do
      
        if Size(ExtRepPolynomialRatFun(unknown))=2 then
            minPolVar := unknown; # use unknown as variable for minimal polynomial.
        else
            # unknown variable is composed and cannot be used as variable for minimal polynomial.
            minPolVar :=  Indeterminate( Rationals ) ;; #maybe Integers are sufficient.
        fi;           
    
        # adjust lift options.
            optsCopy := ShallowCopy( opts );
            
            if optsCopy.startingLiftDepth < liftInfo.maxLiftDepth then 
                optsCopy.startingLiftDepth := liftInfo.maxLiftDepth;
            fi;
    
            if optsCopy.initialLatticeDim  < liftInfo.requiredLatticeDimension then 
                optsCopy.initialLatticeDim := liftInfo.requiredLatticeDimension;
            fi;
        
        liftResult := tryLiftAndComputeMinPolynomialsForSingleVariable( solutionIdeal, indeterminates, solutionPoint, unknown, minPolVar, optsCopy );
        liftInfo := mergeLiftInfo( liftInfo, liftResult.liftInfo );
        Append( liftAndLLLResult.unknowns , [ [ unknown, minPolVar, liftResult.polynomial ] ] );
    
    od;
    
    return [ liftAndLLLResult, liftInfo ];
end;



testComputeMinPolynomials := function()
  local  rng,indeterminates,x,y,FZ1,FZ2, ideal, solutionOverFiniteField, liftAndLLLOptions,   expectedResult, problem, unknowns, liftAndLLLRes ;

    rng := PolynomialRing( Rationals  ,["x","y"] );
    indeterminates := IndeterminatesOfPolynomialRing(rng);
    x := indeterminates[1];
    y := indeterminates[2];
    FZ1 := 33*x^3+19*x^2-81*x-4;
    FZ2 := y-1;
    ideal := Ideal(rng,[FZ1,FZ2]);
    solutionOverFiniteField := [ Z(11)^0, Z(11)^0 ];
      
    liftAndLLLOptions := createLiftOptions();

    problem := rec();
    problem.ideal := ideal;
    problem.indeterminates := indeterminates;   
    problem.solutionOverFiniteField := solutionOverFiniteField;   

    unknowns := problem.indeterminates;
    liftAndLLLRes := tryComputeMinPolynomials (ideal, indeterminates, solutionOverFiniteField, unknowns ,  liftAndLLLOptions );
    expectedResult := [ rec( unknowns := [ [ x, x, -11*x^2-21*x-1 ], [ y, y, y-1 ] ] ), rec( dataType:="liftInfo", maxLatticeDimension := 3, maxLiftDepth := 3, requiredLatticeDimension := 3 ) ];
    Assert( 0, liftAndLLLRes[1].unknowns=expectedResult[1].unknowns );
    Assert( 0, liftAndLLLRes[2]=expectedResult[2] );
    
end;

