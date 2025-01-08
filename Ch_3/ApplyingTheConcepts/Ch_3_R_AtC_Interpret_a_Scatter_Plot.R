#### Interpret a Scatter Plot ####
library(tidyverse)
countries <- read_csv("countries.csv")

countries %>%
  ggplot(aes(x = gni_per_capita, y = life_expectancy)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  xlab("GNI per capita") +
  ylab("Life Expectancy") +
  ggtitle("Life Expectancy by GNI per capita")