library(tidyverse)

# Read the data
school_data <- read_csv("school.csv")

# Perform a one-sample t-test
# Null Hypothesis: The mean number of hours of sleep is 7
# Alternative Hypothesis: The mean number of hours of sleep is less than 7
t_test_result <- t.test(school_data$daily_sleep_hr, mu = 7, alternative = "less")

# Outputting the results
cat("T-statistic:", t_test_result$statistic, "\nP-value:", t_test_result$p.value)
