#### Filter Text Variables ####

# Importing necessary library
library(tidyverse)

# Read the CSV file into a DataFrame
CustomersDf <- read_csv('Customers.csv')

# Filter the DataFrame for rows where 'Country' is equal to "Mexico", and "USA"
MexicoCustomersDf <- CustomersDf %>%
  filter(Country == 'Mexico')

UsaCustomersDf <- CustomersDf %>%
  filter(Country == "USA")

# Calculate the number of observations
NumObservations <- nrow(MexicoCustomersDf)

# Print the number of observations
cat("Number of observations in Mexico:", NumObservations, "\n")

# Print filtered Mexico dataframe
print(MexicoCustomersDf)

# Calculate the number of observations
NumObservations <- nrow(UsaCustomersDf)

# Print the number of observations
cat("Number of observations in the USA:", NumObservations, "\n")

# Print filtered USA dataframe
print(UsaCustomersDf)

