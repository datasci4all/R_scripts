# Load necessary libraries
library(tidyverse)
library(broom)

# Load the dataset
data <- read_csv('portfolio.csv')  # Replace with the actual file path

# Separate the data into two groups based on the image seen
A_group <- filter(data, treatment == 'A')
B_group <- filter(data, treatment == 'B')

# Calculate the number of participants in each group
num_A_participants <- nrow(A_group)
num_B_participants <- nrow(B_group)

print("Number of treatment A participants:")
num_A_participants

print("Number of treatment B participants:")
num_B_participants

# Calculate the mean session duration for each group
mean_session_A <- mean(A_group$view_time, na.rm = TRUE)
mean_session_B <- mean(B_group$view_time, na.rm = TRUE)

print("Mean view time for treatment A:")
mean_session_A

print("Mean view time for treatment B:")
mean_session_B

# Perform t-tests for session duration and contacted rate
t_test_session <- t.test(A_group$view_time, B_group$view_time, alternative = "two.sided")

# Output the results
print("T-statistic:")
t_test_session$statistic

print("P-value:")
t_test_session$p.value