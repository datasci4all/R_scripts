#### Splitting a Variable into Multiple Variables ####

# Load the necessary libraries
library(tidyverse)
library(lubridate)

# Read the birdwatcher dataset
birdwatcher_data <- read_csv('birdwatcher.csv')

# Comment: Isolating the month from the Date variable
# Assuming the date is in a standard format (e.g., YYYY-MM-DD)
birdwatcher_data <- birdwatcher_data %>%
  mutate(
    Month = month(ymd(Date))
  )

# OR Separate 'Date' column into three columns for month, day, year
birdwatching_data <- birdwatcher_data %>%
  separate(Date, into = c("Year", "Month", "Day"))

# Comment: Counting the number of entries for each month
monthly_counts <- table(birdwatcher_data$Month)

# Print the monthly counts
print('Entries per Month:')
print(monthly_counts)
