#### Simulate Samples of a Fair Coin ####

# Importing necessary libraries
library(tidyverse)
set.seed(1234)

# Create data frame for simulation results
ns <- c(30, 100, 1000) # Sample sizes
sim_n <- 1e4 # Number of simulations

d <- data.frame(
  sample_size30 = rep(0, times = sim_n),
  sample_size100 = rep(0, times = sim_n),
  sample_size1000 = rep(0, times = sim_n)
)

# Perform simulations
for (i in 1:sim_n) {
  x <- sample(c("Heads", "Tails"), size = ns[1], replace = T)
  x2 <- sample(c("Heads", "Tails"), size = ns[2], replace = T)
  x3 <- sample(c("Heads", "Tails"), size = ns[3], replace = T)
  
  d$sample_size30[i] <- mean(x == "Heads")
  d$sample_size100[i] <- mean(x2 == "Heads")
  d$sample_size1000[i] <- mean(x3 == "Heads")
}

# Organize results
d2 <- d %>%
  pivot_longer(sample_size30:sample_size1000, names_to = "sample_size", values_to = "prop") %>%
  mutate(
    n = case_when(
      sample_size == "sample_size30" ~ "30",
      sample_size == "sample_size100" ~ "100",
      sample_size == "sample_size1000" ~ "1000"
    )
  ) %>%
  mutate(
    n = factor(n, levels = c("1000", "100", "30"))
  )

# Plot results
d2 %>%
  ggplot(aes(x = prop, fill = n)) +
  geom_histogram(alpha = .55, bins = 20) +
  facet_wrap(~n, nrow = 3) +
  xlab("Sample Proportion of Heads") +
  ylab("Count") +
  labs(fill = "Sample Size") +
  ggtitle("Distribution of Sample Proportion of Heads")