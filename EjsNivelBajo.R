#EJ1
help(mtcars)
head(mtcars)
mtcars$cyl
unique(mtcars$cyl)

tcyl = table(mtcars$cyl)
tcyl
barplot(tcyl, col = c("blue", "red", "green"))
title("Gráficos de barras", "Representa el total de coches con x cilindros")

#EJ2
mdeaths
ldeaths
fdeaths
maximo = max(mdeaths, ldeaths, fdeaths)
minimo = min(mdeaths, ldeaths, fdeaths)

plot(mdeaths, col = "red", ylim = c(minimo - 100,maximo + 1000), xlab = "Año", ylab = "Nº muertes")
lines(ldeaths, col = "blue", lty = 2)
lines(fdeaths, col = "green", lty = 2, lwd = 3)
legend(1978, 5000, legend = c("mdeaths","ldeaths","fdeaths"), 
       col = c("red","blue","green"), lty = c(1,2,2), lwd = c(1,1,3))


#ej3
pr = precip[1:5]
prmenor = pr[pr < 20]
prmayor = pr[pr >= 20]

plot(prmayor, type = "n", ylim = c(min(prmenor), max(prmayor)), xlim = c(1,sum(length(prmayor), length(prmenor))))
text(c(1:length(prmenor)), prmenor, names(prmenor), font = 3, col = "red")
text(c(length(prmenor)+1:length(prmayor)), prmayor, names(prmayor), font = 2, col = "blue")