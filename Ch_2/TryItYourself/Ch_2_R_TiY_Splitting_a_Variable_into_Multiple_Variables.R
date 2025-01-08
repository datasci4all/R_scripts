#### Splitting a Variable into Multiple Variables ####

# Loading required libraries
library(tidyverse)
library(lubridate)

# Reading the dataset (Update the path with your dataset location)
data <- read_csv("vote.csv")

# OR Separate 'Birthdate' column into two columns for month and day
data <- data %>%
  separate(birthdate, into = c("day", "month"))
data$month <- type.convert(data$month)

# Counting the number of people per birth month
birth_month_counts <- table(data$month)

# Displaying the birth month counts
print(birth_month_counts)
