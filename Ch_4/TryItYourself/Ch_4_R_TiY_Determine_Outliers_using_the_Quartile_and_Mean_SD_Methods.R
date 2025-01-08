#### Determine Outliers using the Quartile and Mean/SD Methods ####

# Importing necessary libraries
library(tidyverse)

# Load the dataset
videogames_df <- read_csv('videogames.csv')

# Calculating the mean, standard deviation, quartiles and IQR for 'global_sales'
mean_global_sales <- mean(videogames_df$global_sales)
std_global_sales <- sd(videogames_df$global_sales)
Q1 <- quantile(videogames_df$global_sales, 0.25)
Q3 <- quantile(videogames_df$global_sales, 0.75)
IQR <- Q3 - Q1

# Quartile Method Thresholds
mild_outliers_q_low <- Q1 - 1.5 * IQR
mild_outliers_q_high <- Q3 + 1.5 * IQR
regular_outliers_q_low <- Q1 - 3 * IQR
regular_outliers_q_high <- Q3 + 3 * IQR

# Mean/SD Method Thresholds
mild_outliers_sd_low <- mean_global_sales - 2 * std_global_sales
mild_outliers_sd_high <- mean_global_sales + 2 * std_global_sales
regular_outliers_sd_low <- mean_global_sales - 3 * std_global_sales
regular_outliers_sd_high <- mean_global_sales + 3 * std_global_sales

# Creating a table to display the results
outlier_thresholds <- data.frame(
    Type = c('Mild Outliers', 'Regular Outliers', 'Mild Outliers', 'Regular Outliers'),
    Method = c('Quartile Method', 'Quartile Method', 'Mean/SD Method', 'Mean/SD Method'),
    Lower_Threshold = c(mild_outliers_q_low, regular_outliers_q_low, mild_outliers_sd_low, regular_outliers_sd_low),
    Upper_Threshold = c(mild_outliers_q_high, regular_outliers_q_high, mild_outliers_sd_high, regular_outliers_sd_high)
)

print(outlier_thresholds)

outlier_count <- list(
  'Mild Outliers (Quartile Method)' = sum(videogames_df$global_sales > mild_outliers_q_high),
  'Regular Outliers (Quartile Method)' = sum(videogames_df$global_sales > regular_outliers_q_high),
  'Mild Outliers (Mean/SD Method)' = sum(videogames_df$global_sales > mild_outliers_sd_high),
  'Regular Outliers (Mean/SD Method)' = sum(videogames_df$global_sales > regular_outliers_sd_high)
)


# Print the count of outliers
print(outlier_count)
