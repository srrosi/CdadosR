#texto
library(tidyverse)
#strings (linhas)

art5 <- "Todos são iguais perante a lei, sem distinção de qualquer natureza, garantindo-se aos brasileiros e aos estrangeiros residentes no País a inviolabilidade do direito à vida, à liberdade, à igualdade, à segurança e à propriedade"

art5

# divide, cria "list", dive a string pelo espaço em uma lista
a5<- strsplit(art5," ") 


# muda do formato 'list' para 'vector'
a5<- a5 %>% unlist 
a5

#Pega o elemento de ordem 4
a5[4]


#dividindo por letra
a5_<- art5 %>% strsplit("") %>% unlist 
a5_

#Pega a 3ª letra
a5_[3]

#fazendo o oposto


# separados por espaço junta o documento pelo espaço
paste(a5,collapse=" ") 

# nenhuma separação
paste(a5,collapse="") 

# separados pela letra AAA
paste(a5,collapse="AAA") 


#misturando

#Alfabeto minusculo
letters 

# maiusculo
LETTERS


#Junta as letras minusculas às maísuclas com a / separando. Aqui junta letra a letra
paste(letters,LETTERS, sep="/")

#Aqui junta as letras minusculas primeiro, e depois as maisculas
paste(c(letters,LETTERS))



#funçoes para localizar termos
#função ()

#Localiza todas as palavras que contém o 'a' no vetor ou lista
grep("a",a5)

#Traz as palavras em vez da posição
grep("a", a5, value=TRUE)

#Traz as palavras quem contenha o elemento dado como parâmetro. No exemplo abaixo, o 'dade'
grep("dade", a5, value=TRUE)


#Mostra TRUE ou FALSE caso o item pesquisado seja encontrado
grepl("a",a5)

#Busca a posição da palavra informada no parâmetro
grep("iguais",a5)

#Mostra a palavra busca
grep("iguais",a5,value = TRUE)

#substituindo termos
#função (padrão original, substituição, vetor)


# substitui o primeiro 'a' encontrado em cada palavra
sub("a","A",a5) 

# substitui todos os 'a'
gsub("a","A",a5) 


#é possível utilizar em colunas de dataframes
iris1<- iris
iris1$Species

#Substitui o nome setosa por tipo1
iris1$Species<- gsub("setosa", "tipo1", iris1$Species)

#Substitui o nome versicolor por tipo2
iris1$Species<- gsub("versicolor","tipo2",iris1$Species)

#Substitui o nome virginica por tipo3
iris1$Species<- gsub("virginica","tipo3",iris1$Species)

View(iris1)

iris1$Species<- gsub("tipo","especie_",iris1$Species)
View(iris1)
