#### Compare Cluster Analysis Results ####

# Importing necessary libraries
library(tidyverse)

# Import data
data <- read_csv("small_music.csv")

set.seed(1001)
# Plot data without clustering
data %>%
  ggplot(aes(x = danceability, y = energy)) +
  geom_point(size = 3) +
  ylab("Energy") +
  xlab("Danceability") +
  ggtitle("Energy vs. Danceability")


## 2 cluster analysis
k_means_clustering <- kmeans(data[, c("danceability", "energy")], centers = 2, iter.max = 100,
                algorithm = "Lloyd")

data$clusters2 <- factor(k_means_clustering$cluster)

# Plot 2 cluster analysis
data %>%
  ggplot(aes(x = danceability, y = energy)) +
  geom_point(aes(fill = clusters2), color = "black", pch = 21, size = 3) +
  ylab("Energy") +
  xlab("Danceability") +
  labs(fill = "Cluster") +
  ggtitle("Energy vs. Danceability")

set.seed(1001)
## 4 cluster analysis
k_means_clustering <- kmeans(data[, c("danceability", "energy")], centers = 4, iter.max = 100,
                algorithm = "Lloyd")

data$clusters4 <- factor(k_means_clustering$cluster)

# Plot 4 cluster analysis
data %>%
  ggplot(aes(x = danceability, y = energy)) +
  geom_point(aes(fill = clusters4), color = "black", pch = 21, size = 3) +
  ylab("Energy") +
  xlab("Danceability") +
  labs(fill = "Cluster") +
  ggtitle("Energy vs. Danceability")

set.seed(1001)
## 6 cluster analysis
k_means_clustering <- kmeans(data[, c("danceability", "energy")], centers = 6, iter.max = 100,
                algorithm = "Lloyd")

data$clusters6 <- factor(k_means_clustering$cluster)

# Plot 6 cluster analysis
data %>%
  ggplot(aes(x = danceability, y = energy)) +
  geom_point(aes(fill = clusters6), color = "black", pch = 21, size = 3) +
  ylab("Energy") +
  xlab("Danceability") +
  labs(fill = "Cluster") +
  ggtitle("Energy vs. Danceability")