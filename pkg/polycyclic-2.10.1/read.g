#############################################################################
##
#W    read.g            GAP 4 package 'polycyclic'               Bettina Eick
#W                                                              Werner Nickel
#W                                                                   Max Horn
##

##
## matrix -- basics about matrices, rational spaces, lattices and modules
##
ReadPackage( "polycyclic", "gap/matrix/intmat.gi");
ReadPackage( "polycyclic", "gap/matrix/rowbases.gi");
ReadPackage( "polycyclic", "gap/matrix/latbases.gi");
ReadPackage( "polycyclic", "gap/matrix/lattices.gi");
ReadPackage( "polycyclic", "gap/matrix/modules.gi");
ReadPackage( "polycyclic", "gap/matrix/triangle.gi");
ReadPackage( "polycyclic", "gap/matrix/hnf.gi");

##
##
## basic -- basic functions for pcp groups
##
ReadPackage( "polycyclic", "gap/basic/collect.gi");
ReadPackage( "polycyclic", "gap/basic/colftl.gi");
ReadPackage( "polycyclic", "gap/basic/colcom.gi");
ReadPackage( "polycyclic", "gap/basic/coldt.gi");
ReadPackage( "polycyclic", "gap/basic/colsave.gi");

ReadPackage( "polycyclic", "gap/basic/pcpelms.gi");
ReadPackage( "polycyclic", "gap/basic/pcppcps.gi");
ReadPackage( "polycyclic", "gap/basic/pcpgrps.gi");
ReadPackage( "polycyclic", "gap/basic/pcppara.gi");
ReadPackage( "polycyclic", "gap/basic/pcpexpo.gi");
ReadPackage( "polycyclic", "gap/basic/pcpsers.gi");
ReadPackage( "polycyclic", "gap/basic/grphoms.gi");
ReadPackage( "polycyclic", "gap/basic/pcpfact.gi");
ReadPackage( "polycyclic", "gap/basic/chngpcp.gi");
ReadPackage( "polycyclic", "gap/basic/convert.gi");
ReadPackage( "polycyclic", "gap/basic/orbstab.gi");

ReadPackage( "polycyclic", "gap/basic/construct.gi");

##
## cohomology  - extensions and complements
##
ReadPackage( "polycyclic", "gap/cohom/cohom.gi");
ReadPackage( "polycyclic", "gap/cohom/addgrp.gi");
ReadPackage( "polycyclic", "gap/cohom/general.gi");
ReadPackage( "polycyclic", "gap/cohom/solabel.gi");
ReadPackage( "polycyclic", "gap/cohom/solcohom.gi");
ReadPackage( "polycyclic", "gap/cohom/twocohom.gi");
ReadPackage( "polycyclic", "gap/cohom/intcohom.gi");
ReadPackage( "polycyclic", "gap/cohom/onecohom.gi");
ReadPackage( "polycyclic", "gap/cohom/grpext.gi");
ReadPackage( "polycyclic", "gap/cohom/grpcom.gi");
ReadPackage( "polycyclic", "gap/cohom/norcom.gi");

##
## action - under polycyclic matrix groups
##
ReadPackage( "polycyclic", "gap/action/extend.gi");
ReadPackage( "polycyclic", "gap/action/basepcgs.gi");
ReadPackage( "polycyclic", "gap/action/freegens.gi");
ReadPackage( "polycyclic", "gap/action/dixon.gi");
ReadPackage( "polycyclic", "gap/action/kernels.gi");
ReadPackage( "polycyclic", "gap/action/orbstab.gi");
ReadPackage( "polycyclic", "gap/action/orbnorm.gi");

##
## some more high level functions for pcp groups
##
ReadPackage( "polycyclic", "gap/pcpgrp/general.gi");
ReadPackage( "polycyclic", "gap/pcpgrp/inters.gi");
ReadPackage( "polycyclic", "gap/pcpgrp/grpinva.gi");
ReadPackage( "polycyclic", "gap/pcpgrp/torsion.gi");
ReadPackage( "polycyclic", "gap/pcpgrp/maxsub.gi");
ReadPackage( "polycyclic", "gap/pcpgrp/findex.gi");
ReadPackage( "polycyclic", "gap/pcpgrp/nindex.gi");
ReadPackage( "polycyclic", "gap/pcpgrp/nilpot.gi");
ReadPackage( "polycyclic", "gap/pcpgrp/polyz.gi");
ReadPackage( "polycyclic", "gap/pcpgrp/pcpattr.gi");
ReadPackage( "polycyclic", "gap/pcpgrp/wreath.gi");
ReadPackage( "polycyclic", "gap/pcpgrp/fitting.gi");
ReadPackage( "polycyclic", "gap/pcpgrp/centcon.gi");
ReadPackage( "polycyclic", "gap/pcpgrp/normcon.gi");
ReadPackage( "polycyclic", "gap/pcpgrp/schur.gi");
ReadPackage( "polycyclic", "gap/pcpgrp/tensor.gi");

##
## matrep -- computing a matrix representation
##
ReadPackage( "polycyclic", "gap/matrep/matrep.gi");
ReadPackage( "polycyclic", "gap/matrep/affine.gi");
ReadPackage( "polycyclic", "gap/matrep/unitri.gi");

##
## examples - generic groups and an example list
##
ReadPackage( "polycyclic", "gap/exam/pcplib.gi");
ReadPackage( "polycyclic", "gap/exam/matlib.gi");
ReadPackage( "polycyclic", "gap/exam/nqlib.gi");
ReadPackage( "polycyclic", "gap/exam/generic.gi");
ReadPackage( "polycyclic", "gap/exam/bgnilp.gi");
ReadPackage( "polycyclic", "gap/exam/metacyc.gi");
ReadPackage( "polycyclic", "gap/exam/metagrp.gi");

##
## schur covers and schur towers of p-groups
##
ReadPackage( "polycyclic", "gap/cover/const/bas.gi"); # basic stuff
ReadPackage( "polycyclic", "gap/cover/const/orb.gi"); # orbits
ReadPackage( "polycyclic", "gap/cover/const/aut.gi"); # automorphisms
ReadPackage( "polycyclic", "gap/cover/const/com.gi"); # complements
ReadPackage( "polycyclic", "gap/cover/const/cov.gi"); # Schur covers
#ReadPackage( "polycyclic", "gap/cover/const/ord.gi"); # order
#ReadPackage( "polycyclic", "gap/cover/const/ccc.gi"); # coclass
#ReadPackage( "polycyclic", "gap/cover/trees/xtree.gi"); # cover trees


