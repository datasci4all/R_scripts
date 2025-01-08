#### Compute a Correlation and Fit a Regression Line ####

# Importing necessary libraries
library(tidyverse)

# Import data
penguins <- read_csv("penguins.csv")

# Plot data
penguins %>%
  ggplot(aes(x = flipper_length_mm, y = bill_depth_mm)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# Compute and print correlation
correlation <- cor(penguins$bill_depth_mm, penguins$flipper_length_mm, use = "complete.obs")

cat("Correlation coefficient:", correlation, "\n")

# Regression model
model <- lm(bill_depth_mm ~ flipper_length_mm, data = penguins)

# Regression Slope Coefficient
cat("Estimate slope coefficient:", model$coefficients[2], "\n")
