#!/bin/sh
#SBATCH -J do1
#SBATCH -p F4cpu
#SBATCH -N 4
#SBATCH -t 24:00:00
#SBATCH --exclusive

ulimit -s unlimited
export SPGLIB_ROOT=/home/k0247/k024735/software/spglib/_build
export LD_LIBRARY_PATH=$SPGLIB_ROOT/lib64:$LD_LIBRARY_PATH
ADIR=/home/k0247/k024735/software/alamode.1.4.1
VDIR=/home/k0247/k024735/software/vasp.6.3.0

srun -N 1 -n 1 -c 128 $ADIR/alm/alm MoSe_alm1.in1 > MoSe_alm1.log1

python $ADIR/tools/displace.py --VASP=MoSe881.opt --mag=0.04 MoSe881.pattern_HARMONIC

count=$(ls -1 disp*.POSCAR | wc -l)
for i in `seq 1 $count`; do
num=`printf "%0${#count}d" $i`
dir=$i
cp disp${num}.POSCAR $dir/POSCAR
cp INCAR POTCAR KPOINTS $dir
cd $dir
srun -N 1 -n 128 -c 1 $VDIR/bin/vasp_std > vasp.out 2> vasp.err &
cd ../
done

wait

count=$(ls -1 */vasprun.xml | wc -l)
for i in `seq 1 $count`; do
num=`printf "%0${#count}d" $i`
cp $i/vasprun.xml vasprun${num}.xml
done

python $ADIR/tools/extract.py --VASP=MoSe881.opt vasprun*.xml > DFSET_harmonic

srun -N 1 -n 1 -c 128 $ADIR/alm/alm MoSe_alm1.in2 > MoSe_alm1.log2
srun -N 1 -n 1 -c 128 $ADIR/anphon/anphon MoSe_band.in > MoSe_band.log
