#Carregando o tidyverse
library(tidyverse)


#Pacotes de bases de dados de exemplo do R
data()

#Base de dados de determinado pacote
data(package='dplyr')


dados <- iris


#Criando uma tibble
dados.1 <- as.tibble(dados)
dados.1


dados.2 <- dados
dados.2

#Mostra as primeiras linhas da base
head(dados.1)


##Pacote readr
#salvar em csv
write_csv(dados.1, "Secao1/iris.csv")


#Carrega a base de dados do tipo .csv
dados.3 <- read.csv("Secao1/iris.csv")
