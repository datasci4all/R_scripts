#### Create a New Variable ####

# Importing necessary library
library(tidyverse)

# Read the CSV file into a DataFrame
ProductsDf <- read_csv("Products.csv")

# Define the Yen conversion rate
YenConversionRate <- 142

# Create a new column 'Price_in_Yen'
ProductsDf <- ProductsDf %>%
  mutate(
    PriceInYen = Price * YenConversionRate
  )

# Display the resulting DataFrame with the new variable
print(n=78, select(ProductsDf, ProductID, Price, PriceInYen))
