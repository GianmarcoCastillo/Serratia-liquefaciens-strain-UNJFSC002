#!/bin/bash
#SBATCH --job-name=ubcg_align
#SBATCH --output=ubcg_align_%j.out
#SBATCH --error=ubcg_align_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --time=02:00:00

# Cargar módulo de Java si es necesario (ajusta según tu entorno)
module load java

# Definir variables
UBCG_JAR="/home/indes/investigadores/g.castillo/UBCGtree.jar"
UCG_DIR="/home/indes/investigadores/g.castillo/UBCG_ver2/Filogenia/path"
RUN_ID="mytest1"

# Ejecutar UBCG
java -jar "$UBCG_JAR" align -ucg_dir "$UCG_DIR" -run_id "$RUN_ID" -leaf uid,label
  echo "Proceso Completo"
