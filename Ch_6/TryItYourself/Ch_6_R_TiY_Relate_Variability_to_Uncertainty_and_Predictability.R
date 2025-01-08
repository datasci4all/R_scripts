#### Relate Variability to Uncertainty and Predictability ####

# Importing necessary libraries
library(tidyverse)

# Perform simulations
set.seed(1234)
n <- 1e4
x <- sample(c("Heads", "Tails"), size = n, replace = T)
x2 <- sample(c("Heads", "Tails"), size = n, prob = c(.98, .02), replace = T)
x3 <- sample(c("Heads", "Tails"), size = n, prob = c(.3, .7), replace = T)

# Organize results into a data frame
d <- data.frame(
  rolls = c(x, x2, x3),
  die = c(rep("Coin 1", n), rep("Coin 2", n), rep("Coin 3", n))
)

# Plot results
d %>%
  ggplot(aes(x = rolls)) +
  geom_bar() +
  facet_grid(.~die) +
  ylab("Count") +
  xlab("Flip Outcome") +
  ggtitle("Flips for Three Different Coins")