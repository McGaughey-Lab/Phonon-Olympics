#!/bin/sh


# --------------------------------calculation--------------------------------------------

for ecutwfc in 50;
do

for ecutrho in 400;
do

for k in 2;
do

cat << EOF >> rbbr.scf.in
&CONTROL
   calculation      = 'scf'
   tstress          = .true.
   tprnfor          = .true.
   outdir           = 'RbBr'
   prefix           = 'RbBr'
   pseudo_dir       = '/home/tomuhama/rbbr/electronic/'
/
&SYSTEM
   ecutwfc          = ${ecutwfc}
   ecutrho          = ${ecutrho}
   occupations      = 'fixed'
   ntyp             = 2
   nat              = 2
   ibrav            = 0
/
&ELECTRONS
   electron_maxstep = 300
   conv_thr         = 1e-10
/
&IONS
/
&CELL
/

ATOMIC_SPECIES
Rb 85.4677651 Rb.pbe-spn-kjpaw_psl.1.0.0.UPF
Br 79.9032138 Br.pbe-n-kjpaw_psl.1.0.0.UPF

K_POINTS automatic
${k} ${k} ${k} 0 0 0

CELL_PARAMETERS angstrom
-3.509 0.00000000000000 3.509
0.00000000000000 3.509 3.509
-3.509 3.509 0.00000000000000

ATOMIC_POSITIONS angstrom
Rb 0.0000000000 0.0000000000 0.0000000000
Br -3.509 3.509 3.509

EOF

pw.x < rbbr.scf.in > rbbr.scf.out 2> rbbr.scf.err

cd RbBr

for tr2 in 1e-15;
do

cat << EOF >> rbbr_${tr2}.ph.in
&inputph
  prefix = 'RbBr',
  tr2_ph = ${tr2},
  fildyn = 'matdyn_${tr2}',
  epsil = .true.
/
0 0 0

EOF

ph.x < rbbr_${tr2}.ph.in > rbbr_${tr2}.ph.out 2> rbbr_${tr2}.ph.err


done

done

done

done

# --------------------------------calculation--------------------------------------------