#### Plot Correlations between Two Quantitative Variables ####

# Importing necessary libraries
library(tidyverse)

# Load the dataset
imdb_df <- read_csv('IMDb.csv')

# Calculate the correlation coefficient
corr_coefficient <- cor(imdb_df$Meta_score, imdb_df$Gross, use = "complete.obs")

# Create a scatterplot with a regression line
imdb_df %>%
  ggplot(aes(x=Meta_score, y=Gross)) +
  geom_point() +
  geom_smooth(method='lm', color='red', se=FALSE) +
  annotate('text', x=min(imdb_df$Meta_score, na.rm=T), y=max(imdb_df$Gross, na.rm=T), label=sprintf('Corr: %.2f', corr_coefficient), hjust=0, vjust=1, size=6) +
  labs(title='Scatterplot of Meta_score and Gross') +
  theme_bw(base_size = 16)

# Calculate the correlation coefficient
corr_coefficient <- cor(imdb_df$Runtime, imdb_df$IMDB_Rating, use = "complete.obs")

# Create a scatterplot with a regression line
imdb_df %>%
  ggplot(aes(x=Runtime, y=IMDB_Rating)) +
  geom_point() +
  geom_smooth(method='lm', color='red', se=FALSE) +
  annotate('text', x=min(imdb_df$Runtime, na.rm=T), y=max(imdb_df$IMDB_Rating, na.rm=T), label=sprintf('Corr: %.2f', corr_coefficient), hjust=0, vjust=1, size=6) +
  labs(title='Scatterplot of Runtime and User_Rating') +
  theme_bw(base_size = 16)