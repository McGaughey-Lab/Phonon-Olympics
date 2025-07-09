#!/bin/sh

#SBATCH -p F4cpu
#SBATCH -N 4
#SBATCH -n 512
#SBATCH -t 23:30:00
#SBATCH -J n11-20


#DIR="/work/app/QuantumESPRESSO/q-e-qe-6.5/bin"
DIR="/home/shao/software/q-e-qe-6.6/bin"

prefix=Ge

EXE=/home/k0489/k048900/software/q-e-qe-6.6/bin/pw.x

#for ((i=1;i<=15;i++))
for ((i=1;i<=23;i++))
do
    num=`echo $i | awk '{printf("%02d",$1)}'`
    mkdir ${num}
    cd ${num}
    cp ../disp${num}.pw.in .
    #srun -n 4 --exclusive -c 1 --mem=100G  -N 1 ${EXE} -npool 4 < disp${num}.pw.in > disp${num}.pw.out &
    srun -n 512 -N 4  ${EXE} -npool 4 -input disp${num}.pw.in > disp${num}.pw.out 
    cd ../
done
wait
