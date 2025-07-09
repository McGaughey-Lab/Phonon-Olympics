#!/bin/sh
#PBS -l select=1
#PBS -q P_016
#PBS -N alamode

cd $PBS_O_WORKDIR

ADIR=/work/app/ALAMODE/current/tools
module load intel
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/work/app/ALAMODE/current/spglib/install_dir/lib
export OMP_NUM_THREADS=36

aprun -d 36 -j 1 --cc depth /work/app/ALAMODE/current/alm/alm Ge_alm1.in1 > Ge_alm1.log1

python $ADIR/displace.py --VASP=Ge222.opt --mag=$dis Ge222.pattern_HARMONIC

count=$(ls -1 disp*.POSCAR | wc -l)
for i in `seq 1 $count`; do
num=`printf "%0${#count}d" $i`
dir=$i
cp disp${num}.POSCAR $dir/POSCAR
cp INCAR POTCAR KPOINTS $dir
cd $dir
aprun -n 36 -N 36 -j 1 /work/app/VASP5/current/bin/vasp_std > vasp.out 2> vasp.err
cd ../
done

count=$(ls -1 */vasprun.xml | wc -l)
for i in `seq 1 $count`; do
num=`printf "%0${#count}d" $i`
cp $i/vasprun.xml vasprun${num}.xml
done

python $ADIR/extract.py --VASP=Ge222.opt vasprun*.xml > DFSET_harmonic

aprun -d 36 -j 1 --cc depth /work/app/ALAMODE/current/alm/alm Ge_alm1.in2 > Ge_alm1.log2
aprun -d 36 -j 1 --cc depth /work/app/ALAMODE/current/anphon/anphon Ge_band.in > Ge_band.log