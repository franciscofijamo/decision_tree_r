data(Titanic, package = "datasets")

df <- as.data.frame(Titanic)


modelo_titanic_tree <- rpart(Survived~ Class + Sex + Age, 
                            data = df,
                            weights = Freq, # Coluna Frequencia sera usado como peso por se tratarem de mortes, para ajudar o algoritmo a prever
                            method = "class", 
                            parms = list(split = "information"), 
                            control = rpart.control(minsplit = 5))

# contruindo visualizacao
prp(modelo_titanic_tree, type = 0, extra = 1, under = TRUE, compress = TRUE)

#Faxzendo a poda

pruning_modelo_titanic_tree <- prune(modelo_titanic_tree,cp = 0.02) # grau de complexidade 0.02

prp(pruning_modelo_titanic_tree, type = 0, extra = 1, under = TRUE, compress = TRUE)
