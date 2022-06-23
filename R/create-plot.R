# Simple script analysing the Australian weather data

library("tidyverse")

# Read in the data

df = read_csv("data/weatherAUS.csv")

# Create a scatter plot of Humidity9am and Temp9am
# a location

city = "WaggaWagga"
title = paste("Scatterplot of temparature and humidity in",city,": 2007 to 2017")

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

# Create a violin plot of Maximum temperature
title2 = paste("Violinplot of Max Temperature in",city,": 2007 to 2017")

violin_plot = 
  df %>%
  filter(Location == city) %>%
  ggplot(aes(x=Location, y=MaxTemp)) +
  geom_violin(fill = "red", alpha=0.6, draw_quantiles=c(.25, .50, .75)) +
  geom_jitter(color="blue", size=0.4, alpha=0.3)+
  ggtitle(lab = title2) +
  theme_minimal() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  )

ggsave(filename = "graphics/max-temperature.png", plot = violin_plot)

  
