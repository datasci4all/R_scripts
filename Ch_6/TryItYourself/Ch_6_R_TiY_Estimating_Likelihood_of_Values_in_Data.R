#### Estimating Likelihood of Values in Data ####

# Importing necessary libraries
library(tidyverse)

# Import data
college <- read_csv("college.csv")

# Plot data
college %>%
  ggplot(aes(x = f_undergrad)) +
  geom_histogram() +
  ggtitle("Number of Full-time Undergraduates") +
  ylab("Count") +
  xlab("Number of Full-time Undergraduates")

# Proportion of schools with less than 5000 full-time undergraduates
cat(mean(college$f_undergrad < 5000), "\n")

# Proportion of schools with more than 15000 full-time undergraduates
cat(mean(college$f_undergrad > 15000), "\n")
