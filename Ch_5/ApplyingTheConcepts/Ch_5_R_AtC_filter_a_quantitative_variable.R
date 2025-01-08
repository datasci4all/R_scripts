#### Filter a Quantitative Variable ####

# Importing necessary library
library(tidyverse)

# Read the CSV file into a DataFrame
orderdetails_df <- read_csv('OrderDetails.csv')

# Filter the DataFrame for rows where 'Quantity' is greater than or equal to 45
filtered_orderdetails_df45 <- orderdetails_df %>%
  filter(Quantity >= 45)

# Calculate the number of observations where Quantity >= 45
num_observations_45 <- nrow(filtered_orderdetails_df45)

# Print the number of observations where Quantity >= 45
print(paste("Number of observations where Quantity >= 45:", num_observations_45))

# Display the resulting DataFrame where Quantity >= 45
print(filtered_orderdetails_df45)

# Filter the DataFrame for rows where 'Quantity' is more than 10
filtered_orderdetails_df10 <- orderdetails_df %>%
  filter(Quantity > 10)

# Calculate the number of observations where Quantity > 10
num_observations_10 <- nrow(filtered_orderdetails_df10)

# Print the number of observations where Quantity > 10
print(paste("Number of observations where Quantity > 10:", num_observations_10))

# Display the resulting DataFrame where Quantity > 10
print(filtered_orderdetails_df10)
