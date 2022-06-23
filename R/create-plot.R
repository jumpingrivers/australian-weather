# Simple script analysing the Australian weather data

library("tidyverse")

# Read in the data

df = read_csv("data/weatherAUS.csv")

# Create a scatter plot of Humidity9am and Temp9am
# a location

city = "WaggaWagga"
title = paste("Scatterplot of temparature and humidity in",city,"2007 to 2017")

scatter_plot = 
df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Temp9am, y = Humidity9am)) + 
  geom_point(color = "red", size = 1.2) +
  geom_smooth() +
  ggtitle(lab = title) +
  theme_minimal()

# Save the plot in graphics/
ggsave(filename = "graphics/scatter-temp-humidity.png", plot = scatter_plot)
