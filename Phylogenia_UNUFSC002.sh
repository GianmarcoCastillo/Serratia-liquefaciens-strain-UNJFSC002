#!/bin/bash
#SBATCH --job-name=iqtree2_gcf
#SBATCH --output=iqtree2_gcf_%j.out
#SBATCH --error=iqtree2_gcf_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G
#SBATCH --time=04:00:00

# Cargar IQ-TREE 2 (ajusta según tu entorno de módulos si es necesario)
module load iqtree/2

# Definir rutas
WORKDIR="/home/indes/investigadores/g.castillo/UBCG_ver2/Filogenia/arbol"
ALIGNMENT="$WORKDIR/aligned_concatenated.fasta"
GENETREES="$WORKDIR/all_genetrees.txt"
PREFIX="arbol_gcf"
MODEL="GTR+F+I+G4"
BOOTSTRAP=1000
ALRT=1000


# Confirmar información para depuración
echo "Ejecutando IQ-TREE 2 con:"
echo "  Alineamiento: $ALIGNMENT"
echo "  Gene Trees:   $GENETREES"
echo "  Prefijo:      $PREFIX"
echo "  Modelo:       $MODEL"
echo "  Bootstrap:    $BOOTSTRAP"
echo "  aLRT:         $ALRT"
echo "Fecha de inicio: $(date)"

# Ejecutar IQ-TREE 2
iqtree2 -s "$ALIGNMENT" \
        --gcf-input "$GENETREES" \
        --prefix "$PREFIX" \
        -m "$MODEL" \
        -B "$BOOTSTRAP" \
        -alrt "$ALRT" \
        -nt $SLURM_CPUS_PER_TASK

# Verificación de éxito
if [ $? -eq 0 ]; then
    echo "IQ-TREE finalizado correctamente."
else
    echo "ERROR: Fallo en la ejecución de IQ-TREE." >&2
fi

echo "Fecha de finalización: $(date)"
