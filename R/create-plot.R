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
  geom_point(color="green")+
  labs(caption = "Hello Sydney") +
  theme_minimal()

bar_chart = 
  df %>% 
  group_by(Location) %>% 
  summarise(average_rainfall = mean(Rainfall, na.rm = TRUE)) %>% 
  ggplot(aes(y=Location, x=average_rainfall)) +
  geom_col()
ggsave(filename = "graphics/barchart-avg-rainfall.png",plot=bar_chart)

time_series =
  df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Date, y = Temp9am)) +
  geom_line()
ggsave(filename = "graphics/timeseries-rainfall.png",
       plot = time_series)

# Save the plot in graphics/
ggsave(filename = "graphics/scatter-temp-humidity.png", plot = scatter_plot)
