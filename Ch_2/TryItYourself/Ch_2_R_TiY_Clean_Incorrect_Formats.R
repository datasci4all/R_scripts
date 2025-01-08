#### Clean Incorrect Formats ####

# Load necessary libraries
library(tidyverse)

# Read the dataset
data <- read_csv("vote.csv")

# Initial count of 'dog' and 'cat'
initial_dog_count <- sum(data$favorite_pet == "dog", na.rm = TRUE)
initial_cat_count <- sum(data$favorite_pet == "cat", na.rm = TRUE)

# Print initial counts
cat("Initial dog count:", initial_dog_count, "\n")
cat("Initial cat count:", initial_cat_count, "\n")

# Data cleaning
data <- data %>%
  mutate(
    favorite_pet = case_when(
      favorite_pet == "dogs" ~ "dog",
      favorite_pet == "cats" ~ "cat",
      str_detect(favorite_pet, "d.*g") ~ "dog",
      str_detect(favorite_pet, "c.*t") ~ "cat",
      TRUE ~ favorite_pet
    )
  )

# Final count of 'dog' and 'cat'
final_dog_count <- sum(data$favorite_pet == "dog", na.rm = TRUE)
final_cat_count <- sum(data$favorite_pet == "cat", na.rm = TRUE)

# Print final counts
cat("Final dog count:", final_dog_count, "\n")
cat("Final cat count:", final_cat_count, "\n")
