#### Explore a Line Chart ####
library(tidyverse)
child_mortality <- read_csv("child_mortality_long.csv")
child_mortality %>%
  filter(country == "United States" & year >= 1880 & year <= 2020) %>%
  ggplot(aes(x = year, y = child_mortality)) +
  geom_line() +
  xlab("Year") +
  ylab("Under-5 Mortality Rate (Deaths per 1000 Births)") +
  ggtitle("United States Child Mortality Rate over Time")