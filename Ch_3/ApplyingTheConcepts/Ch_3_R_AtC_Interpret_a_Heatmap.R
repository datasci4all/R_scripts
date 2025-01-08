#### Interpret a Heatmap ####
library(tidyverse)
countries <- read_csv("countries.csv")
countries %>%
  filter(income_group %in% c("High income", "Upper middle income",
                             "Lower middle income")) %>%
  filter(country %in% c('Argentina', 'Bolivia', 'Brazil',  
                        'Colombia', 'Chile','Ecuador','French Guiana','Guyana', 
                        'Paraguay', 'Peru', 'Suriname', 
                        'Trinidad and Tobago', 'Uruguay', 'Venezuela')) %>%
  mutate(
    income_group = factor(income_group, levels = c("High income", "Upper middle income", "Lower middle income"))
  ) %>%
  ggplot(aes(x = income_group, y = country, fill = ggei)) +
  geom_tile() +
  geom_text(aes(label = ggei)) +
  scale_fill_gradient(low = "darksalmon", high = "deepskyblue") +
  xlab("Income Group") +
  ylab("Country") +
  labs(fill = "GGEI") +
  ggtitle("")