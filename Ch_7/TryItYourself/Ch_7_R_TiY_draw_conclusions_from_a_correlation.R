# Loading necessary libraries
library(tidyverse)

# Load the dataset
data <- read_csv("school.csv")

# Extracting GPA and AvgCourseDifficulty
gpa <- data$gpa
course_difficulty <- data$avg_course_difficulty

# Calculating the Pearson correlation coefficient
sample_correlation <- cor(gpa, course_difficulty, method = "pearson")

# Output the results
cat("Observed correlation coefficient:", sample_correlation, "\n")


# Perform simulation-based hypothesis test
num_sim <- 1e4

# Create data frame to store simulations in
data_sim <- data.frame(
  correlation = rep(0, times = num_sim)
)

null_value <- 0

# Perform simulations
for (i in 1:num_sim) {
  correlation_sim <- cor(course_difficulty, sample(gpa, size = length(gpa), replace = FALSE))
  
  data_sim$correlation[i] <- correlation_sim
}


# Plot simulations
data_sim %>%
  ggplot(aes(x = correlation)) +
  geom_histogram(alpha = .55, bins = 20, boundary = sample_correlation) +
  geom_vline(xintercept = sample_correlation, color = "red") +
  xlab("Sample Correlation") +
  ylab("Count") +
  ggtitle("Distribution of Sample Correlations")


# Compute and print p-value
cat("P-value:", sum(data_sim$n <= sample_correlation)/num_sim, "\n")