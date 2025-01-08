#### Perform a Two-Sample T-Test ####

# Importing necessary libraries
library(tidyverse)

# Import data
penguin_flipper_length <- read_csv("penguins_flipper_sex.csv")

# T-Test
ttest_result <- t.test(penguin_flipper_length$flipper_length_female, penguin_flipper_length$flipper_length_male, data = penguin_flipper_length)

cat("Male Mean of Flipper Length:", mean(penguin_flipper_length$flipper_length_male, na.rm =TRUE), "\n")
cat("Female Mean of Flipper Length:", mean(penguin_flipper_length$flipper_length_female, na.rm =TRUE), "\n")

cat("\nT-Test Output:\nT-statistic:", ttest_result$statistic, "\nP-value:", ttest_result$p.value, "\n")