#### Detect Anomalies ####
purchases <- c(35, 12, 50, 42, 600, 5, 70, 37, 90, 73, 45, 100, 22)

# Compute mean and standard deviation
m <- mean(purchases)
s <- sd(purchases)

# Compute z-scores (standardized scores)
z <- (purchases-m)/s

# Organize information into a data frame
d <- data.frame(
  purchases = purchases,
  standardized_scores = z
)

print(d)