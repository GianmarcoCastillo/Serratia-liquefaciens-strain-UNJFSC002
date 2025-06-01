setwd("/home/marcos/Escritorio/SERRATIA/")

library(readxl)
library(tidyverse)
library(RColorBrewer)

df <- read_xlsx("COG_counts.xlsx")

head(df)
dim(df)
library(tidyr)
library(ggplot2)
library(ggpubr)
library(ggeasy)
library(randomcoloR)

print(df)

df_long <- df %>% pivot_longer(cols= 2:27,names_to = "COG Category",
                               values_to = "counts")

print(df_long)

colores_personalizados <- distinctColorPalette(26)
colores_personalizados

df_long <- df %>% pivot_longer(cols = 2:27,names_to = "COG Category",
                               values_to = "numbers")

ggbarplot(df_long, x = "COG Category", y = "counts",
          fill = "COG Category",
          color = "black",
          palette = c("#DB48AB","#70AC8B","#C1E595","#D7C6E1","#72EB98",
                      "#7A64D8","#6FB1DF","#8F96A3","#96835D","#DB48E7",
                      "#D882E5","#E29D96","#763BE4","#66D2DF","#DF5D7D",
                      "#D89FD2","#B9E1E4","#82E04B","#78EBD3","#DDE452",
                      "#E3693D","#DFB34B","#DDE0CC","#8994E3","#EAD099","#75528A"),
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

p <- ggbarplot(df_long, x = "COG Category", y = "counts",
               fill = "COG Category",
               color = "black",
               palette = c("#DB48AB","#70AC8B","#C1E595","#D7C6E1","#72EB98",
                           "#7A64D8","#6FB1DF","#8F96A3","#96835D","#DB48E7",
                           "#D882E5","#E29D96","#763BE4","#66D2DF","#DF5D7D",
                           "#D89FD2","#B9E1E4","#82E04B","#78EBD3","#DDE452",
                           "#E3693D","#DFB34B","#DDE0CC","#8994E3","#EAD099","#75528A"),
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

ggsave (plot = p, "COGcategory_COLORS_.pdf", dpi = 500, width = 11.5, height = 8)
