#### Describe the Shape of the Histogram ####

# Importing necessary libraries
library(tidyverse)

# Read the data
imdb_df <- read_csv('IMDb.csv')

# Plotting a histogram of User_Ratings
imdb_df %>%
  ggplot(aes(x = IMDB_Rating)) +
    geom_histogram(bins = 10, fill = '#0072b2', color = 'black') +
    labs(title = 'Histogram of IMDb Rating', x = 'Meta Score', y = 'Frequency') +
    theme_minimal()
