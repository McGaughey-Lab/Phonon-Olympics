#!/bin/sh
#PBS -l select=1
#PBS -q P_016
#PBS -N vasp

cd $PBS_O_WORKDIR

aprun -n 36 -N 36 -j 1 /work/app/VASP5/current/bin/vasp_std > vasp.out 2> vasp.err

