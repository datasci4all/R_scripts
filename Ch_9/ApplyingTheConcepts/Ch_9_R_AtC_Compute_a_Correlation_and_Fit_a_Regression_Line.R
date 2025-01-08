#### Compute a Correlation and Fit a Regression Line ####

# Importing necessary libraries
library(tidyverse)

# Import data
carseats <- read_csv("carseats.csv")

# Plot data
carseats %>%
  ggplot(aes(x = Advertising, y = Sales)) +
  geom_point()

# Compute and print correlation
print("Correlation coefficient:")
cor(carseats$Sales, carseats$Advertising, use = "complete.obs")

# Regressio model
mod <- lm(Sales ~ Advertising, data = carseats)

# Regression Slope Coefficient
print("Estimated slope coefficient:")
print(mod$coefficients[2])
