#### Describe a Bubble Chart ####
library(tidyverse)
countries <- read_csv("countries.csv")
countries %>%
  ggplot(aes(x = mean_years_of_schooling, y = whr_score, size = population)) +
  geom_point(color = "blue", alpha = .75) +
  xlab("Mean Years of Schooling") +
  ylab("World Happiness Score") +
  labs(size = "Population") +
  ggtitle("World Happiness Score by Mean Years of Schooling")