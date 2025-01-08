#### Perform a Two-Sample T-Test ####

# Importing necessary libraries
library(tidyverse)

# Import data
carseats <- read_csv("carseats_sales_us.csv")

# T-Test
ttest <- t.test(carseats$sales_us_yes, carseats$sales_us_no, data = carseats)

# Print results
ttest

