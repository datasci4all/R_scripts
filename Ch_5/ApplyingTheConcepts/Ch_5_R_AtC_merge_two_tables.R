#### Merge Two Tables ####

# Importing necessary library
library(tidyverse)

# Read the CSV files into DataFrames
products_df <- read_csv('Products.csv') %>%
  select(CategoryID, ProductName, ProductID)
categories_df <- read_csv('Categories.csv') %>%
  select(CategoryID, CategoryName)

# Perform an inner join between 'Products' and 'Categories' on 'CategoryID'
result_df <- products_df %>%
  inner_join(categories_df, by = 'CategoryID')

# Calculate the number of observations after joining
num_observations <- nrow(result_df)

# Print the number of observations
print(paste("Number of observations after joining:", num_observations))

# Display the resulting DataFrame with only 'ProductName' and 'CategoryName' columns
print(n=77,select(result_df, ProductName, CategoryName))
