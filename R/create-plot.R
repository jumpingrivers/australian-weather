# Simple script analysing the Australian weather data

library("tidyverse")

# Read in the data

df = read_csv("data/weatherAUS.csv")

# Create a scatter plot of Humidity9am and Temp9am
# a location

city = "Albury"

scatter_plot = df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Temp9am, y = Humidity9am)) + 
  geom_point(color = "red")+
  theme_minimal()

bar_plot = df %>% 
  ggplot(aes(x = WindGustDir))+
  geom_bar(fill = "blue")

bar_plot

time_series =
  df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Date, y = Temp9am)) +
  geom_line()+
  theme_classic()



ggsave(filename = "graphics/timeseries-rainfall.png",
       plot = time_series)+

# Save the plot in graphics/
ggsave(filename = "graphics/scatter-temp-humidity.png", plot = scatter_plot)
ggsave(filename = "graphics/wind_gust_ddir_bar.png", plot = bar_plot)
