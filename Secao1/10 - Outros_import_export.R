library(tidyverse)
library(haven)
library(readr)

dados <- as_tibble(iris)


#lifecycle::last_warnings()

View(dados) #dataframe utilizado


#EXCEL
iris_excel<- read_excel("iris.xlsx")

#como é possível exportar em .csv não há grande necessidade de se utilizar outra
#forma de se exportar para excel

# SPSS

write_sav(iris,"iris.sav")

dados_SPSS<- read_sav("iris.sav")

#Alter o nome das colunas da base de dados.
colnames(dados) <- c("SLength", "SWidth","PLength", "PWidth", "Species")

#Abre a ajuda de como usar o colnames
help("colnames")


#stata

write_dta(dados,"Secao1/iris.dta") #erro, variáveis não podem conter pontos


View(Orange) #data frame alternativo

write_dta(Orange,"orange.dta")

orange_stata<- read_stata("orange.dta")

