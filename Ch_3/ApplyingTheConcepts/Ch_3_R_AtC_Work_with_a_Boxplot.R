#### Work with a Boxplot ####
library(tidyverse)
countries <- read_csv("countries.csv")
countries %>%
  ggplot(aes(y = mean_years_of_schooling)) +
  geom_boxplot(fill = "purple", color = "black") +
  ylab("Mean Years of Schooling") +
  ggtitle("Distribution of Mean Years of Schooling Worldwide")