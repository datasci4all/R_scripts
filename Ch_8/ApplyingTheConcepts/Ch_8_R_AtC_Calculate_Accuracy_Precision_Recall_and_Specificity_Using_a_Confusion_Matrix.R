#### Calculate Accuracy, Precision, Recall, and Specificity using a Confusion Matrix ####

# Importing necessary libraries
library(tidyverse)
library(tidymodels)
library(rpart.plot)

set.seed(1234)

# Import data
data_train <- read_csv("carseats_train.csv") %>%
  mutate(Sales_cat = factor(Sales_cat))
data_test <- read_csv("carseats_test.csv") %>%
  mutate(Sales_cat = factor(Sales_cat))

## Classification Tree (Depth 1)
tree_spec <- decision_tree(
  tree_depth = 1,
  cost_complexity = 0,
  min_n = 2
) %>%
  set_engine("rpart") %>%
  set_mode("classification")

class_tree_fit <- tree_spec %>%
  fit(Sales_cat ~ . -Sales, data = data_train)

# Print confusion matrix
print("Confusion matrix for test data:")
conf_mat <- augment(class_tree_fit, new_data = data_test) %>%
  conf_mat(truth = Sales_cat, estimate = .pred_class)
conf_mat2 <- conf_mat[[1]]

print(conf_mat)

print("Accuracy:")
print((conf_mat2[1,1] + conf_mat2[2,2])/nrow(data_test))

print("Precision:")
print(conf_mat2[1,1]/(conf_mat2[1,1] + conf_mat2[1,2]))

print("Recall:")
print(conf_mat2[1,1]/(conf_mat2[1,1] + conf_mat2[2,1]))

print("Specificity:")
print(conf_mat2[2,2]/(conf_mat2[2,2] + conf_mat2[2,1]))