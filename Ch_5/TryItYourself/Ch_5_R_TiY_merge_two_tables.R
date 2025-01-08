#### Merge Two Tables ####

# Importing necessary library
library(tidyverse)

# Read 'Customers.csv' into a DataFrame
CustomersDf <- read_csv('Customers.csv') %>%
  select(CustomerID, CustomerName)

# Read 'Orders.csv' into a DataFrame
OrdersDf <- read_csv('Orders.csv') %>%
  select(CustomerID, OrderDate)

# Perform an inner join between 'Customers' and 'Orders' on 'CustomerID'
ResultDf <- CustomersDf %>%
  inner_join(OrdersDf, by = 'CustomerID')

# Calculate the number of observations
NumObservations <- nrow(ResultDf)

# Print the number of observations
cat("Number of observations:", NumObservations, "\n")

# Display the resulting DataFrame with only 'CustomerName' and 'OrderDate' columns
print(n=196, select(ResultDf, CustomerID, CustomerName, OrderDate))
