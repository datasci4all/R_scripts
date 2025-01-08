#### Investigate Resistance ####

# Importing necessary libraries
library(tidyverse)

# Load the dataset
linkedin_df <- read_csv('linkedin_connections.csv')

# Calculating various statistics for 'LinkedIn_connections'
mean_linkedin_connections <- mean(linkedin_df$linkedin_connections, na.rm = TRUE)
trimmed_mean_linkedin_connections <- mean(linkedin_df$linkedin_connections, trim = 0.1, na.rm = TRUE)
median_linkedin_connections <- median(linkedin_df$linkedin_connections, na.rm = TRUE)
range_linkedin_connections <- max(linkedin_df$linkedin_connections, na.rm = TRUE) - min(linkedin_df$linkedin_connections, na.rm = TRUE)
variance_linkedin_connections <- var(linkedin_df$linkedin_connections, na.rm = TRUE)
std_dev_linkedin_connections <- sd(linkedin_df$linkedin_connections, na.rm = TRUE)

# Printing the results
print(paste('Mean:', mean_linkedin_connections))
print(paste('80% Trimmed Mean:', trimmed_mean_linkedin_connections))
print(paste('Median:', median_linkedin_connections))
print(paste('Range:', range_linkedin_connections))
print(paste('Variance:', variance_linkedin_connections))
print(paste('Standard Deviation:', std_dev_linkedin_connections))
