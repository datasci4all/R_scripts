#### Determine Outliers using the Quartile and Mean/SD Methods ####

# Importing necessary libraries
library(tidyverse)

# Load the dataset
imdb_df <- read_csv('IMDB.csv')

# Calculating the mean, standard deviation, quartiles and IQR for 'Global_Sales'
mean_IMDB_Rating <- mean(imdb_df$IMDB_Rating)
std_IMDB_Rating <- sd(imdb_df$IMDB_Rating)
Q1 <- quantile(imdb_df$IMDB_Rating, 0.25)
Q3 <- quantile(imdb_df$IMDB_Rating, 0.75)
IQR <- Q3 - Q1

# Quartile Method Thresholds
mild_outliers_q_low <- Q1 - 1.5 * IQR
mild_outliers_q_high <- Q3 + 1.5 * IQR
regular_outliers_q_low <- Q1 - 3 * IQR
regular_outliers_q_high <- Q3 + 3 * IQR

# Mean/SD Method Thresholds
mild_outliers_sd_low <- mean_IMDB_Rating - 2 * std_IMDB_Rating
mild_outliers_sd_high <- mean_IMDB_Rating + 2 * std_IMDB_Rating
regular_outliers_sd_low <- mean_IMDB_Rating - 3 * std_IMDB_Rating
regular_outliers_sd_high <- mean_IMDB_Rating + 3 * std_IMDB_Rating

# Creating a table to display the results
outlier_thresholds <- data.frame(
  Type = c('Mild Outliers', 'Regular Outliers', 'Mild Outliers', 'Regular Outliers'),
  Method = c('Quartile Method', 'Quartile Method', 'Mean/SD Method', 'Mean/SD Method'),
  Lower_Threshold = c(mild_outliers_q_low, regular_outliers_q_low, mild_outliers_sd_low, regular_outliers_sd_low),
  Upper_Threshold = c(mild_outliers_q_high, regular_outliers_q_high, mild_outliers_sd_high, regular_outliers_sd_high)
)

print(outlier_thresholds)

mild_outliers_q_high_rounded <- mild_outliers_q_high
regular_outliers_q_high_rounded <- regular_outliers_q_high
mild_outliers_sd_high_rounded <- mild_outliers_sd_high
regular_outliers_sd_high_rounded <- regular_outliers_sd_high

# Counting the number of outliers above each UPPER threshold
outlier_count <- list(
  'Mild Outliers (Quartile Method)' = sum(imdb_df$IMDB_Rating > mild_outliers_q_high_rounded),
  'Regular Outliers (Quartile Method)' = sum(imdb_df$IMDB_Rating > regular_outliers_q_high_rounded),
  'Mild Outliers (Mean/SD Method)' = sum(imdb_df$IMDB_Rating > mild_outliers_sd_high_rounded),
  'Regular Outliers (Mean/SD Method)' = sum(imdb_df$IMDB_Rating > regular_outliers_sd_high_rounded)
)

# Print the count of outliers
print(outlier_count)

# Counting the number of outliers below each LOWER threshold
outlier_count <- list(
  'Mild Outliers (Quartile Method)' = sum(imdb_df$IMDB_Rating < mild_outliers_q_low),
  'Regular Outliers (Quartile Method)' = sum(imdb_df$IMDB_Rating < regular_outliers_q_low),
  'Mild Outliers (Mean/SD Method)' = sum(imdb_df$IMDB_Rating < mild_outliers_sd_low),
  'Regular Outliers (Mean/SD Method)' = sum(imdb_df$IMDB_Rating < regular_outliers_sd_low)
)


# Print the count of outliers
print(outlier_count)
