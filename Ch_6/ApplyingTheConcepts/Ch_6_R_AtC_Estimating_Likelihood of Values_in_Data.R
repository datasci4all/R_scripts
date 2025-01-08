#### Estimating Likelihood of Values in Data ####

# Importing necessary libraries
library(tidyverse)

# Import data
penguins <- read_csv("penguins.csv")

# Plot data
penguins %>%
  ggplot(aes(x = body_mass_g)) +
  geom_histogram(bins = 11) +
  ylab("Count") +
  xlab("Body Mass (g)") +
  ggtitle("Body Mass of Palmer Penguins")


# Proportion of penguins with body mass between 3500 and 5500
mean(penguins$body_mass_g <= 5500 & penguins$body_mass_g >= 3500)

# Proportion of penguins with body mass greater than or equal to 6000
mean(penguins$body_mass_g >= 6000)