#### Associate Two Categorical Variables ####

# Load necessary libraries
library(tidyverse)

# Load the dataset
videogames_df <- read_csv("videogames.csv")

# Filter for the specified genres
selected_genres <- c('Role-Playing', 'Action', 'Sports', 'Shooter')
filtered_df <- videogames_df %>%
  filter(genre %in% selected_genres)

# Find the top four Maturity Ratings in terms of counts
top_maturity_ratings <- names(sort(table(filtered_df$maturity_rating), decreasing = TRUE)[1:4])
top_maturity_ratings_df <- filtered_df %>%
  filter(maturity_rating %in% top_maturity_ratings) %>%
  mutate(
    maturity_rating = factor(maturity_rating, levels = c("E", "M", "T", "E10+")),
    genre = factor(genre, levels = c("Action", "Sports", "Shooter", "Role-Playing"))
  )

# Plot
top_maturity_ratings_df %>%
  ggplot(aes(x = genre, fill = maturity_rating)) +
  geom_bar(position = "dodge") +
  scale_fill_manual(values = c('#d55e00', '#cc79a7', '#0072b2', '#f0e442')) +
  ggtitle('Association between Game Genre and Maturity Rating') +
  xlab('Game Genre') +
  ylab('Count') +
  theme_minimal()
