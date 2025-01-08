# Loading necessary libraries
library(tidyverse)

# Read the data
school_data <- read_csv('school.csv')

# Perform a one-sample t-test
# Null Hypothesis: The mean number of DailyFruitVeg is 2.21
# Alternative Hypothesis: The mean DailyFruitVeg is less than 2.21
t_test_result <- t.test(school_data$DailyFruitVeg, mu = 2.21, alternative = "less")

# Outputting the results
cat("T-statistic:", t_test_result$statistic, "\nP-value:", t_test_result$p.value)
