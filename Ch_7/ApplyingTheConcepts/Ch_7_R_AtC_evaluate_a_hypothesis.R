# Load necessary library
library(tidyverse)

# Read the data from the CSV file
school_data <- read_csv('school.csv')

# Filtering the data to include only classes with an average difficulty rating of less than 2
difficult_classes <- school_data %>%
  filter(AvgCourseDifficulty < 2)

# Calculating the proportion of students in difficult classes
proportion_difficult_classes <- nrow(difficult_classes) / nrow(school_data)

# Output the result
print("Observed proportion of students take least difficult classes:")
print(proportion_difficult_classes)


# Perform simulation-based inference
ns <- nrow(school_data)
sim_n <- 1e4 # Number of simulations


# Create data frame to store simulations
d <- data.frame(
  n = rep(0, times = sim_n)
)

null_value <- 0.10

# Perform simulations
for (i in 1:sim_n) {
  x <- sample(c("Heads", "Tails"), prob = c(null_value, 1-null_value), size = ns, replace = T)
  
  d$n[i] <- mean(x == "Heads")
}

# Plot simulations
d %>%
  ggplot(aes(x = n)) +
  geom_histogram(alpha = .55, bins = 20) +
  geom_vline(xintercept = proportion_difficult_classes, color = "red") +
  xlab("Sample Proportion of Heads") +
  ylab("Count") +
  labs(fill = "Sample Size") +
  ggtitle("Distribution of Sample Proportion of Heads")

# Compute and print p-value
print("P-value:")
sum(d$n <= proportion_difficult_classes)/sim_n
