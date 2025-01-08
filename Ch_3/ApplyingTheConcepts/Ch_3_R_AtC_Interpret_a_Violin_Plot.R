#### Interpret a Violin Plot ####
library(tidyverse)
countries <- read_csv("countries.csv")
countries %>%
  ggplot(aes(x = "", y = gni_per_capita)) +
  geom_violin(color = "black", fill = "salmon") +
  geom_boxplot(width = 0.1) +
  xlab("") +
  ylab("GNI Per Capita") +
  ggtitle("Distribution of GNI Per Capita Worldwide")