
miTabla = read.csv("genesDataSet.txt", sep="\t", row.names="gen")
miTabla

help(dist)
misDistancias = dist(miTabla, method="euclidean")
misDistancias

#Con la función hclust podemos crear un árbol ne el que podemos
#hacernos una posible clustering
arbolJeraquico = hclust(misDistancias, method="complete")
plot(arbolJeraquico)

#También podemos pintar los puntos en un gráfico para observarlos previamente
miTabla
trans=t(miTabla)
trans
plot(trans[,1], col = "red", ylim = c(min(miTabla),max(miTabla)), pch = 2)
points(trans[,2], col = "green", pch = 3)
points(trans[,3], col = "blue", pch = 4)
points(trans[,4], col = "brown", pch = 5)


#KMEANS
help("kmeans")
kme2 = kmeans(miTabla,2)
kme2
kme3 = kmeans(miTabla,3)
kme3

#Pintamos los clustes obtenidos
library(cluster)
clusplot(miTabla, kme2$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)
clusplot(miTabla, kme3$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)

#Iris
iris
#Eliminamos la variable categórica
train = iris[, -5]
y = iris$Species
train

#Entrenamos el modelo
fit = kmeans(train, 3)
fit

clusplot(train, fit$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)
table(y, fit$cluster)

#Es dificil, a la hora de aplicar clustering, saber el número de clusters que estamos buscando. Para ello, existen algunos metodos que intentan ayudarnos, pero no hay nada fijo. Nosotros, podemos usar la variable withinss resultante de aplicar el modelo.
maxClust=10
Error = NULL
for(i in 1:maxClust) {
  Error[i] = sum(kmeans(train, i)$withinss)
}
Error
plot(1:maxClust, Error, type="b", 
     xlab="Cantidad de Cluster", 
     ylab="Suma de error")

#AGRUPACIÓN JERÁRQUICA
#######
####### Agrupación jerárquica.
#######

# De nuevo, podemos volver a pintar el arbol
distIris = dist(train, method = "euclidean")
distIris
arbolIris = hclust(distIris, method = "complete")
plot(arbolIris, labels = FALSE)

# También podemos usar la función cutree para conseguir la clusterización.

grupos = cutree(arbolIris, k = 3)
grupos
plot(arbolIris, labels = FALSE)
# La pintamos
rect.hclust(arbolIris, k = 3)


table(grupos, iris[,5])
