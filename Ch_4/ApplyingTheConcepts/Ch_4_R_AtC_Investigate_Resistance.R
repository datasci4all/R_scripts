#### Investigate Resistance ####

# Importing necessary libraries
library(tidyverse)

# Load the dataset
imdb_df <- read_csv('IMDb.csv')

# Calculating various statistics for 'Gross' (Original Data)
mean_Gross <- mean(imdb_df$Gross, na.rm = TRUE)
trimmed_mean_90_Gross <- mean(imdb_df$Gross, trim = 0.05, na.rm = TRUE)
median_Gross <- median(imdb_df$Gross, na.rm = TRUE)
mode_Gross <- as.numeric(names(sort(table(imdb_df$Gross), decreasing = TRUE)[1]))
range_Gross <- max(imdb_df$Gross, na.rm = TRUE) - min(imdb_df$Gross, na.rm = TRUE)
variance_Gross <- var(imdb_df$Gross, na.rm = TRUE)
std_dev_Gross <- sd(imdb_df$Gross, na.rm = TRUE)

# Printing the original summary statistics
print("Original Summary Statistics:")
print(paste('Mean:', mean_Gross))
print(paste('90% Trimmed Mean:', trimmed_mean_90_Gross))
print(paste('Median:', median_Gross))
print(paste('Mode:', mode_Gross))
print(paste('Range:', range_Gross))
print(paste('Variance:', variance_Gross))
print(paste('Standard Deviation:', std_dev_Gross))

# Creating a new row with Gross = 10000 and other columns as NA (if any)
outlier_row <- data.frame(matrix(NA, ncol = ncol(imdb_df), nrow = 1))
names(outlier_row) <- names(imdb_df)
outlier_row$Gross <- 10000

# Adding the outlier row to imdb_df
imdb_df_with_outlier <- rbind(imdb_df, outlier_row)

# Calculating statistics for 'Gross' after adding the outlier
mean_Gross_outlier <- mean(imdb_df_with_outlier$Gross, na.rm = TRUE)
trimmed_mean_90_Gross_outlier <- mean(imdb_df_with_outlier$Gross, trim = 0.05, na.rm = TRUE)
median_Gross_outlier <- median(imdb_df_with_outlier$Gross, na.rm = TRUE)
mode_Gross_outlier <- as.numeric(names(sort(table(imdb_df_with_outlier$Gross), decreasing = TRUE)[1]))
range_Gross_outlier <- max(imdb_df_with_outlier$Gross, na.rm = TRUE) - min(imdb_df_with_outlier$Gross, na.rm = TRUE)
variance_Gross_outlier <- var(imdb_df_with_outlier$Gross, na.rm = TRUE)
std_dev_Gross_outlier <- sd(imdb_df_with_outlier$Gross, na.rm = TRUE)

# Printing the summary statistics after adding the outlier
print("Summary Statistics with Outlier (10000 added to 'Gross'):")
print(paste('Mean:', mean_Gross_outlier))
print(paste('90% Trimmed Mean:', trimmed_mean_90_Gross_outlier))
print(paste('Median:', median_Gross_outlier))
print(paste('Mode:', mode_Gross_outlier))
print(paste('Range:', range_Gross_outlier))
print(paste('Variance:', variance_Gross_outlier))
print(paste('Standard Deviation:', std_dev_Gross_outlier))
