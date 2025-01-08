#### Fit, Evaluate, and Interpret Decision Trees ####

# Importing necessary libraries
library(tidyverse)
library(tidymodels)
library(rpart.plot)


set.seed(1234)

# Import data
penguins_train <- read_csv("penguins_train.csv")
penguins_test <- read_csv("penguins_test.csv")

## Regression Tree (Depth 1) 
tree_spec <- decision_tree(
  tree_depth = 1,
  cost_complexity = 0
) %>%
  set_engine("rpart") %>%
  set_mode("regression")


tree_fit <- tree_spec %>%
  fit(bill_depth_mm ~ . , penguins_train)

y_predicted_1 <- predict(tree_fit, penguins_test)

r2_1 <- rsq_vec(penguins_test$bill_depth_mm, y_predicted_1$.pred)

## Regression Tree (Depth 3) 
tree_spec <- decision_tree(
  tree_depth = 3,
  cost_complexity = 0
) %>%
  set_engine("rpart") %>%
  set_mode("regression")


tree_fit <- tree_spec %>%
  fit(bill_depth_mm ~ . , penguins_train)

y_predicted_2 <- predict(tree_fit, penguins_test)

r2_2 <- rsq_vec(penguins_test$bill_depth_mm, y_predicted_2$.pred)

# Plot the fitted decision tree
tree_fit %>%
  extract_fit_engine() %>%
  rpart.plot(
    cex = 1,
    extra = 1,
    roundint = FALSE,
    main = "Decision Tree with Max Depth of 3"
  )

## Regression Tree (Depth 5) 
tree_spec <- decision_tree(
  tree_depth = 5,
  cost_complexity = 0
) %>%
  set_engine("rpart") %>%
  set_mode("regression")


tree_fit <- tree_spec %>%
  fit(bill_depth_mm ~ . , penguins_train)

y_predicted_3 <- predict(tree_fit, penguins_test)

r2_3 <- rsq_vec(penguins_test$bill_depth_mm, y_predicted_3$.pred)

# Plot the fitted decision tree
tree_fit %>%
  extract_fit_engine() %>%
  rpart.plot(
    cex = 1,
    extra = 1,
    roundint = FALSE,
    main = "Decision Tree with Max Depth of 5"
  )

## Regression Tree (Depth 7) 
tree_spec <- decision_tree(
  tree_depth = 7,
  cost_complexity = 0
) %>%
  set_engine("rpart") %>%
  set_mode("regression")


tree_fit <- tree_spec %>%
  fit(bill_depth_mm ~ . , penguins_train)

y_predicted_4 <- predict(tree_fit, penguins_test)

r2_4 <- rsq_vec(penguins_test$bill_depth_mm, y_predicted_4$.pred)

## Regression Tree (Depth 10) 
tree_spec <- decision_tree(
  tree_depth = 10,
  cost_complexity = 0
) %>%
  set_engine("rpart") %>%
  set_mode("regression")


tree_fit <- tree_spec %>%
  fit(bill_depth_mm ~ . , penguins_train)

y_predicted_5 <- predict(tree_fit, penguins_test)

r2_5 <- rsq_vec(penguins_test$bill_depth_mm, y_predicted_5$.pred)

# From results above
max_depth_vs_r2 <- data.frame(
  max_depth = c(1, 3, 5, 7, 10),
  r2 = c(r2_1, r2_2, r2_3, r2_4, r2_5)
)

print(max_depth_vs_r2)

# Predictions for two penguins

# Create dataframe for new observations
new_penguins <- data.frame(
  species = c("Adelie", "Gentoo"),
  island = c("Biscoe", "Biscoe"),
  bill_length_mm = c(43.7, 43.7),
  flipper_length_mm = c(200, 200),
  body_mass_g = c(4160, 4160),
  sex = c("male", "male")
)

# Build decision tree model
tree_spec <- decision_tree(
  tree_depth = 3,
  cost_complexity = 0
) %>%
  set_engine("rpart") %>%
  set_mode("regression")


tree_fit <- tree_spec %>%
  fit(bill_depth_mm ~ . , penguins_train)

# Compute and print predictions
y_predicted_2 <- predict(tree_fit, new_penguins)
predictions <- data.frame(
  species = new_penguins$species,
  bill_depth = y_predicted_2$.pred
)

cat("Predictions:\n")
print(predictions)
