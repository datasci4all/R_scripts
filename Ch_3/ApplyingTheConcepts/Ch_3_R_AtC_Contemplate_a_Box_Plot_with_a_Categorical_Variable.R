#### Contemplate a Box Plot with a Categorical Variable ####
library(tidyverse)
countries <- read_csv("countries.csv")

countries %>%
  filter(continent %in% c("Africa", "Asia", "Europe", "Oceania")) %>%
  ggplot(aes(x = continent, y = whr_score, fill = continent)) +
  geom_boxplot() +
  xlab("Continent") +
  ylab("World Happiness Report Score") +
  ggtitle("World Happiness Report Score by Continent")
