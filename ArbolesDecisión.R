help("sample")

# Inicializamos la semilla
set.seed(1234)
# Creamos un vector del tamaño del conjunto de datos con 1 y 2.
ind <- sample(2, nrow(iris), replace = TRUE, prob = c(0.7, 0.3))
ind

train = iris[ind == 1,]
test = iris[ind == 2, ]
nrow(train)
nrow(test)

#Librería rpart
library(rpart)
formula = Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
arbol = rpart(formula = formula, data = train)
print(arbol)

# Dibujamos el arbol
plot(arbol)
text(arbol, use.n = TRUE)

# Comprobamos los resultados
testPred = predict(arbol, newdata = test, type = "class")
testPred
table(testPred, test$Species)


#librería randomforest
library(randomForest)
rf <- randomForest(Species ~ ., data=train, ntree=50,
                             proximity=T)
rf

# Podemos dibujar los arboles con su error
plot(rf)

# Con la siguiente función comprobamos las variables mas importantes
importance(rf)
varImpPlot(rf)

pred = predict(rf, newdata = test)
pred
table(pred, test$Species)

#J48
library(RWeka)
model = J48(Species ~ Sepal.Length + Sepal.Width + Petal.Length, data = train)
model

library(partykit)
plot(model, labels = TRUE)
predJ48 = predict(model, newdata = test)
table(predJ48, test$Species)
