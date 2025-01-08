#### Summarize a Quantitative Variable by a Categorical Variable ####

# Importing necessary library
library(tidyverse)
options(pillar.sigfig = 10)

# Read the CSV file into a DataFrame
orderdetails_df <- read_csv('OrderDetails.csv')

# Group by 'ProductID' and calculate the average quantity for each group
summary_stat_by_product <- orderdetails_df %>%
                           group_by(ProductID) %>%
                           summarise(AverageQuantity = mean(Quantity, na.rm = TRUE))

# Group by 'OrderID' and calculate the average quantity for each group
summary_stat_by_order <- orderdetails_df %>%
  group_by(OrderID) %>%
  summarise(AverageQuantity = mean(Quantity, na.rm = TRUE))

# Display the resulting DataFrame
print(n = 77, summary_stat_by_product)

print(n=196, summary_stat_by_order)
