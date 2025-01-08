#### Filter Using a Wildcard ####

# Importing necessary library
library(tidyverse)

# Read the CSV file into a DataFrame
products_df <- read_csv('Products.csv')

# Filter the DataFrame for rows where 'ProductName' starts with "C"
filtered_products_df_C <- products_df %>%
  filter(str_detect(ProductName, '^C'))

# Calculate the number of observations
num_observations_C <- nrow(filtered_products_df_C)

# Print the number of observations where ProductName starts with a C
print(paste("Number of observations where ProductName starts with a C:", num_observations_C))

# Display the resulting DataFrame with all columns
print(filtered_products_df_C)

# Filter the DataFrame for rows where 'ProductName' ends with 'e'
filtered_products_df_endE <- products_df %>%
  filter(str_detect(ProductName, 'e$'))

# Calculate the number of observations
num_observations_endE <- nrow(filtered_products_df_endE)

# Print the number of observations where ProductName ends with an e
print(paste("Number of observations where ProductName ends with an e:", num_observations_endE))

# Display the resulting DataFrame with all columns
print(filtered_products_df_endE)

# Filter the DataFrame for rows where 'Unit' starts with "48"
filtered_products_df_48 <- products_df %>%
  filter(str_detect(Unit, '^48'))

# Calculate the number of observations
num_observations_48 <- nrow(filtered_products_df_48)

# Print the number of observations where Unit starts with '48'
print(paste("Number of observations where Unit starts with '48':", num_observations_48))

# Display the resulting DataFrame with all columns
print(filtered_products_df_48)
