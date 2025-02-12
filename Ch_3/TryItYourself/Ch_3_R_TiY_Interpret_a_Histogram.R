#### Interpret a Histogram ####
library(tidyverse)

countries <- read_csv("countries.csv")

min_gni <- min(countries$gni_per_capita, na.rm = TRUE)
max_gni <- max(countries$gni_per_capita, na.rm = TRUE)

bins <- seq(from = min_gni, to = max_gni, length = 21)

ggplot(countries, aes(x = gni_per_capita)) +
  geom_histogram(breaks = bins, fill = 'skyblue', color = 'black') +  # Lighter blue color
  xlab("GNI Per Capita ($)") +
  ggtitle("Gross National Income Per Capita Worldwide")