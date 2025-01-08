#### Identify Missing Data ####

# Importing necessary libraries
library(tidyverse)
options(pillar.sigfig = 10)

# Read the data file into a DataFrame
ch4_ac1 <- read_csv('Titanic-Dataset.csv')

# Analyze missing data in the 'Age' column
missing_age_analysis <- ch4_ac1 %>%
  summarize(`Total #` = n(),
            `# Missing Age` = sum(is.na(Age)),
            `Percent Missing Age` = round(sum(is.na(Age)) / n() * 100, 2))

print(missing_age_analysis)
