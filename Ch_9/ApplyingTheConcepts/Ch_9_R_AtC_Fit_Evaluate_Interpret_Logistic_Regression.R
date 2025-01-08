#### Fit, Evaluate, and Interpret Logistic Regression ####

# Importing necessary libraries
library(tidyverse)
library(tidymodels)

# Import data
college_train <- read_csv("college_train.csv") %>%
  mutate(
    Private = factor(Private)
  )

college_test <- read_csv("college_test.csv") %>%
  mutate(
    Private = factor(Private)
  )

## Logistic Regression (1) 
lr_spec <- logistic_reg() %>%
  set_engine("glm") %>%
  set_mode("classification")


lr_fit <- lr_spec %>%
  fit(Private ~ F.Undergrad , data = college_train)

y_pred <- predict(lr_fit, new_data = college_test)

print("Accuracy for logistic regression 1:")
accuracy_vec(college_test$Private, factor(y_pred$.pred_class))



## Logistic Regression (2) 
lr_spec <- logistic_reg() %>%
  set_engine("glm") %>%
  set_mode("classification")


lr_fit <- lr_spec %>%
  fit(Private ~ F.Undergrad + Room.Board, data = college_train)

y_pred <- predict(lr_fit, new_data = college_test)

print("Accuracy for logistic regression 2:")
accuracy_vec(college_test$Private, factor(y_pred$.pred_class))


## Logistic Regression (3) 
lr_spec <- logistic_reg() %>%
  set_engine("glm") %>%
  set_mode("classification")


lr_fit <- lr_spec %>%
  fit(Private ~ F.Undergrad + Room.Board
      + Top10perc, data = college_train)

y_pred <- predict(lr_fit, new_data = college_test)

print("Accuracy for logistic regression 3:")
accuracy_vec(college_test$Private, factor(y_pred$.pred_class))

## Logistic Regression (4) 
lr_spec <- logistic_reg() %>%
  set_engine("glm") %>%
  set_mode("classification")


lr_fit <- lr_spec %>%
  fit(Private ~ F.Undergrad + Room.Board
      + Top10perc + Accept, data = college_train)

y_pred <- predict(lr_fit, new_data = college_test)

print("Accuracy for logistic regression 4:")
accuracy_vec(college_test$Private, factor(y_pred$.pred_class))

print("Coefficients for Model 4:")
lr_fit$fit$coefficients

# Predictions for two Top10perc rates

# Create data frame for new observations
new_school <- data.frame(
  F.Undergrad = c(3680, 3680),
  Room.Board = c(4350, 4350),
  Top10perc = c(10, 35),
  Accept = c(2000, 2000)
)

# Build logistic regression model
lr_spec <- logistic_reg() %>%
  set_engine("glm") %>%
  set_mode("classification")


lr_fit <- lr_spec %>%
  fit(Private ~ F.Undergrad + Room.Board
      + Top10perc + Accept, data = college_train)

# Compute and print predictions
print("Predictions:")
y_pred <- predict(lr_fit, new_data = new_school, type = "prob")
y_pred