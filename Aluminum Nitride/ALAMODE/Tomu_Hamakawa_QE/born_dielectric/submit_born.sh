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

for shift in 0 1;
do

header=AlN_str_wfc_${ecutwfc}_rho_${ecutrho}_k_${k}_thr_${conv_thr}_s_${shift}
prefix=${header}

cat << EOF >> pw.${header}.in
&CONTROL
   calculation      = 'scf'
   tstress          = .true.
   tprnfor          = .true.
   outdir           = '${prefix}'
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

aprun -n 36 -N 36 -j 1 ${QEBIN}/pw.x < pw.${header}.in > pw.${header}.out

cd ${prefix}

for tr2 in 1e-15;
do

cat << EOF > aln_${tr2}.ph.in
&inputph
  prefix = '${prefix}',
  tr2_ph = ${tr2},
  fildyn = 'matdyn_${prefix}',
  epsil = .true.
/
0 0 0

EOF

aprun -n 36 -N 36 -j 1 ${QEBIN}/ph.x < aln_${tr2}.ph.in > aln_${tr2}.ph.out

done

cd ..

done

done

done

done

done

# --------------------------------calculation--------------------------------------------
end_time=`date +%s`
 
run_time=$((end_time - start_time))
 
echo $run_time


