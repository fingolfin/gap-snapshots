# The GAP package SglPPow

SglPPow is an extension to the GAP Small Groups Library. Currently the Small
Groups Library gives access to the following groups:

  - Those of order at most 2000 except 1024 (423,164,062 groups);
  - Those of cubefree order at most 50,000 (395,703 groups);
  - Those of order p^7 for the primes p = 3,5,7,11 (907,489 groups);
  - Those of order p^n for n <= 6 and all primes p;
  - Those of order q^n * p where q^n divides 28, 36, 55 or 74 and p is
      an arbitrary prime not equal to q;
  - Those of squarefree order;
  - Those whose order factorises into at most 3 primes.

This package gives access to the groups of order p^7 for primes p > 11,
and to the groups of order 3^8.

The Database of groups of order 3^8 has been determined by Michael 
Vaughan-Lee. Access to the groups of order p^7 for primes p > 11 is via 
Bettina Eick and Michael Vaughan-Lee's LiePRing package which is based 
on Eamonn O'Brien and Michael Vaughan-Lee's classification of the nilpotent 
Lie rings of order p^7. 

The package can be downloaded as a .tar.gz file from
   <https://gap-packages.github.io/sglppow/>

Then `tar -zxvf slgppow.tar` produces a directory sglppow. This should be
moved into the `pkg` directory of a GAP installation.

The package is set up so that after loading it into GAP with

    LoadPackage("sglppow")

the groups can be obtained via the command

    SmallGroup( size, nr )

You can also obtain the number of groups of a given order with the command

    NumberSmallGroups(size)

Thus the package does not install any new functionality in GAP, it only
extends the available SmallGroups library.

To access the groups of order p^7 for p > 11 you will also need to install
the LiePRing package and the LieRing package due to Willem de Graaf and
Serena Cicalo. These packages are automatically loaded when SglPPow is 
loaded.

*WARNING:* There are 1,396,077 groups of order 3^8, 1,600,573 groups of
order 13^7, and 5,546,909 groups of order 17^7. For general p the number 
of groups of order p^7 is of order 3p^5. Furthermore as p increases, the 
time taken to generate a complete list of the groups of order p^7 grows
rapidly. Experimentally the time taken seems to be proportional to p^{6.2}. 
For p=13 it takes several hours to generate the complete list. For p <= 11 
the groups are precomputed, and their SmallGroup codes are stored in the 
SmallGroup database. But for p > 11 the Lie rings have to be generated from 
a list of 4773 parametrized presentations in the LiePRing database, and then 
converted into groups using the Baker-Campbell-Hausdorff formula. Further,
it takes over 11 gb of memory to store a complete list of power-commutator
presentations for all groups of order 13^7. Hence most users will want to 
avoid generating complete lists of the groups!

## License

The SglPPow package is copyright (C) 2014 by Michael Vaughan-Lee and Bettina Eick,
and licensed under the terms of the Artistic License 2.0.
For the exact terms of this license, please refer to the `LICENSE`
file provided to you as part of the SglPPow package, or refer to
<https://opensource.org/licenses/artistic-license-2.0>.
