#### Filter Missing Values ####

# Importing necessary library
library(tidyverse)

# Read the CSV file into a DataFrame
orderdetails_df <- read_csv('OrderDetails.csv')

# Filter the DataFrame for rows where 'OrderID' is missing
filtered_orderdetails_missing_orderid <- orderdetails_df %>%
  filter(is.na(OrderID))

# Calculate the number of observations
num_observations <- nrow(filtered_orderdetails_missing_orderid)

# Print the number of observations where OrderID is null
print(paste("Number of observations where OrderID is null:", num_observations))

# Display the resulting DataFrame with all columns
print(filtered_orderdetails_missing_orderid)
