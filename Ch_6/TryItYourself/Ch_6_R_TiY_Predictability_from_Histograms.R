#### Predictability from Histograms ####

# Importing necessary libraries
library(tidyverse)

# Import data
pinball <- read_csv("pinball.csv")

# Plot data
pinball %>%
  ggplot(aes(x = scores, fill = person)) +
  geom_histogram() +
  facet_wrap(~person, nrow = 3) +
  labs(
    fill = "Gamer",
    x = "Pinball Scores (in millions)"
  )

# Compute averages
pinball %>%
  group_by(person) %>%
  summarize(
    avg_score = mean(scores)
  )

# Compute proportions
print("Proportion of Darc's Scores Over 1250 million:")
cat(sum(pinball$scores[pinball$person == "Darc"] > 1250)/1000, "\n")
print("Proportion of Qpawnz's Scores Over 1250 million:")
cat(sum(pinball$scores[pinball$person == "Qpawnz"] > 1250)/1000, "\n")
print("Proportion of Ember's Scores Over 1250 million:")
cat(sum(pinball$scores[pinball$person == "Ember"] > 1250)/1000, "\n")