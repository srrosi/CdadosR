#dplyr
library(tidyverse)

iris_1<- as.tibble(iris)

#select
#Seleciona/renomeia variáveis por nome e posição
?select
help(select)


colnames(iris_1)

#selecionando a primeira variável
select(iris_1, 1)
select(iris_1, Sepal.Length)

#Selecionando as duas primeiras variáveis
select(iris_1, 1:2)
select(iris_1, Sepal.Length,Sepal.Width)

#Selecionando as três primeiras variáveis
select(iris_1, 1:3)
select(iris_1, Sepal.Length,Sepal.Width,Petal.Length)
select(iris_1, Sepal.Length:Petal.Length)

#Excluindo colunas
select(iris_1, -1)
select(iris_1, -Sepal.Length)
select(iris_1, -(4:5))

#Outras utilidades

select(iris_1, starts_with("S")) # começa com
select(iris_1, ends_with("Width"))# termina com
select(iris_1, contains("tal"))# contém "
select(iris_1, matches("[:punct:]")) #contém expressão regular

#Renomeando

select(iris_1, comprimento_petala = Petal.Length)#mantém apenas as variáveis selecionadas


rename(iris_1, comprimento_petala = Petal.Length) # mantém todas as variáveis

