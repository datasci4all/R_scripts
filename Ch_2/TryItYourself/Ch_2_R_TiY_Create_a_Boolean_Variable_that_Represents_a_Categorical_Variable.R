#### Create a Boolean Variable that Represents a Categorical Variable ####

# Load required library
library(tidyverse)

# Load the data
data <- read_csv("vote.csv")  # Replace with your file path

# Create drinking age variable
data <- data %>%
  mutate(
    drinking_age = case_when(
      age >= 21 ~ 1,
      TRUE ~ 0
    )
  )

# Count the number of 1s and 0s in drinking_age
drinking_age_count <- sum(data$drinking_age == 1, na.rm = TRUE)
non_drinking_age_count <- sum(data$drinking_age == 0, na.rm = TRUE)
cat("Drinking Age Counts\n")
cat("0:", non_drinking_age_count, "\n")
cat("1:", drinking_age_count, "\n")

# Count the number of people who voted based on drinking age
voted_drinking_age <- sum(data[data$drinking_age == 1, "voted"])
voted_non_drinking_age <- sum(data[data$drinking_age == 0, "voted"])
cat("Number of people of drinking age who voted:", voted_drinking_age, "\n")
cat("Number of people not of drinking age who voted:", voted_non_drinking_age, "\n")

# Calculate the percentages
percentage_drinking_age <- voted_drinking_age / drinking_age_count * 100
percentage_non_drinking_age <- voted_non_drinking_age / non_drinking_age_count * 100
cat("Percentage of people of drinking age who voted:", percentage_drinking_age, "%\n")
cat("Percentage of people not of drinking age who voted:", percentage_non_drinking_age, "%")
