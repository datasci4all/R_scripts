#### Summarize a Quantitative Variable ####

# Importing necessary library
library(tidyverse)

# Read the CSV file 'Products.csv' into a DataFrame
ProductsDf <- read_csv("Products.csv")

# Calculate the mean, max, and min of 'Price'
MeanPrice <- mean(ProductsDf$Price, na.rm = TRUE)
MaxPrice <- max(ProductsDf$Price, na.rm = TRUE)
MinPrice <- min(ProductsDf$Price, na.rm = TRUE)

# Print the results with two decimal places
cat(sprintf("Mean Price: %.2f\n", MeanPrice))
cat(sprintf("Maximum Price: %.2f\n", MaxPrice))
cat(sprintf("Minimum Price: %.2f\n", MinPrice))
