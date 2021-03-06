library(caTools)
dados1 <- credit
divisao = sample.split(dados1$class, SplitRatio = 0.7)
base_treinamento = subset(dados1,divisao==TRUE)
base_teste = subset(dados1,divisao==FALSE)
ncol(dados1)
library(e1071)
classificador = naiveBayes(x = base_treinamento[,-21], y = base_treinamento$class)
#print(classificador)
previsao = predict(classificador,newdata = base_teste[,-21])
#ncol(dadosTeste)
matriz = table(base_teste$class,previsao)
library(caret)
confusionMatrix(matriz)
