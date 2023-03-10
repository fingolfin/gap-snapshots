# RepnDecomp, chapter 6
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST( "repndecomp05.tst");

# /doc/_Chunks.xml:2-14
gap> G := DihedralGroup(8);;
gap> irreps := IrreducibleRepresentations(G);;
gap> # rho is the sum of two isomorphic degree 1 irreps, and a degree
> # 2 irrep.
> rho := DirectSumOfRepresentations([irreps[4], irreps[4], irreps[5]]);;
gap> # Compute a basis for the centralizer (in blocks)
> cent_basis_blocks := CentralizerBlocksOfRepresentation(rho);;
gap> # Verify that the dimension is the sum of the multiplicities squared,
> # in this case 2^2 + 1 = 5.
> Length(cent_basis_blocks) = 5;
true

# /doc/_Chunks.xml:20-26
gap> # This is the actual basis for the centralizer.
> cent_basis := CentralizerOfRepresentation(rho);;
gap> # All matrices in the span should commute with the image of rho.
> ForAll(G, g -> ForAll(cent_basis, M -> Image(rho, g)*M = M*Image(rho,g)));
true

# /doc/_Chunks.xml:32-49
gap> # Now we have a basis for the centralizer, we can sum a conjugacy class
> # of G.
> class := List(ConjugacyClasses(G)[3]);;
gap> # We can do the computation naively, with no centralizer basis given:
> sum1 := ClassSumCentralizer(rho, class, fail);;
gap> # Before summing with th centralizer basis given, we need to
> # orthonormalize it. It's already orthogonal, but not normal:
> orth_basis := OrthonormalBasis@RepnDecomp(cent_basis);;
gap> IsOrthonormalSet(orth_basis, InnerProduct@RepnDecomp);
true
gap> # And with the centralizer given, should be more efficient in certain
> # cases (small degree, low multiplicities, but very large group)
> sum2 := ClassSumCentralizer(rho, class, orth_basis);;
gap> # Should be the same:
> sum1 = sum2;
true

# /doc/_Chunks.xml:55-60
gap> # The very same as the above, but with no checks on orthonormality.
> sum3 := ClassSumCentralizerNC(rho, class, orth_basis);;
gap> sum1 = sum3;
true

#
gap> STOP_TEST("repndecomp05.tst", 1 );
