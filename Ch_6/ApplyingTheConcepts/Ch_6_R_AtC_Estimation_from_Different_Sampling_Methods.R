#### Estimation from Different Sampling Methods ####

# Importing necessary libraries
library(tidyverse)

## SRS Stats
srs <- read_csv("student_gpa_srs.csv")

srs %>%
  group_by(class) %>%
  summarize(
    avg = mean(gpa),
    n = n()
  )

# Overall average
mean(srs$gpa)

## Proportional Stratified Stats
strat_samp <- read_csv("student_gpa_strat.csv")

strat_samp %>%
  group_by(class) %>%
  summarize(
    avg = mean(gpa),
    n = n()
  )

# Overall average
mean(strat_samp$gpa)

## Balanced Stratified Stats
bal_strat_samp <- read_csv("student_gpa_bal_strat.csv")

bal_strat_samp %>%
  group_by(class) %>%
  summarize(
    avg = mean(gpa),
    n = n()
  )

# Overall average
mean(bal_strat_samp$gpa)