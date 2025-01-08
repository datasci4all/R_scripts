#### Filter Text Variables ####

# Importing necessary library
library(tidyverse)

# Read the CSV file into a DataFrame
suppliers_df <- read_csv('Suppliers.csv')

# Filter the DataFrame for rows where 'Country' is equal to "France"
france_suppliers <- suppliers_df %>%
  filter(Country == 'France')

# Calculate the number of observations for France
num_observations_france <- nrow(france_suppliers)

# Print the number of observations for France
print(paste("Number of observations for France:", num_observations_france))

# Display the resulting DataFrame for France
print(france_suppliers)

# Filter the DataFrame for rows where 'Country' is equal to "USA"
usa_suppliers <- suppliers_df %>%
  filter(Country == 'USA')

# Calculate the number of observations for USA
num_observations_usa <- nrow(usa_suppliers)

# Print the number of observations for USA
print(paste("Number of observations for USA:", num_observations_usa))

# Display the resulting DataFrame for USA
print(usa_suppliers)
