#!/bin/sh
#PBS -l select=1
#PBS -q P_016
#PBS -N vasp

cd $PBS_O_WORKDIR
VDIR=/work/app/VASP6/vasp.6.3.0

cp INCAR.sc INCAR
cp KPOINTS.sc KPOINTS
aprun -n 36 -N 36 -j 1 $VDIR/bin/vasp_std > vasp.out 2> vasp.err

cp INCAR.band INCAR
cp KPOINTS.band KPOINTS
aprun -n 36 -N 36 -j 1 $VDIR/bin/vasp_std > vasp.out 2> vasp.err