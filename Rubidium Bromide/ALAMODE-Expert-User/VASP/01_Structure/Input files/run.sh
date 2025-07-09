#!/bin/sh
#PBS -l select=1
#PBS -q P_016
#PBS -N vasp

cd $PBS_O_WORKDIR
VDIR=/work/app/VASP6/vasp.6.3.0

aprun -n 36 -N 36 -j 1 $VDIR/bin/vasp_std > vasp.out 2> vasp.err

