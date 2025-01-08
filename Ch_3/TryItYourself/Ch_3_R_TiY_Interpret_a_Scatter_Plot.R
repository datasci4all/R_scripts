#### Interpret a Scatter Plot ####
library(tidyverse)
countries <- read_csv("countries.csv")

countries %>%
  ggplot(aes(x = whr_score, y = ggei)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  xlab("World Happiness Report Score") +
  ylab("Global Green Economic Index (GGEI)") +
  ylim(0, 1) +
  ggtitle("GGEI by Score in World Happiness Report")
