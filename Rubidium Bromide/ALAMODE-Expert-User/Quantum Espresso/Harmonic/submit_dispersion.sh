#!/bin/sh

#-----------------Calculation-----------------------
for ecutwfc in 50;
do

for ecutrho in 400;
do

for k in 2;
do

for mag in 0.01;
do

condition_name=ecutwfc_${ecutwfc}_ecutrho_${ecutrho}_kpoint_${k}_mag_${mag}

prefix=RbBr222_${condition_name}

cat << EOF > ${prefix}_opt.alm.in
&general
  PREFIX = ${prefix}
  MODE = optimize
  NAT = 64
  NKD = 2
  KD = Br Rb 
/

&optimize
  DFSET = DFSET_harmonic_${condition_name}
/

&interaction
  NORDER = 1
/

&cell
  1.8897261246257702
  14.036 0.0 0.0
  0.0 14.036 0.0
  0.0 0.0 14.036
/

&cutoff
  *-* None
/

&position
  2 0.0 0.0 0.0
  1 0.0 0.25 0.0
  2 0.0 0.25 0.25
  1 0.0 0.0 0.25
  2 0.25 0.0 0.25
  1 0.25 0.25 0.25
  2 0.25 0.25 0.0
  1 0.25 0.0 0.0
  2 0.0 0.0 0.5
  1 0.0 0.25 0.5
  2 0.0 0.25 0.75
  1 0.0 0.0 0.75
  2 0.25 0.0 0.75
  1 0.25 0.25 0.75
  2 0.25 0.25 0.5
  1 0.25 0.0 0.5
  2 0.0 0.5 0.0
  1 0.0 0.75 0.0
  2 0.0 0.75 0.25
  1 0.0 0.5 0.25
  2 0.25 0.5 0.25
  1 0.25 0.75 0.25
  2 0.25 0.75 0.0
  1 0.25 0.5 0.0
  2 0.0 0.5 0.5
  1 0.0 0.75 0.5
  2 0.0 0.75 0.75
  1 0.0 0.5 0.75
  2 0.25 0.5 0.75
  1 0.25 0.75 0.75
  2 0.25 0.75 0.5
  1 0.25 0.5 0.5
  2 0.5 0.0 0.0
  1 0.5 0.25 0.0
  2 0.5 0.25 0.25
  1 0.5 0.0 0.25
  2 0.75 0.0 0.25
  1 0.75 0.25 0.25
  2 0.75 0.25 0.0
  1 0.75 0.0 0.0
  2 0.5 0.0 0.5
  1 0.5 0.25 0.5
  2 0.5 0.25 0.75
  1 0.5 0.0 0.75
  2 0.75 0.0 0.75
  1 0.75 0.25 0.75
  2 0.75 0.25 0.5
  1 0.75 0.0 0.5
  2 0.5 0.5 0.0
  1 0.5 0.75 0.0
  2 0.5 0.75 0.25
  1 0.5 0.5 0.25
  2 0.75 0.5 0.25
  1 0.75 0.75 0.25
  2 0.75 0.75 0.0
  1 0.75 0.5 0.0
  2 0.5 0.5 0.5
  1 0.5 0.75 0.5
  2 0.5 0.75 0.75
  1 0.5 0.5 0.75
  2 0.75 0.5 0.75
  1 0.75 0.75 0.75
  2 0.75 0.75 0.5
  1 0.75 0.5 0.5
/

EOF

alm  ${prefix}_opt.alm.in >  ${prefix}_opt.alm.log1 2>  ${prefix}_opt.alm.err

cat << EOF > ${prefix}_phband_GX.in
    &general
    PREFIX = ${prefix}_GX
    MODE   = phonons
    FCSXML = ${prefix}.xml
    MASS = 79.9032138 85.4677651
    NKD = 2
    KD = Br Rb
    NONANALYTIC = 3
    BORNINFO = borninfo
    BORNSYM = 1
    /

    &cell
    1.8897261246257702
    3.509 3.509 0.0
    3.509 0.0 3.509
    0.0 3.509 3.509
    /

    &kpoint
    1
    G 0.0 0.0 0.0 X 0.5 0.5 0.0 100
    /

EOF

anphon ${prefix}_phband_GX.in > ${prefix}_phband_GX.out

cat << EOF > ${prefix}_phband_GKX.in
    &general
    PREFIX = ${prefix}_GKX
    MODE   = phonons
    FCSXML = ${prefix}.xml
    MASS = 79.9032138 85.4677651
    NKD = 2
    KD = Br Rb
    NONANALYTIC = 3
    BORNINFO = borninfo
    BORNSYM = 1
    /

    &cell
    1.8897261246257702
    3.509 3.509 0.0
    3.509 0.0 3.509
    0.0 3.509 3.509
    /

    &kpoint
    1
    G 0.0 0.0 0.0 K 0.375 0.75 0.375 50
    K 0.375 0.75 0.375 X 0.5 1.0 0.5 50
    /

EOF

anphon ${prefix}_phband_GKX.in > ${prefix}_phband_GKX.out

cat << EOF > ${prefix}_phband_GL.in
    &general
    PREFIX = ${prefix}_GL
    MODE   = phonons
    FCSXML = ${prefix}.xml
    MASS = 79.9032138 85.4677651
    NKD = 2
    KD = Br Rb
    NONANALYTIC = 3
    BORNINFO = borninfo
    BORNSYM = 1
    /

    &cell
    1.8897261246257702
    3.509 3.509 0.0
    3.509 0.0 3.509
    0.0 3.509 3.509
    /

    &kpoint
    1
    G 0.0 0.0 0.0 L 0.5 0.5 0.5 100
    /

EOF

anphon ${prefix}_phband_GL.in > ${prefix}_phband_GL.out

done

done

done

done

# --------------------------------calculation--------------------------------------------