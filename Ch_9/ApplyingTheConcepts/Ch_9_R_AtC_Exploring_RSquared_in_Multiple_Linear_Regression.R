#### Multiple Linear Regression ####

# Importing necessary libraries
library(tidyverse)

# Import data
carseats <- read_csv("carseats.csv")

# Regression model 1
mod1 <- lm(Sales ~ Competitor_Price, data = carseats)
r2_1 <- summary(mod1)$r.squared

# Slope coefficient for model 1
print("Slope coefficient for model 1:")
print(mod1$coefficients[2])

# Regression model 2
mod2 <- lm(Sales ~ Competitor_Price + US, data = carseats)
r2_2 <- summary(mod2)$r.squared

# Regression model 3
mod3 <- lm(Sales ~ Competitor_Price + US + Price, data = carseats)
r2_3 <- summary(mod3)$r.squared

# Regression model 4
mod4 <- lm(Sales ~ Competitor_Price + US + Price
           + Advertising, data = carseats)
r2_4 <- summary(mod4)$r.squared

# Regression model 5
mod5 <- lm(Sales ~ Competitor_Price + US + Price
           + Advertising + Shelf_Location, data = carseats)
r2_5 <- summary(mod5)$r.squared

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
  ggtitle("R-Square vs. Number of Explanatory Variables")
