#### Describe the Shape of the Histogram ####

# Load necessary libraries
library(tidyverse)

# Reading the data from 'videogames.csv' into a data frame 'videogames_df'
videogames_df <- read_csv("videogames.csv")

# Plotting a histogram of User_Ratings
videogames_df %>%
  ggplot(aes(x = user_rating)) +
  geom_histogram(bins = 30, binwidth = 0.3233, boundary =0, fill = "#0072b2", color = "black") +
  theme_minimal() +
  labs(title = "Histogram of User Ratings",
       x = "User Rating",
       y = "Frequency")
