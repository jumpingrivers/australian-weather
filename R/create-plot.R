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
  geom_point(color = "red")+
  labs(caption = "Copyright by the Australian Commonwealth Bureau of Meteorology")+
  labs(xlab = "Temperature", ylab = "Humidity")

# Save the plot in graphics/
ggsave(filename = "graphics/scatter-Brisbane.png", plot = scatter_plot)
