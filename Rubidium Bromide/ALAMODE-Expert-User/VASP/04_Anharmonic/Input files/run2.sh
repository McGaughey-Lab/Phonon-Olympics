#!/bin/sh
#PBS -l select=1
#PBS -q P_016
#PBS -N alamode

cd $PBS_O_WORKDIR
module load intel
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/work/app/ALAMODE/current/spglib/install_dir/lib
export OMP_NUM_THREADS=36
ADIR=/work/app/ALAMODE/alamode-1.3.0

aprun -d 36 -j 1 --cc depth $ADIR/anphon/anphon RbBr_RTA_pure.in > RbBr_RTA_pure.log
aprun -d 36 -j 1 --cc depth $ADIR/anphon/anphon RbBr_RTA_nat.in > RbBr_RTA_nat.log

python $ADIR/tools/analyze_phonons.py --calc tau --isotope RbBr222_nat.self_isotope --temp 300 RbBr222_nat.result > tau_nat_300K_ph+iso.dat
python $ADIR/tools/analyze_phonons.py --calc tau --temp 300 RbBr222_nat.result > tau_nat_300K_ph.dat