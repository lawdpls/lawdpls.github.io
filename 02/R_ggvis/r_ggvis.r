library(ggvis)
data = read.csv("/Users/ozymandias/Desktop/cars-sample.csv")
data <- na.omit(data)
data %>% ggvis(~Weight, ~MPG, fill = ~Manufacturer, size = ~Weight, opacity := 0.5) %>% 
  layer_points() %>%
  add_relative_scales() %>%
  add_legend("fill", title = "Manufacturer",
             properties = legend_props(
               legend = list(
                 x = scaled_value("x_rel", 0.8),
                 y = scaled_value("y_rel", 1)
               )
             )
  )