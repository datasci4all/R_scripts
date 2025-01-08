#### Simulate Flipping a Loaded Coin ####
# Roulette Wheel

# Importing necessary libraries
library(tidyverse)

# Perform simulations
set.seed(1234)
ns <- c(5, 10, 100, 5000) # number of spins
probs <- c(18/38, 18/38, 2/38) # red, black, green probabilities
x <- sample(c("Red", "Black", "Green"), size = ns[1], prob = probs, replace = T)
x2 <- sample(c("Red", "Black", "Green"), size = ns[2], prob = probs, replace = T)
x3 <- sample(c("Red", "Black", "Green"), size = ns[3], prob = probs, replace = T)
x4 <- sample(c("Red", "Black", "Green"), size = ns[4], prob = probs, replace = T)

# Organize simulation results
d <- data.frame(
  rolls = factor(c(x, x2, x3, x4), levels = c("Black", "Green", "Red")),
  die = factor(c(rep(paste(ns[1], "Spins"), ns[1]), rep(paste(ns[2], "Spins"), ns[2]), rep(paste(ns[3], "Spins"), ns[3]),
                 rep(paste(ns[4], "Spins"), ns[4])), levels = paste(ns, "Spins"))
)

# Plot results
d %>%
  ggplot(aes(x = rolls, y = after_stat(prop), group = 1)) +
  geom_bar() +
  geom_segment(aes(x = 2.55, y = 18/38, xend = 3.45, yend = 18/38), color = "red", lwd = 2) +
  geom_segment(aes(x = .55, y = 18/38, xend = 1.45, yend = 18/38), color = "black", lwd = 2) +
  geom_segment(aes(x = 1.55, y = 2/38, xend = 2.45, yend = 2/38), color = "darkgreen", lwd = 2) +
  facet_wrap(~die, nrow = 2) +
  ylab("Proportion") +
  xlab("Spin Outcome") +
  ggtitle("Roulette Wheel Spins")