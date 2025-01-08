#### Extrapolation ####

# Enter data from text
age <- 6:20
height <- c(42, 45, 48, 51, 54.5, 58, 61,
            63.5, 66, 68.5, 69.5, 70, 71, 71.5, 72)

# Regression model
model <- lm(height ~ age)
model_result <- summary(model)

# Print regression model coefficients
cat("Intercept coefficient:", model_result$coefficients[1], "\n")

cat("Slope coefficient:", model_result$coefficients[2], "\n")


# Make prediction
new_observation <- data.frame(
  age = 40
)

cat("Prediction for new observation:", predict(model, new_observation), "\n")