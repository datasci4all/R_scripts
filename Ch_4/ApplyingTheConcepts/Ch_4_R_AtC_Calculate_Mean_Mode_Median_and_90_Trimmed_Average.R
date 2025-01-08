#### Calculate the Mean, Mode, Median, and 90% Trimmed Mean ####

# Importing necessary libraries
library(tidyverse)

# Read the data
summarystats_db <- read_csv('IMDb.csv')

# Calculating mean, median, mode, and trimmed mean for 'User_Score'
mean_rating <- mean(summarystats_db$Meta_score, na.rm = TRUE)
median_rating <- median(summarystats_db$Meta_score, na.rm = TRUE)
mode_rating <- as.numeric(names(sort(table(summarystats_db$Meta_score), decreasing = TRUE)[1]))
mean_90_rating <- mean(summarystats_db$Meta_score, na.rm = TRUE, trim = 0.05)

# Output the calculated values
cat("Mean Rating:", mean_rating, "\n")
cat("Median Rating:", median_rating, "\n")
cat("Mode Rating:", mode_rating, "\n")
cat("Mean 90 Rating:", mean_90_rating, "\n")
