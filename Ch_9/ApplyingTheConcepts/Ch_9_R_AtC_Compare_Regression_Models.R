#### Compare Regression Models ####

# Importing necessary libraries
library(tidyverse)
library(tidymodels)

# Import data
carseats_train <- read_csv("carseats_train.csv") %>%
  select(-Sales_cat)
carseats_test <- read_csv("carseats_test.csv") %>%
  select(-Sales_cat)

## Linear Regression with all explanatory variables
mod5 <- lm(Sales ~ . , data = carseats_train)
y_pred <- predict(mod5, newdata = carseats_test)

r2_1 <- rsq_vec(carseats_test$Sales, y_pred)

## Decision Tree with Max Depth of 10
tree_spec <- decision_tree(
  tree_depth = 10,
  cost_complexity = 0
) %>%
  set_engine("rpart") %>%
  set_mode("regression")


tree_fit <- tree_spec %>%
  fit(Sales ~ . , data = carseats_train)

y_pred5 <- predict(tree_fit, new_data = carseats_test)

r2_2 <- rsq_vec(carseats_test$Sales, y_pred5$.pred)

## Random Forest with Min n of 15
rf_spec <- rand_forest(
  mtry = .cols(),
  min_n = 15
) %>%
  set_engine("ranger", importance = "impurity") %>%
  set_mode("regression")


rf_fit <- rf_spec %>%
  fit(Sales ~ . , data = carseats_train)

y_pred3 <- predict(rf_fit, new_data = carseats_test)

r2_3 <- rsq_vec(carseats_test$Sales, y_pred3$.pred)


## kNN with k = 10
knn_spec <- nearest_neighbor(
  neighbors = 10
) %>%
  set_engine("kknn") %>%
  set_mode("regression")


knn_fit <- knn_spec %>%
  fit(Sales ~ . , data = carseats_train)

y_pred4 <- predict(knn_fit, new_data = carseats_test)

r2_4 <- rsq_vec(carseats_test$Sales, y_pred4$.pred)

## From output above
results <- data.frame(
  method = c("MLR", "DT", "RF", "kNN"),
  r2 = c(r2_1, r2_2, r2_3, r2_4)
)

results