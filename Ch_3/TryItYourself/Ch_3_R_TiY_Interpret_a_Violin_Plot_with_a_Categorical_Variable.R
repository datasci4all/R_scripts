#### Interpret a Violin Plot with a Categorical variable ####
library(tidyverse)
countries <- read_csv("countries.csv")

countries %>%
  filter(income_group %in% c("Lower middle income", "Upper middle income")) %>%
  ggplot(aes(x = income_group, y = gni_per_capita, fill = income_group)) +
  geom_violin() +
  geom_boxplot(fill = "white", width = 0.1) +
  xlab("Income Group") +
  ylab("GNI per Capita ($)") +
  labs(fill = "Income Group") +
  ggtitle("GNI per Capita Among Lower Middle and Upper Middle Income Groups")
