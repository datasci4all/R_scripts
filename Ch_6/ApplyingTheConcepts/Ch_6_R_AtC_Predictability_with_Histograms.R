#### Predictability with Histograms ####

# Importing necessary libraries
library(tidyverse)

# Import data
skeeball <- read_csv("skeeball.csv")

# Plot data
skeeball %>%
  ggplot(aes(x = scores, fill = person)) +
  geom_histogram() +
  facet_wrap(~person, nrow = 3) +
  labs(
    fill = "Gamer",
    x = "Skeeball Scores"
  ) 

# Compute averages
skeeball %>%
  group_by(person) %>%
  summarize(
    avg_score = mean(scores)
  )

# Compute proportions
print("Darc's proportion of scores over 400:")
sum(skeeball$scores[skeeball$person == "Darc"] > 400)/1000

print("Qpawnz's proportion of scores over 400:")
sum(skeeball$scores[skeeball$person == "Qpawnz"] > 400)/1000

print("Ember's proportion of scores over 400:")
sum(skeeball$scores[skeeball$person == "Ember"] > 400)/1000