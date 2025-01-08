#### Interpret a Violin Plot ####
library(tidyverse)
countries <- read_csv("countries.csv")
countries %>%
  ggplot(aes(x = "", y = under_5_mortality_rate)) +
  geom_violin(color = "black", fill = "salmon") +
  geom_boxplot(width = 0.1) +
  xlab("") +
  ylab("Under-5 Mortality Rate (Deaths per 1000 Births)") +
  ggtitle("Worldwide Distribution of Mortality Rate for Children Under 5")