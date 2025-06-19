# Simple script analysing the Australian weather data

library("tidyverse")

# Read in the data
# Conor Rosato

df = read_csv("data/weatherAUS.csv")

# Create a scatter plot of Humidity9am and Temp9am a location
# Test now
#adding comment

city = "Brisbane"

scatter_plot = 
df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Temp9am, y = Humidity9am)) + 
  geom_point()

# Save the plot in graphics/
ggsave(filename = "graphics/scatter-temp-humidity.png", plot = scatter_plot)
