library(ggplot2)
conserved = colMeans(read.table("number_of_conserved_genes.Rtab"))
total = colMeans(read.table("number_of_genes_in_pan_genome.Rtab"))

genes = data.frame( 
  genes_to_genomes = c(conserved, total),
  genomes = c(1:length(conserved), 1:length(conserved)),
  Key = c(rep("Conserved genes", length(conserved)), rep("Total genes", length(total))) 
)

# Filtrar solo los datos de "Total genes" para la línea de tendencia
total_df = genes[genes$Key == "Total genes", ]

ggplot(data = genes, aes(x = genomes, y = genes_to_genomes, group = Key, color = Key, linetype = Key)) +
  geom_line(size = 1) +
  # Línea de tendencia para los "Total genes"
  geom_smooth(data = total_df, aes(x = genomes, y = genes_to_genomes), method = "lm", color = "red", se = FALSE, linetype = "solid", size = 1) +
  scale_color_manual(values = c("Conserved genes" = "orange", "Total genes" = "black")) +
  theme_classic() +
  ylim(c(1, max(total))) +
  xlim(c(1, length(total))) +
  xlab("No. of genomes") +
  ylab("No. of genes") +
  theme_bw(base_size = 16) +
  theme(legend.justification = c(0, 1), legend.position = c(0, 1))

ggsave(filename = "conserved_vs_total_genes_05.png", scale = 1)