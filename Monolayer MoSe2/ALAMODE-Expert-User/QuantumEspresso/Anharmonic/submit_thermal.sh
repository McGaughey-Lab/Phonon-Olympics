#!/bin/sh

for anh_cutoff in 14;
do

for ecutwfc in 90;
do

for ecutrho in 320;
do

for k in 1;
do

for mag in 0.22;
do

condition_name=ecutwfc_${ecutwfc}_ecutrho_${ecutrho}_kpoint_${k}_mag_${mag}

prefix=MoSe551_${condition_name}

for thermo_k in 150;
do

cat << EOF > RTA_${prefix}_cutoff_${anh_cutoff}_thermo_k_${thermo_k}_iso_50_300K.in
    &general
    PREFIX = ${prefix}_cutoff_${anh_cutoff}_thermo_k_${thermo_k}_iso_50_300K
    MODE = RTA
    FCSXML = ${prefix}_cubic.xml
    MASS = 97.905 79.917
    NKD = 2
    KD = Mo Se
    EMIN = 0
    EMAX = 400
    DELTA_E = 0.1
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
      3.27 0.0 0.0
      -1.635 2.8319030703751142 0.0
      0.0 0.0 6.47
    /

    &kpoint
    2
    ${thermo_k} ${thermo_k} 1
    /

EOF

cat << EOF > RTA_${prefix}_cutoff_${anh_cutoff}_thermo_k_${thermo_k}_iso_300_1000K.in
    &general
    PREFIX = ${prefix}_cutoff_${anh_cutoff}_thermo_k_${thermo_k}_iso_300_1000K
    MODE = RTA
    FCSXML = ${prefix}_cubic.xml
    MASS = 97.905 79.917
    NKD = 2
    KD = Mo Se
    EMIN = 0
    EMAX = 400
    DELTA_E = 0.1
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
      3.27 0.0 0.0
      -1.635 2.8319030703751142 0.0
      0.0 0.0 6.47
    /

    &kpoint
    2
    ${thermo_k} ${thermo_k} 1
    /

EOF

cat << EOF > RTA_${prefix}_cutoff_${anh_cutoff}_thermo_k_${thermo_k}_nat_50_300K.in
    &general
    PREFIX = ${prefix}_cutoff_${anh_cutoff}_thermo_k_${thermo_k}_nat_50_300K
    MODE = RTA
    FCSXML = ${prefix}_cubic.xml
    MASS = 95.94873241 78.9595608
    NKD = 2
    KD = Mo Se
    EMIN = 0
    EMAX = 400
    DELTA_E = 0.1
    TMIN = 50
    TMAX = 300
    DT = 25
    NONANALYTIC = 3
    BORNINFO = borninfo
    BORNSYM = 1
    /

    &analysis
    ISOTOPE = 2
    ISOFACT = 0.0005967491911393617 0.00046293253700458
    KAPPA_SPEC = 1
    /

    &cell
    1.8897261246257702
      3.27 0.0 0.0
      -1.635 2.8319030703751142 0.0
      0.0 0.0 6.47
    /

    &kpoint
    2
    ${thermo_k} ${thermo_k} 1
    /

EOF

cat << EOF > RTA_${prefix}_cutoff_${anh_cutoff}_thermo_k_${thermo_k}_nat_300_1000K.in
    &general
    PREFIX = ${prefix}_cutoff_${anh_cutoff}_thermo_k_${thermo_k}_nat_300_1000K
    MODE = RTA
    FCSXML = ${prefix}_cubic.xml
    MASS = 95.94873241 78.9595608
    NKD = 2
    KD = Mo Se
    EMIN = 0
    EMAX = 400
    DELTA_E = 0.1
    TMIN = 300
    TMAX = 1000
    DT = 100
    NONANALYTIC = 3
    BORNINFO = borninfo
    BORNSYM = 1
    /

    &analysis
    ISOTOPE = 2
    ISOFACT = 0.0005967491911393617 0.00046293253700458
    KAPPA_SPEC = 1
    /

    &cell
    1.8897261246257702
      3.27 0.0 0.0
      -1.635 2.8319030703751142 0.0
      0.0 0.0 6.47
    /

    &kpoint
    2
    ${thermo_k} ${thermo_k} 1
    /

EOF

${ALMDIR}/anphon/anphon RTA_${prefix}_cutoff_${anh_cutoff}_thermo_k_${thermo_k}_iso_50_300K.in > RTA_${prefix}_cutoff_${anh_cutoff}_thermo_k_${thermo_k}_iso_50_300K.out

${ALMDIR}/anphon/anphon RTA_${prefix}_cutoff_${anh_cutoff}_thermo_k_${thermo_k}_iso_300_1000K.in > RTA_${prefix}_cutoff_${anh_cutoff}_thermo_k_${thermo_k}_iso_300_1000K.out

${ALMDIR}/anphon/anphon RTA_${prefix}_cutoff_${anh_cutoff}_thermo_k_${thermo_k}_nat_50_300K.in > RTA_${prefix}_cutoff_${anh_cutoff}_thermo_k_${thermo_k}_nat_50_300K.out

${ALMDIR}/anphon/anphon RTA_${prefix}_cutoff_${anh_cutoff}_thermo_k_${thermo_k}_nat_300_1000K.in > RTA_${prefix}_cutoff_${anh_cutoff}_thermo_k_${thermo_k}_nat_300_1000K.out

done

done
done
done
done
done