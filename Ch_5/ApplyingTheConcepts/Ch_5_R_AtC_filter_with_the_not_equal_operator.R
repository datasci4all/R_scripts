#### Filter with the Not-Equal Operator ####

# Importing necessary library
library(tidyverse)

# Read the CSV file into a DataFrame
suppliers_df <- read_csv('Suppliers.csv')

# Filter the DataFrame for rows where 'Country' is NOT equal to "USA"
suppliers_not_usa <- filter(suppliers_df, Country != 'USA')

# Calculate the number of observations not in USA
num_observations_not_usa <- nrow(suppliers_not_usa)

# Print the number of observations not in USA
print(paste("Number of observations not in USA:", num_observations_not_usa))

# Display the resulting DataFrame not in USA
print(suppliers_not_usa)

# Filter the DataFrame for rows where 'Country' is NOT equal to "France"
suppliers_not_france <- suppliers_df %>%
  filter(Country != 'France')

# Calculate the number of observations not in France
num_observations_not_france <- nrow(suppliers_not_france)

# Print the number of observations not in France
print(paste("Number of observations not in France:", num_observations_not_france))

# Display the resulting DataFrame not in France
print(suppliers_not_france)