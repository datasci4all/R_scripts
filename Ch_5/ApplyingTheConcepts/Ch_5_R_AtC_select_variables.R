#### Select Variables ####

# Importing necessary library
library(tidyverse)

# Read the CSV file into a DataFrame
suppliers_df <- read_csv('Suppliers.csv')

# Calculate the number of observations
num_observations <- nrow(suppliers_df)

suppliers_df$Country[10]
suppliers_df$Country[1]
suppliers_df$Country[num_observations]

# Print the number of observations
print(paste("Number of observations:", num_observations))

# Select and display the 'Country' column
selected_data <- select(suppliers_df, Country)
print(n = num_observations, selected_data)
