#!/bin/sh

#SBATCH -p i8cpu
#SBATCH -N 4
#SBATCH -n 512
#SBATCH -t 00:30:00
#SBATCH -J RTA


#DIR="/work/app/QuantumESPRESSO/q-e-qe-6.5/bin"
DIR="/home/shao/software/q-e-qe-6.5/bin"

prefix=Au

EXE=/home/k0489/k048900/software/q-e-qe-6.6/bin/pw.x
srun -n 128 anphon  RTA.in > RTA.out
