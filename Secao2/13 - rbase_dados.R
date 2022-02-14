#manipulando data frames com Rbase

dados<- iris

#Abre a base para leitura
View(dados)


summary(dados)

#acessando elementos do data frame
# dataframe[linha, coluna]

# acessa o elemento localizado na segunda linha e terceira coluna
dados[2,3]

# acessa a primeira linha (todas as colunas)
dados[1,] 


# acessa a terceira coluna
dados[,3]


#acessa a coluna "Sepal.Length"
dados$Sepal.Length 

#idem
dados[,"Sepal.Length"] 


# é possível utilizar funções nas colunas de um data frame
#média da coluna 'Sepal.Length'
mean(dados$Sepal.Length) 

###########################
#Filtrando iris

setosa<- dados[dados$Species=="setosa",]



View(setosa)


maior5<- dados[dados$Sepal.Length > 5,]

#exclui uma coluna (Sepal.Length)
dados<- dados[,-1] 

