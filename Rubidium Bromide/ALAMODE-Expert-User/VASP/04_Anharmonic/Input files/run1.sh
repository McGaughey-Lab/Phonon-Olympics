#!/bin/sh
#PBS -l select=1
#PBS -q P_016
#PBS -N alamode

cd $PBS_O_WORKDIR
module load intel
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/work/app/ALAMODE/current/spglib/install_dir/lib
export OMP_NUM_THREADS=36
ADIR=/work/app/ALAMODE/alamode-1.3.0
VDIR=/work/app/VASP6/vasp.6.3.0

aprun -d 36 -j 1 --cc depth $ADIR/alm/alm RbBr_alm2.in1 > RbBr_alm2.log1

python $ADIR/tools/displace.py --VASP=RbBr222.opt --mag=0.08 RbBr222.pattern_ANHARM3

count=$(ls -1 disp*.POSCAR | wc -l)
for i in `seq 1 $count`; do
num=`printf "%0${#count}d" $i`
dir=$i
cp disp${num}.POSCAR $dir/POSCAR
cp INCAR POTCAR KPOINTS $dir
cd $dir
aprun -n 36 -N 36 -j 1 $VDIR/bin/vasp_std > vasp.out 2> vasp.err
cd ../
done

count=$(ls -1 */vasprun.xml | wc -l)
for i in `seq 1 $count`; do
num=`printf "%0${#count}d" $i`
cp $i/vasprun.xml vasprun${num}.xml
done

python $ADIR/tools/extract.py --VASP=RbBr222.opt vasprun*.xml > DFSET_cubic

aprun -d 36 -j 1 --cc depth $ADIR/alm/alm RbBr_alm2.in2 > RbBr_alm2.log2