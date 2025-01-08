#### Describe a Density Plot ####
library(tidyverse)
countries <- read_csv("countries.csv")
countries %>%
  ggplot(aes(x = mean_years_of_schooling)) +
  geom_density() +
  xlab("Mean Years of Schooling") +
  ylab("Density") +
  ggtitle("Mean Years of Schooling Worldwide")
