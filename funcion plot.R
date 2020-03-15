help("mtcars")
str(mtcars)
plot(mtcars$wt, mtcars$mpg)

#plot(x)
help("AirPassengers")
str(AirPassengers)
AirPassengers
plot(AirPassengers)

#Complejos
a = 2i + 5
b = 3i + 6
c = 6i + 3
d = 4i + 3
e = 3.5i + 2
v = c(a,b,c,d,e)
plot(v)

#plot de un factor
help("discoveries")
discoveries
f = factor(discoveries)
plot(f)

#Gráfico de cajas
str(mtcars)
factor = factor(mtcars$cyl)
plot(factor, mtcars$mpg)

#Plot de un dataframe (muchos grafos distintas combinaciones)
help(trees)
str(trees)
plot(trees)

#Pintar dataframe con combinaciones que nos interesan
plot(~mtcars$mpg + mtcars$cyl + mtcars$wt)
help(plot)



