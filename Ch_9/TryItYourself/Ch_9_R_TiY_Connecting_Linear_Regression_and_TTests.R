#### Connecting Linear Regression and T-Tests ####

# Importing necessary libraries
library(tidyverse)

# Import data
penguins <- read_csv("penguins.csv")

# T-test
ttest_result <- t.test(bill_depth_mm ~ sex, penguins, var.equal = TRUE)

cat("T-Statistic:", ttest_result$statistic, "\n")
cat("P-value:", ttest_result$p.value, "\n")


# Regression
model <- lm(bill_depth_mm ~ sex, penguins)
model_result <- summary(model)

cat("Regression T-statistic:", model_result$coefficients[2, 3], "\n")
cat("Regression p-value:", model_result$coefficients[2, 4], "\n")