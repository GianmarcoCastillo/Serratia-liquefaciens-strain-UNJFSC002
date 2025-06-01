setwd("/home/marcos/Escritorio/SERRATIA/")

library(readxl)
library(tidyverse)

df <- read_xlsx("kegg1.xlsx")

head(df)
dim(df)
library(tidyr)
library(ggplot2)
library(ggpubr)
library(randomcoloR)
#display.brewer.all()

#PARA TRAER 25 COLORES PERSONALIZADOS DEL PACKAGE ranmdomcoloR
colores_personalizados <- distinctColorPalette(25)
print(colores_personalizados)

library(ggsci)
df

df_long <- df %>% pivot_longer(cols= 2:21,names_to = "KEEG Mapper",
                               values_to = "counts")

ggbarplot(df_long, x = "KEEG Mapper", y = "counts",
          fill = "KEEG Mapper",
          color = "black",
          palette = c("#6F9395","#8CA051","#C79373","#B1E8D7","#8AE94A",
                      "#7BEA8D","#7A7ADB","#E4B1E5","#E15198","#8046DE",
                      "#CBEB8B","#D54654","#929CCE","#C47691","#DDB4BB",
                      "#DDE148","#DB48E5","#D57ADA","#DEDFB1","#77E2B0",
                      "#E2BD61","#77C4E3","#EF8C3B","#DDE1E5","#63E6DE"),
          sort.val = "desc",
          x.text.angle = 0,
          label = FALSE)+
  theme(
    legend.position = "none",
    panel.grid.major = element_line(color = "gray80", size = 0.5),
    panel.border = element_rect(color = "black", fill = NA, size = 1)
  )+
  coord_flip()+
  scale_y_reverse()+
  geom_text(aes(label = counts), hjust = 1.3, color = "black", size = 2.9)


p <- ggbarplot(df_long, x = "KEEG Mapper", y = "counts",
               fill = "KEEG Mapper",
               color = "black",
               palette = c("#6F9395","#8CA051","#C79373","#B1E8D7","#8AE94A",
                           "#7BEA8D","#7A7ADB","#E4B1E5","#E15198","#8046DE",
                           "#CBEB8B","#D54654","#929CCE","#C47691","#DDB4BB",
                           "#DDE148","#DB48E5","#D57ADA","#DEDFB1","#77E2B0",
                           "#E2BD61","#77C4E3","#EF8C3B","#DDE1E5","#63E6DE"),
               sort.val = "desc",
               x.text.angle = 0,
               label = FALSE)+
  theme(
    legend.position = "none",
    panel.grid.major = element_line(color = "gray80", size = 0.5),
    panel.border = element_rect(color = "black", fill = NA, size = 1)
  )+
  coord_flip()+
  scale_y_reverse()+
  geom_text(aes(label = counts), hjust = 1.3, color = "black", size = 2.9)

p


ggsave(plot = p, "KEGG_MAPPER_UNJFSC002_03_COLORS.pdf", dpi = 500, width = 11.5, height = 8)
               
               
               