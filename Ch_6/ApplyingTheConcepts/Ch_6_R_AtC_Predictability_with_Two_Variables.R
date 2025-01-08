#### Predictability with Two Variables ####

# Importing necessary libraries
library(tidyverse)

# Import data
treats <- read_csv("treats_hour_age.csv")

# Plot treats vs. day_hour
treats %>%
  ggplot(aes(x = day_hour, y = treats)) +
  geom_point(size = 2.5) +
  ylim(0, 60) +
  labs(
    x = "Hour of the Day",
    y = "Total Number of Treats"
  ) +
  ggtitle("Total Treats vs. Hour of the Day")

# Plot treats vs. age
treats %>%
  ggplot(aes(x = age, y = treats)) +
  geom_point(size = 2) +
  ylim(0, 60) +
  labs(
    x = "Age (Weeks)",
    y = "Total Number of Treats"
  ) +
  ggtitle("Total Treats vs. Age")