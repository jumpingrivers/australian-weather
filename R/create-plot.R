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
  ggtitle('Sydney weather') +
  geom_point(colour = "red") + 
  labs(caption = "Copyright by the Australian Commonwealth Bureau of Meteorology") + 
  labs(xlab = "Temperature", ylab = "Humidity") +
  theme_minimal()

# Save the plot in graphics/
ggsave(filename = "graphics/scatter-temp-humidity.png", plot = scatter_plot)

