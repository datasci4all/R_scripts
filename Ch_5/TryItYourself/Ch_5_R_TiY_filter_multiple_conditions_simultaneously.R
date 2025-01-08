#### Filter Multiple Conditions Simultaneously ####

# Importing necessary library
library(tidyverse)

# Read the CSV file into a DataFrame
ProductsDf <- read_csv('Products.csv')

# Filter the DataFrame for rows where 'Unit' is "24 - 12 oz bottles" and 'Price' is 19
FilteredProducts19 <- ProductsDf %>%
  filter(Unit == '24 - 12 oz bottles' & Price == 19)

# Calculate the number of observations
NumObservations19 <- nrow(FilteredProducts19)

# Print the number of observations
cat("Number of observations where Unit is '24 - 12 oz bottles' and Price = 19:", NumObservations19, "\n")

# Display the resulting DataFrame with all columns
print(FilteredProducts19)

# Filter the DataFrame for rows where 'Unit' is "24 - 12 oz bottles" and 'Price' is 14
FilteredProducts14 <- ProductsDf %>%
  filter(Unit == '24 - 12 oz bottles' & Price == 14)

# Calculate the number of observations
NumObservations14 <- nrow(FilteredProducts14)

# Print the number of observations
cat("Number of observations where Unit is '24 - 12 oz bottles' and Price = 14:", NumObservations14, "\n")

# Display the resulting DataFrame with all columns
print(FilteredProducts14)

# Filter the DataFrame for rows where 'Unit' is "24 - 12 oz bottles" and 'Price' is at least 10
FilteredProducts10Plus <- ProductsDf %>%
  filter(Unit == '24 - 12 oz bottles' & Price >= 10)

# Calculate the number of unique observations
NumObservations10Plus <- nrow(FilteredProducts10Plus)

# Print the number of unique observations
cat("Number of observations where Unit is '24 - 12 oz bottles' and Price >= 10:", NumObservations10Plus, "\n")

# Display the resulting DataFrame with all columns
print(FilteredProducts10Plus)
