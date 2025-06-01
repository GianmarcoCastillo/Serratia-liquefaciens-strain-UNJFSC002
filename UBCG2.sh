#!/bin/bash
#SBATCH --job-name=ubcg_align
#SBATCH --output=ubcg_align_%j.out
#SBATCH --error=ubcg_align_%j.err
#SBATCH --ntasks=1
#SBATCH --c 96
#SBATCH --mem=8G
#SBATCH --time=02:00:00

# Cargar módulo de Java si es necesario
module load java

# Definir rutas
UBCG_JAR="/home/indes/investigadores/g.castillo/UBCGtree.jar"
UCG_DIR="/home/indes/investigadores/g.castillo/UBCG_ver2/Filogenia/path"
OUT_DIR="/home/indes/investigadores/g.castillo/UBCG_ver2/Filogenia/arbol"
RUN_ID="mytest1"

# Ejecutar UBCG align
java -jar "$UBCG_JAR" align \
  -ucg_dir "$UCG_DIR" \
  -run_id "$RUN_ID" \
  -leaf uid,label \
  -out_dir "$OUT_DIR"
  
  echo "Proceso Completo"
