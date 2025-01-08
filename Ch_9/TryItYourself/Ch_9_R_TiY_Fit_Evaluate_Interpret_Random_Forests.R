#### Fit, Evaluate, Interpret Random Forests ####

# Importing necessary libraries
library(tidyverse)
library(tidymodels)
library(rpart.plot)
library(vip)
library(ranger)

set.seed(1234)
# Import data
penguins_train <- read_csv("penguins_train.csv")
penguins_test <- read_csv("penguins_test.csv")


## Regression RF (Min_n = 30) 
forest_spec <- rand_forest(
  mtry = .cols(),
  min_n = 30
) %>%
  set_engine("ranger", importance = "impurity") %>%
  set_mode("regression")


forest_fit <- forest_spec %>%
  fit(bill_depth_mm ~ . , penguins_train)

y_predicted_1 <- predict(forest_fit, penguins_test)

r2_1 <- rsq_vec(penguins_test$bill_depth_mm, y_predicted_1$.pred)

print("Variable Importances for Min n = 30:")

importances <- forest_fit %>%
  vi(num_features = 5)

importances <- importances %>% mutate(
  importance_weighted = Importance/sum(Importance)
)

print(importances[,c("Variable","importance_weighted")])


## Regression RF (Min_n = 20) 
forest_spec <- rand_forest(
  mtry = .cols(),
  min_n = 20
) %>%
  set_engine("ranger", importance = "impurity") %>%
  set_mode("regression")


forest_fit <- forest_spec %>%
  fit(bill_depth_mm ~ . , penguins_train)

y_predicted_2 <- predict(forest_fit, penguins_test)

r2_2 <- rsq_vec(penguins_test$bill_depth_mm, y_predicted_2$.pred)

print("Variable Importances for Min n 20:")
importances <- forest_fit %>%
  vi(num_features = 5)

importances <- importances %>% mutate(
  importance_weighted = Importance/sum(Importance)
)

print(importances[,c("Variable","importance_weighted")])

## Regression RF (Min_n = 15) 
forest_spec <- rand_forest(
  mtry = .cols(),
  min_n = 15
) %>%
  set_engine("ranger", importance = "impurity") %>%
  set_mode("regression")


forest_fit <- forest_spec %>%
  fit(bill_depth_mm ~ . , penguins_train)

y_predicted_3 <- predict(forest_fit, penguins_test)

r2_3 <- rsq_vec(penguins_test$bill_depth_mm, y_predicted_3$.pred)

print("Variable Importances for Min n 15:")
importances <- forest_fit %>%
  vi(num_features = 5)

importances <- importances %>% mutate(
  importance_weighted = Importance/sum(Importance)
)

print(importances[,c("Variable","importance_weighted")])

## Regression RF (Min_n = 10) 
forest_spec <- rand_forest(
  mtry = .cols(),
  min_n = 10
) %>%
  set_engine("ranger", importance = "impurity") %>%
  set_mode("regression")


forest_fit <- forest_spec %>%
  fit(bill_depth_mm ~ . , penguins_train)

y_predicted_4 <- predict(forest_fit, penguins_test)

r2_4 <- rsq_vec(penguins_test$bill_depth_mm, y_predicted_4$.pred)

print("Variable Importances for Min n 10:")
importances <- forest_fit %>%
  vi(num_features = 5)

importances <- importances %>% mutate(
  importance_weighted = Importance/sum(Importance)
)

print(importances[,c("Variable","importance_weighted")])

## Regression RF (Min_n = 5) 
forest_spec <- rand_forest(
  mtry = .cols(),
  min_n = 5
) %>%
  set_engine("ranger", importance = "impurity") %>%
  set_mode("regression")


forest_fit <- forest_spec %>%
  fit(bill_depth_mm ~ . , data = penguins_train)

y_predicted_5 <- predict(forest_fit, penguins_test)

r2_5 <- rsq_vec(penguins_test$bill_depth_mm, y_predicted_5$.pred)

print("Variable Importances for Min n 5:")
importances <- forest_fit %>%
  vi(num_features = 5)

importances <- importances %>% mutate(
  importance_weighted = Importance/sum(Importance)
)

print(importances[,c("Variable","importance_weighted")])

# From results above
min_n_vs_r2 <- data.frame(
  min_n = c(30, 20, 15, 10, 5),
  r2 = c(r2_1, r2_2, r2_3, r2_4, r2_5)
)

print(min_n_vs_r2)

# Predictions for two penguins

# Create data frame for new observations
new_penguins <- data.frame(
  species = c("Adelie", "Adelie"),
  island = c("Biscoe", "Biscoe"),
  bill_length_mm = c(43.7, 43.7),
  flipper_length_mm = c(200, 242),
  body_mass_g = c(4160, 4160),
  sex = c("male", "male")
)

# Build random forest model
forest_spec <- rand_forest(
  mtry = .cols(),
  min_n = 30
) %>%
  set_engine("ranger", importance = "impurity") %>%
  set_mode("regression")


forest_fit <- forest_spec %>%
  fit(bill_depth_mm ~ . , penguins_train)

# Compute and print predictions
y_predicted_1 <- predict(forest_fit, new_penguins)

predictions <- data.frame(
  flipper_length_mm = new_penguins$flipper_length_mm,
  bill_depth = round(y_predicted_1$.pred, 2)
)

cat("Predictions:\n")
print(predictions)
