library(tidyverse)
#dplyr

dados <- iris

#Abre a ajuda sobre o camando ou função
?select
help("select")

#Mostra o nome das colunas da base de dados
colnames(dados)

#Seleciona a coluna informada como parâmetro
select(dados, 1)

#Seleciona a coluna informada como parâmetro
select(dados, "Sepal.Width")

#Seleciona as colunas informadas como parâmetro
select(dados, 1:2)

select(dados, "Species" , "Petal.Width")

select(dados, c(1,3,5))

select(dados, -(4:5))

#Seleciona a coluna que inicia com o valor do parâmetro
select(dados, start('Spe'))

#Seleciona as colunas que terminam que o que for informado como parâmetro
select(dados, ends_with('dth'))

select(dados, contains('peci'))


#filter
#filtra linhas de acordo com condições estabelecidas
#Petal width igual ou maior que 1
filter(dados,Petal.Width >= 1) 



# menor que 2 E Species "virginica"
filter(dados,Petal.Width < 2 & Species == "virginica") 


#arrange
#organiza linhas por variáveis
arrange(dados,Petal.Width) # crescente

arrange(dados,desc(Petal.Width)) # decrescente

#mutate
#cria novas variáveis
mutate(dados, sepal2 = Sepal.Length * Sepal.Width)
mutate(dados, sepal2 = Sepal.Length +10)

#combinando com argumento if_else
combinando<- mutate(dados, comprimento = if_else(Petal.Length>=4,"comprido","curto"))
View(combinando)

#group_by 
#'marca' variáveis por grupo

dados<- group_by(dados, Species)

#summarise 
# aplica funções nos grupos
summarise(dados, media= mean(Petal.Width),desvio_padrao=sd(Petal.Width),soma= sum(Petal.Width))



