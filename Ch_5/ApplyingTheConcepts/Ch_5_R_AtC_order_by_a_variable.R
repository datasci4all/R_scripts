#### Order by a Variable ####

# Importing necessary library
library(tidyverse)

# Read the CSV file into a DataFrame
suppliers_df <- read_csv('Suppliers.csv')

# Sort the DataFrame by 'SupplierName' in ascending order
sorted_suppliers_ascending <- suppliers_df %>%
  arrange(SupplierName)

# Calculate the number of observations (Ascending)
num_observations_ascending <- nrow(sorted_suppliers_ascending)

# Print the number of observations (Ascending)
print(paste("Number of observations (Ascending):", num_observations_ascending))

# Display the resulting DataFrame (Ascending)
print(sorted_suppliers_ascending)

# Sort the DataFrame by 'SupplierName' in descending order
sorted_suppliers_descending <- suppliers_df %>%
  arrange(desc(SupplierName))

# Calculate the number of observations (Descending)
num_observations_descending <- nrow(sorted_suppliers_descending)

# Print the number of observations (Descending)
print(paste("Number of observations (Descending):", num_observations_descending))

# Display the resulting DataFrame (Descending)
print(sorted_suppliers_descending)
