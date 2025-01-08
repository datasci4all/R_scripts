#### Interpretability vs. Complexity ####

# Importing necessary libraries
library(tidyverse)
library(tidymodels)
library(rpart.plot)

# Import data
data <- read_csv("carseats.csv") %>%
  mutate(
    sales_cat = factor(sales_cat)
  )

# Classification Tree (Max Depth = 1) 
tree_spec <- decision_tree(
  tree_depth = 1
) %>%
  set_engine("rpart") %>%
  set_mode("classification")


tree_fit <- tree_spec %>%
  fit(sales_cat ~ . -sales, data = data)

# Plot Tree
tree_fit %>%
  extract_fit_engine() %>%
  rpart.plot(
    cex = 4, # adjust this value between 0.5 and 5 to make your tree more readable
    extra = 1
  )


# Classification Tree (Max Depth = 5)
tree_spec <- decision_tree(
  tree_depth = 5
) %>%
  set_engine("rpart") %>%
  set_mode("classification")


tree_fit <- tree_spec %>%
  fit(sales_cat ~ . -sales, data = data)

# Plot Tree
tree_fit %>%
  extract_fit_engine() %>%
  rpart.plot(
    cex = 2, # adjust this value between 0.5 and 5 to make your tree more readable
    extra = 1
  )


## Classification Tree (Max Depth = 20)
tree_spec <- decision_tree(
  tree_depth = 20,
  min_n = 2
) %>%
  set_engine("rpart") %>%
  set_mode("classification")

tree_fit <- tree_spec %>%
  fit(sales_cat ~ . -sales, data = data)

# Plot Tree
tree_fit %>%
  extract_fit_engine() %>%
  rpart.plot(
    cex = 1.25, # adjust this value between 0.5 and 5 to make your tree more readable
    extra = 1
  )