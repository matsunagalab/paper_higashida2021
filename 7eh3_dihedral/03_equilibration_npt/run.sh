#!/bin/bash
#SBATCH -p all
#SBATCH -J 7eh3
#SBATCH -n 32  #num of total mpi processes
#SBATCH -c 1  #num of threads per mpi processes
#SBATCH -o run.log

export OMP_NUM_THREADS=1
export CUDA_VISIBLE_DEVICES="0"

mpirun -np 32 spdyn.cuda run.inp >run.log

