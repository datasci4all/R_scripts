#### Identify Missing Data ####

# Loading required library
library(tidyverse)

# Reading the dataset (Update the path with your dataset location)
data <- read_csv("vote.csv")

# Counting the number of missing values in GPA
missing_gpa <- sum(is.na(data$gpa))

# Counting the total number of rows in the dataset
total_rows <- nrow(data)

# Calculating the percentage of missing GPA values
percentage_missing_gpa <- (missing_gpa / total_rows) * 100

# Printing the results
cat("Number of missing GPA values:", missing_gpa, "\n")
cat("Total number of rows:", total_rows, "\n")
cat("Percentage of missing GPA values:", percentage_missing_gpa, "%\n")
