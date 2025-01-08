#### Relate Variability to Uncertainty and Predictability ####

# Importing necessary libraries
library(tidyverse)

# Perform simulations
set.seed(1234)
n <- 1e5
x5 <- sample(1:20, size = n, replace = T)
x3 <- sample(1:20, size = n, prob = c(rep(0.005263158, times = 19), .9), replace = T)
x4 <- sample(1:20, size = n, prob = c(rep(0.01470588, times = 17), .25, .25, .25), replace = T)

# Organize results into a data frame
d <- data.frame(
  rolls = c(x3, x4, x5),
  die = c(rep("Die 1", n), rep("Die 2", n), rep("Die 3", n))
)

# Plot results
d %>%
  ggplot(aes(x = rolls, y = after_stat(prop), group = 1)) +
  geom_bar() +
  facet_grid(die~.) +
  ylab("Proportion of 100,000 Rolls") +
  xlab("Roll Outcome") +
  ggtitle("Rolls for Three Different Dice") +
  scale_x_continuous(
    breaks = 1:20,
    labels = 1:20
  )