#!/bin/sh

QEDIR=/work/app/QuantumESPRESSO/qe-6.8/
ALAMODEDIR=/work/app/ALAMODE/alamode-1.3.0/


for anh_cutoff in 16;
do

for ecutwfc in 50;
do

for ecutrho in 400;
do

for k in 1;
do

for mag in 0.04;
do

condition_name=ecutwfc_${ecutwfc}_ecutrho_${ecutrho}_kpoint_${k}_mag_${mag}

prefix=RbBr333_${condition_name}

for thermo_k in 30;
do

cat << EOF > RTA_${prefix}_thermo_k_${thermo_k}_iso_10_50K.in
    &general
    PREFIX = ${prefix}_thermo_k_${thermo_k}_iso_10_50K
    MODE = RTA
    FCSXML = ${prefix}_cubic.xml
    MASS = 78.918 84.912
    NKD = 2
    KD = Br Rb
    EMIN = 0
    EMAX = 120
    DELTA_E = 0.5
    TMIN = 10
    TMAX = 50
    DT = 10
    NONANALYTIC = 3
    BORNINFO = borninfo
    BORNSYM = 1
    /

    &analysis
    ISOTOPE = 0
    KAPPA_SPEC = 1
    /

    &cell
    1.8897261246257702
    3.509 3.509 0.0
    3.509 0.0 3.509
    0.0 3.509 3.509
    /

    &kpoint
    2
    ${thermo_k} ${thermo_k} ${thermo_k}
    /

EOF

${ALAMODEDIR}/anphon/anphon RTA_${prefix}_thermo_k_${thermo_k}_iso_10_50K.in > RTA_${prefix}_thermo_k_${thermo_k}_iso_10_50K.out

cat << EOF > RTA_${prefix}_thermo_k_${thermo_k}_iso_50_300K.in
    &general
    PREFIX = ${prefix}_thermo_k_${thermo_k}_iso_50_300K
    MODE = RTA
    FCSXML = ${prefix}_cubic.xml
    MASS = 78.918 84.912
    NKD = 2
    KD = Br Rb
    EMIN = 0
    EMAX = 120
    DELTA_E = 0.5
    TMIN = 50
    TMAX = 300
    DT = 25
    NONANALYTIC = 3
    BORNINFO = borninfo
    BORNSYM = 1
    /

    &analysis
    ISOTOPE = 0
    KAPPA_SPEC = 1
    /

    &cell
    1.8897261246257702
    3.509 3.509 0.0
    3.509 0.0 3.509
    0.0 3.509 3.509
    /

    &kpoint
    2
    ${thermo_k} ${thermo_k} ${thermo_k}
    /

EOF

${ALAMODEDIR}/anphon/anphon RTA_${prefix}_thermo_k_${thermo_k}_iso_50_300K.in > RTA_${prefix}_thermo_k_${thermo_k}_iso_50_300K.out

cat << EOF > RTA_${prefix}_thermo_k_${thermo_k}_iso_300_1000K.in
    &general
    PREFIX = ${prefix}_thermo_k_${thermo_k}_iso_300_1000K
    MODE = RTA
    FCSXML = ${prefix}_cubic.xml
    MASS = 78.918 84.912
    NKD = 2
    KD = Br Rb
    EMIN = 0
    EMAX = 120
    DELTA_E = 0.5
    TMIN = 300
    TMAX = 1000
    DT = 100
    NONANALYTIC = 3
    BORNINFO = borninfo
    BORNSYM = 1
    /

    &analysis
    ISOTOPE = 0
    KAPPA_SPEC = 1
    /

    &cell
    1.8897261246257702
    3.509 3.509 0.0
    3.509 0.0 3.509
    0.0 3.509 3.509
    /

    &kpoint
    2
    ${thermo_k} ${thermo_k} ${thermo_k}
    /

EOF

${ALAMODEDIR}/anphon/anphon RTA_${prefix}_thermo_k_${thermo_k}_iso_300_1000K.in > RTA_${prefix}_thermo_k_${thermo_k}_iso_300_1000K.out

cat << EOF > RTA_${prefix}_thermo_k_${thermo_k}_nat_10_50K.in
    &general
    PREFIX = ${prefix}_thermo_k_${thermo_k}_nat_10_50K
    MODE = RTA
    FCSXML = ${prefix}_cubic.xml
    MASS = 79.9032138 85.4677651
    NKD = 2
    KD = Br Rb
    EMIN = 0
    EMAX = 120
    DELTA_E = 0.5
    TMIN = 10
    TMAX = 50
    DT = 10
    NONANALYTIC = 3
    BORNINFO = borninfo
    BORNSYM = 1
    /

    &analysis
    ISOTOPE = 2
    ISOFACT = 0.00015628588866173983 0.00010965320902588707
    KAPPA_SPEC = 1
    /

    &cell
    1.8897261246257702
    3.509 3.509 0.0
    3.509 0.0 3.509
    0.0 3.509 3.509
    /

    &kpoint
    2
    ${thermo_k} ${thermo_k} ${thermo_k}
    /

EOF

${ALAMODEDIR}/anphon/anphon RTA_${prefix}_thermo_k_${thermo_k}_nat_10_50K.in > RTA_${prefix}_thermo_k_${thermo_k}_nat_10_50K.out

cat << EOF > RTA_${prefix}_thermo_k_${thermo_k}_nat_50_300K.in
    &general
    PREFIX = ${prefix}_thermo_k_${thermo_k}_nat_50_300K
    MODE = RTA
    FCSXML = ${prefix}_cubic.xml
    MASS = 79.9032138 85.4677651
    NKD = 2
    KD = Br Rb
    EMIN = 0
    EMAX = 120
    DELTA_E = 0.5
    TMIN = 50
    TMAX = 300
    DT = 25
    NONANALYTIC = 3
    BORNINFO = borninfo
    BORNSYM = 1
    /

    &analysis
    ISOTOPE = 2
    ISOFACT = 0.00015628588866173983 0.00010965320902588707
    KAPPA_SPEC = 1
    /

    &cell
    1.8897261246257702
    3.509 3.509 0.0
    3.509 0.0 3.509
    0.0 3.509 3.509
    /

    &kpoint
    2
    ${thermo_k} ${thermo_k} ${thermo_k}
    /

EOF

${ALAMODEDIR}/anphon/anphon RTA_${prefix}_thermo_k_${thermo_k}_nat_50_300K.in > RTA_${prefix}_thermo_k_${thermo_k}_nat_50_300K.out

cat << EOF > RTA_${prefix}_thermo_k_${thermo_k}_nat_300_1000K.in
    &general
    PREFIX = ${prefix}_thermo_k_${thermo_k}_nat_300_1000K
    MODE = RTA
    FCSXML = ${prefix}_cubic.xml
    MASS = 79.9032138 85.4677651
    NKD = 2
    KD = Br Rb
    EMIN = 0
    EMAX = 120
    DELTA_E = 0.5
    TMIN = 300
    TMAX = 1000
    DT = 100
    NONANALYTIC = 3
    BORNINFO = borninfo
    BORNSYM = 1
    /

    &analysis
    ISOTOPE = 2
    ISOFACT = 0.00015628588866173983 0.00010965320902588707
    KAPPA_SPEC = 1
    /

    &cell
    1.8897261246257702
    3.509 3.509 0.0
    3.509 0.0 3.509
    0.0 3.509 3.509
    /

    &kpoint
    2
    ${thermo_k} ${thermo_k} ${thermo_k}
    /

EOF

${ALAMODEDIR}/anphon/anphon RTA_${prefix}_thermo_k_${thermo_k}_nat_300_1000K.in > RTA_${prefix}_thermo_k_${thermo_k}_nat_300_1000K.out

done

done
done
done
done
done