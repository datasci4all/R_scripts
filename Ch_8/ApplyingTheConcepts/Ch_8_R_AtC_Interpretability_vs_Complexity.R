#### Interpretability vs. Complexity ####

# Importing necessary libraries
library(tidyverse)
library(tidymodels)
library(rpart.plot)

# Import data
data <- read_csv("penguins.csv") %>%
  mutate(
    species = factor(species)
  )

## Classification Tree (Depth 1) 
tree_spec <- decision_tree(
  tree_depth = 1
) %>%
  set_engine("rpart")

class_tree_spec <- tree_spec %>%
  set_mode("classification")


class_tree_fit <- class_tree_spec %>%
  fit(species ~ ., data = data)

# Plot Tree
class_tree_fit %>%
  extract_fit_engine() %>%
  rpart.plot(
    cex = 4, # adjust this value to make your tree more readable
    extra = 1
  )


## Classification Tree (Depth 5)
tree_spec <- decision_tree(
  tree_depth = 5
) %>%
  set_engine("rpart")

class_tree_spec <- tree_spec %>%
  set_mode("classification")


class_tree_fit <- class_tree_spec %>%
  fit(species ~ ., data = data)

# Plot Tree
class_tree_fit %>%
  extract_fit_engine() %>%
  rpart.plot(
    cex = 2, # adjust this value to make your tree more readable
    extra = 1
  )


## Classification Tree (Depth 7)
tree_spec <- decision_tree(
  tree_depth = 7,
  cost_complexity = 0,
  min_n = 2
) %>%
  set_engine("rpart")

class_tree_spec <- tree_spec %>%
  set_mode("classification")


class_tree_fit <- class_tree_spec %>%
  fit(species ~ ., data = data)

# Plot Tree
class_tree_fit %>%
  extract_fit_engine() %>%
  rpart.plot(
    cex = 1.25, # adjust this value to make your tree more readable
    extra = 1
  )
