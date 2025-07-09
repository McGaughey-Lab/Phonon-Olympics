#!/bin/sh


# --------------------------------calculation--------------------------------------------

for ecutwfc in 50;
do

for ecutrho in 400;
do

for k in 6;
do

for conv_thr in 1e-9;
do

filename=RbBr_structure_ecutwfc_${ecutwfc}_ecutrho_${ecutrho}_kpoint_${k}_conv_thr_${conv_thr}

cat << EOF >> pw.scf_${filename}.in
&CONTROL
   calculation      = 'scf'
   tstress          = .true.
   tprnfor          = .true.
   outdir           = 'RbBr'
   prefix           = 'RbBr'
   pseudo_dir       = './'
/
&SYSTEM
   ecutwfc          = $ecutwfc
   ecutrho          = $ecutrho
   occupations      = 'fixed'
   ntyp             = 2
   nat              = 2
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
Rb 85.4677651 Rb.pbe-spn-kjpaw_psl.1.0.0.UPF
Br 79.9032138 Br.pbe-n-kjpaw_psl.1.0.0.UPF

K_POINTS automatic
$k $k $k 0 0 0

CELL_PARAMETERS angstrom
-3.509 0.00000000000000 3.509
0.00000000000000 3.509 3.509
-3.509 3.509 0.00000000000000

ATOMIC_POSITIONS angstrom
Rb 0.0000000000 0.0000000000 0.0000000000 
Br -3.509 3.509 3.509 

EOF

pw.x < pw.scf_${filename}.in > pw.scf_${filename}.out

fermi=($(grep "Fermi" pw.scf_${filename}.out))
fermi=${fermi[-2]}
echo ${fermi}

cat << EOF > pw.bands_${filename}_GX.in
&CONTROL
   calculation      = 'bands'
   tstress          = .true.
   tprnfor          = .true.
   outdir           = 'RbBr'
   prefix           = 'RbBr'
   pseudo_dir       = './'
/
&SYSTEM
   ecutwfc          = $ecutwfc
   ecutrho          = $ecutrho
   occupations      = 'fixed'
   ntyp             = 2
   nat              = 2
   ibrav            = 0
   nbnd             = 16
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
Rb 85.4677651 Rb.pbe-spn-kjpaw_psl.1.0.0.UPF
Br 79.9032138 Br.pbe-n-kjpaw_psl.1.0.0.UPF

K_POINTS crystal_b
2
0.0 0.0 0.0 99
0.5 0.5 0.0 0

CELL_PARAMETERS angstrom
-3.509 0.00000000000000 3.509
0.00000000000000 3.509 3.509
-3.509 3.509 0.00000000000000

ATOMIC_POSITIONS angstrom
Rb 0.0000000000 0.0000000000 0.0000000000 
Br -3.509 3.509 3.509 

EOF

pw.x < pw.bands_${filename}_GX.in > pw.bands_${filename}_GX.out

cat << EOF > bands_GX.in
&bands
  prefix = "RbBr",
  outdir = "./RbBr/",
  filband = "pw.bands_${filename}_GX.dat"
/

EOF

bands.x < bands_GX.in > bands_GX.out

cat << EOF > pw.bands_${filename}_GKX.in
&CONTROL
   calculation      = 'bands'
   tstress          = .true.
   tprnfor          = .true.
   outdir           = 'RbBr'
   prefix           = 'RbBr'
   pseudo_dir       = './'
/
&SYSTEM
   ecutwfc          = $ecutwfc
   ecutrho          = $ecutrho
   occupations      = 'fixed'
   ntyp             = 2
   nat              = 2
   ibrav            = 0
   nbnd             = 16
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
Rb 85.4677651 Rb.pbe-spn-kjpaw_psl.1.0.0.UPF
Br 79.9032138 Br.pbe-n-kjpaw_psl.1.0.0.UPF

K_POINTS crystal_b
3
0.0 0.0 0.0 50
0.75 0.375 0.375 49
1.0 0.5 0.5 0

CELL_PARAMETERS angstrom
-3.509 0.00000000000000 3.509
0.00000000000000 3.509 3.509
-3.509 3.509 0.00000000000000

ATOMIC_POSITIONS angstrom
Rb 0.0000000000 0.0000000000 0.0000000000 
Br -3.509 3.509 3.509 

EOF

pw.x < pw.bands_${filename}_GKX.in > pw.bands_${filename}_GKX.out

cat << EOF > bands_GKX.in
&bands
  prefix = "RbBr",
  outdir = "./RbBr/",
  filband = "pw.bands_${filename}_GKX.dat"
/

EOF

bands.x < bands_GKX.in > bands_GKX.out

cat << EOF > pw.bands_${filename}_GL.in
&CONTROL
   calculation      = 'bands'
   tstress          = .true.
   tprnfor          = .true.
   outdir           = 'RbBr'
   prefix           = 'RbBr'
   pseudo_dir       = './'
/
&SYSTEM
   ecutwfc          = $ecutwfc
   ecutrho          = $ecutrho
   occupations      = 'fixed'
   ntyp             = 2
   nat              = 2
   ibrav            = 0
   nbnd             = 16
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
Rb 85.4677651 Rb.pbe-spn-kjpaw_psl.1.0.0.UPF
Br 79.9032138 Br.pbe-n-kjpaw_psl.1.0.0.UPF

K_POINTS crystal_b
2
0.0 0.0 0.0 99
0.5 0.5 0.5 0

CELL_PARAMETERS angstrom
-3.509 0.00000000000000 3.509
0.00000000000000 3.509 3.509
-3.509 3.509 0.00000000000000

ATOMIC_POSITIONS angstrom
Rb 0.0000000000 0.0000000000 0.0000000000 
Br -3.509 3.509 3.509 

EOF

pw.x < pw.bands_${filename}_GL.in > pw.bands_${filename}_GL.out

cat << EOF > bands_GL.in
&bands
  prefix = "RbBr",
  outdir = "./RbBr/",
  filband = "pw.bands_${filename}_GL.dat"
/

EOF

bands.x < bands_GL.in > bands_GL.out

done

done

done

done

# --------------------------------calculation--------------------------------------------
