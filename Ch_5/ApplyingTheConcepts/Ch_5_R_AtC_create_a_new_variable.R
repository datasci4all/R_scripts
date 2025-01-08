#### Create a New Variable ####

# Importing necessary library
library(tidyverse)

# Read the CSV file into a DataFrame
products_df <- read_csv('Products.csv')

# Define the Turkish Lira conversion rate
turk_conversion_rate <- 30

# Create a new column 'Price_in_Turkish_Lira'
products_df <- products_df %>%
  mutate(
    Price_in_Turkish_Lira = Price * turk_conversion_rate
  )

# Display the resulting DataFrame with the new variable
print(n=77, select(products_df, ProductID, Price, Price_in_Turkish_Lira))
