#### Match Boxplots with Histograms ####

# Load necessary libraries
library(tidyverse)

# Read the dataset
imdb_df <- read_csv('IMDb.csv')

# Filter the dataset
filtered_genres <- c('Drama', 'Animation', 'Comedy')
imdb_filtered <- imdb_df %>%
  filter(Genre %in% filtered_genres)

# Boxplots of Runtime
imdb_filtered %>%
  ggplot(aes(x=Genre, y=Runtime)) +
  geom_boxplot() +
  labs(title='Boxplots of Runtime for Drama, Animation, and Comedy',
       x='Genre', y='Runtime')

# Histograms of Runtime
imdb_filtered %>%
  ggplot(aes(x=Runtime)) +
  geom_histogram(binwidth=1) +
  facet_grid(rows = vars(Genre)) +
  labs(title='Histograms of Runtime for Drama, Animation, and Comedy')
