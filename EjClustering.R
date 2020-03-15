
#EJ1

str(airquality)

# Comprobamos valores especiales
which(is.infinite(airquality$Ozone) == TRUE)
which(is.infinite(airquality$Solar.R) == TRUE)
which(is.infinite(airquality$Wind) == TRUE)
which(is.infinite(airquality$Temp) == TRUE)
which(is.infinite(airquality$Month) == TRUE)
which(is.infinite(airquality$Day) == TRUE)

# Comprobamos valores faltantes
complete.cases(airquality)
# Nos quedamos solo con los casos completos
datos = airquality[complete.cases(airquality), ]
datos

mediaTemp = mean(datos$Temp)
mediaTemp

#EJ 2
library(rpart)
help(car90)

# Country --> Pais
# Disp --> Desplazamiento del motor en pulgadas cubicas
# Disp2 --> Cilindrada
# Eng.Rev --> Revoluciones del motor
# Front.Hd --> Distancia entre techo y pasajero
# Frt.Leg.Room --> Espacio para las piernas
# Frt.Shld --> Espacio para hombros
# ...
# ...
# Height --> Altura
# Length --> Tamaño
# ...
# ...

head(car90)

# Vemos cuantos casos completos tenemos
length(which(complete.cases(car90) == TRUE))
length(car90[,1])

# Son demasiado pocos, nuetro conjunto quedaria demasiado reducido. Vamos por variables concretas
length(which(complete.cases(car90$Eng.Rev) == TRUE))
length(car90[,1])

filtrado = car90[complete.cases(car90$Eng.Rev), ]
filtrado

# Podemos eliminar variables que no creamos convenientes
filtrado = filtrado[, -15]
filtrado

# Buscamos valores especiales
# El espacio no puede ser negativo.
filtrado$Luggage >= 0
filtrado = filtrado[filtrado$Luggage > 0, ]

# Podemos buscar si existe algun outlier.
boxplot(filtrado)

boxplot(filtrado$Price)

boxplot.stats(filtrado$Price)
filtrado$Price

mean(filtrado$Price)

# Podemos eliminar el caso que posee el outlier
filtrado = filtrado[filtrado$Price < 41990, ]
mean(filtrado$Price)


#EJ3
library(datasets)
str(attitude)
help("attitude")

# Vamos a comparar las oportunidades de aprender con los aumentos por rendimiento.
plot(attitude$raises ~ attitude$learning)

datos = attitude[, c(4,5)]
datos
# Los datos están 'limpios', por lo que aplicamos el algoritmo de Kmeans para 2 clusters
model = kmeans(datos, 2)
model

# Pintamos los clusters obtenidos
library(cluster) 
clusplot(datos, model$cluster, color = TRUE, shade = TRUE, labels = 2, lines = 0)


# Para 3 cluster
model3 = kmeans(datos, 3)
clusplot(datos, model3$cluster, color = TRUE, shade = TRUE, labels = 2, lines = 0)

# Para 4 cluster
model4 = kmeans(datos, 4)
clusplot(datos, model4$cluster, color = TRUE, shade = TRUE, labels = 2, lines = 0)


Error = NULL
for(i in 2:4) {
  print(i)
  Error[i] = sum(kmeans(datos, i)$withinss)
}
na.omit(Error)
plot(2:4, na.omit(Error), type="b", 
     xlab="Cantidad de Cluster", 
     ylab="Suma de error")


#EJ4
datos = attitude[, c(4,5)]
datos

distancia = dist(datos, method = "euclidean")
model = hclust(distancia, method = "complete")
model

# Dibujamos el dendograma
plot(model, labels = FALSE)

# Buscamos la clusterizacion con 2
grupos = cutree(model, k = 2)
grupos

plot(model, labels = FALSE)
rect.hclust(model, k = 2)

# k = 3
# Buscamos la clusterizacion con 3
grupos3 = cutree(model, k = 3)
grupos3

plot(model, labels = FALSE)
rect.hclust(model, k = 3)

# Realizamos la clusterización usando todas las variables.
distanciaTodos = dist(attitude, method = "euclidean")
modelTodos = hclust(distanciaTodos, method = "complete")
plot(modelTodos, labels = FALSE)

# k = 2
plot(modelTodos, labels = FALSE)
rect.hclust(model, k = 2)

# k = 3
plot(modelTodos, labels = FALSE)
rect.hclust(model, k = 3)