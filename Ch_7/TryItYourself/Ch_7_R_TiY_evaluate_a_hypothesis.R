# Load necessary library
library(tidyverse)

# Read the data from the CSV file
school_data <- read_csv("school.csv")

# Filtering the data to include only classes with an average difficulty rating of at least 3
difficult_classes <- school_data %>%
  filter(avg_course_difficulty >= 3)

# Calculating the proportion of students in difficult classes
proportion_difficult_classes <- nrow(difficult_classes) / nrow(school_data)

# Print the proportion of students in difficult classes
cat("Observed proportion of students in difficult classes:", proportion_difficult_classes, "\n")

# Perform simulation-based hypothesis test
num_students <- nrow(school_data)
num_sim <- 1e4 # Number of simulations

# Create dataframe to hold simulations in
data_sim <- data.frame(
  proportion_sim = rep(0, times = num_sim)
)

null_value <- 0.65

# Perform simulations
for (i in 1:num_sim) {
  sim <- sample(c(1, 0), prob = c(null_value, 1-null_value), size = num_students, replace = T)
  
  data_sim$proportion_sim[i] <- mean(sim)
}


# Plot simulations
data_sim %>%
  ggplot(aes(x = proportion_sim)) +
  geom_histogram(alpha = .55, bins = 20, boundary = proportion_difficult_classes) +
  geom_vline(xintercept = proportion_difficult_classes, color = "red") +
  xlab("Sample Proportion of Students Attending Difficult Courses") +
  ylab("Count") +
  ggtitle("Distribution of Sample Proportion")

# Compute and print p-value
cat("P-value:", sum(data_sim$proportion_sim >= proportion_difficult_classes)/num_sim, "\n")
