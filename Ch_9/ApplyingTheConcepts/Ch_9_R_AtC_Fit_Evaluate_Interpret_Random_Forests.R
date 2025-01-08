#### Fit, Evaluate, Interpret Random Forests ####

# Importing necessary libraries
library(tidyverse)
library(tidymodels)
library(rpart.plot)
library(vip)
library(ranger)

set.seed(1234)
# Import data
carseats_train <- read_csv("carseats_train.csv") %>%
  select(-Sales_cat)
carseats_test <- read_csv("carseats_test.csv") %>%
  select(-Sales_cat)


## Regression RF (Min_n 30) 
rf_spec <- rand_forest(
  mtry = .cols(),
  min_n = 30
) %>%
  set_engine("ranger", importance = "impurity") %>%
  set_mode("regression")


rf_fit <- rf_spec %>%
  fit(Sales ~ . , data = carseats_train)

y_pred1 <- predict(rf_fit, new_data = carseats_test)

r1 <- rsq_vec(carseats_test$Sales, y_pred1$.pred)

# Variable Importances
print("Variables Importances for Min n 30:")
rf_fit %>%
  vi(num_features = 5)


## Regression RF (Min_n 20) 
rf_spec <- rand_forest(
  mtry = .cols(),
  min_n = 20
) %>%
  set_engine("ranger", importance = "impurity") %>%
  set_mode("regression")


rf_fit <- rf_spec %>%
  fit(Sales ~ . , data = carseats_train)

y_pred2 <- predict(rf_fit, new_data = carseats_test)

r2 <- rsq_vec(carseats_test$Sales, y_pred2$.pred)


# Variable Importances
print("Variables Importances for Min n 20:")
rf_fit %>%
  vi(num_features = 5)

## Regression RF (Min_n 15) 
rf_spec <- rand_forest(
  mtry = .cols(),
  min_n = 15
) %>%
  set_engine("ranger", importance = "impurity") %>%
  set_mode("regression")


rf_fit <- rf_spec %>%
  fit(Sales ~ . , data = carseats_train)

y_pred3 <- predict(rf_fit, new_data = carseats_test)

r3 <- rsq_vec(carseats_test$Sales, y_pred3$.pred)

# Variable Importances
print("Variables Importances for Min n 15:")
rf_fit %>%
  vi(num_features = 5)

## Regression RF (Min_n 10) 
rf_spec <- rand_forest(
  mtry = .cols(),
  min_n = 10
) %>%
  set_engine("ranger", importance = "impurity") %>%
  set_mode("regression")


rf_fit <- rf_spec %>%
  fit(Sales ~ . , data = carseats_train)

y_pred4 <- predict(rf_fit, new_data = carseats_test)

r4 <- rsq_vec(carseats_test$Sales, y_pred4$.pred)

# Variable Importances
print("Variables Importances for Min n 10:")
rf_fit %>%
  vi(num_features = 5)

## Regression RF (Min_n 5) 
rf_spec <- rand_forest(
  mtry = .cols(),
  min_n = 5
) %>%
  set_engine("ranger", importance = "impurity") %>%
  set_mode("regression")


rf_fit <- rf_spec %>%
  fit(Sales ~ . , data = carseats_train)

y_pred5 <- predict(rf_fit, new_data = carseats_test)

r5 <- rsq_vec(carseats_test$Sales, y_pred5$.pred)

# Variable Importances
print("Variables Importances for Min n 5:")
rf_fit %>%
  vi(num_features = 5)

# From results above
results <- data.frame(
  minn = c(30, 20, 15, 10, 5),
  rsq = c(r1, r2, r3, r4, r5)
)

results

# Predictions for two prices

# Create data frame for new observations
new_store <- data.frame(
  US = c("Yes", "Yes"),
  Urban = c("Yes", "Yes"),
  Advertising = c(6.3, 6.3),
  Population = c(245.78, 245.78),
  Shelf_Location = c("Good", "Good"),
  Competitor_Price = c(125, 125),
  Income = c(67, 67),
  Price = c(100, 130),
  Age = c(53, 53),
  Education = c(14, 14)
)

# Build random forest model
rf_spec <- rand_forest(
  mtry = .cols(),
  min_n = 5
) %>%
  set_engine("ranger", importance = "impurity") %>%
  set_mode("regression")


rf_fit <- rf_spec %>%
  fit(Sales ~ . , data = carseats_train)

# Compute and print predictions
print("Predictions:")
y_pred <- predict(rf_fit, new_data = new_store)
y_pred