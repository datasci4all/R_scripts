#### Compare Classification Models ####

# Importing necessary libraries
library(tidyverse)
library(tidymodels)

set.seed(1236)
# Import data
college_train <- read_csv("college_train.csv") %>%
  mutate(
    Private = factor(Private)
  )

college_test <- read_csv("college_test.csv") %>%
  mutate(
    Private = factor(Private)
  )


## Logistic Regression 
lr_spec <- logistic_reg() %>%
  set_engine("glm") %>%
  set_mode("classification")


lr_fit <- lr_spec %>%
  fit(Private ~ . , data = college_train)

y_pred <- predict(lr_fit, new_data = college_test)

print("Logistic regression accuracy:")
accuracy_vec(college_test$Private, factor(y_pred$.pred_class))

## Classification Tree (Depth 10) 
tree_spec <- decision_tree(
  tree_depth = 10,
  cost_complexity = 0,
  min_n = 2
) %>%
  set_engine("rpart") %>%
  set_mode("classification")


tree_fit <- tree_spec %>%
  fit(Private ~ . , data = college_train)

y_pred <- predict(tree_fit, new_data = college_test)

print("Decision tree accuracy:")
accuracy_vec(college_test$Private, factor(y_pred$.pred_class))

## Regression RF (Min_n 30) 
rf_spec <- rand_forest(
  mtry = .cols(),
  min_n = 30
) %>%
  set_engine("ranger", importance = "impurity") %>%
  set_mode("classification")


rf_fit <- rf_spec %>%
  fit(Private ~ . , data = college_train)

y_pred <- predict(rf_fit, new_data = college_test)

print("Random forest accuracy:")
accuracy_vec(college_test$Private, factor(y_pred$.pred_class))
