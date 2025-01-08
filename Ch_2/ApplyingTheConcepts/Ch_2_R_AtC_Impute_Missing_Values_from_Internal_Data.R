#### Impute Missing Values from Internal Data ####

# Importing necessary libraries
library(tidyverse)
options(pillar.sigfig=10)

# Read the data file into a DataFrame
ch2_ac2 <- read_csv('World_Happiness_Report_2005-2021.csv')

# Calculate mean and median of 'Healthy life expectancy at birth'
mean_life_expec <- mean(ch2_ac2$`Healthy life expectancy at birth`, na.rm = TRUE)
median_life_expec <- median(ch2_ac2$`Healthy life expectancy at birth`, na.rm = TRUE)

# Impute missing values with mean and median and summarize
imputed_data <- ch2_ac2 %>%
  mutate(
    life_expec_mean = case_when(
      is.na(`Healthy life expectancy at birth`) ~ mean_life_expec,
      TRUE ~ `Healthy life expectancy at birth`
    ),
    life_expec_median = case_when(
      is.na(`Healthy life expectancy at birth`) ~ median_life_expec,
      TRUE ~ `Healthy life expectancy at birth`
    )
  )

mean(imputed_data$life_expec_mean)
mean(imputed_data$life_expec_median)
