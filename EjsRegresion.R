#EJ1
car90

library(rpart)

# Front.Hd
# Frt.Leg.Room
# Frt.Shld
# Rear.Hd
# RearShld

# Type
variables = list("Front.Hd", "Frt.Leg.Room", "Frt.Shld", "Rear.Hd", "RearShld", "Type")
datos = car90[, which((names(car90) %in% variables)==TRUE)]
datos
nrow(datos)
datos = datos[complete.cases(datos) == TRUE, ]
nrow(datos)

# Elegimos el conjunto de entrenamiento
ind <- sample(2, nrow(datos), replace = TRUE, prob = c(0.8, 0.2))
ind

train = datos[ind == 1,]
test = datos[ind == 2, ]
nrow(train)
nrow(test)

## Creamos el arbol de decision.
formula = Type ~ Front.Hd + Frt.Leg.Room + Frt.Shld + Rear.Hd + RearShld
arbol = rpart(formula = formula, data = train)

plot(arbol)
text(arbol, use.n = TRUE)


testPred = predict(arbol, newdata = test, type = "class")
testPred
tabla = table(testPred, test$Type)
tabla

# Comprobamos %
diag(tabla) # Casos acertados
nrow(test) # Numero de casos
sum(diag(tabla)) / nrow(test)


#EJ2
library(randomForest)
help("stagec")

datos = stagec

nrow(datos)
nrow(na.omit(datos))

datos = na.omit(datos)

nivel = factor(datos$grade)
nivel

datos$nivel = nivel

# Elegimos el conjunto de entrenamiento
ind <- sample(2, nrow(datos), replace = TRUE, prob = c(0.8, 0.2))
ind

train = datos[ind == 1,]
test = datos[ind == 2, ]
nrow(train)
nrow(test)

# Creamos el modelo
#formula = nivel ~ g2 + ploidy + eet
formula = nivel ~ g2 + ploidy + eet + gleason
model = randomForest(formula, data = train, ntree = 100, proximity=T)

plot(model)

# Con la siguiente funci?n comprobamos las variables mas importantes
importance(model)
varImpPlot(model)


# Comprobamos con conjunto de test
pred = predict(model, newdata = test)
pred
tabla = table(pred, test$nivel)
tabla
aciertos = sum(diag(tabla)) / nrow(test)
aciertos

#EJ3
library(RWeka)
datos = na.omit(stagec)

nivel = factor(datos$grade)
datos$nivel = nivel

# Elegimos el conjunto de entrenamiento
ind <- sample(2, nrow(datos), replace = TRUE, prob = c(0.8, 0.2))
ind

train = datos[ind == 1,]
test = datos[ind == 2, ]

modelWeka = J48(formula = nivel ~ g2 + ploidy + eet, data = train)
modelWeka


library(partykit)
plot(modelWeka, labels = TRUE)

predJ48 = predict(modelWeka, newdata = test)

tabla = table(predJ48, test$nivel)
tabla
aciertos = sum(diag(tabla)) / nrow(test)
aciertos


#EJ4
str(women)

plot(women$height ~ women$weight)

set.seed(1234)
# Creamos un vector del tamaño del conjunto de datos con 1 y 0.
ind <- sample(2, nrow(women), replace = TRUE, prob = c(0.7, 0.3))
ind

train = women[ind == 1,]
test = women[ind == 2, ]
nrow(train)
nrow(test)

linearMod = lm(height ~ weight, data = train)
print(linearMod)

plot(linearMod)
summary(linearMod)

distPred <- predict(linearMod, test)
distPred
test


#EJ5
library(RWeka)
help(ChickWeight)
head(ChickWeight)

ind <- sample(2, nrow(ChickWeight), replace = TRUE, prob = c(0.7, 0.3))

trainChick = ChickWeight[ind == 1,]
testChick = ChickWeight[ind == 2, ]

nrow(trainChick)
nrow(testChick)

# Aplicamos algoritmo
m5model = M5P(Time ~ weight + Chick + Diet , data = trainChick)
print(m5model)
plot(m5model)

predM5 = predict(m5model, newdata = testChick)
predM5
testChick$Time

# Calculamos error
error = abs(predM5 - testChick$Time)
error
sqrt(sum(error^2))

