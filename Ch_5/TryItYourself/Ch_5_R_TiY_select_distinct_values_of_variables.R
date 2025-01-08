#### Select Distinct Values of Variables ####

# Importing necessary library
library(tidyverse)

# Read the CSV file 'Customers.csv' into a DataFrame
CustomersDf <- read_csv('Customers.csv')

# Get unique/distinct values from the 'Country' column
UniqueCountries <- CustomersDf %>%
  distinct(Country)

# Calculate the number of unique observations
NumUniqueCountries <- nrow(UniqueCountries)

# Print the number of unique observations
cat("Number of unique observations:", NumUniqueCountries, "\n")

# Display the DataFrame
print(n = NumUniqueCountries, UniqueCountries)
