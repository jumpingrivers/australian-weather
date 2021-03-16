# Simple script analysing the Australian weather data

library("tidyverse")

# Read in the data

df = read_csv("data/weatherAUS.csv")

# Create a scatter plot of Humidity9am and Temp9am
# a location

city = "Melbourne"

scatter_plot = 
df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Temp9am, y = Humidity9am)) + 
  geom_point(colour="darkred")+ 
  facet_wrap(~WindDir9am)+
  labs(title= city, x="Temperature", y="Humidity")+
  theme_minimal()

# Save the plot in graphics/
ggsave(filename = "graphics/scatter-temp-humidity.png", plot = scatter_plot)

#Creating a bar chart

bar_plot = df %>% 
  group_by(Location) %>% 
  summarise (average_rainfall=mean(Rainfall, na.rm=TRUE)) %>% 
  ggplot(aes(y=Location, x=average_rainfall))+
  geom_col()

# Save the plot in graphics/
ggsave(filename = "graphics/average_rainfall.png", plot = bar_plot)
