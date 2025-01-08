#### Calculate Mean, Mode, Median, and 90% Trimmed Mean ####

# Load necessary libraries
library(tidyverse)

# Reading the data from 'videogames.csv' into a data frame 'videogames'
videogames <- read_csv("videogames.csv")

# Calculating mean, median, and mode for 'user_rating'
mean_rating <- mean(videogames$user_rating)
median_rating <- median(videogames$user_rating)
mode_rating <- as.numeric(names(sort(table(videogames$user_rating), decreasing = TRUE)[1]))

# Calculating 90% trimmed mean
mean_90_rating <- mean(videogames$user_rating, trim = 0.05)

# Creating a data frame to display the calculated statistics
summary <- data.frame(
  mean_rating = mean_rating,
  trimmed_mean_rating_90 = mean_90_rating,
  median_rating = median_rating,
  mode_rating = mode_rating
)

# Displaying the summary
print(summary)
