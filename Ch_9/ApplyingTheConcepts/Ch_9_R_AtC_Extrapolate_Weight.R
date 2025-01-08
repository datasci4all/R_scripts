#### Extrapolate Weight ####

# Enter data from text
age <- c(1, 2, 3, 4, 6, 8, 10, 12, 14, 16, 18)
weight <- c(19, 29, 32, 37, 48, 62, 78, 98, 122, 145, 159)

# Regression model
mod <- lm(weight ~ age)
mod_sum <- summary(mod)

# Model coefficients
print("Intercept coefficient:")
mod_sum$coefficients[1]

print("Slope coefficient:")
mod_sum$coefficients[2]


# Compute and print prediction
newobs <- data.frame(
  age = 40
)
print("Prediction:")
predict(mod, newdata = newobs)