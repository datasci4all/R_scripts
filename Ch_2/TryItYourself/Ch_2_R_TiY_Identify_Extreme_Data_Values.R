#### Identify Extreme Data Values ####

# Load required library
library(tidyverse)

# Load the data
data <- read_csv("vote.csv")  # Replace with your file path

# Calculate the 5th and 95th percentiles of age
age_5th_percentile <- quantile(data$age, 0.05)
age_95th_percentile <- quantile(data$age, 0.95)

# Get the range of the oldest 5% and youngest 5% of respondents
oldest_5_percent_range <- range(data[data$age >= age_95th_percentile, "age"])
youngest_5_percent_range <- range(data[data$age <= age_5th_percentile, "age"])

# Count the number of respondents above 100 and below 18
above_100_count <- sum(data$age > 100)
below_18_count <- sum(data$age < 18)

# Print results
cat("Highest age of the lowest 5%:", age_5th_percentile, "\n")
cat("Lowest age of the highest 5%:", age_95th_percentile, "\n")
cat("Oldest 5% age range:", oldest_5_percent_range, "\n")
cat("Youngest 5% age range:", youngest_5_percent_range, "\n")
cat("Number of respondents above 100:", above_100_count, "\n")
cat("Number of respondents below 18:", below_18_count)
