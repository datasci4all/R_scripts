#### Fit, Evaluate, and Interpret Logistic Regression ####

# Importing necessary libraries
library(tidyverse)
library(tidymodels)

# Import data
carseats_train <- read_csv("carseats_train.csv") %>%
  mutate(
    sales_cat = factor(sales_cat, levels = c("Low", "High"), labels = c(0, 1))
  )
carseats_test <- read_csv("carseats_test.csv") %>%
  mutate(
    sales_cat = factor(sales_cat, levels = c("Low", "High"), labels = c(0, 1))
  )

## Logistic Regression (1) 
regression_spec <- logistic_reg() %>%
  set_engine("glm") %>%
  set_mode("classification")


regression_fit <- regression_spec %>%
  fit(sales_cat ~ advertising, carseats_train)

y_predicted <- predict(regression_fit, carseats_test)

# Accuracy for model 1
cat("Test accuracy for model 1:", accuracy_vec(carseats_test$sales_cat, factor(y_predicted$.pred_class)), "\n")


## Logistic Regression (2) 
regression_fit <- regression_spec %>%
  fit(sales_cat ~ advertising + population, carseats_train)

y_predicted <- predict(regression_fit, carseats_test)

# Accuracy for model 2
cat("Test accuracy for model 2:", accuracy_vec(carseats_test$sales_cat, factor(y_predicted$.pred_class)), "\n")


## Logistic Regression (3) 
regression_fit <- regression_spec %>%
  fit(sales_cat ~ advertising + population + shelf_location, carseats_train)

y_predicted <- predict(regression_fit, carseats_test)

# Accuracy for model 3
cat("Test accuracy for model 3:", accuracy_vec(carseats_test$sales_cat, factor(y_predicted$.pred_class)), "\n")


## Logistic Regression (4) 
regression_fit <- regression_spec %>%
  fit(sales_cat ~ advertising + population + shelf_location +
        age, carseats_train)

y_predicted <- predict(regression_fit, carseats_test)

# Accuracy for model 4
cat("Test accuracy for model 4:", accuracy_vec(carseats_test$sales_cat, factor(y_predicted$.pred_class)), "\n")


# Coefficients for model 4
cat("\nCoefficients for Model 4:\n")
print(regression_fit$fit$coefficients)

# Predictions for two shelves

# Create data frame for new observations
new_stores <- data.frame(
  advertising = c(6.3, 6.3),
  population = c(245.78, 245.78),
  shelf_location = c("Good", "Good"),
  age = c(32, 60)
)


# Compute and make predictions
cat("\nProbability Predictions for Two Stores:\n")
predictions <- predict(regression_fit, new_stores, type = "prob")
predictions <- rename(predictions, c(low_sales = .pred_0, high_sales = .pred_1))
predictions <- predictions %>% add_column(store = c("Store 1", "Store 2"), .before = "low_sales")
print(predictions)