#!/bin/sh
#PBS -l select=1
#PBS -q P_016
#PBS -N vasp

cd $PBS_O_WORKDIR

cp INCAR.sc INCAR
cp KPOINTS.sc KPOINTS
aprun -n 36 -N 36 -j 1 /work/app/VASP5/current/bin/vasp_std > vasp.out 2> vasp.err

cp INCAR.band INCAR
cp KPOINTS.band KPOINTS
aprun -n 36 -N 36 -j 1 /work/app/VASP5/current/bin/vasp_std > vasp.out 2> vasp.err