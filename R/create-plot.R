# Simple script analysing the Australian weather data

library("tidyverse")

# Read in the data

df = read_csv("data/weatherAUS.csv")

# Create a scatter plot of Humidity9am and Temp9am
# a location

city = "Newcastle"

scatter_plot = 
df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Temp9am, y = Humidity9am)) + 
  geom_point(colour = "red") + 
  geom_smooth(method = "lm") +
  labs(title = "Scatter plot - Humidity vs temperature") + 
  theme_minimal()

scatter_plot_MinMax = 
  df %>%
  filter(Location == city) %>%
  ggplot(aes(x = MinTemp, y = MaxTemp)) + 
  geom_point(colour = "red") + 
  geom_smooth(method = "lm") +
  labs(title = "Scatter plot - Min vs Max")  + 
  theme_minimal()

# Save the plot in graphics/
ggsave(filename = "graphics/scatter-temp-humidity.png", plot = scatter_plot)

ggsave(filename = "graphics/scatter_plot_MinMax.png", plot = scatter_plot_MinMax)


# Add time series 
time_series =
  df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Date, y = Temp9am)) +
  geom_line()
ggsave(filename = "graphics/timeseries-rainfall.png",
       plot = time_series)
