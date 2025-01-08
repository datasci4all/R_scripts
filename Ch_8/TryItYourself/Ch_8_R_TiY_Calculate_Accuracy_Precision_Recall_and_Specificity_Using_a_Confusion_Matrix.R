#### Calculate Accuracy, Precision, Recall, and Specificity using a Confusion Matrix ####

# Importing necessary libraries
library(tidyverse)
library(tidymodels)

# Import data
set.seed(1234)
data_train <- read_csv("carseats_train.csv") %>%
  mutate(sales_cat = factor(sales_cat))
data_test <- read_csv("carseats_test.csv") %>%
  mutate(sales_cat = factor(sales_cat))

## Classification Tree (Max Depth = 5)
tree_spec <- decision_tree(
  tree_depth = 5,
  cost_complexity = 0,
  min_n = 2
) %>%
  set_engine("rpart") %>%
  set_mode("classification")

tree_fit <- tree_spec %>%
  fit(sales_cat ~ . -sales, data_train)

# Print confusion matrix
print("Confusion matrix for test data:")
conf_mat <- augment(tree_fit, data_test) %>%
  conf_mat(truth = sales_cat, estimate = .pred_class)
confusion_matrix <- conf_mat[[1]]

print(confusion_matrix)

cat("Accuracy:", (confusion_matrix[1,1] + confusion_matrix[2,2])/nrow(data_test), "\n")

cat("Precision:", confusion_matrix[1,1]/(confusion_matrix[1,1] + confusion_matrix[1,2]), "\n")

cat("Recall:", confusion_matrix[1,1]/(confusion_matrix[1,1] + confusion_matrix[2,1]), "\n")

cat("Specificity:", confusion_matrix[2,2]/(confusion_matrix[2,2] + confusion_matrix[2,1]), "\n")