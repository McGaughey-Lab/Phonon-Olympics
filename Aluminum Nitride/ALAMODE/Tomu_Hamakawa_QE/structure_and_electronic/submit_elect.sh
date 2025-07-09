#!/bin/sh

module switch PrgEnv-cray PrgEnv-intel

DIRNAME=`basename $PBS_O_WORKDIR`
WORKDIR=/work/$USER/$PBS_JOBID
mkdir -p $WORKDIR
cp -raf  $PBS_O_WORKDIR $WORKDIR
cd $WORKDIR/$DIRNAME

QEBIN=/work/app/QuantumESPRESSO/qe-7.0/bin

start_time=`date +%s`
# --------------------------------calculation--------------------------------------------

ceiling() {
  result=$(( ($1 + $2 - 1) / $2 ))
  echo $result
}

for ecutwfc in 90;
do

for b_ecutrho in 8;
do

ecutrho=$((${ecutwfc}*${b_ecutrho}))

for k in 10;
do

tk=$((3*k))
c_k=$(ceiling $tk 5)

for conv_thr in 1e-11;
do

for shift in 0;
do

header=AlN_str_wfc_${ecutwfc}_rho_${ecutrho}_k_${k}_thr_${conv_thr}_s_${shift}
prefix=${header}

cat << EOF >> pw.${header}.in
&CONTROL
   calculation      = 'scf'
   tstress          = .true.
   tprnfor          = .true.
   outdir           = 'AlN'
   prefix           = '${prefix}'
   pseudo_dir       = './'
   nstep            = 300
/
&SYSTEM
   ecutwfc          = ${ecutwfc}
   ecutrho          = ${ecutrho}
   occupations      = 'fixed'
   ntyp             = 2
   nat              = 4
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
Al 26.98153863 Al.pbesol-n-kjpaw_psl.1.0.0.UPF
N 14.0030740048 N.pbesol-n-kjpaw_psl.1.0.0.UPF

K_POINTS automatic
${k} ${k} ${c_k} ${shift} ${shift} ${shift}

CELL_PARAMETERS angstrom
3.11591200000000 0.00000000000000 0.00000000000000
-1.55795600000000 2.69845894795678 0.00000000000000
0.00000000000000 0.00000000000000 4.98753000000000

ATOMIC_POSITIONS angstrom
Al -0.0000000000 1.7989726320 0.0000000000 
Al 1.5579560000 0.8994863160 2.4937650000 
N -0.0000000000 1.7989726320 1.9049172581 
N 1.5579560000 0.8994863160 4.3986822581

EOF

${QEBIN}/pw.x < pw.${header}.in > pw.${header}.out

cat << EOF > pw.bands_${prefix}_all.in
&CONTROL
   calculation      = 'bands'
   tstress          = .true.
   tprnfor          = .true.
   outdir           = 'AlN'
   prefix           = '${prefix}'
   pseudo_dir       = './'
   nstep            = 300
/
&SYSTEM
   ecutwfc          = ${ecutwfc}
   ecutrho          = ${ecutrho}
   occupations      = 'fixed'
   ntyp             = 2
   nat              = 4
   ibrav            = 0
   nbnd             = 14
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
Al 26.98153863 Al.pbesol-n-kjpaw_psl.1.0.0.UPF
N 14.0030740048 N.pbesol-n-kjpaw_psl.1.0.0.UPF

K_POINTS crystal_b
5
0.0 0.0 0.0 100
0.5 0.0 0.0 50
0.33333 0.333333 0.0 50
0.0 0.0 0.0 99
0.0 0.0 0.5 0

CELL_PARAMETERS angstrom
3.11591200000000 0.00000000000000 0.00000000000000
-1.55795600000000 2.69845894795678 0.00000000000000
0.00000000000000 0.00000000000000 4.98753000000000

ATOMIC_POSITIONS angstrom
Al -0.0000000000 1.7989726320 0.0000000000 
Al 1.5579560000 0.8994863160 2.4937650000 
N -0.0000000000 1.7989726320 1.9049172581 
N 1.5579560000 0.8994863160 4.3986822581

EOF

${QEBIN}/pw.x < pw.bands_${prefix}_all.in > pw.bands_${prefix}_all.out

cat << EOF > bands_all.in
&bands
  prefix = '${prefix}',
  outdir = './AlN/',
  filband = "pw.bands_${prefix}_all.dat"
/

EOF

${QEBIN}/bands.x < bands_all.in > bands_all.out

done

done

done

done

done

# --------------------------------calculation--------------------------------------------
end_time=`date +%s`
 
run_time=$((end_time - start_time))
 
echo $run_time

cd; if cp -raf $WORKDIR/$DIRNAME $PBS_O_WORKDIR/.. ; then rm -rf $WORKDIR; fi

