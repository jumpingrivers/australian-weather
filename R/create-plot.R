# Simple script analysing the Australian weather data

library("tidyverse")

# Read in the data

df = read_csv("data/weatherAUS.csv")

# Colours

My_rgb2hex <- function(r,g,b) sprintf('#%s',paste(as.hexmode(c(r,g,b)),collapse = ''))

SU_colours <- c (
  `orange` = My_rgb2hex(248,191,7),# "#f9bf07",
  `charcoal` = My_rgb2hex(44,40,37),# "#2c2825",
  `slate` = My_rgb2hex(104,111,115), # "#686f73",
  `blue` = My_rgb2hex(88,29,193), # "#5881c1",
  `red` = My_rgb2hex(236,101,85), # "#ec6555",
  #additional accent colours from word doc template
  `yellow` = My_rgb2hex(252,229,155),
  `grey` = My_rgb2hex(163,168,172),
  `white` = My_rgb2hex(255,255,255),
  #light and dark ends from colour theme in word doc
  `light orange` = My_rgb2hex(253,242,205),
  `dark orange` = My_rgb2hex(124,95,3),
  `light charcoal` = My_rgb2hex(235,233,231),
  `dark charcoal` = 	"#000000",#black
  `light slate` = My_rgb2hex(224,226,227),
  `dark slate` = My_rgb2hex(51,55,57),
  `light blue` = My_rgb2hex(221,229,242),
  `dark blue` = My_rgb2hex(38,61,102),
  `light red` = My_rgb2hex(251,224,220),
  `dark red` = My_rgb2hex(144,29,16),
  `light yellow` = My_rgb2hex(254,249,235),
  `dark yellow` = My_rgb2hex(197,152,5),
  `light grey`=My_rgb2hex(236,237,238),
  `dark grey` = My_rgb2hex(79,84,88),
  `light white`=My_rgb2hex(242,242,242),
  `dark white` =My_rgb2hex(127,127,127))


SU_cols <- function(...) {
  cols <- c(...)
  
  if (is.null(cols))
    return (SU_colours)
  
  SU_colours[cols]
}

# Create a scatter plot of Humidity9am and Temp9am
# a location

city = "Brisbane"

scatter_plot = 
df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Temp9am, y = Humidity9am)) +
  geom_point(colour = SU_cols('orange'))+ 
  theme_light()+
  labs(title = paste0("Scatter plot of Humidity9am and Temp9am in ",city),
                                   subtitle = "Plot for training")+ 
  facet_wrap(~WindDir9am)

# Save the plot in graphics/
ggsave(filename = "graphics/scatter-temp-humidity.png", plot = scatter_plot)

time_series =
  df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Date, y = Temp9am)) +
  geom_line()
ggsave(filename = "graphics/timeseries-rainfall.png",
       plot = time_series)

