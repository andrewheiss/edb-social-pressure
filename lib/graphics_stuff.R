# Colors
# color_no_committee <- "#004259"
# color_committee <- "#FC7300"
# its_1 <- "red"
# its_2 <- "blue"

# Grayscale
color_no_committee <- "black"
color_committee <- "grey70"
its_1 <- "black"
its_2 <- "grey70"


# ggplot theme
theme_edb <- function(base_size = 9, base_family = "Clear Sans Light") {
  update_geom_defaults("label", list(family = "Clear Sans Light"))
  update_geom_defaults("text", list(family = "Clear Sans Light"))
  ret <- theme_bw(base_size, base_family) + 
    theme(panel.background = element_rect(fill = "#ffffff", colour = NA),
          axis.title.y = element_text(margin = margin(r = 10)),
          axis.title.x = element_text(margin = margin(t = 10)),
          title = element_text(vjust = 1.2, family = "Clear Sans", face = "bold"),
          plot.subtitle = element_text(family = "Clear Sans Light"),
          plot.caption = element_text(family = "Clear Sans Light",
                                      size = rel(0.8), colour = "grey70"),
          panel.border = element_blank(), 
          axis.line = element_blank(),
          axis.ticks = element_blank(),
          legend.position = "bottom", 
          legend.title = element_text(size = rel(0.8)),
          axis.title = element_text(size = rel(0.8), family = "Clear Sans", face = "bold"),
          strip.text = element_text(size = rel(1), family = "Clear Sans", face = "bold"),
          strip.background = element_rect(fill = "#ffffff", colour = NA),
          panel.spacing.y = unit(1.5, "lines"),
          legend.key = element_blank(),
          legend.spacing = unit(0.2, "lines"))
  
  ret
}
