#### Describe a Density Plot ####
library(tidyverse)
countries <- read_csv("countries.csv")
countries %>%
  ggplot(aes(x = under_5_mortality_rate)) +
  geom_density() +
  xlab("Under-5 Mortality Rate") +
  ggtitle("Under-5 Mortality Rate")