#!/bin/sh
#SBATCH -J do1
#SBATCH -p F1cpu
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH --exclusive

ulimit -s unlimited
export SPGLIB_ROOT=/home/k0247/k024735/software/spglib/_build
export LD_LIBRARY_PATH=$SPGLIB_ROOT/lib64:$LD_LIBRARY_PATH
ADIR=/home/k0247/k024735/software/alamode.1.4.1
VDIR=/home/k0247/k024735/software/vasp.6.3.0

srun -N 1 -n 1 -c 128 $ADIR/anphon/anphon MoSe_RTA_pure.in > MoSe_RTA_pure.log
srun -N 1 -n 1 -c 128 $ADIR/anphon/anphon MoSe_RTA_nat.in > MoSe_RTA_nat.log

python $ADIR/tools/analyze_phonons.py --calc tau --isotope MoSe881_nat.self_isotope --temp 300 MoSe881_nat.result > tau_nat_300K_ph+iso.dat
python $ADIR/tools/analyze_phonons.py --calc tau --temp 300 MoSe881_nat.result > tau_nat_300K_ph.dat