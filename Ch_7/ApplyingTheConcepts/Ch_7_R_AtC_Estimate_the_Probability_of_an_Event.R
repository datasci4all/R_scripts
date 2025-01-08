# Loading necessary libraries
library(tidyverse)

# Setting the seed for reproducibility
set.seed(777)

# Parameters for the die-rolling simulation
n <- 100        # Number of rolls in each simulation
sides <- 6      # Number of sides on the die
target <- 6     # The specific outcome we're interested in (e.g., rolling a 6)

# Null Distribution Simulation
num_sims <- 1000
null_flips <- replicate(num_sims, sum(sample(1:6, size=n, replace=TRUE) == 6))
nulldata <- data.frame(num_heads=null_flips)


# Plotting the null distribution
ggplot(nulldata, aes(x=num_heads)) +
  geom_histogram(binwidth = 1, boundary = 0.5, color = "black", fill = "blue") +
  xlab("Number of Times Rolling a 6") +
  ylab("Frequency") +
  theme_minimal()


# Compute number of times that a six came up 29 times or more
sum(nulldata$num_heads == 29)

# Compute the proportion of times that a six came up 29 times or more
sum(nulldata$num_heads == 29)/num_sims