#### Create a Boolean Variable that Represents a Categorical Variable ####

# Importing necessary libraries
library(tidyverse)

# Read the zoo dataset
zoo <- read_csv('Zoo.csv')

# Create boolean variables representing categorical variables
# 'Mammal' is TRUE if class_type is 2, FALSE otherwise
zoo <- zoo %>%
  mutate(
    Mammal = case_when(
      class_type == 1 ~ TRUE,
      class_type != 1 ~ FALSE
    )
  )

# 'Bird' is TRUE if class_type is 2, FALSE otherwise
zoo <- zoo %>%
  mutate(
    Bird = case_when(
      class_type == 2 ~ TRUE,
      class_type != 2 ~ FALSE
    )
  )

# 'Reptile' is TRUE if class_type is 3, FALSE otherwise
zoo <- zoo %>%
  mutate(
    Reptile = case_when(
      class_type == 3 ~ TRUE,
      class_type != 3 ~ FALSE
    )
  )

# Count the values of the boolean variables
mammal_count <- table(zoo$Mammal)
bird_count <- table(zoo$Bird)
reptile_count <- table(zoo$Reptile)

# Print the counts
print('Mammal Counts:')
print(mammal_count)
print('Bird Counts:')
print(bird_count)
print('Reptile Counts:')
print(reptile_count)
