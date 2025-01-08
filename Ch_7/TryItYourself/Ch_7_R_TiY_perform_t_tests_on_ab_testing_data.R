# Load necessary libraries
library(tidyverse)

# Read the dataset
data <- read.csv("pizzapasta.csv")  # Replace with the actual file path

# Separate the data into two groups based on the treatment
pizza_group <- data %>%
  filter(treatment == "pizza")
pasta_group <- data %>%
  filter(treatment == "pasta")

# Calculate the number of participants in each group
num_pizza_participants <- nrow(pizza_group)
num_pasta_participants <- nrow(pasta_group)

cat("Number of participants seeing pizza image:", num_pizza_participants, "\n")

cat("Number of participants seeing pasta image:", num_pasta_participants, "\n")

# Calculate the mean session duration for each group
mean_session_pizza <- mean(pizza_group$session_duration)
mean_session_pasta <- mean(pasta_group$session_duration)

cat("Mean session duration of participants seeing pizza image:", mean_session_pizza, "\n")

cat("Mean session duration of participants seeing pasta image:", mean_session_pasta, "\n")

# Perform t-tests to compare the means between the two groups
# for session duration and purchase portion
t_test_session <- t.test(pizza_group$session_duration, pasta_group$session_duration, alternative = "greater",
                         var.equal = TRUE)

# Output the results of the t-tests
cat("T-statistic:", t_test_session$statistic, "\n")

cat("P-value:", t_test_session$p.value, "\n")
