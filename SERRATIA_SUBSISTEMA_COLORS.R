setwd("/home/marcos/Escritorio/SERRATIA/")

library(readxl)
library(tidyverse)
df <- read_xlsx("subsistem.xlsx")

head(df)
dim(df)
library(tidyr)
library(ggplot2)
library(ggpubr)
library(randomcoloR)

df

df_long <- df %>% pivot_longer(cols= 2:27,names_to = "subsystem",
                               values_to = "counts")

#PARA TRAER 26 COLORES PERSONALIZADOS DEL PACKAGE ranmdomcoloR
colores_personalizados <- distinctColorPalette(26)
print(colores_personalizados)

ggbarplot(df_long, x = "subsystem", y = "counts",
          fill = "subsystem",
          color = "black",
          palette = c("#6F9395","#8CA051","#C79373","#B1E8D7","#8AE94A",
                      "#7BEA8D","#7A7ADB","#E4B1E5","#E15198","#8046DE",
                      "#CBEB8B","#D54654","#929CCE","#C47691","#DDB4BB",
                      "#DDE148","#DB48E5","#D57ADA","#DEDFB1","#77E2B0",
                      "#E2BD61","#77C4E3","#EF8C3B","#DDE1E5","#63E6DE","#CD950C"),
          sort.val = "desc",
          sort.by.groups = FALSE,
          x.text.angle = 0)+
  theme(
    legend.position = "none",
    panel.grid.major = element_line(color = "gray80", size = 0.5),
    panel.border = element_rect(color = "black", fill = NA, size = 1)
  )+
  coord_flip()+
  geom_text(aes(label = counts), hjust = -0.1, color = "black", size = 2.7)


p <- ggbarplot(df_long, x = "subsystem", y = "counts",
               fill = "subsystem",
               color = "black",
               palette = c("#6F9395","#8CA051","#C79373","#B1E8D7","#8AE94A",
                           "#7BEA8D","#7A7ADB","#E4B1E5","#E15198","#8046DE",
                           "#CBEB8B","#D54654","#929CCE","#C47691","#DDB4BB",
                           "#DDE148","#DB48E5","#D57ADA","#DEDFB1","#77E2B0",
                           "#E2BD61","#77C4E3","#EF8C3B","#DDE1E5","#63E6DE","#CD950C"),
               sort.val = "desc",
               sort.by.groups = FALSE,
               x.text.angle = 0)+
  theme(
    legend.position = "none",
    panel.grid.major = element_line(color = "gray80", size = 0.5),
    panel.border = element_rect(color = "black", fill = NA, size = 1)
  )+
  coord_flip()+
  geom_text(aes(label = counts), hjust = -0.1, color = "black", size = 2.7)

p

#GUARDAR CON VECTOR P EL SUBSISTEMA DE SERRATIA LIQUEFACUENS STRAIN UNJFSC002
ggsave(plot = p, "Subsystema10_UNJFSC002_COLORS.pdf", dpi = 500, width = 11.5, height = 8)


