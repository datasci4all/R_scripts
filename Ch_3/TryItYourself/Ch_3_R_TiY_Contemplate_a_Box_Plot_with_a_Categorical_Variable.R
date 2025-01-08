#### Contemplate a Box Plot with a Categorical Variable ####
library(tidyverse)
countries <- read_csv("countries.csv")

countries %>%
  filter(continent %in% c("Africa", "Asia", "Oceania")) %>%
  ggplot(aes(x = continent, y = life_expectancy, fill = continent)) +
  geom_boxplot() +
  xlab("Continent") +
  ylab("Mean Life Expectancy") +
  labs(fill = "Continent") +
  ggtitle("Mean Life Expectancies by Continent")
