#!/bin/sh

QEDIR=/work/app/QuantumESPRESSO/qe-6.8

# --------------------------------calculation--------------------------------------------

for ecutwfc in 90;
do

echo $ecutwfc

for ecutrho in 320;
do

for k in 6;
do

for conv_thr in 1e-10;
do

for shift in 0;
do

header=structure_ecutwfc_${ecutwfc}_ecutrho_${ecutrho}_kpoint_${k}_conv_thr_${conv_thr}_shift_${shift}

prefix=MoSe2_${header}

cat << EOF >> pw.${header}.in
&CONTROL
   calculation      = 'scf'
   tstress          = .true.
   tprnfor          = .true.
   outdir           = 'MoSe2_mono'
   prefix           = 'MoSe2_mono' 
   pseudo_dir       = '/home/tomuhama/mose2_mono/structure/'
   nstep            = 300
/
&SYSTEM
   ecutwfc          = ${ecutwfc}
   ecutrho          = ${ecutrho}
   occupations      = 'fixed'
   ntyp             = 2
   nat              = 3
   ibrav            = 0
/

&ELECTRONS
   electron_maxstep = 300
   conv_thr         = ${conv_thr}
/

&IONS
/

&CELL
/


ATOMIC_SPECIES
Mo 95.94873241 Mo.pbesol-spn-kjpaw_psl.1.0.0.UPF
Se 78.9595608 Se.pbesol-dn-kjpaw_psl.1.0.0.UPF

K_POINTS automatic
${k} ${k} 1 ${shift} ${shift} ${shift}

CELL_PARAMETERS angstrom
3.267 0.00000000000000 0.00000000000000
-1.6335 2.829305 0.00000000000000
0.00000000000000 0.00000000000000 14

ATOMIC_POSITIONS angstrom
Mo 0.0000000000 0.0000000000 0.0000000000
Se 0.0000000000 1.88620333  1.66
Se 0.0000000000 1.88620333  -1.66


EOF

${QEDIR}/bin/pw.x < pw.${header}.in > pw.${header}.out

cat << EOF > pw.bands_${prefix}_GM.in
&CONTROL
   calculation      = 'bands'
   tstress          = .true.
   tprnfor          = .true.
   outdir           = 'MoSe2_mono'
   prefix           = 'MoSe2_mono' 
   pseudo_dir       = '/home/tomuhama/mose2_mono/structure/'
   nstep            = 300
/
&SYSTEM
   ecutwfc          = ${ecutwfc}
   ecutrho          = ${ecutrho}
   occupations      = 'fixed'
   ntyp             = 2
   nat              = 3
   ibrav            = 0
   nbnd             = 32
/
&ELECTRONS
   electron_maxstep = 300
   conv_thr         = ${conv_thr}
/
&IONS
/
&CELL
/

ATOMIC_SPECIES
Mo 95.94873241 Mo.pbesol-spn-kjpaw_psl.1.0.0.UPF
Se 78.9595608 Se.pbesol-dn-kjpaw_psl.1.0.0.UPF

K_POINTS crystal_b
2
0.0 0.0 0.0 99
0.5 0.0 0.0 0


CELL_PARAMETERS angstrom
3.267 0.00000000000000 0.00000000000000
-1.6335 2.829305 0.00000000000000
0.00000000000000 0.00000000000000 14

ATOMIC_POSITIONS angstrom
Mo 0.0000000000 0.0000000000 0.0000000000
Se 0.0000000000 1.88620333  1.66
Se 0.0000000000 1.88620333  -1.66


EOF

${QEDIR}/bin/pw.x < pw.bands_${prefix}_GM.in > pw.bands_${prefix}_GM.out

cat << EOF > bands_GM.in
&bands
  prefix = 'MoSe2_mono',
  outdir = './MoSe2_mono/',
  filband = "pw.bands_${prefix}_GM.dat"
/

EOF

${QEDIR}/bin/bands.x < bands_GM.in > bands_GM.out

cat << EOF > pw.bands_${prefix}_GKM.in
&CONTROL
   calculation      = 'bands'
   tstress          = .true.
   tprnfor          = .true.
   outdir           = 'MoSe2_mono'
   prefix           = 'MoSe2_mono' 
   pseudo_dir       = '/home/tomuhama/mose2_mono/structure/'
   nstep            = 300
/
&SYSTEM
   ecutwfc          = ${ecutwfc}
   ecutrho          = ${ecutrho}
   occupations      = 'fixed'
   ntyp             = 2
   nat              = 3
   ibrav            = 0
   nbnd             = 32
/
&ELECTRONS
   electron_maxstep = 300
   conv_thr         = ${conv_thr}
/
&IONS
/
&CELL
/

ATOMIC_SPECIES
Mo 95.94873241 Mo.pbesol-spn-kjpaw_psl.1.0.0.UPF
Se 78.9595608 Se.pbesol-dn-kjpaw_psl.1.0.0.UPF

K_POINTS crystal_b
3
0.0 0.0 0.0 50
0.3333333333 0.3333333333 0.0 49
0.5 0.0 0.0 0


CELL_PARAMETERS angstrom
3.267 0.00000000000000 0.00000000000000
-1.6335 2.829305 0.00000000000000
0.00000000000000 0.00000000000000 14

ATOMIC_POSITIONS angstrom
Mo 0.0000000000 0.0000000000 0.0000000000
Se 0.0000000000 1.88620333  1.66
Se 0.0000000000 1.88620333  -1.66


EOF

${QEDIR}/bin/pw.x < pw.bands_${prefix}_GKM.in > pw.bands_${prefix}_GKM.out

cat << EOF > bands_GKM.in
&bands
  prefix = 'MoSe2_mono',
  outdir = './MoSe2_mono/',
  filband = "pw.bands_${prefix}_GKM.dat"
/

EOF

${QEDIR}/bin/bands.x < bands_GKM.in > bands_GKM.out

done

done

done

done

done

# --------------------------------calculation--------------------------------------------


