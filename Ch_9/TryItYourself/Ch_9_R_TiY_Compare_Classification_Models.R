#### Compare Classification Models ####

# Importing necessary libraries
library(tidyverse)
library(tidymodels)

# Import data
set.seed(1234)
carseats_train <- read_csv("carseats_train.csv") %>%
  mutate(
    sales_cat = factor(sales_cat, levels = c("Low", "High"), labels = c(0, 1))
  ) %>%
  select(sales_cat, competitor_price, income, advertising, population, price, age, education)
carseats_test <- read_csv("carseats_test.csv") %>%
  mutate(
    sales_cat = factor(sales_cat, levels = c("Low", "High"), labels = c(0, 1))
  ) %>%
  select(sales_cat, competitor_price, income, advertising, population, price, age, education)

## Logistic Regression 
regression_spec <- logistic_reg() %>%
  set_engine("glm") %>%
  set_mode("classification")


regression_fit <- regression_spec %>%
  fit(sales_cat ~ ., carseats_train)

y_predicted <- predict(regression_fit, carseats_test)

# Logistic Regression accuracy
cat("Logistic Regression accuracy:", accuracy_vec(carseats_test$sales_cat, factor(y_predicted$.pred_class)), "\n")

## Classification Tree (Max Depth = 5) 
tree_spec <- decision_tree(
  tree_depth = 5,
  cost_complexity = 0,
  min_n = 2
) %>%
  set_engine("rpart") %>%
  set_mode("classification")


tree_fit <- tree_spec %>%
  fit(sales_cat ~ ., carseats_train)

y_predicted <- predict(tree_fit, carseats_test)

# Decision Tree accuracy
cat("Decision Tree accuracy:", accuracy_vec(carseats_test$sales_cat, factor(y_predicted$.pred_class)), "\n")

## Regression RF (Min n = 10) 
forest_spec <- rand_forest(
  mtry = .cols(),
  min_n = 10
) %>%
  set_engine("ranger") %>%
  set_mode("classification")


forest_fit <- forest_spec %>%
  fit(sales_cat ~ ., carseats_train)

y_predicted <- predict(forest_fit, carseats_test)

# Random Forest accuracy
cat("Random Forest accuracy:", accuracy_vec(carseats_test$sales_cat, factor(y_predicted$.pred_class)), "\n")


## Regression kNN (k = 5) 
knn_spec <- nearest_neighbor(
  neighbors = 5,
  weight_func = "rectangular",
  dist_power = 2
) %>%
  set_engine("kknn") %>%
  set_mode("classification")


knn_fit <- knn_spec %>%
  fit(sales_cat ~ ., carseats_train)

y_predicted <- predict(knn_fit, carseats_test)

# kNN accuracy
cat("kNN accuracy:", accuracy_vec(carseats_test$sales_cat, factor(y_predicted$.pred_class)), "\n")