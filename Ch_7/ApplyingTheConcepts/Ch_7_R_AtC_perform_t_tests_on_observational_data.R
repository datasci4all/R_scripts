# Load necessary libraries
library(tidyverse)

# Read the data from a CSV file
vb_data <- read_csv("volleyball.csv")

# Perform a one-sample t-test
sample_mean <- mean(vb_data$hit_perc)
population_mean <- 30
t_test_result <- t.test(vb_data$hit_perc, mu = population_mean)

# Compute and print mean and standard deviation
print("Mean hit_perc:")
sample_mean

print("Standard deviation of hit_perc:")
sd(vb_data$hit_perc)

# Output the t-statistic and p-value
t_statistic <- t_test_result$statistic
p_value <- t_test_result$p.value

print(paste("T-statistic:", t_statistic))
print(paste("P-value:", p_value))
