#### Create a Categorical Variable from a Quantitative Variable ####

# Importing necessary libraries
library(tidyverse)

# Read the AmesHousing data file into a DataFrame
AmesHousing <- read_csv('AmesHousing.csv')

# Categorize 'SalePrice'
AmesHousing <- AmesHousing %>%
  mutate(
    SalePriceCategory = case_when(
      SalePrice <= 100000 ~ "Cheap",
      SalePrice > 100000 & SalePrice <= 150000 ~ "Cheap Moderate",
      SalePrice > 150000 & SalePrice <= 200000 ~ "Expensive Moderate",
      SalePrice > 200000 ~ "Expensive"
    )
  )

# Get the count of each category
sale_price_counts <- table(AmesHousing$SalePriceCategory)

# Print the count of each category
print(sale_price_counts)

