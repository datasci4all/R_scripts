#### Examine the Elbow of a Cluster Analysis ####

# Importing necessary libraries
library(tidyverse)
set.seed(1)

# Import data
data <- read_csv("penguins.csv")

k_values <- 2:10
inertia <- numeric(length(k_values))

# Scale the variables
data <- data %>% mutate(
  bill_length_mm = (bill_length_mm-mean(bill_length_mm))/sd(bill_length_mm),
  bill_depth_mm = (bill_depth_mm-mean(bill_depth_mm))/sd(bill_depth_mm),
  flipper_length_mm = (flipper_length_mm-mean(flipper_length_mm))/sd(flipper_length_mm),
  body_mass_g = (body_mass_g-mean(body_mass_g))/sd(body_mass_g)
)

# k-means cluster analysis for different k
for (i in seq_along(k_values)) {
  k_means_clustering <- kmeans(data[, c("bill_length_mm", "bill_depth_mm", 
                                        "flipper_length_mm", "body_mass_g")], centers = k_values[i], iter.max = 100,
                   algorithm = "Lloyd")
  
  inertia[i] <- k_means_clustering$tot.withinss
}

# Organize results into a dataframe
data_result <- data.frame(
  k_value = k_values,
  inertia = inertia
)

# Plot results for k-means analysis
data_result %>%
  ggplot(aes(x = k_value, y = inertia)) +
  geom_point(size = 3) +
  geom_line(lwd = 1) +
  xlab("Number of Clusters (k)") +
  ylab("Within-Cluster Variability (Inertia)") +
  ggtitle("Within-Cluster Variability vs. Number of Clusters")
