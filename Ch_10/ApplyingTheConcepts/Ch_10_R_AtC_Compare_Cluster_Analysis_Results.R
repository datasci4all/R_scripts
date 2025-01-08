#### Compare Cluster Analysis Results ####

# Importing necessary libraries
library(tidyverse)

# Import data
data <- read_csv("iris.csv")

set.seed(1234)
# Original Data in all black
data %>%
  ggplot(aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(size = 5) +
  ylab("Sepal Width") +
  xlab("Sepal Length") +
  ggtitle("Sepal Length vs. Sepal Width")


## 3 cluster analysis
k_res <- kmeans(data[, 1:4], centers = 3, iter.max = 100,
                algorithm = "Hartigan-Wong")

data$clusters3 <- factor(k_res$cluster)

# Plot 3 cluster analysis
data %>%
  ggplot(aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(fill = clusters3), color = "black", pch = 21, size = 5) +
  ylab("Sepal Width") +
  xlab("Sepal Length") +
  labs(fill = "Cluster") +
  ggtitle("Sepal Length vs. Sepal Width")


## 4 cluster analysis
k_res <- kmeans(data[, 1:4], centers = 4, iter.max = 100,
                algorithm = "Hartigan-Wong")

data$clusters4 <- factor(k_res$cluster)

# Plot 4 cluster analysis
data %>%
  ggplot(aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(fill = clusters4), color = "black", pch = 21, size = 5) +
  ylab("Sepal Width") +
  xlab("Sepal Length") +
  labs(fill = "Cluster") +
  ggtitle("Sepal Length vs. Sepal Width")


## 6 cluster analysis
k_res <- kmeans(data[, 1:4], centers = 6, iter.max = 100,
                algorithm = "Hartigan-Wong")

data$clusters6 <- factor(k_res$cluster)

# Plot 6 cluster analysis
data %>%
  ggplot(aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(fill = clusters6), color = "black", pch = 21, size = 5) +
  ylab("Sepal Width") +
  xlab("Sepal Length") +
  labs(fill = "Cluster") +
  ggtitle("Sepal Length vs. Sepal Width")