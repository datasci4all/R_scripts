#### Plot Correlations between Two Quantitative Variables ####

# Importing necessary libraries
library(tidyverse)

# Load the dataset
videogames_df <- read_csv('videogames.csv')

# Calculate the correlation coefficient
corr_coefficient <- cor(videogames_df$critic_rating, videogames_df$user_rating, use = "complete.obs")

# Create a scatterplot with a regression line
videogames_df %>%
  ggplot(aes(x=critic_rating, y=user_rating)) +
  geom_point() +
  geom_smooth(method='lm', color='red', se=FALSE) +
  annotate('text', x=min(videogames_df$critic_rating, na.rm=T), y=max(videogames_df$user_rating, na.rm=T), label=sprintf('Corr: %.2f', corr_coefficient), hjust=0, vjust=1, size=6) +
  labs(title='Scatterplot of Critic_Rating and User_Rating') +
  theme_bw(base_size = 16)


# Calculate the correlation coefficient
corr_coefficient <- cor(videogames_df$user_count, videogames_df$user_rating, use = "complete.obs")

# Create a scatterplot with a regression line
videogames_df %>%
  ggplot(aes(x=user_count, y=user_rating)) +
  geom_point() +
  geom_smooth(method='lm', color='red', se=FALSE) +
  annotate('text', x=max(videogames_df$user_count, na.rm=T)-1000, y=min(videogames_df$user_rating, na.rm=T), label=sprintf('Corr: %.2f', corr_coefficient), hjust=0, vjust=1, size=6) +
  labs(title='Scatterplot of User_Count and User_Rating') +
  theme_bw(base_size = 16)
