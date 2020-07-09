# Criando decision tree com rpart.
#install.packages('rpart')
#install.packages('rpart.plot')
library(rpart)

library(rpart.plot)
?rpart

clima <- expand.grid(Tempo = c("Assolarado", "Nublado", "Chuvoso"),
                     Tempertatura = c("Quente", "Ameno", "Frio"),
                     Humidade = c("Alta", "Normal"),
                     Vento = c("Franco", "Forte"))


# criar variavel target
response <- c(1,19,4,31,16,2,11,23,35,6,24,15,18,36)

# criar um vector de facroe
play <- as.factor( c("Não Jogar", "Não Jogar", "Não Jogar", "Jogar", "Jogar", "Jogar", "Jogar", "Jogar", "Jogar", "Jogar", "Não Jogar", "Jogar", "Jogar", "Não Jogar")) 

# unir as colunas com um dataframe com todas vars
tennis <- data.frame(clima[response,], play)

# contruindo o modelo 
#
#modelo_tennis_tree <- rpart(play~.,data = tennis,
#                method = class, # class, porque queremos trabalahar com factor
#               parms = list(split = "information"), # information is entropy ou gini
#                control = rpart.control(minsplit = 1)) # numero minimo de observacao pra ele fazer o split, basta ter uma 'e suficiente neste caso

modelo_tennis_tree <- rpart(play ~ ., 
                     data = tennis, 
                     method = "class", 
                     parms = list(split = "information"), 
                     control = rpart.control(minsplit = 1))

# visualizar ganho de iformacao

modelo_tennis_tree

# contruindo visualizacao
prp(modelo_tennis_tree, type = 0, extra = 1, under = TRUE, compress = TRUE)
