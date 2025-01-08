#### Calculate Similarity Using Distance ####

# Importing necessary libraries
library(tidyverse)

# Import data
small_iris <- read_csv("small_iris.csv")


# Plot original data set
small_iris %>%
  ggplot(aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(size = 4) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Sepal Width vs. Sepal Length")


small_iris_num <- small_iris %>%
  select(Sepal.Length, Sepal.Width)

# Compute distances
dist_matrix <- as.matrix(dist(small_iris_num))
dist_matrix

# View original data set to see species
small_iris