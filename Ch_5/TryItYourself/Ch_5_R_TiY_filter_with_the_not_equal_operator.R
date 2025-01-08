#### Filter with the Not-Equal Operator ####

# Importing necessary library
library(tidyverse)

# Read the CSV file into a DataFrame
CustomersDf <- read_csv("Customers.csv")

# Filter the DataFrame for rows where 'Country' is not equal to "Canada"
NonCanadaCustomersDf <- CustomersDf %>%
  filter(Country != "Canada")

# Calculate the number of observations
NumObservations <- nrow(NonCanadaCustomersDf)

# Print the number of observations
cat("Number of observations not in Canada:", NumObservations, "\n")

# Filter the DataFrame for rows where 'Country' is not equal to "Mexico"
NonMexicoCustomersDf <- CustomersDf %>%
  filter(Country != "Mexico")

# Calculate the number of observations
NumObservations <- nrow(NonMexicoCustomersDf)

# Print the number of observations
cat("Number of observations not in Mexico:", NumObservations, "\n")

# Filter the DataFrame for rows where 'Country' is not equal to "USA"
NonUsaCustomersDf <- CustomersDf %>%
  filter(Country != "USA")

# Calculate the number of observations
NumObservations <- nrow(NonUsaCustomersDf)

# Print the number of observations
cat("Number of observations not in the USA:", NumObservations, "\n")

