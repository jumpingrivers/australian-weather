# Simple script analysing the Australian weather data

library("tidyverse")

# Read in the data

df = read_csv("data/weatherAUS.csv")

# Create a scatter plot of Humidity9am and Temp9am
# a location

city = "Sydney"

scatter_plot = 
  df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Temp9am, y = Humidity9am)) + 
  geom_point(colour = "yellow") + 
  theme_minimal() + 
  facet_wrap(~WindDir9am)

# Save the plot in graphics/
ggsave(filename = "graphics/scatter-temp-humidity.png", plot = scatter_plot)

###### Add time series plot

avg_rainfall = df %>%
  group_by(Location) %>%
  summarise(avg_rainfall = mean(Rainfall, na.rm = TRUE)) %>%
  slice(1:20)

avg_rainfall_plot = ggplot(avg_rainfall, aes(x = avg_rainfall, y = Location)) +
  geom_col()

#Save the plot in graphics/
ggsave(filename = "graphics/average-rainfall-location.png", plot = avg_rainfall_plot)