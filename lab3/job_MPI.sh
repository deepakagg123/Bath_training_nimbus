#!/bin/bash
#SBATCH --job-name=lab3_run1
#SBATCH --output=lab3_run1_%A.out
#SBATCH --error=lab3_run1_%A.err
#SBATCH --account=CA-CS1HGN-015
#SBATCH --qos=paygo-ncv3-6
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=6
#SBATCH --partition=paygo-ncv3-6
#SBATCH --time=00:01:00

# Load the module for compiling the code
module load mpi/openmpi

# Print the jobid and node on which it is running
echo "Running task ${SLURM_JOB_ID} on nodes ${SLURMD_NODENAME}" >> test3.txt
echo "Running task ${SLURM_JOB_ID} on nodes $(hostname)" >> test3.txt

# Compile the code
mpicc -o hello_mpi_C hello_mpi.c

# Run the sequential code
mpirun -np 12 ./hello_mpi_C >> test3.txt
