#!/bin/bash
#SBATCH --job-name=lab1_run1
#SBATCH --output=lab1_run1_%A.out
#SBATCH --error=lab1_run1_%A.err
#SBATCH --account=CA-CS1HGN-015
#SBATCH --qos=paygo-fsv2-1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --partition=paygo-fsv2-1
#SBATCH --time=00:00:50

# Load the module for compiling the code
module load gcc-9.2.0

# Print the jobid and node on which it is running
echo "Running task ${SLURM_JOB_ID} on node ${SLURMD_NODENAME}" >> test1.txt

# Compile the code
gcc -o hello_C hello.c

# Run the sequential code
./hello_C >> test1.txt

