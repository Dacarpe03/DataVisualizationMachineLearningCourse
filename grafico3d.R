library(plotly)

#Gráfico de puntos
plot_ly(mtcars, x = ~wt, y = ~hp, z = ~qsec) %>% add_markers()

#Gráfico de lineas
# Cambiamos la lista de 0 y 1 de mtcars$am por Automatico y Manual. 
mtcars$am[which(mtcars$am == 0)] <- 'Automatico'
mtcars$am[which(mtcars$am == 1)] <- 'Manual'
mtcars$am <- as.factor(mtcars$am)

plot_ly(mtcars, x = ~wt, y = ~hp, z = ~qsec, color = ~am, colors = c("red","blue")) %>% add_lines()


#Gráfico de superficie
help("volcano")
plot_ly(z = volcano) %>% add_surface()

#Gráfico de barras
plot_ly(mtcars, x = ~wt, y = ~hp, z = ~qsec, color = ~am, colors = c("red","blue")) %>% add_bars()

#Mapa de calor
plot_ly(z=volcano)%>% add_heatmap()

#Histogramap
fact = factor(mtcars$cyl)
plot_ly(mtcars, x = fact) %>% add_histogram()


#Pie
pr = precip[1:5]
ds = data.frame(labes = names(pr),
               values = pr)

plot_ly(ds, labes = ~labes, values = ~values) %>% add_pie()

