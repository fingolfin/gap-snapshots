# RepnDecomp, chapter 5
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST( "repndecomp04.tst");

# /doc/_Chunks.xml:140-164
gap> G := SymmetricGroup(4);;
gap> irreps := IrreducibleRepresentations(G);;
gap> rho := DirectSumOfRepresentations([irreps[4], irreps[5]]);;
gap> # Jumble rho up a bit so it's not so easy for the library.
> A := [ [ 3, -3, 2, -4, 0, 0 ], [ 4, 0, 1, -5, 1, 0 ], [ -3, -1, -2, 4, -1, -2 ],
>        [ 4, -4, -1, 5, -3, -1 ], [ 3, -2, 1, 0, 0, 0 ], [ 4, 2, 4, -1, -2, 1 ] ];;
gap> rho := ComposeHomFunction(rho, B -> A^-1 * B * A);;
gap> # We've constructed rho from two degree 3 irreps, so there are a few
> # things we can check for correctness:
> decomposition := REPN_ComputeUsingMyMethod(rho);;
gap> # Two distinct irreps, so the centralizer has dimension 2
> Length(decomposition.centralizer_basis) = 2;
true
gap> # Two distinct irreps i.e. two invariant subspaces
> Length(decomposition.decomposition) = 2;
true
gap> # All subspaces are dimension 3
> ForAll(decomposition.decomposition, Vs -> Length(Vs) = 1 and Dimension(Vs[1]) = 3);
true
gap> # And finally, check that the block diagonalized representation
> # computed is actually isomorphic to rho:
> AreRepsIsomorphic(rho, decomposition.diagonal_rep);
true

# /doc/_Chunks.xml:170-183
gap> # This is the same example as before, but splits into canonical
> # summands internally. It gives exactly the same results, up to
> # isomorphism.
> other_decomposition := REPN_ComputeUsingMyMethodCanonical(rho);;
gap> Length(other_decomposition.centralizer_basis) = 2;
true
gap> Length(other_decomposition.decomposition) = 2;
true
gap> ForAll(other_decomposition.decomposition, Vs -> Length(Vs) = 1 and Dimension(Vs[1]) = 3);
true
gap> AreRepsIsomorphic(rho, other_decomposition.diagonal_rep);
true

# /doc/_Chunks.xml:189-207
gap> # This is the trivial group
> G := Group(());;
gap> # The trivial group has only one representation per degree, so a
> # degree d representation decomposes into a single canonical summand
> # containing the whole space
> rho := FuncToHom@RepnDecomp(G, g -> IdentityMat(3));;
gap> canonical_summands_G := CanonicalDecomposition(rho);
[ ( Cyclotomics^3 ) ]
gap> # More interesting example, S_3
> H := SymmetricGroup(3);;
gap> # The standard representation: a permutation to the corresponding
> # permutation matrix.
> tau := FuncToHom@RepnDecomp(H, h -> PermutationMat(h, 3));;
gap> # Two canonical summands corresponding to the degree 2 and
> # trivial irreps (in that order)
> List(CanonicalDecomposition(tau), Dimension);
[ 2, 1 ]

# /doc/_Chunks.xml:213-232
gap> # The trivial group has 1 irrep of degree 1, so rho decomposes into 3
> # lines.
> irred_decomp_G := IrreducibleDecomposition(rho);
[ rec( basis := [ [ 1, 0, 0 ] ] ), rec( basis := [ [ 0, 1, 0 ] ] ),
  rec( basis := [ [ 0, 0, 1 ] ] ) ]
gap> # The spaces are returned in this format - explicitly keeping the
> # basis - since this basis block diagonalises rho into the irreps,
> # which are the smallest possible blocks. This is more obvious with
> # H.
> irred_decomp_H := IrreducibleDecomposition(tau);
[ rec( basis := [ [ 1, 1, 1 ] ] ),
  rec( basis := [ [ 1, E(3), E(3)^2 ], [ 1, E(3)^2, E(3) ] ] ) ]
gap> # Using the basis vectors given there block diagonalises tau into
> # the two blocks corresponding to the two irreps:
> nice_basis := [ [ 1, 1, 1 ], [ 1, E(3), E(3)^2 ], [ 1, E(3)^2, E(3) ] ];;
gap> tau_diag := ComposeHomFunction(tau, X -> nice_basis^-1 * X * nice_basis);
[ (1,2,3), (1,2) ] -> [ [ [ 1, 0, 0 ], [ 0, E(3), 0 ], [ 0, 0, E(3)^2 ] ],
  [ [ 1, 0, 0 ], [ 0, 0, E(3)^2 ], [ 0, E(3), 0 ] ] ]

# /doc/_Chunks.xml:238-255
gap> # Does the same thing we have done in the examples above, but all in
> # one step, with as many subcomputations reused as possible
> REPN_ComputeUsingSerre(tau);
rec( basis := [ [ 1, 1, 1 ], [ 1, E(3), E(3)^2 ], [ 1, E(3)^2, E(3) ] ],
  centralizer_basis := [ [ [ [ 1 ] ], [ [ 0, 0 ], [ 0, 0 ] ] ],
      [ [ [ 0 ] ], [ [ 1, 0 ], [ 0, 1 ] ] ] ],
  decomposition := [ [ rec( basis := [ [ 1, 1, 1 ] ] ) ], [  ],
      [ rec( basis := [ [ 1, E(3), E(3)^2 ], [ 1, E(3)^2, E(3) ] ] ) ] ],
  diagonal_rep := [ (1,2,3), (1,2) ] ->
    [ [ [ 1, 0, 0 ], [ 0, E(3), 0 ], [ 0, 0, E(3)^2 ] ],
      [ [ 1, 0, 0 ], [ 0, 0, E(3)^2 ], [ 0, E(3), 0 ] ] ] )
gap> # You can also do the computation in parallel:
> REPN_ComputeUsingSerre(tau : parallel);;
gap> # Or specify the irreps if you have already computed them:
> irreps_H := IrreducibleRepresentations(H);;
gap> REPN_ComputeUsingSerre(tau : irreps := irreps_H);;

#
gap> STOP_TEST("repndecomp04.tst", 1 );
