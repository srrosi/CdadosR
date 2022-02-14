#dplyr
library(tidyverse)

a<- data_frame("altura"= c(1.7,1.6,1.65), "peso"=c(60,65,70))
a
a1<- data_frame("altura"= c(1.6,1.65,1.55), "peso"=c(65,55,70))
a1

b<- data_frame("peso"=c(55,60,66), "genero"=c("masc","masc","fem"))
b
c<- data_frame("x"=1:2,"y"=letters[9:10], "z"=200:201)
c
#juntando

#juntando colunas

bind_cols(a,b)   # mesmo número de linhas

bind_cols(b,a)

bind_cols(a,c) # número diferente de linhas


#juntando linhas
bind_rows(a,b)  # uma coluna em comum

bind_rows(a,c)   #nenhuma coluna em comum

bind_rows(a,a1)   # todas as colunas em comum

############
#juntando por colunas iguais

?join

inner_join(a,b, by="peso")   # retorna números em comum

left_join(a,b, by="peso")   # todos os valores do data.frame da esquerda
right_join(a,b, by="peso")   # todos os valores do data.frame da direita
full_join(a,b, by="peso")   # todos os valores
anti_join(a,b, by="peso")   # todos os valores NÃO combinados do primeiro data frame

# filtrar valores 
?distinct

dist<- bind_rows(a,a1)   # combinando "a" e "a1"
dist

distinct(dist,peso) # mantém apenas a coluna selecionada
distinct(dist,peso, .keep_all= TRUE) # mantém todas as colunas
