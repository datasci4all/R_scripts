#### Fit, Evaluate, and Interpret Decision Trees ####

# Importing necessary libraries
library(tidyverse)
library(tidymodels)
library(rpart.plot)

set.seed(1240)##1237

# Import data
carseats_train <- read_csv("carseats_train.csv") %>%
  select(-Sales_cat)
carseats_test <- read_csv("carseats_test.csv") %>%
  select(-Sales_cat)

## Regression Tree (Depth 1) 
tree_spec <- decision_tree(
  tree_depth = 1,
  cost_complexity = 0,
  min_n = 2
) %>%
  set_engine("rpart") %>%
  set_mode("regression")


tree_fit <- tree_spec %>%
  fit(Sales ~ . , data = carseats_train)

y_pred1 <- predict(tree_fit, new_data = carseats_test)

r1 <- rsq_vec(carseats_test$Sales, y_pred1$.pred)

## Regression Tree (Depth 3) 
tree_spec <- decision_tree(
  tree_depth = 3,
  cost_complexity = 0,
  min_n = 2
) %>%
  set_engine("rpart") %>%
  set_mode("regression")


tree_fit <- tree_spec %>%
  fit(Sales ~ . , data = carseats_train)

y_pred2 <- predict(tree_fit, new_data = carseats_test)

r2 <- rsq_vec(carseats_test$Sales, y_pred2$.pred)


## Regression Tree (Depth 5) 
tree_spec <- decision_tree(
  tree_depth = 5,
  cost_complexity = 0,
  min_n = 2
) %>%
  set_engine("rpart") %>%
  set_mode("regression")


tree_fit <- tree_spec %>%
  fit(Sales ~ . , data = carseats_train)

y_pred3 <- predict(tree_fit, new_data = carseats_test)

r3 <- rsq_vec(carseats_test$Sales, y_pred3$.pred)

# Plot the fitted decision tree
tree_fit %>%
  extract_fit_engine() %>%
  rpart.plot(
    cex = 1,
    extra = 1
  )

## Regression Tree (Depth 7) 
tree_spec <- decision_tree(
  tree_depth = 7,
  cost_complexity = 0,
  min_n = 2
) %>%
  set_engine("rpart") %>%
  set_mode("regression")


tree_fit <- tree_spec %>%
  fit(Sales ~ . , data = carseats_train)

y_pred4 <- predict(tree_fit, new_data = carseats_test)

r4 <- rsq_vec(carseats_test$Sales, y_pred4$.pred)

## Regression Tree (Depth 10) 
tree_spec <- decision_tree(
  tree_depth = 10,
  cost_complexity = 0,
  min_n = 2
) %>%
  set_engine("rpart") %>%
  set_mode("regression")


tree_fit <- tree_spec %>%
  fit(Sales ~ . , data = carseats_train)

y_pred5 <- predict(tree_fit, new_data = carseats_test)

r5 <- rsq_vec(carseats_test$Sales, y_pred5$.pred)

# From results above
results <- data.frame(
  max_depth = c(1, 3, 5, 7, 10),
  rsq = c(r1, r2, r3, r4, r5)
)

results

# Predictions for two shelves

# Create data frame for new observations
new_store <- data.frame(
  US = c("Yes", "Yes"),
  Urban = c("Yes", "Yes"),
  Advertising = c(6.3, 6.3),
  Population = c(245.78, 245.78),
  Shelf_Location = c("Good", "Medium"),
  Competitor_Price = c(125, 125),
  Income = c(67, 67),
  Price = c(115.7, 115.7),
  Age = c(53, 53),
  Education = c(14, 14)
)

# Build decision tree model
tree_spec <- decision_tree(
  tree_depth = 5,
  cost_complexity = 0,
  min_n = 2
) %>%
  set_engine("rpart") %>%
  set_mode("regression")

tree_fit <- tree_spec %>%
  fit(Sales ~ ., data = carseats_train)

# Compute and print predictions
y_pred <- predict(tree_fit, new_data = new_store)
y_pred