
# Lib:
library("dplyr")
library("spData") 
library("hrbrthemes")
library("ggplot2")

# Dat:
s <- read.csv("s.csv")
names(s)

# ggplot:

legend_size <- c(8,9,10,11,12)

ggplot(s, aes(gdpPercap, emissions)) +
  ggtitle("Emisiones de CO2, PIB per cápita y población por países - 2020") +
  ylab("Emisiones de CO2 (toneladas métricas por persona)") +
  xlab("PIB per cápita") +
  geom_point(aes(size = pop, 
                 fill = Continente), 
             shape = 21, 
             alpha = 0.7) +
  scale_fill_viridis_d(
    guide = guide_legend(override.aes = list(size = 10))) +
  scale_size(range = c(0.1, 30),
             name="Población (mills.)",
             breaks = 1000000 * c(250, 500, 750, 1000, 1250),
             labels = c("280", "560", "840", "1120", "1400"),
  ) +
  geom_text(aes(x = gdpPercap, y = emissions+1.5, label = country),
            color = "blue",
            data = filter(s, pop > 1000000000 | country %in% c("Norway",
                                                               "Singapore",
                                                               "Luxembourg",
                                                               "United States",
                                                               "Switzerland",
                                                               "Spain",
                                                               "Brazil",
                                                               "Japan",
                                                               "Qatar",
                                                               "Kuwait",
                                                               "Chile",
                                                               "Netherlands",
                                                               "Trinidad and Tobago",
                                                               "United Kingdom"))) +
  theme_ipsum(axis_title_size = 14,
              base_family = "TT Arial") +
  theme(legend.position="bottom",
        legend.box = "vertical")



# :)





