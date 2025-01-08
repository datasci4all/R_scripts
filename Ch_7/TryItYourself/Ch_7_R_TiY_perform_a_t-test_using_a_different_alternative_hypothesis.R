# Loading necessary libraries
library(tidyverse)

# Load the data
school_data <- read_csv("school.csv")

# Perform a one-sample t-test
# Null Hypothesis: The mean number of GPA is 3.5
# Alternative Hypothesis: The mean GPA is less than 3.5
t_test_result <- t.test(school_data$gpa, mu = 3.5, alternative = "less")

# Output the t-test result
cat("T-statistic:", t_test_result$statistic, "\n")

cat("P-value:", t_test_result$p.value, "\n")
