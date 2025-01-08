#### Summarize a Quantitative Variable ####

# Importing necessary library
library(tidyverse)

# Read the CSV file into a DataFrame
orderdetails_df <- read_csv('OrderDetails.csv')

# Calculate the mean, max, and min of 'Quantity'
mean_quantity <- mean(orderdetails_df$Quantity, na.rm = TRUE)
max_quantity <- max(orderdetails_df$Quantity, na.rm = TRUE)
min_quantity <- min(orderdetails_df$Quantity, na.rm = TRUE)

# Print the results with two decimal places
cat(sprintf("Mean Quantity: %f\n", mean_quantity))
cat(sprintf("Maximum Quantity: %f\n", max_quantity))
cat(sprintf("Minimum Quantity: %f\n", min_quantity))
