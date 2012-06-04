CC = gcc
CFLAGS= -O2
EXEC= ../exec.d
all:  ${EXEC}/makegp ${EXEC}/gprun ${EXEC}/egrun ${EXEC}/sylrun ${EXEC}/normrun\
	${EXEC}/sylnorm ${EXEC}/conrun ${EXEC}/pcrun ${EXEC}/scrun\
	${EXEC}/selgen ${EXEC}/chbrun ${EXEC}/optrun ${EXEC}/matcalc\
	${EXEC}/matperm ${EXEC}/nqmrun ${EXEC}/nqrun ${EXEC}/grrun\
	${EXEC}/extprun ${EXEC}/crrun ${EXEC}/readrels ${EXEC}/testmf\
	${EXEC}/testpf ${EXEC}/subdir ${EXEC}/wreath ${EXEC}/permmat\
	${EXEC}/tcrun ${EXEC}/tcrunb ${EXEC}/pkrun ${EXEC}/tens ${EXEC}/matsum\
	${EXEC}/cohomology ${EXEC}/execcmd ${EXEC}/clrgrp\
	${EXEC}/cohomology.gap ${EXEC}/execcmd.gap
.c.o:
	${CC} -c $(CFLAGS) $*.c 
${EXEC}/makegp: mg.o
	${CC} $(CFLAGS) -o ${EXEC}/makegp mg.o
${EXEC}/gprun: gpd.o gpp.o permfns.o
	${CC} $(CFLAGS) -o ${EXEC}/gprun gpd.o gpp.o permfns.o
${EXEC}/egrun: egd.o egp.o permfns.o
	${CC} $(CFLAGS) -o ${EXEC}/egrun egd.o egp.o permfns.o
${EXEC}/sylrun: syld.o sylp.o morepermfns.o permfns.o
	${CC} $(CFLAGS) -o ${EXEC}/sylrun syld.o sylp.o morepermfns.o permfns.o
${EXEC}/normrun: normd.o normp1.o normp2.o chb.o permfns.o morepermfns.o
	${CC} $(CFLAGS) -o ${EXEC}/normrun normd.o normp1.o normp2.o \
	chb.o permfns.o morepermfns.o
${EXEC}/sylnorm: snd.o sylp2.o normp1.o normp2.o permfns.o morepermfns.o chb.o
	${CC} $(CFLAGS) -o ${EXEC}/sylnorm snd.o sylp2.o normp1.o normp2.o \
	permfns.o morepermfns.o chb.o
${EXEC}/conrun: conpdcd.o conpdc1.o conpdc2.o
	${CC} $(CFLAGS) -o ${EXEC}/conrun conpdcd.o conpdc1.o conpdc2.o
${EXEC}/pcrun: pcd.o pcp.o permfns.o pcscfns.o
	${CC} $(CFLAGS) -o ${EXEC}/pcrun pcd.o pcp.o permfns.o pcscfns.o
${EXEC}/scrun: scd.o scp.o permfns.o pcscfns.o
	${CC} $(CFLAGS) -o ${EXEC}/scrun scd.o scp.o permfns.o pcscfns.o
${EXEC}/selgen: slg.o
	${CC} $(CFLAGS) -o ${EXEC}/selgen slg.o
${EXEC}/chbrun: testchb.o chb.o permfns.o
	${CC} $(CFLAGS) -o ${EXEC}/chbrun testchb.o chb.o permfns.o
${EXEC}/optrun: optd.o optp.o permfns.o
	${CC} $(CFLAGS) -o ${EXEC}/optrun optd.o optp.o permfns.o
${EXEC}/matcalc: mcd.o mcp.o matfns.o
	${CC} $(CFLAGS) -o ${EXEC}/matcalc mcd.o mcp.o matfns.o
${EXEC}/matperm: matperm.o matfns.o
	${CC} $(CFLAGS) -o ${EXEC}/matperm matperm.o matfns.o
${EXEC}/nqmrun: nqmd.o nqmp.o nqmfns.o
	${CC} $(CFLAGS) -o ${EXEC}/nqmrun nqmd.o nqmp.o nqmfns.o
${EXEC}/nqrun: nqd.o nqp1.o nqp2.o nqp3.o nqfns.o matfns.o
	${CC} $(CFLAGS) -o ${EXEC}/nqrun nqd.o nqp1.o nqp2.o nqp3.o nqfns.o \
	matfns.o
${EXEC}/grrun: grd.o grp.o permfns.o
	${CC} $(CFLAGS) -o ${EXEC}/grrun grd.o grp.o permfns.o
${EXEC}/extprun: extpd.o exa.o exb.o exc.o permfns.o matfns.o
	${CC} $(CFLAGS) -o ${EXEC}/extprun extpd.o exa.o exb.o exc.o \
	permfns.o matfns.o
${EXEC}/crrun: crd.o crp1.o crp2.o matfns.o
	${CC} $(CFLAGS) -o ${EXEC}/crrun crd.o crp1.o crp2.o matfns.o
${EXEC}/readrels: readrels.o
	${CC} $(CFLAGS) -o ${EXEC}/readrels readrels.o
${EXEC}/testmf: testmf.o matfns.o
	${CC} $(CFLAGS) -o ${EXEC}/testmf testmf.o matfns.o
${EXEC}/testpf: testpf.o permfns.o
	${CC} $(CFLAGS) -o ${EXEC}/testpf testpf.o permfns.o
${EXEC}/subdir: subdir.o
	${CC} $(CFLAGS) -o ${EXEC}/subdir subdir.o
${EXEC}/wreath: wreath.o
	${CC} $(CFLAGS) -o ${EXEC}/wreath wreath.o
${EXEC}/permmat: permmat.o
	${CC} $(CFLAGS) -o ${EXEC}/permmat permmat.o
${EXEC}/tcrun: tcd.o tcp.o
	${CC} $(CFLAGS) -o ${EXEC}/tcrun tcd.o tcp.o
${EXEC}/tcrunb: tcdb.o tcpb.o
	${CC} $(CFLAGS) -o ${EXEC}/tcrunb tcdb.o tcpb.o
${EXEC}/pkrun: pkd.o pkp.o pkmatfns.o
	${CC} $(CFLAGS) -o ${EXEC}/pkrun pkd.o pkp.o pkmatfns.o
${EXEC}/tens: tens.o
	${CC} $(CFLAGS) -o ${EXEC}/tens tens.o
${EXEC}/matsum: matsum.o
	${CC} $(CFLAGS) -o ${EXEC}/matsum matsum.o
${EXEC}/cohomology: cohomology
	cp cohomology $(EXEC)/cohomology
	chmod +x $(EXEC)/cohomology
${EXEC}/execcmd: execcmd
	cp execcmd $(EXEC)/execcmd
	chmod +x $(EXEC)/execcmd
${EXEC}/clrgrp: clrgrp
	cp clrgrp $(EXEC)/clrgrp
	chmod +x $(EXEC)/clrgrp
${EXEC}/cohomology.gap: cohomology.gap
	cp cohomology.gap $(EXEC)/cohomology.gap
	chmod +x $(EXEC)/cohomology.gap
${EXEC}/execcmd.gap: execcmd.gap
	cp execcmd.gap $(EXEC)/execcmd.gap
	chmod +x $(EXEC)/execcmd.gap
