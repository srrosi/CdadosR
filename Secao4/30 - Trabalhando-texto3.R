library(tidyverse)
library(tidytext)
library(tm)

#trabalhando com n-gram

#carregando dados
# carrega .txt e transforma em vetor
casmurro<-  scan("Secao4/casmurro.txt", what="character", sep="\n",encoding="UTF-8") 

# texto em si
casmurro<- casmurro[27:6393]


# cria um data frame de texto e linha
casmurro<- data_frame("linha"= 1:length(casmurro),"texto"=casmurro ) 


na.omit(casmurro$linha)
na.omit(casmurro$texto)

###############
###2
# dividir por ngram 2

casmurro_2<- unnest_tokens(casmurro, palavra,texto,token = "ngrams",n=2) 

#Reme os NAs do texto
casmurro_2 <- na.omit(casmurro_2)

View(casmurro_2)




#frequência de palavras
freq2<-casmurro_2 %>%  count(palavra, sort = TRUE) 
View (freq2)


###3
# dividir por ngram 3
casmurro_3<- unnest_tokens(casmurro,palavra,texto,token = "ngrams",n=3) 


#frequência de palavras

casmurro_3 <- na.omit(casmurro_3)
freq3<-casmurro_3 %>%  count(palavra, sort = TRUE) 
View (freq3)


# dividir por ngram 4
casmurro_4<- unnest_tokens(casmurro,palavra,texto,token = "ngrams",n=4) 

#Remove os Nas do texto
casmurro_4 <- na.omit(casmurro_4)

#frequência de palavras
freq4<-casmurro_4 %>%  count(palavra, sort = TRUE) 
View (freq4)
