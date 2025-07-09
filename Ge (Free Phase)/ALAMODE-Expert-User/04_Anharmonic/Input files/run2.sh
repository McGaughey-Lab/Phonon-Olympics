#!/bin/sh
#PBS -l select=1
#PBS -q P_016
#PBS -N alamode

cd $PBS_O_WORKDIR

ADIR=/work/app/ALAMODE/current/tools
module load intel
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/work/app/ALAMODE/current/spglib/install_dir/lib
export OMP_NUM_THREADS=36

aprun -d 36 -j 1 --cc depth /work/app/ALAMODE/current/anphon/anphon Ge_RTA_pure.in > Ge_RTA_pure.log
aprun -d 36 -j 1 --cc depth /work/app/ALAMODE/current/anphon/anphon Ge_RTA_nat.in > Ge_RTA_nat.log

python ${ADIR}/analyze_phonons.py --calc tau --isotope Ge222_nat.self_isotope --temp 300 Ge222_nat.result > tau_nat_300K_ph+iso.dat
python ${ADIR}/analyze_phonons.py --calc tau --temp 300 Ge222_nat.result > tau_nat_300K_ph.dat