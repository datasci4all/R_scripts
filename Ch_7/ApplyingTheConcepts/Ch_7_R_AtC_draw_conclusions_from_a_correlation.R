# Load necessary libraries
library(tidyverse)

# Load the first dataset
data1 <- read_csv("icecream1.csv")
ice_cream_sales1 <- data1$ice_cream_sales
number_drownings1 <- data1$number_drownings

# Calculate and print correlation for the first dataset
sample_cor1 <- cor(ice_cream_sales1, number_drownings1)

print(paste("Correlation Coefficient:", sample_cor1))

# Perform simulation-based hypothesis test
sim_n <- 1e4

# Create data frame to store simulations in
d <- data.frame(
  n = rep(0, times = sim_n)
)

null_value <- 0

# Perform simulations
for (i in 1:sim_n) {
  x <- cor(ice_cream_sales1, sample(number_drownings1, size = length(number_drownings1), replace = F))
  
  d$n[i] <- x
}

# Plot simulations
d %>%
  ggplot(aes(x = n)) +
  geom_histogram(alpha = .55, bins = 20) +
  geom_vline(xintercept = sample_cor1, color = "red") +
  xlab("Sample Correlations") +
  ylab("Count") +
  ggtitle("Distribution of Sample Correlations")

# Compute and print p-value
print("P-value:")
sum(d$n >= sample_cor1)/sim_n


# Load the second dataset
data2 <- read_csv("icecream2.csv")
ice_cream_sales2 <- data2$ice_cream_sales
number_drownings2 <- data2$number_drownings
temperature <- data2$temperature

# Calculate and print correlation for ice_cream_sales and temperature
sample_cor2 <- cor(ice_cream_sales2, temperature)

print(paste("Correlation Coefficient:", sample_cor2))


# Perform simulation-based hypothesis test
sim_n <- 1e4

# Create data frame to store simulations in
d <- data.frame(
  n = rep(0, times = sim_n)
)

null_value <- 0

# Perform simulations
for (i in 1:sim_n) {
  x <- cor(ice_cream_sales2, sample(temperature, size = length(temperature), replace = F))
  
  d$n[i] <- x
}

# Plot simulations
d %>%
  ggplot(aes(x = n)) +
  geom_histogram(alpha = .55, bins = 20) +
  geom_vline(xintercept = sample_cor2, color = "red") +
  xlab("Sample Correlations") +
  ylab("Count") +
  ggtitle("Distribution of Sample Correlations")

# Compute and print p-value
print("P-value:")
sum(d$n >= sample_cor2)/sim_n

# Calculate and print correlation for number_drownings and temperature
sample_cor3 <- cor(number_drownings2, temperature)


print(paste("Correlation Coefficient:", sample_cor3))

# Perform simulation-based hypothesis test
sim_n <- 1e4

# Create data frame to store simulations in
d <- data.frame(
  n = rep(0, times = sim_n)
)

null_value <- 0

# Perform simulations
for (i in 1:sim_n) {
  x <- cor(number_drownings2, sample(temperature, size = length(temperature), replace = F))
  
  d$n[i] <- x
}

# Plot simulations
d %>%
  ggplot(aes(x = n)) +
  geom_histogram(alpha = .55, bins = 20) +
  geom_vline(xintercept = sample_cor3, color = "red") +
  xlab("Sample Correlations") +
  ylab("Count") +
  ggtitle("Distribution of Sample Correlations")

# Compute and print p-value
print("P-value:")
sum(d$n >= sample_cor3)/sim_n