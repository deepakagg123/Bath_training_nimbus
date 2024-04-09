#!/bin/bash
#SBATCH --job-name=lab2_run1
#SBATCH --output=lab2_run1_%A.out
#SBATCH --error=lab2_run1_%A.err
#SBATCH --account=CA-CS1HGN-015
#SBATCH --qos=paygo-fsv2-2
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --partition=paygo-fsv2-2
#SBATCH --time=00:30:00

# Load the module for compiling the code
module load gcc-9.2.0

# Print the jobid and node on which it is running
echo "Running task ${SLURM_JOB_ID} on node ${SLURMD_NODENAME}" >> test2.txt

# Compile the code
gfortran -fopenmp -o pi_cal_F pi_cal.f90

# Run the sequential code
OMP_NUM_THREADS=2 ./pi_cal_F >> test2.txt

