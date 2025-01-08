#### Select Distinct Values of Variables ####

# Importing necessary library
library(tidyverse)

# Read the CSV file into a DataFrame
suppliers_df <- read_csv('Suppliers.csv')

suppliers_df$Country

# Get unique/distinct values from the 'Country' column
unique_countries <- suppliers_df %>%
  distinct(Country)

# Calculate the number of unique observations
num_unique_countries <- nrow(unique_countries)

# Print the number of unique observations
print(paste("Number of unique observations:", num_unique_countries))

# Display the unique countries
print(unique_countries)
