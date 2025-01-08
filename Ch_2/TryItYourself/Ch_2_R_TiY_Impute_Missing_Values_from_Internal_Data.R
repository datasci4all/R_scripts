#### Impute Missing Values from Internal Data ####

# Loading required libraries
library(tidyverse)

# Reading the dataset (Update the path with your dataset location)
data <- read_csv("vote.csv")

# Calculate mean and median GPA before imputation
mean_gpa_before <- mean(data$gpa, na.rm = TRUE)
median_gpa_before <- median(data$gpa, na.rm = TRUE)

# Perform mean imputation for missing GPA values
mean_imputation_value <- mean(data$gpa, na.rm = TRUE)
data <- data %>%
  mutate(
    gpa_imputed = case_when(
      is.na(gpa) ~ mean_imputation_value,
      TRUE ~ gpa
    )
  )

# Calculate mean and median GPA after imputation
mean_gpa_after <- mean(data$gpa_imputed)
median_gpa_after <- median(data$gpa_imputed)

# Printing the results
cat("Mean GPA before imputation:", mean_gpa_before, "\n")
cat("Median GPA before imputation:", median_gpa_before, "\n")
cat("Mean GPA after imputation:", mean_gpa_after, "\n")
cat("Median GPA after imputation:", median_gpa_after, "\n")
