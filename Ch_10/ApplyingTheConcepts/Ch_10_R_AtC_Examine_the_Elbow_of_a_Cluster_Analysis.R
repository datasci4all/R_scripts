#### Examine the Elbow of a Cluster Analysis ####

# Importing necessary libraries
library(tidyverse)

# Import data
data <- read_csv("iris.csv")

set.seed(1234)
k_vals <- 2:10
var_ratio <- numeric(length(k_vals))

# K-Means cluster analysis for different k
for (i in 1:length(k_vals)) {
  k_res <- kmeans(data[, 1:4], centers = k_vals[i], iter.max = 100,
                  algorithm = "Lloyd")
  
  var_ratio[i] <- k_res$tot.withinss
}

# Organize information into a data frame
data_res <- data.frame(
  k = k_vals,
  var_rat = var_ratio
)

# Plot K-Means clustering results
data_res %>%
  ggplot(aes(x = k_vals, y = var_rat)) +
  geom_point(size = 5) +
  geom_line(lwd = 2) +
  xlab("Number of Clusters (k)") +
  ylab("Within-Cluster Variability") +
  ggtitle("Within-Cluster vs. Number of Clusters")
