#### Calculate Similarity Using Distance ####

# Importing necessary libraries
library(tidyverse)

# Import data
penguins <- read_csv("small_penguins.csv")

# Plot the data
penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, label = species)) +
  geom_point(size = 4) +
  xlab("Bill Length (mm)") +
  ylab("Bill Depth (mm)") +
  ggtitle("Bill Depth vs. Bill Length") +
  geom_text(nudge_y = 0.3)


penguin_bills <- penguins %>%
  select(bill_length_mm, bill_depth_mm)

# Compute distances
dist_matrix <- as.matrix(dist(penguin_bills))
print(dist_matrix)

# View original data set to see species
print(penguins)

# Compute Min and Max Distances for Question 2

# Cluster 1
max_dist1 <- max(dist_matrix[1:5, 1:5])
cat("Maximum distance between two points in Cluster 1: ", max_dist1, "\n")

min_dist1 <- min(dist_matrix[1:5, 6:15])
cat("Distance from Cluster 1 to nearest other cluster using single linkage: ", min_dist1, "\n")

# Cluster 2
max_dist2 <- max(dist_matrix[6:10, 6:10])
cat("Maximum distance between two points in Cluster 2: ", max_dist2, "\n")

min_dist2 <- min(dist_matrix[6:10, c(1:5, 11:15)])
cat("Distance from Cluster 2 to nearest other cluster using single linkage: ", min_dist2, "\n")

# Cluster 3
max_dist3 <- max(dist_matrix[11:15, 11:15])
cat("Maximum distance between two points in Cluster 3: ", max_dist3, "\n")

min_dist3 <- min(dist_matrix[11:15, 1:10])
cat("Distance from Cluster 3 to nearest other cluster using single linkage: ", min_dist3, "\n")
