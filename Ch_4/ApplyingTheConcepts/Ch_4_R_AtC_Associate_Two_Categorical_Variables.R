#### Associate Two Categorical Variables ####

# Importing necessary libraries
library(tidyverse)

# Read the data
imdb_df <- read_csv('IMDb.csv')

# Filter for the specified genres
selected_genres <- c('Drama', 'Action', 'Animation', 'Comedy')
filtered_df <- imdb_df %>%
  filter(Genre %in% selected_genres)

# Find the top four Maturity Ratings in terms of counts
top_maturity_ratings <- sort(table(filtered_df$Certificate), decreasing = TRUE)[1:4]
top_maturity_ratings_df <- filtered_df %>% filter(Certificate %in% names(top_maturity_ratings))

# Create a bar chart for the top four Maturity Ratings using a color-blind safe palette
top_maturity_ratings_df %>%
  ggplot(aes(x = Genre, fill = Certificate)) +
    geom_bar(position = "dodge") +
    scale_fill_manual(values = c('#d55e00', '#cc79a7', '#0072b2', '#f0e442')) +
    labs(title = 'Side-by-Side Column Chart of Categorical Variable Certificate by Categorical Variable Genre.',
         x = 'Genre', y = 'Count') +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
