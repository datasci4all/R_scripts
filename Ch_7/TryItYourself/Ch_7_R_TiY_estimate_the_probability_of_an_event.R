# Loading necessary libraries
library(tidyverse)

# Setting the seed for reproducibility
set.seed(777)

# Coin-Flipping Simulation
nullp <- 0.5
num_flips <- 100

# Null Distribution Simulation with 100
num_sims <- 100
null_flips <- replicate(num_sims, sum(sample(c(1, 0), size=num_flips, prob=c(nullp, 1-nullp), replace=TRUE)))
null_data <- data.frame(num_heads=null_flips)

# Plotting the null distribution (optional to recreate Figure 7.7)
ggplot(null_data, aes(x=num_heads)) +
    geom_histogram(binwidth = 1, center = 50, fill="blue", color="black") +
    xlim(0, num_sims) +
    scale_x_continuous(breaks=seq(0, num_sims, by=10)) +
    labs(title="Counts of Getting Heads after 100 Trials of 100 Coin Flips", x="Number of Heads", y="Count") +
    theme_minimal()

# Compute number of times 60 heads came up
cat("Number of times 60 heads came up:", sum(null_data$num_heads == 60), "\n")

# Compute the proportion of times 60 heads came up
cat("Probability of 60 heads coming up:", sum(null_data$num_heads == 60)/num_sims, "\n")
