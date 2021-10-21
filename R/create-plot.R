# Simple script analysing the Australian weather data

library("tidyverse")

# Read in the data

df = read_csv("data/weatherAUS.csv")

# Create a scatter plot of Humidity9am and Temp9am
# a location

city = "GoldCoast"

scatter_plot = 
df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Temp9am, y = Humidity9am)) + 
  geom_point(colour = "red") +
  theme_minimal()

bar_plot = df %>%
  ggplot(aes(x = WindGustDir)) +
  geom_bar(fill = "blue")

bar_chart =
  df %>%
  group_by(Location) %>%
  summarise(average_rainfall = mean(Rainfall, na.rm = TRUE)) %>%
  ggplot(aes(y = Location, x = average_rainfall)) +
  geom_col()
  
# Save the plot in graphics/
ggsave(filename = "graphics/scatter-temp-humidity.png", plot = scatter_plot)
ggsave(filename = "graphics/wind_gust_dir_bar.png", plot = bar_plot)
ggsave(filename = "graphics/barchart-avg-rainfall.png", plot = bar_chart)


