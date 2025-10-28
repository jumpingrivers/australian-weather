# Simple script analysing the Australian weather data

library(tidyverse)

# Read in the data
df <- read_csv("data/weatherAUS.csv")

# Choose a city
city <- "Melbourne"

# Create a scatter plot of Humidity9am and Temp9am
scatter_plot <- df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Temp9am, y = Humidity9am)) +
  geom_point() +
  labs(
    title = paste("Temperature vs Humidity at 9am in", city),
    x = "Temperature at 9am (°C)",
    y = "Humidity at 9am (%)"
  )
