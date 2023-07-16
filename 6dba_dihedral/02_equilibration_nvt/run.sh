#!/bin/bash
#PJM -L "rscunit=ito-b"
#PJM -L "rscgrp=ito-g-4-dbg"
#PJM -L "vnode=1"
#PJM -L "vnode-core=36"
#PJM -L "elapse=1:00:00"
#PJM -S

LANG=C

module load intel/2019.4
module load cuda/8.0

NUM_NODES=$PJM_VNODES
NUM_CORES=36
NUM_PROCS=8
NUM_THREADS=4

export I_MPI_PERHOST=8
export I_MPI_FABRICS=shm:ofi
export I_MPI_PIN_DOMAIN=omp
export I_MPI_PIN_CELL=core

export OMP_NUM_THREADS=$NUM_THREADS
export KMP_STACKSIZE=8m
export KMP_AFFINITY=compact

export I_MPI_HYDRA_BOOTSTRAP=rsh
export I_MPI_HYDRA_BOOTSTRAP_EXEC=/bin/pjrsh
export I_MPI_HYDRA_HOST_FILE=${PJM_O_NODEINF}

cd $PJM_O_WORKDIR

mpiexec.hydra -n $NUM_PROCS /home/usr6/p70156a/genesis-1.5.0/bin/spdyn run.inp >run.log

