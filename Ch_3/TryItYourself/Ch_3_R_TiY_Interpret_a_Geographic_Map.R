#### Interpret a Geographic Map ####

# Importing necessary libraries
library(tidyverse)

# Import the data
countries <- read_csv("countries.csv")
sa_countries <- c("Argentina", "Bolivia", "Brazil",  
                  "Colombia", "Chile","Ecuador","French Guiana","Guyana", 
                  "Paraguay", "Peru", "Suriname", 
                  "Trinidad and Tobago", "Uruguay", "Venezuela")

south_america <- countries %>%
  filter(continent == "South America") %>%
  rename(
    region = country
  )

world <- map_data("world", region = sa_countries)

combined_data <- left_join(world, south_america, by = "region")
country_labels <- combined_data %>%
  group_by(region) %>%
  summarize(long = mean(long, na.rm = T), lat = mean(lat, na.rm = TRUE), group = group)


# Plot the data
combined_data %>% 
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_polygon(aes(fill = gni_per_capita), color = "white", size = 0.2) +
  scale_fill_gradient(low="#D35FB7", high="#FEFE62", limits = c(4000, 27500)) +
  geom_text(data = country_labels, aes(long, lat, label = region, group = group), size = 4) +
  xlab("") +
  ylab("") +
  labs(fill = "GNI per Capita") +
  ggtitle("Geographic Map of South America\nIllustrating GNI per Capita by Country")
