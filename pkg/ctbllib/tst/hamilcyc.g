# This file was created from xpl/hamilcyc.xpl, do not edit!
#############################################################################
##
#W  hamilcyc.g        Hamiltonian cycles in finite groups       Thomas Breuer
##
#Y  Copyright (C)  2009,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##

#############################################################################
##
##  The examples use the {\GAP} Character Table Library
##  and the {\GAP} Library of Tables of Marks,
##  so we first load these packages in the required versions.
##  Also, we force the assertion level to zero;
##  this is the default in interactive {\GAP} sessions
##  but it is automatically set to $1$ when a file is read with `ReadTest'.
##
if not CompareVersionNumbers( GAPInfo.Version, "4.5" ) then
     Error( "need GAP in version at least 4.5" );
   fi;
LoadPackage( "ctbllib", "1.2" );
LoadPackage( "tomlib", "1.1.1" );
SetAssertionLevel( 0 );


#############################################################################
##
#F  IsGeneratorsOfTransPermGroup( <G>, <list> )
##
##  Let <G> be a finite group that acts *transitively* on its moved points,
##  and <list> a list of elements in <G>.
##
##  `IsGeneratorsOfTransPermGroup' returns `true' if the permutations in
##  <list> generate <G>, and `false' otherwise.
##  The main point is that the return value `true' requires the group
##  generated by `list' to be transitive, and the check for transitivity
##  is much cheaper than the test whether this group is equal to `G'.
##
BindGlobal( "IsGeneratorsOfTransPermGroup", function( G, list )
    local S;

    if not IsTransitive( G ) then
      Error( "<G> must be transitive on its moved points" );
    fi;
    S:= SubgroupNC( G, list );

    return IsTransitive( S, MovedPoints( G ) ) and Size( S ) = Size( G );
end );


#############################################################################
##
#F  VertexDegreesGeneratingGraph( <G>, <classes>, <normalsubgroups> )
##
##  Let <G> be a finite group that acts *transitively* on its moved points,
##  <classes> be the list of conjugacy classes of <G>
##  (in order to prescribe an ordering of the classes),
##  and <normalsubgroups> be a list of proper normal subgroups of <G>.
##
##  `VertexDegreesGeneratingGraph' returns the matrix $d(g_i, g_j^G)$,
##  with rows and columns indexed by nonidentity class representatives
##  ordered as in the list <classes>.
##  (The class containing the identity element may be contained in
##  `classes'.)
##
BindGlobal( "VertexDegreesGeneratingGraph",
    function( G, classes, normalsubgroups )
    local nccl, matrix, cents, powers, normalsubgroupspos, i, j, g_i, nsg,
          g_j, gen, pair, d, pow;

    if not IsTransitive( G ) then
      Error( "<G> must be transitive on its moved points" );
    fi;

    classes:= Filtered( classes, C -> Order( Representative( C ) ) <> 1 );
    nccl:= Length( classes );
    matrix:= [];
    cents:= [];
    powers:= [];
    normalsubgroupspos:= [];
    for i in [ 1 .. nccl ] do
      matrix[i]:= [];
      if IsBound( powers[i] ) then
        # The i-th row equals the earlier row `powers[i]'.
        for j in [ 1 .. i ] do
          matrix[i][j]:= matrix[ powers[i] ][j];
          matrix[j][i]:= matrix[j][ powers[i] ];
        od;
      else
        # We have to compute the values.
        g_i:= Representative( classes[i] );
        nsg:= Filtered( [ 1 .. Length( normalsubgroups ) ],
                        i -> g_i in normalsubgroups[i] );
        normalsubgroupspos[i]:= nsg;
        cents[i]:= Centralizer( G, g_i );
        for j in [ 1 .. i ] do
          g_j:= Representative( classes[j] );
          if IsBound( powers[j] ) then
            matrix[i][j]:= matrix[i][ powers[j] ];
            matrix[j][i]:= matrix[ powers[j] ][i];
          elif not IsEmpty( Intersection( nsg, normalsubgroupspos[j] ) )
               or ( Order( g_i ) = 2 and Order( g_j ) = 2
                    and not IsDihedralGroup( G ) ) then
            matrix[i][j]:= 0;
            matrix[j][i]:= 0;
          else
            # Compute $d(g_i, g_j^G)$.
            gen:= 0;
            for pair in DoubleCosetRepsAndSizes( G, cents[j], cents[i] ) do
              if IsGeneratorsOfTransPermGroup( G, [ g_i, g_j^pair[1] ] ) then
                gen:= gen + pair[2];
              fi;
            od;
            matrix[i][j]:= gen / Size( cents[j] );
            if i <> j then
              matrix[j][i]:= gen / Size( cents[i] );
            fi;
          fi;
        od;

        # For later, provide information about algebraic conjugacy.
        for d in Difference( PrimeResidues( Order( g_i ) ), [ 1 ] ) do
          pow:= g_i^d;
          for j in [ i+1 .. nccl ] do
            if not IsBound( powers[j] ) and pow in classes[j] then
              powers[j]:= i;
              break;
            fi;
          od;
        od;
      fi;
    od;

    return matrix;
end );


#############################################################################
##
#A  PrimitivePermutationCharacters( <tbl> )
##
##  For an ordinary character table <tbl> for which either the value of one
##  of the attributes `Maxes' or `UnderlyingGroup' is stored or the table of
##  marks is contained in the {\GAP} library of tables of marks,
##  `PrimitivePermutationCharacters' returns the list of all primitive
##  permutation characters of <tbl>.
##  Otherwise `fail' is returned.
##
DeclareAttribute( "PrimitivePermutationCharacters", IsCharacterTable );
InstallMethod( PrimitivePermutationCharacters,
    [ IsCharacterTable ],
    function( tbl )
    local maxes, i, fus, poss, tom, G;

    if HasMaxes( tbl ) then
      maxes:= List( Maxes( tbl ), CharacterTable );
      for i in [ 1 .. Length( maxes ) ] do
        fus:= GetFusionMap( maxes[i], tbl );
        if fus = fail then
          fus:= PossibleClassFusions( maxes[i], tbl );
          poss:= Set( List( fus, map -> InducedClassFunctionsByFusionMap(
             maxes[i], tbl, [ TrivialCharacter( maxes[i] ) ], map )[1] ) );
          if Length( poss ) = 1 then
            maxes[i]:= poss[1];
          else
            return fail;
          fi;
        else
          maxes[i]:= TrivialCharacter( maxes[i] )^tbl;
        fi;
      od;
      return maxes;
    elif HasFusionToTom( tbl ) then
      tom:= TableOfMarks( tbl );
      maxes:= MaximalSubgroupsTom( tom );
      return PermCharsTom( tbl, tom ){ maxes[1] };
    elif HasUnderlyingGroup( tbl ) then
      G:= UnderlyingGroup( tbl );
      return List( MaximalSubgroupClassReps( G ),
                   M -> TrivialCharacter( M )^tbl );
    fi;

    return fail;
end );


#############################################################################
##
#F  LowerBoundsVertexDegrees( <classlengths>, <prim> )
##
##  For two lists <classlengths> of the conjugacy class lengths and <prim> of
##  all primitive permutation characters of a group $G$, say,
##  `LowerBoundsVertexDegrees' returns a matrix <delta> such that
##  `<delta>[i][j] = '$\delta(s, g^G)$ holds,
##  for $s$ and $g$ in the `i+1'-st and `j+1'-st class of $G$,
##  respectively.
##
##  So the row sums in <delta> are the values $\delta(s)$.
##
LowerBoundsVertexDegrees:= function( classlengths, prim )
    local sizes, nccl;

    nccl:= Length( classlengths );
    return List( [ 2 .. nccl ],
             i -> List( [ 2 .. nccl ],
                    j -> Maximum( 0, classlengths[j] - Sum( prim,
                    pi -> classlengths[j] * pi[j] * pi[i] / pi[1] ) ) ) );
end;;


#############################################################################
##
#F  LowerBoundsVertexDegreesOfClosure( <classlengths>, <bounds> )
##
##  Given the list <classlengths> of conjugacy class lengths for the group
##  $G$ and a matrix <bounds> of the values $d^{(i)}(s, g^G)$ or
##  $\delta^{(i)}(s, g^G)$,
##  as is returned by `VertexDegreesGeneratingGraph' or
##  `LowerBoundsVertexDegrees',
##  the following function returns the corresponding matrix of the values
##  $d^{(i+1)}(s, g^G)$ or $\delta^{(i+1)}(s, g^G)$, respectively.
##
LowerBoundsVertexDegreesOfClosure:= function( classlengths, bounds )
    local delta, newbounds, size, i, j;

    delta:= List( bounds, Sum );
    newbounds:= List( bounds, ShallowCopy );
    size:= Sum( classlengths );
    for i in [ 1 .. Length( bounds ) ] do
      for j in [ 1 .. Length( bounds ) ] do
        if delta[i] + delta[j] >= size - 1 then
          newbounds[i][j]:= classlengths[ j+1 ];
        fi;
      od;
    od;

    return newbounds;
end;;


#############################################################################
##
#F  CheckCriteriaOfPosaAndChvatal( <classlengths>, <bounds> )
##
##  Let <classlengths> be list of conjugacy class lengths of a group $G$,
##  say, and <bounds> be a matrix of the values $d^{(i)}(s, g^G)$ or
##  $\delta^{(i)}(s, g^G)$,
##  as is returned for example by `LowerBoundsVertexDegrees' or
##  `LowerBoundsVertexDegreesOfClosure'.
##
##  `CheckCriteriaOfPosaAndChvatal' returns a record with the following
##  components.
##
##  `badForPosa':
##      the list of those pairs $[ L_k, U_k ]$ with the property
##      $L_k \leq U_k$,
##
##  `badForChvatal':
##      the list of pairs of lower and upper bounds of nonempty intervals
##      where Chv\'atal's criterion may be violated, and
##
##  `data':
##      the sorted list of triples $[ \delta(g_k), |g_k^G|, \iota(k) ]$,
##      where $\iota(k)$ is the row and column position of $g_k$
##      in the matrix <bounds>.
##
##  The generating graph $\Gamma(G)$ satisfies P\'osa's criterion
##  if the `badForPosa' component is empty;
##  the graph satisfies Chv\'atal's criterion if the `badForChvatal'
##  component is empty.
##
##  The ordering of class lengths must of course be compatible with the
##  ordering of rows and columns of the matrix,
##  and the identity element of $G$ must belong to the first entry in the
##  list of class lengths.
##
CheckCriteriaOfPosaAndChvatal:= function( classlengths, bounds )
    local size, degs, addinterval, badForPosa, badForChvatal1, pos, half,
          i, low1, upp2, upp1, low2, badForChvatal, interval1, interval2;

    size:= Sum( classlengths );
    degs:= List( [ 2 .. Length( classlengths ) ],
                 i -> [ Sum( bounds[ i-1 ] ), classlengths[i], i ] );
    Sort( degs );

    addinterval:= function( intervals, low, upp )
      if low <= upp then
        Add( intervals, [ low, upp ] );
      fi;
    end;

    badForPosa:= [];
    badForChvatal1:= [];
    pos:= 1;
    half:= Int( size / 2 ) - 1;
    for i in [ 1 .. Length( degs ) ] do
      # We have pos = c_1 + c_2 + \cdots + c_{i-1} + 1
      low1:= Maximum( pos, degs[i][1] );  # L_i
      upp2:= Minimum( half, size-1-pos, size-1-degs[i][1] ); # U'_i
      pos:= pos + degs[i][2];
      upp1:= Minimum( half, pos-1 ); # U_i
      low2:= Maximum( 1, size-pos ); # L'_i
      addinterval( badForPosa, low1, upp1 );
      addinterval( badForChvatal1, low2, upp2 );
    od;

    # Intersect intervals.
    badForChvatal:= [];
    for interval1 in badForPosa do
      for interval2 in badForChvatal1 do
        addinterval( badForChvatal, Maximum( interval1[1], interval2[1] ),
                                    Minimum( interval1[2], interval2[2] ) );
      od;
    od;

    return rec( badForPosa:= badForPosa,
                badForChvatal:= Set( badForChvatal ),
                data:= degs );
end;;


#############################################################################
##
#F  HamiltonianCycleInfo( <classlengths>, <bounds> )
##
##  Let <classlengths> be list of conjugacy class lengths of a group $G$,
##  say, and <bounds> be a matrix of the values $d^{(i)}(s, g^G)$ or
##  $\delta^{(i)}(s, g^G)$,
##  as is returned for example by `LowerBoundsVertexDegrees' or
##  `LowerBoundsVertexDegreesOfClosure'.
##
##  `HamiltonianCycleInfo' returns a string that describes the minimal $i$
##  with the property that the given bounds suffice to show that
##  $cl^{(i)}(\Gamma(G))$ satisfies P\'osa's or Chv\'atal's criterion,
##  if such a closure exists.
##  If no closure has this property, the string `"no decision"' is returned.
##
HamiltonianCycleInfo:= function( classlengths, bounds )
    local i, result, res, oldbounds;

    i:= 0;
    result:= rec( Posa:= fail, Chvatal:= fail );
    repeat
      res:= CheckCriteriaOfPosaAndChvatal( classlengths, bounds );
      if result.Posa = fail and IsEmpty( res.badForPosa ) then
        result.Posa:= i;
      fi;
      if result.Chvatal = fail and IsEmpty( res.badForChvatal ) then
        result.Chvatal:= i;
      fi;
      i:= i+1;
      oldbounds:= bounds;
      bounds:= LowerBoundsVertexDegreesOfClosure( classlengths, bounds );
    until oldbounds = bounds;

    if result.Posa <> fail then
      if result.Posa <> result.Chvatal then
        return Concatenation( "Chvatal for ", Ordinal( result.Chvatal ),
            " closure, Posa for ", Ordinal( result.Posa ), " closure" );
      else
        return Concatenation( "Posa for ", Ordinal( result.Posa ),
            " closure" );
      fi;
    elif result.Chvatal <> fail then
      return Concatenation( "Chvatal for ", Ordinal( result.Chvatal ),
                            " closure" );
    else
      return "no decision";
    fi;
end;;


#############################################################################
##
#F  HamiltonianCycleInfoFromCharacterTable( <tbl> )
##
##  For a character table <tbl>, this function returns a string,
##  either `"no prim. perm. characters"' or the return value of
##  `HamiltonianCycleInfo' for the bounds computed from the primitive
##  permutation characters.
##
HamiltonianCycleInfoFromCharacterTable:= function( tbl )
    local prim, classlengths, bounds;

    prim:= PrimitivePermutationCharacters( tbl );
    if prim = fail then
      return "no prim. perm. characters";
    fi;
    classlengths:= SizesConjugacyClasses( tbl );
    bounds:= LowerBoundsVertexDegrees( classlengths, prim );
    return HamiltonianCycleInfo( classlengths, bounds );
end;;


#############################################################################
##
#F  HamiltonianCycleInfoFromGroup( <G> )
##
##  For a group <G>, this function returns a string,
##  the return value of `HamiltonianCycleInfo' for the vertex degrees
##  computed from the group.
##
HamiltonianCycleInfoFromGroup:= function( G )
    local ccl, nsg, der, degrees, classlengths;
    ccl:= ConjugacyClasses( G );
    if IsPerfect( G ) then
      nsg:= [];
    else
      der:= DerivedSubgroup( G );
      nsg:= Concatenation( [ der ],
                           IntermediateSubgroups( G, der ).subgroups );
    fi;
    degrees:= VertexDegreesGeneratingGraph( G, ccl, nsg );
    classlengths:= List( ccl, Size );
    return HamiltonianCycleInfo( classlengths, degrees );        
end;;


#############################################################################
##
#E

