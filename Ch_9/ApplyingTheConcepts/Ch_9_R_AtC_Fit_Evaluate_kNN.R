#### Fit and Evaluate k-Nearest Neighbors ####

# Importing necessary libraries
library(tidyverse)
library(tidymodels)
library(kknn)
library(rpart.plot)
library(kknn)

# Import data
carseats_train <- read_csv("carseats_train.csv") %>%
  select(-Sales_cat)
carseats_test <- read_csv("carseats_test.csv") %>%
  select(-Sales_cat)


## Regression kNN (k = 1) 
knn_spec <- nearest_neighbor(
  neighbors = 1
) %>%
  set_engine("kknn") %>%
  set_mode("regression")


knn_fit <- knn_spec %>%
  fit(Sales ~ . , data = carseats_train)

y_pred1 <- predict(knn_fit, new_data = carseats_test)

r2_1 <- rsq_vec(carseats_test$Sales, y_pred1$.pred)


## Regression kNN (k = 3) 
knn_spec <- nearest_neighbor(
  neighbors = 3
) %>%
  set_engine("kknn") %>%
  set_mode("regression")


knn_fit <- knn_spec %>%
  fit(Sales ~ . , data = carseats_train)

y_pred2 <- predict(knn_fit, new_data = carseats_test)

r2_2 <- rsq_vec(carseats_test$Sales, y_pred2$.pred)


## Regression kNN (k = 5) 
knn_spec <- nearest_neighbor(
  neighbors = 5
) %>%
  set_engine("kknn") %>%
  set_mode("regression")


knn_fit <- knn_spec %>%
  fit(Sales ~ . , data = carseats_train)

y_pred3 <- predict(knn_fit, new_data = carseats_test)

r2_3 <- rsq_vec(carseats_test$Sales, y_pred3$.pred)


## Regression kNN (k = 10) 
knn_spec <- nearest_neighbor(
  neighbors = 10
) %>%
  set_engine("kknn") %>%
  set_mode("regression")


knn_fit <- knn_spec %>%
  fit(Sales ~ . , data = carseats_train)

y_pred4 <- predict(knn_fit, new_data = carseats_test)

r2_4 <- rsq_vec(carseats_test$Sales, y_pred4$.pred)


## Regression kNN (k = 25) 
knn_spec <- nearest_neighbor(
  neighbors = 25
) %>%
  set_engine("kknn") %>%
  set_mode("regression")


knn_fit <- knn_spec %>%
  fit(Sales ~ . , data = carseats_train)

y_pred5 <- predict(knn_fit, new_data = carseats_test)

r2_5 <- rsq_vec(carseats_test$Sales, y_pred5$.pred)

# From results above
results <- data.frame(
  k = c(1, 3, 5, 10, 25),
  r2 = c(r2_1, r2_2, r2_3, r2_4, r2_5)
)

results