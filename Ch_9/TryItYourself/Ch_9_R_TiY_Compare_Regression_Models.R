#### Compare Regression Models ####

# Importing necessary libraries
library(tidyverse)
library(tidymodels)
library(rpart)
library(ranger)
library(kknn)

# Import data
penguins_train <- read_csv("penguins_train.csv")
penguins_test <- read_csv("penguins_test.csv")

## Linear Regression with all explanatory variables
model_1 <- lm(bill_depth_mm ~ . , penguins_train)
y_predicted_1 <- predict(model_1, penguins_test)

r2_1 <- rsq_vec(penguins_test$bill_depth_mm, y_predicted_1)

## Decision Tree with Max Depth of 10
tree_spec <- decision_tree(
  tree_depth = 10,
  cost_complexity = 0
) %>%
  set_engine("rpart") %>%
  set_mode("regression")


tree_fit <- tree_spec %>%
  fit(bill_depth_mm ~ . , penguins_train)

y_predicted_2 <- predict(tree_fit, penguins_test)

r2_2 <- rsq_vec(penguins_test$bill_depth_mm, y_predicted_2$.pred)

## Random Forest with Min n of 15
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


## kNN with k = 10
knn_spec <- nearest_neighbor(
  neighbors = 10
) %>%
  set_engine("kknn") %>%
  set_mode("regression")


knn_fit <- knn_spec %>%
  fit(bill_depth_mm ~ . , penguins_train)

y_predicted_4 <- predict(knn_fit, penguins_test)

r2_4 <- rsq_vec(penguins_test$bill_depth_mm, y_predicted_4$.pred)

## From output above
method_vs_r2 <- data.frame(
  method = c("Multiple Linear Regression", "Decision Tree", "Random Forest", "kNN"),
  r2 = c(r2_1, r2_2, r2_3, r2_4)
)

print(method_vs_r2)