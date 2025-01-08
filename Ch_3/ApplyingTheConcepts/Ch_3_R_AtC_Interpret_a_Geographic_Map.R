#### Interpret a Geographic Map ####
library(tidyverse)
countries <- read_csv("countries.csv")
na.countries <- c("Aruba", "Bahamas", "Belize",
                  "Barbados", "Canada", "Costa Rica",
                  "Cuba", "Dominican Republic", "Grenada",
                  "Guatemala", "Honduras", "Haiti",
                  "Jamaica", "Mexico", "Nicaragua",
                  "Panama", "Puerto Rico", "El Salvador",
                  "Trinidad and Tobago", "USA")

north_america <- countries %>%
  filter(continent == "North America") %>%
  rename(
    region = country
  ) %>%
  mutate(
    region = case_when(
      region == "United States" ~ "USA",
      TRUE ~ region
    )
  )

world <- map_data("world", region = na.countries)

df.country <- left_join(world, north_america, by = "region") 

dff <- df.country %>%
  group_by(region) %>%
  summarize(long = mean(long, na.rm = T), lat = mean(lat, na.rm = T), group = group) %>%
  mutate(
    long = case_when(
      region == "USA" ~ long + 25,
      TRUE ~ long
    ),
    lat = case_when(
      region == "USA" ~ lat - 10,
      TRUE ~ lat
    )
  )

df.country %>% 
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_polygon(aes(fill = life_expectancy), color = "white", size = 0.2) +
  scale_fill_gradient(low="#D35FB7", high="#FEFE62", limits = c(60, 85)) +
  theme_minimal() +
  geom_text(data = dff, aes(long, lat, label = region, group = group), size = 4) +
  xlab("") +
  ylab("") +
  xlim(-200, 0) +
  labs(fill = "Life Expectancy")

