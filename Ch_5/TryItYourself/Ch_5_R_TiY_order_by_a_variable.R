#### Order by a Variable ####

# Importing necessary library
library(tidyverse)

# Read the CSV file 'Products.csv' into a DataFrame
ProductsDf <- read_csv("Products.csv")

# Sort the DataFrame by 'Price' in ascending order
SortedProducts <- ProductsDf %>%
  arrange(Price)

# Calculate the number of observations
NumObservations <- nrow(SortedProducts)

# Print the number of observations
cat("Number of observations:", NumObservations, "\n")

# Display the resulting DataFrame with all columns
SortedProducts[1:8,]

# Sort the DataFrame by 'Price' in descending order
SortedProductsDesc <- ProductsDf %>%
  arrange(desc(Price))

# Display the resulting DataFrame with all columns
SortedProductsDesc[1:8,]
