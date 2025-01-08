#### Create a Categorical Variable ####

# Load required libraries
library(tidyverse)

# Read the dataset
data <- read_csv("vote.csv")

# Categorize GPA
data <- data %>%
  mutate(
    gpa_cat = case_when(
      gpa >= 2.00 & gpa <= 2.99 ~ "low",
      gpa >= 3.00 & gpa <= 4.00 ~ "high"
    )
  )

# Final count of 'low' and 'high'
final_low_count <- sum(data$gpa_cat == "low", na.rm = TRUE)
final_high_count <- sum(data$gpa_cat == "high", na.rm = TRUE)

# Print final counts
cat("Final low count:", final_low_count, "\n")
cat("Final high count:", final_high_count, "\n")
