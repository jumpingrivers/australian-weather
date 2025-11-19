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
  geom_point()

# Save the plot in graphics/
ggsave(filename = "graphics/scatter-temp-humidity.png", plot = scatter_plot)



#Now Applying changes on the main branch parallely. Things are in parallel r8 now

# Applying some changes on test-1, not disturbing the main branch

# Applying 2nd changes on test -1, before pushing the changes into main branch

time_series =
  df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Date, y = Temp9am)) +
  geom_line()
ggsave(filename = "graphics/timeseries-rainfall.png",
       plot = time_series)