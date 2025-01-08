#### Filter a Quantitative Variable ####

# Importing necessary library
library(tidyverse)

# Read the CSV file into a DataFrame
ProductsDf <- read_csv('Products.csv')

# Filter the DataFrame for rows where 'Price' is greater than or equal to 45
FilteredProducts45Df <- ProductsDf %>%
  filter(Price >= 45)

# Calculate the number of observations
NumObservations45 <- nrow(FilteredProducts45Df)

# Print the number of observations where the Price >= $45
cat("Number of observations where the Price >= $45:", NumObservations45, "\n")

# Display the resulting DataFrame with all columns
print(FilteredProducts45Df)

# Filter the DataFrame for rows where 'Price' is less than 10
FilteredProducts10Df <- ProductsDf %>%
  filter(Price < 10)

# Calculate the number of observations
NumObservations10 <- nrow(FilteredProducts10Df)

# Print the number of observations where the Price < $10
cat("Number of observations where the Price < $10:", NumObservations10, "\n")

# Display the resulting DataFrame with all columns
print(FilteredProducts10Df)
