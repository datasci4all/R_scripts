#### Estimation from Different Sampling Methods ####

# Importing necessary libraries
library(tidyverse)

## SRS Stats
srs <- read_csv("student_socialmedia_srs.csv")

srs %>%
  group_by(class) %>%
  summarize(
    avg = mean(social_media),
    n = n()
  )

cat("SRS Statistics:","\n")

# Compute overall average
cat("Overall average:","\n")
mean(srs$social_media)

## Proportional Stratified Stats
strat_samp <- read_csv("student_socialmedia_strat.csv")

cat("Stratified Random Sample Statistics:","\n")

strat_samp %>%
  group_by(class) %>%
  summarize(
    avg = mean(social_media),
    n = n()
  )

# Compute overall average
cat("Overall average:","\n")
mean(strat_samp$social_media)

## Balanced Stratified Stats
bal_strat_samp <- read_csv("student_socialmedia_bal_strat.csv")

cat("Balanced Stratified Random Sample Statistics:","\n")

bal_strat_samp %>%
  group_by(class) %>%
  summarize(
    avg = mean(social_media),
    n = n()
  )

# Compute overall average
cat("Overall average:","\n")
mean(bal_strat_samp$social_media)