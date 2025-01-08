#### Filter Using a Wildcard ####

# Importing necessary library
library(tidyverse)

# Read the CSV file into a DataFrame
CustomersDf <- read_csv("Customers.csv")

# Filter the DataFrame for rows where 'ContactName' starts with "Z"
FilteredCustomersDfZ <- CustomersDf %>%
  filter(str_detect(ContactName, "^Z"))

# Calculate the number of observations
NumObservationsZ <- nrow(FilteredCustomersDfZ)

# Print the number of observations where ContactName starts with a Z
cat("Number of observations where ContactName starts with a Z:", NumObservationsZ, "\n")

# Display the resulting DataFrame with all columns
print(FilteredCustomersDfZ)

# Filter the DataFrame for rows where 'CustomerName' starts with "B"
FilteredCustomersDfB <- CustomersDf %>%
  filter(str_detect(CustomerName, "^B"))

# Calculate the number of observations
NumObservationsB <- nrow(FilteredCustomersDfB)

# Print the number of observations where CustomerName starts with a B
cat("Number of observations where CustomerName starts with a B:", NumObservationsB, "\n")

# Display the resulting DataFrame with all columns
print(FilteredCustomersDfB)


# Filter the DataFrame for rows where 'CustomerName' ends with 'B'
FilteredCustomersDfEndB <- CustomersDf %>%
  filter(str_detect(CustomerName, "B$"))

# Calculate the number of observations
NumObservationsEndB <- nrow(FilteredCustomersDfEndB)

# Print the number of observations where CustomerName ends with a B
cat("Number of observations where CustomerName ends with a B:", NumObservationsEndB, "\n")

# Display the resulting DataFrame with all columns
print(FilteredCustomersDfEndB)

