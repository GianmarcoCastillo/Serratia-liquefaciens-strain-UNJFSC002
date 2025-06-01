#!/bin/bash
#SBATCH -J unicycler
#SBATCH --nodes=1
#SBATCH -c 30
#SBATCH --mem=1T
#SBATCH -p sm
#SBATCH -o unicycler_%j.out
#SBATCH -e unicycler_%j.err

#Cargar modulos necesarios
module load unicycler/0.5.1
module load spades/4.0.0
module load ncbi-blast/2.10.0
module load racon/1.5.0
module load busco/5.8.2
#Variables
READS="/home/indes/investigadores/g.castillo/assembly/R1.fastq.gz R2.fastq.gz"
ASSEMBLY="/home/indes/investigadores/g.castillo/assembly"


for f in *.fastq.gz*
do

#Commands Unicycler

unicycler -1 R1.fastq.gz -2 R2.fastq.gz -o o_directory_unicycler

done

