#### Connecting Linear Regression and T-Tests ####

# Importing necessary libraries
library(tidyverse)

# Import data
carseats <- read_csv("carseats.csv")

# T-Test
ttest <- t.test(Sales  ~ US, data = carseats, var.equal = TRUE)

print("T-statistic:")
ttest$statistic

print("P-value:")
ttest$p.value

# Regression model
mod <- lm(Sales ~ US, data = carseats)
mod_sum <- summary(mod)

print("T-statistic from Regression:")
mod_sum$coefficients[2,3]

print("P-value from Regression:")
mod_sum$coefficients[2,4]