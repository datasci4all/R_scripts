#### Filter Multiple Conditions Simultaneously ####

# Importing necessary library
library(tidyverse)

# Read the CSV file into a DataFrame
orderdetails_df <- read_csv('OrderDetails.csv')

# Filter the DataFrame for rows where 'OrderID' is 10293 and 'Quantity' is 10 or higher
filtered_orderdetails_10293_10 <- orderdetails_df %>%
  filter(OrderID == 10293 & Quantity >= 10)

# Calculate the number of observations for the first condition
num_observations_10293_10 <- nrow(filtered_orderdetails_10293_10)

# Print the number of observations for the first condition
print(paste("Number of observations where Order ID = 10293 and Quantity >= 10:", num_observations_10293_10))

# Display the resulting DataFrame for the first condition
print(filtered_orderdetails_10293_10)

# Filter the DataFrame for rows where 'OrderID' is 10294 and 'Quantity' is greater than 15
filtered_orderdetails_10294_15 <- orderdetails_df %>%
  filter(OrderID == 10294 & Quantity > 15)

# Calculate the number of observations for the second condition
num_observations_10294_15 <- nrow(filtered_orderdetails_10294_15)

# Print the number of observations for the second condition
print(paste("Number of observations where Order ID = 10294 and Quantity > 15:", num_observations_10294_15))

# Display the resulting DataFrame for the second condition
print(filtered_orderdetails_10294_15)
