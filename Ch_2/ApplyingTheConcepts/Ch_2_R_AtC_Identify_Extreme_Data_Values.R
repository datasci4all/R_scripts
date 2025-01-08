#### Identify Extreme Data Values ####

# Load the necessary libraries
library(tidyverse)

# Read the birdwatcher dataset
birdwatcher_data <- read_csv('birdwatcher.csv')

# Calculate the 5th and 95th percentiles of age
# This will help in identifying the oldest and youngest 5% of birdwatchers
age_5th_percentile <- quantile(birdwatcher_data$Age, 0.05)
age_95th_percentile <- quantile(birdwatcher_data$Age, 0.95)

# Determine the range of ages for the oldest 5% and youngest 5% of birdwatchers
oldest_5_percent_range <- range(birdwatcher_data$Age[birdwatcher_data$Age >= age_95th_percentile])
youngest_5_percent_range <- range(birdwatcher_data$Age[birdwatcher_data$Age <= age_5th_percentile])

# Count the number of birdwatchers above 100 and below 18
# These counts will identify potentially extreme values
above_100_count <- sum(birdwatcher_data$Age > 100)
below_18_count <- sum(birdwatcher_data$Age < 18)

# Identify impossible values such as negative ages
impossible_values_count <- sum(birdwatcher_data$Age < 0 | birdwatcher_data$Age > 200)

# Display the results
cat('Range of the oldest 5%:', oldest_5_percent_range, '\n')
cat('Range of the youngest 5%:', youngest_5_percent_range, '\n')
cat('Birdwatchers above 100 years:', above_100_count, '\n')
cat('Birdwatchers below 18 years:', below_18_count, '\n')
cat('Impossible values:', impossible_values_count, '\n')

# Print impossible values
print("Impossible values:")
birdwatcher_data[birdwatcher_data$Age < 0 | birdwatcher_data$Age > 200,]
