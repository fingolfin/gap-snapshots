                        The GAP package 
                           IRREDSOL
                         Version 1.4.4

IRREDSOL is a GAP package which provides a library of all irreducible 
soluble subgroups of GL(n, q), up to conjugacy, where n is a positive
integer and q a prime power satisfying q^n <= 2^24-1, and a library
of all primitive soluble groups of degree at most 2^24-1.

This version of IRREDSOL requires at least GAP 4.9.

In order to install IRREDSOL, you have to get the package archive file 
'irredsol-1.4.4.tar.gz', or any other archive format suitable for your
system. It is available for download from

https://www.gap-system.org/Packages/irredsol.html

To install IRREDSOL, move the package archive file into the 'pkg'
directory in which you plan to install IRREDSOL. Usually, this will be 
the directory 'pkg' in the GAP directory.

You should now have a directory `irredsol-1.4.4' in the `pkg' directory.

If you already have a previous version of IRREDSOL, that is, there is a 
directory whose name starts with 'irredsol' in the 'pkg' directory, you
may delete that directory (or move it outside the pkg directory).

To load the IRREDSOL package manually, start GAP and type

    LoadPackage ("irredsol");

at the GAP prompt. If everything is ok, this should print a 
banner (if IRREDSOL is not already loaded) and return `true'.

Please do not hesitate to report any bugs or other problems/suggestions to the 
author:

Burkhard Höfling
e-mail: b.hoefling@tu-bs.de
www:    http://www.icm.tu-bs.de/~bhoeflin
