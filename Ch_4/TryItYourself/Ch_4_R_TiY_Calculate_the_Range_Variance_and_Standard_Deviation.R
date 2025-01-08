#### Calculate Range, Variance, and Standard Deviation ####

# Load necessary libraries
library(tidyverse)

# Reading the data from 'videogames.csv' into a data frame 'videogames_df'
videogames_df <- read_csv("videogames.csv")

# Calculating range, variance, and standard deviation for 'User_Rating'
range_user_rating <- max(videogames_df$user_rating, na.rm = TRUE) - min(videogames_df$user_rating, na.rm = TRUE)
variance_user_rating <- var(videogames_df$user_rating, na.rm = TRUE)
std_dev_user_rating <- sd(videogames_df$user_rating, na.rm = TRUE)

# Printing the calculated values
cat("Range of User Rating:", range_user_rating, "\n")
cat("Variance of User Rating:", variance_user_rating, "\n")
cat("Standard Deviation of User Rating:", std_dev_user_rating, "\n")
