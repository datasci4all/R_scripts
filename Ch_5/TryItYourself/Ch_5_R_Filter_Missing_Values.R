#### Filter Missing Values ####

# Importing necessary library
library(tidyverse)

# Read the CSV file into a DataFrame
CustomersDf <- read_csv("Customers.csv")

# Filter the DataFrame for rows where 'PostalCode' is missing
FilteredCustomersMissingPostalcode <- CustomersDf %>%
  filter(is.na(PostalCode))

# Calculate the number of observations
NumObservations <- nrow(FilteredCustomersMissingPostalcode)

FilteredCustomersMissingPostalcode

# Print the number of observations
print(paste("Number of observations where PostalCode is null:", NumObservations))

# Display the resulting DataFrame with all columns
print(FilteredCustomersMissingPostalcode)
