#### Explore a Line Chart ####
library(tidyverse)
life_expectancy <- read_csv("lex_long.csv")
life_expectancy %>%
  filter(country == "USA" & year >= 1880 & year <= 2020) %>%
  ggplot(aes(x = year, y = life_expectancy)) +
  geom_line() +
  xlab("Year") +
  ylab("Life Expectancy") +
  ggtitle("United States Life Expectancy Over Time")
