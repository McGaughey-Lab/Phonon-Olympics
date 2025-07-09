#!/bin/sh

#SBATCH -p F4cpu
#SBATCH -N 2
#SBATCH -n 256
#SBATCH -c 1

NP=128
NPOOL=128

DIR="/home/k0489/k048900/software/q-e-qe-6.5/bin"
srun -n ${NP}  ${DIR}/pw.x -npool ${NPOOL} -in scf.in > scf.out
NPOOL=128
srun -n ${NP}  ${DIR}/ph.x -npool ${NPOOL} -in ph.in > ph.out
srun -n 1  ${DIR}/q2r.x < q2r.in | tee q2r.out
srun -n 1 ${DIR}/matdyn.x < matdyn.in.freq | tee matdyn.out.freq

