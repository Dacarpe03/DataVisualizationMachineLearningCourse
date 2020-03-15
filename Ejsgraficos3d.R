#EJ1

trees
trees$tamanyo <- ifelse(trees$Height > 75, 'Alto', 'Bajo')
trees
plot_ly(x = trees$Girth, y = trees$Height, z = trees$Volume, 
        color = trees$tamanyo, colors = c("blue","red")) %>% add_markers()

# Añadimos add_lines() para unir las lineas.
plot_ly(x = trees$Girth, y = trees$Height, z = trees$Volume, 
        color = trees$tamanyo, colors = c("blue","red")) %>% add_markers()


#EJ2
disc = factor(discoveries)
disc
str(discoveries)
plot_ly(data.frame(discoveries), x = disc) %>% add_histogram()

#EJ3
help(euro)
euro
plot_ly(x = names(euro), y = euro) %>% add_bars()
