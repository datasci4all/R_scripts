#### Interpret a Histogram ####
library(tidyverse)
countries <- read_csv("countries.csv")
countries %>%
  ggplot(aes(x = life_expectancy)) +
  geom_histogram(bins = 20, fill = "blue", color = "black") +
  xlab("Life Expectancy") +
  ggtitle("Life Expectancy Worldwide")