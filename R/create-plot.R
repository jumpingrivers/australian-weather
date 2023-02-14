# Simple script analysing the Australian weather data

library("tidyverse")

# Read in the data

df = read_csv("data/weatherAUS.csv")

# Create a scatter plot of Humidity9am and Temp9am
# a location

city = "Perth"

scatter_plot = 
df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Temp9am, y = Humidity9am)) + 
  geom_point(color = "purple") +
  ggtitle(city) +
  theme_minimal() +
  facet_wrap(~WindDir9am)

# Save the plot in graphics/
ggsave(filename = "graphics/scatter-temp-humidity.png", plot = scatter_plot)

#### Add time sereies plot

avg_rainfall <- df %>%
  group_by(Location) %>%
  summarise(avg_rainfall = mean(Rainfall, na.rm = TRUE)) %>%
  slice(1:20)

avg_rainfall_plot <- ggplot(avg_rainfall, aes(x = avg_rainfall, y = Location)) + 
  geom_col()

# Save the plot in graphics/
ggsave(filename = "graphics/avg-rainfall-location.png", plot = avg_rainfall_plot)


time_series =
  df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Date, y = Temp9am)) +
  geom_line()
ggsave(filename = "graphics/timeseries-rainfall.png",
       plot = time_series)
