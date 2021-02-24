# Simple script analysing the Australian weather data

library("tidyverse")

# Read in the data

df = read_csv("data/weatherAUS.csv")

# Create a scatter plot of Humidity9am and Temp9am
# a location

city = "Brisbane"

scatter_plot =
  df %>%
  filter(Location == "Brisbane") %>%
  ggplot(aes(x = Temp9am, y = Humidity9am)) +
<<<<<<< HEAD
  geom_point(color = "purple") +
=======
  geom_point(color = "green") +
>>>>>>> master
  labs(title = "Humidity and Temperatur for Brisbane") +
  theme_minimal() +
  facet_wrap(~WindDir9am)

# Save the plot in graphics/
ggsave(filename = "graphics/scatter-temp-humidity.png", plot = scatter_plot)



#Chapter 4 exercises

time_series =
  df %>%
  filter(Location == city) %>%
  ggplot(aes = "purple") +
  geom_line()
ggsave(filename = "graphics/timeseries-rainfall.png",
       plot = scatter_plot)


