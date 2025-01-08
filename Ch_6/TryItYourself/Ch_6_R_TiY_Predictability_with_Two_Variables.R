#### Predictability with Two Variables ####

# Importing necessary libraries
library(tidyverse)

# Import data
pinball <- read_csv("pinball_sleep_caffeine.csv")

# Plot scores vs. sleep
pinball %>%
  ggplot(aes(x = sleep, y = scores)) +
  geom_point(size = 2.5) +
  ylim(0, 1500) +
  labs(
    x = "Sleep (hours)",
    y = "Pinball Score (in millions)"
  ) +
  ggtitle("Pinball Score vs. Sleep")

# Plot scores vs. caffeine
pinball %>%
  ggplot(aes(x = caffeine, y = scores)) +
  geom_point(size = 2) +
  ylim(0, 1500) +
  labs(
    x = "Caffeine (mg)",
    y = "Pinball Score (in millions)"
  ) +
  ggtitle("Pinball Score vs. Caffeine Consumed")