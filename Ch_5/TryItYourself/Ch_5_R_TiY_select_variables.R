#### Select Variables ####

# Importing necessary library
library(tidyverse)

# Read the CSV file 'Customers.csv' into a DataFrame
CustomersDf <- read_csv("Customers.csv")

print(CustomersDf$Country[10])

print(CustomersDf$City[10])

# Calculate the number of observations
NumObservations <- nrow(CustomersDf)

# Print the number of observations
cat("Number of observations:", NumObservations, "\n")

# Display the 'Country' column
print(n = NumObservations, select(CustomersDf, Country))
