#### Interpret a Heatmap ####
library(tidyverse)
countries <- read_csv("countries.csv")
countries %>%
  filter(income_group %in% c("High income", "Upper middle income",
                             "Lower middle income")) %>%
  filter(country %in% c("Vanuatu", "Tonga", "Solomon Islands", "Samoa",
                        "Papua New Guinea", "New Zealand", "Micronesia",
                        "Fiji", "Australia")) %>%
  mutate(
    income_group = factor(income_group, levels = c("High income", "Upper middle income", "Lower middle income"))
  ) %>%
  ggplot(aes(x = income_group, y = country, fill = under_5_mortality_rate)) +
  geom_tile() +
  geom_text(aes(label = under_5_mortality_rate)) +
  scale_fill_gradient(low = "deepskyblue", high = "darksalmon") +
  xlab("Income Group") +
  ylab("Country") +
  labs(fill = "Under-5 Mortality Rate") +
  ggtitle("Under-5 Mortality Rate by Income Group and Continent")
