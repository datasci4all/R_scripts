#### Interpret a Column Chart ####
library(tidyverse)
countries <- read_csv("countries.csv")

internet_means <- countries %>%
  group_by(continent) %>%
  summarize(avg = round(mean(prop_internet, na.rm = TRUE), 2))

internet_means %>%
  ggplot(aes(x = continent, y = avg, fill = continent)) +
  geom_col() +
  geom_text(aes(label = internet_means$avg), vjust = -0.2) +
  xlab("Continent") +
  ylab("Mean Percentage Among Countries") +
  labs(fill = "Continent") +
  ggtitle("Mean Percentage of People with Internet Access by Continent")
