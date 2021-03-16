# Simple script analysing the Australian weather data

library("tidyverse")

# Read in the data

df = read_csv("data/weatherAUS.csv")

# Create a scatter plot of Humidity9am and Temp9am
# a location

city = "Brisbane"

scatter_plot = 
df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Temp9am, y = Humidity9am)) + 
  geom_point(colour = "red") +
  labs(title = city,
       caption = "Copyright by the Australian Commonwealth Bureau of Meteorology") +
  theme_minimal() +
  facet_wrap(~WindDir9am)

# Save the plot in graphics/
ggsave(filename = "graphics/scatter-temp-humidity.png", plot = scatter_plot)

time_series =
  df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Date, y = Temp9am)) +
  geom_line()
ggsave(filename = "graphics/timeseries-rainfall.png",
       plot = scatter_plot)


bar_plot <- df %>%
  group_by(Location) %>%
  summarise(avg_rainfall = mean(Rainfall, na.rm = T)) %>%
  ggplot(aes(x = avg_rainfall, y = Location)) +
  geom_col()

ggsave(filename = "graphics/bar-rainfall-location.png", plot = bar_plot)