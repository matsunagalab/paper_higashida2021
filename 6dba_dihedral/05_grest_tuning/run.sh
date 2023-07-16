#!/bin/bash
#SBATCH -p all
#SBATCH -J 6dba
#SBATCH -n 32  #num of total mpi processes
#SBATCH -c 1  #num of threads per mpi processes
#SBATCH -o run.log

# set the number of OpenMP threads
export OMP_NUM_THREADS=1
export CUDA_VISIBLE_DEVICES="2,3,4,5,6,7,8,9"

# perform equilibration with SPDYN by using 8 MPI processes
mpirun -np 32 /opt/genesis/bin/spdyn.cuda run.inp

