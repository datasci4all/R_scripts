#### Reading a Decision Tree ####

# Importing necessary libraries
library(tidyverse)
library(tidymodels)
library(rpart.plot)

# Import data
data <- read_csv("penguins.csv") %>%
  mutate(
    species = factor(species)
  )

# Build decision tree
tree_spec <- decision_tree(
  tree_depth = 1
) %>%
  set_engine("rpart") %>%
  set_mode("classification")

tree_fit <- tree_spec %>%
  fit(species ~ ., data = data)

# Plot decision tree
tree_fit %>%
  extract_fit_engine() %>%
  rpart.plot(
    cex = 3.5, # adjust this value between 0.5 and 5 to make your tree more readable
    extra = 1
  )