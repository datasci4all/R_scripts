#### Detect Anomalies ####
bids <- c(88, 92, 95, 76, 89, 40, 180, 15, 90, 80, 85, 91, 20)

# Compute the mean and standard deviation
bids_mean <- mean(bids)
bids_std_dev <- sd(bids)

# Compute the z-scores (standardized scores)
z_scores <- (bids-bids_mean)/bids_std_dev

# Organize information into a data frame
formatted_z_scores <- data.frame(
  bids = bids,
  z_scores = z_scores
)

print(formatted_z_scores)

cat("Mean:", bids_mean, "\n")
cat("Standard Deviation:", bids_std_dev, "\n")