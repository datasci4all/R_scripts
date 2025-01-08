#### Simulate Flipping a Loaded Coin ####

# Importing necessary libraries
library(tidyverse)

# Perform simulations
set.seed(1234)
ns <- c(5, 10, 100, 1000) # Numbers of Flips
probs <- c(.7, .3) # Probability of Heads, Probability of Tails
x <- sample(c("Heads", "Tails"), size = ns[1], prob = probs, replace = T)
x2 <- sample(c("Heads", "Tails"), size = ns[2], prob = probs, replace = T)
x3 <- sample(c("Heads", "Tails"), size = ns[3], prob = probs, replace = T)
x4 <- sample(c("Heads", "Tails"), size = ns[4], prob = probs, replace = T)


# Organize results
d <- data.frame(
  rolls = c(x, x2, x3, x4),
  die = factor(c(rep(paste(ns[1], "Flips"), ns[1]), rep(paste(ns[2], "Flips"), ns[2]), rep(paste(ns[3], "Flips"), ns[3]),
                 rep(paste(ns[4], "Flips"), ns[4])), levels = paste(ns, "Flips"))
)

# Plot results
d %>%
  ggplot(aes(x = rolls, y = after_stat(prop), group = 1)) +
  geom_bar() +
  geom_segment(aes(x = .55, y = .7, xend = 1.45, yend = .7), color = "red", lwd = 1.5) +
  geom_segment(aes(x = 1.55, y = .3, xend = 2.45, yend = .3), color = "blue", lwd = 1.5) +
  facet_wrap(~die, nrow = 2) +
  ylim(0, 1) +
  ylab("Proportion") +
  xlab("Flip Outcome") +
  ggtitle("Loaded Coin Flips")
