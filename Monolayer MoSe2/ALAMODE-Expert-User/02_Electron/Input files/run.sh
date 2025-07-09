#!/bin/sh
#SBATCH -J do1
#SBATCH -p i8cpu
#SBATCH -N 1
#SBATCH -t 00:30:00
#SBATCH --exclusive

ulimit -s unlimited
VDIR=/home/k0247/k024735/software/vasp.6.3.0

cp POSCAR.opt POSCAR

cp INCAR.sc INCAR
cp KPOINTS.sc KPOINTS
srun -N 1 -n 128 -c 1 $VDIR/bin/vasp_std > vasp.out 2> vasp.err

cp INCAR.band INCAR
cp KPOINTS.band KPOINTS
srun -N 1 -n 128 -c 1 $VDIR/bin/vasp_std > vasp.out 2> vasp.err

