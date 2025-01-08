#### Fit and Evaluate k-Nearest Neighbors ####

# Importing necessary libraries
library(tidyverse)
library(tidymodels)
library(kknn)

# Import data
penguins_train <- read_csv("penguins_train.csv") %>%
  select(bill_length_mm, bill_depth_mm)
penguins_test <- read_csv("penguins_test.csv") %>%
  select(bill_length_mm, bill_depth_mm)


## Regression kNN (k = 1) 
knn_spec <- nearest_neighbor(
  neighbors = 1,
  weight_func = "rectangular",
  dist_power = 2
) %>%
  set_engine("kknn") %>%
  set_mode("regression")


knn_fit <- knn_spec %>%
  fit(bill_depth_mm ~ . , penguins_train)

y_predicted_1 <- predict(knn_fit, penguins_test)

r1 <- rsq_vec(penguins_test$bill_depth_mm, y_predicted_1$.pred)


## Regression kNN (k = 3) 
knn_spec <- nearest_neighbor(
  neighbors = 3,
  weight_func = "rectangular",
  dist_power = 2
) %>%
  set_engine("kknn") %>%
  set_mode("regression")


knn_fit <- knn_spec %>%
  fit(bill_depth_mm ~ . , penguins_train)

y_predicted_2 <- predict(knn_fit, penguins_test)

r2 <- rsq_vec(penguins_test$bill_depth_mm, y_predicted_2$.pred)


## Regression kNN (k = 5) 
knn_spec <- nearest_neighbor(
  neighbors = 5,
  weight_func = "rectangular",
  dist_power = 2
) %>%
  set_engine("kknn") %>%
  set_mode("regression")


knn_fit <- knn_spec %>%
  fit(bill_depth_mm ~ . , penguins_train)

y_predicted_3 <- predict(knn_fit, penguins_test)

r3 <- rsq_vec(penguins_test$bill_depth_mm, y_predicted_3$.pred)


## Regression kNN (k = 10) 
knn_spec <- nearest_neighbor(
  neighbors = 10,
  weight_func = "rectangular",
  dist_power = 2
) %>%
  set_engine("kknn") %>%
  set_mode("regression")


knn_fit <- knn_spec %>%
  fit(bill_depth_mm ~ . , penguins_train)

y_predicted_4 <- predict(knn_fit, penguins_test)

r4 <- rsq_vec(penguins_test$bill_depth_mm, y_predicted_4$.pred)


## Regression kNN (k = 25) 
knn_spec <- nearest_neighbor(
  neighbors = 25,
  weight_func = "rectangular",
  dist_power = 2
) %>%
  set_engine("kknn") %>%
  set_mode("regression")


knn_fit <- knn_spec %>%
  fit(bill_depth_mm ~ . , penguins_train)

y_predicted_5 <- predict(knn_fit, penguins_test)

r5 <- rsq_vec(penguins_test$bill_depth_mm, y_predicted_5$.pred)

# From results above
k_vs_r2 <- data.frame(
  k = c(1, 3, 5, 10, 25),
  rsq = c(r1, r2, r3, r4, r5)
)

print(k_vs_r2)