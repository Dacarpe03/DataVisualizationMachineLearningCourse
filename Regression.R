Orange
plot(Orange$circumference ~ Orange$age)

set.seed(1234)
# Creamos un vector del tamaño del conjunto de datos con 1 y 0.
ind <- sample(2, nrow(Orange), replace = TRUE, prob = c(0.7, 0.3))
ind

train = Orange[ind == 1,]
test = Orange[ind == 2, ]
nrow(train)
nrow(test)

linearMod = lm(circumference ~ age, data = train)
print(linearMod)
summary(linearMod)

distPred <- predict(linearMod, test)
distPred
test

#OTRA FORMA 
library(rJava)
library(RWeka)
library(partykit)

help(M5P)
m5model = M5P(circumference ~ age, data = train)
print(m5model)
plot(m5model)
predM5 = predict(m5model, newdata = test)
predM5
test


# Probamos con el conjunto de datos airquality

set.seed(4321)
datos = na.omit(airquality)

indAir <- sample(2, nrow(datos), replace = TRUE, prob = c(0.8, 0.2))

trainAir = datos[indAir == 1,]
testAir = datos[indAir == 2, ]

nrow(trainAir)
nrow(testAir)

m5modelAir = M5P(Temp ~ Solar.R + Wind + Ozone , data = trainAir)
print(m5modelAir)
plot(m5modelAir)

predM5Air = predict(m5modelAir, newdata = testAir)
predM5Air
testAir$Temp

