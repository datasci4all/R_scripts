#### Exploring R-Squared in Multiple Linear Regression ####

# Importing necessary libraries
library(tidyverse)

# Import data
penguins <- read_csv("penguins.csv")

# Regression model 1
model_1 <- lm(bill_depth_mm ~ body_mass_g, penguins)
r2_1 <- summary(model_1)$r.squared

cat("Slope coefficient for Model 1:", model_1$coefficients[2], "\n")

# Regression model 2
model_2 <- lm(bill_depth_mm ~ body_mass_g + species, penguins)
r2_2 <- summary(model_2)$r.squared

# Regression model 3
model_3 <- lm(bill_depth_mm ~ body_mass_g + species + bill_length_mm, penguins)
r2_3 <- summary(model_3)$r.squared

# Regression model 4
model_4 <- lm(bill_depth_mm ~ body_mass_g + species + bill_length_mm
           + flipper_length_mm, penguins)
r2_4 <- summary(model_4)$r.squared

# Regression model 5
model_5 <- lm(bill_depth_mm ~ body_mass_g + species + bill_length_mm
           + flipper_length_mm + sex, penguins)
r2_5 <- summary(model_5)$r.squared

# From summary output above
results <- data.frame(
  num_vars = 1:5,
  r2 = c(r2_1, r2_2, r2_3, r2_4, r2_5) 
)

# Plot the results
results %>%
  ggplot(aes(x = num_vars, y = r2)) +
  geom_point(size = 4) +
  xlab("Number of Explanatory Variables") +
  ylab("R-squared") +
  ggtitle("R-Squared vs. \nNumber of Explanatory Variables")
