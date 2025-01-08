#### Work with a Boxplot ####
library(tidyverse)
countries <- read_csv("countries.csv")
countries %>%
  ggplot(aes(y = whr_score)) +
  geom_boxplot(fill = "purple", color = "black") +
  ylab("WHR Score") +
  ggtitle("Distribution of World Happiness Report (WHR) Scores Worldwide") +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
