#### Summarize a Quantitative Variable by a Categorical Variable ####

# Importing necessary library
library(tidyverse)
options(pillar.sigfig = 10)

# Read the CSV file 'Products.csv' into a DataFrame
ProductsDf <- read_csv("Products.csv")

# Group by 'CategoryID' and calculate the average price for each group, formatted to two decimal places
AveragePriceByCategory <- ProductsDf %>%
  group_by(CategoryID) %>%
  summarise(AveragePrice = mean(Price, na.rm = TRUE))

# Display the resulting DataFrame
print(AveragePriceByCategory)

