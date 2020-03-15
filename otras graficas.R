help("precip")
str(precip)

precip[1:10]
#Puntos
dotchart(precip[1:10])

#Barras
mtcars$carb
carb = table(mtcars$carb)
carb
barplot(carb)

#pie
pr = precip[1:5]
pr
pie(pr)

#pairs
pressure
str(pressure)
head(pressure)

pairs(pressure)
pairs(mtcars)

#coplot
coplot(mtcars$mpg ~ mtcars$wt | factor(mtcars$cyl))

plot(mtcars)
pairs(mtcars)
#histogramas
discoveries
str(discoveries)
hist(discoveries)

plot_ly(mtcars, x = ~wt, y = ~mpg, z = ~qsec) %>% add_lines() %>% add_markers()