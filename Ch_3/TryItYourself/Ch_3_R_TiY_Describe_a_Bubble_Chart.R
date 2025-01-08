#### Describe a Bubble Chart ####
library(tidyverse)
countries <- read_csv("countries.csv")
countries %>%
  ggplot(aes(x = prop_internet, y = ggei, size = gni_per_capita)) +
  geom_point(color = "blue", alpha = .75) +
  ylim(0, 1) +
  xlab("Proportion of People in Country with Internet Access") +
  ylab("Global Green Economic Index (GGEI)") +
  labs(size = "Gross National Income (GNI)\nper Capita") +
  ggtitle("GGEI by Proportion of People with Internet Access")
