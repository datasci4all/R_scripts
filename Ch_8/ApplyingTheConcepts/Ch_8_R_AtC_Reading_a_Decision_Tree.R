#### Reading a Decision Tree ####

# Importing necessary libraries
library(tidyverse)
library(tidymodels)
library(rpart.plot)

# Import data
data <- read_csv("college.csv") %>%
  mutate(
    Private = factor(Private)
  )

# Build Decision Tree
tree_spec <- decision_tree(
  tree_depth = 1
) %>%
  set_engine("rpart")

class_tree_spec <- tree_spec %>%
  set_mode("classification")

class_tree_fit <- class_tree_spec %>%
  fit(Private ~ ., data = data)

# Plot Tree
class_tree_fit %>%
  extract_fit_engine() %>%
  rpart.plot(
    cex = 3.5, # adjust this value to make your tree more readable
    extra = 1
  )