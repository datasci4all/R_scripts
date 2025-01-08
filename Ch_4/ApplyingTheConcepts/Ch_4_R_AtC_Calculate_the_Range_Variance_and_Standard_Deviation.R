#### Calculate the Range, Variance, and Standard Deviation ####

# Importing necessary libraries
library(tidyverse)

# Read the data
imdb_df <- read_csv('IMDb.csv')

# Calculating range, variance, and standard deviation for 'Meta_score'
range_meta_score <- max(imdb_df$Meta_score, na.rm = TRUE) - min(imdb_df$Meta_score, na.rm = TRUE)
variance_meta_score <- var(imdb_df$Meta_score, na.rm = TRUE)
std_dev_meta_score <- sd(imdb_df$Meta_score, na.rm = TRUE)

# Output the calculated values
cat("Range of Meta score:", range_meta_score, "\n")
cat("Variance of Meta score:", variance_meta_score, "\n")
cat("Standard Deviation of Meta score:", std_dev_meta_score, "\n")
