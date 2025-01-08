#### Clean Incorrect Formats ####

# Loading required library
library(tidyverse)

# Reading the dataset (Update the path with your dataset location)
df <- read.csv("birdwatcher.csv")

# Initial counts of 'sparrow', 'woodpecker', and 'hummingbird'
initial_sparrow_count <- sum(df$Favorite_Bird == "sparrow", na.rm = TRUE)
initial_woodpecker_count <- sum(df$Favorite_Bird == "woodpecker", na.rm = TRUE)
initial_hummingbird_count <- sum(df$Favorite_Bird == "hummingbird", na.rm = TRUE)

# Print initial counts
cat("Initial sparrow count:", initial_sparrow_count, "\n")
cat("Initial woodpecker count:", initial_woodpecker_count, "\n")
cat("Initial hummingbird count:", initial_hummingbird_count, "\n")

# Clean Favorite_Bird
df <- df %>%
  mutate(
    Favorite_Bird = case_when(
      Favorite_Bird == "sparrows" ~ "sparrow",
      Favorite_Bird == "woodpeckers" ~ "woodpecker",
      Favorite_Bird == "hummingbirds" ~ "hummingbird",
      str_detect(Favorite_Bird, "s.*w") ~ "sparrow",
      str_detect(Favorite_Bird, "w.*r") ~ "woodpecker",
      str_detect(Favorite_Bird, "h.*d") ~ "hummingbird"
    )
  )

# Final counts of 'sparrow', 'woodpecker', and 'hummingbird'
final_sparrow_count <- sum(df$Favorite_Bird == "sparrow", na.rm = TRUE)
final_woodpecker_count <- sum(df$Favorite_Bird == "woodpecker", na.rm = TRUE)
final_hummingbird_count <- sum(df$Favorite_Bird == "hummingbird", na.rm = TRUE)

# Print final counts
cat("Final sparrow count:", final_sparrow_count, "\n")
cat("Final woodpecker count:", final_woodpecker_count, "\n")
cat("Final hummingbird count:", final_hummingbird_count, "\n")
