#Preprocesamiento

#Valores faltantes
datos=women
head(datos)
mean(datos$height)
datos$height[1] = NA
mean(datos$height, na.rm=TRUE)

d = complete.cases(datos)
head(d)
datosCompletos = datos[complete.cases(datos), ]
datosCompletos

#Special values o valores especiales
datos = trees
datos$Volume[5] = Inf
mean(datos$Volume)
max(datos$Volume)
is.finite(datos$Volume)
datosFinitos = datos[is.finite(datos$Volume),]
datosFinitos

#Outliers o valores extraños
datos = trees
datos$Volume
datos$Volume[1] = 300
datos$Volume[2] = 315

boxplot.stats(datos$Volume)
boxplot(datos$Volume)
