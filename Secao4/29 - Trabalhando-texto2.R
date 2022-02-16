library(tidyverse)
library(tidytext)
library(tm) #pacote para text mining


#carregando texto
# carrega .txt e transforma em vetor
casmurro <-  scan("Secao4/casmurro.txt", what="character", sep="\n",encoding="UTF-8")



#início do texto em si
casmurro[1:30] 

# Busca o tempo informado como parâmetro, neste exemplo, 'FIM'.
grep("FIM",casmurro) 


# texto em si
casmurro<- casmurro[27:6393]

#stopwords
stopwords("pt") 

#Remevo palavras como conjunções e ou preposições
casmurro<- removeWords(casmurro,stopwords("pt"))

#Busca pela palavra 'Bentinho'. Esta busca encontra as linhas em que foi citado. 
grep("Bentinho",casmurro)


#quantas vezes é citado
length(grep("Bentinho",casmurro)) 

#ocorrências da palavra
length(grep("Capitú",casmurro))


#tidytext
# cria um data frame de texto e linha
casmurro <- data_frame("linha" = 1:length(casmurro),"texto" = casmurro ) 
View(casmurro)

# dividir por palavra
casmurro_<- unnest_tokens(casmurro, palavra, texto) 
View(casmurro_)


#frequência de palavras
freq <- casmurro_ %>%  count(palavra, sort = TRUE) 
View (freq)


#palavras com frequência superior a 100
freq100 <- filter(freq, n>100) %>% 
  arrange(desc(n)) 
View(freq100)


#gráficos de frequência
# gráfico simples
ggplot(freq100)+
  geom_col(aes(y=n, x=palavra))


# gráfico mais complexo
ggplot(freq100)+
  geom_col(aes(x=reorder(palavra,-n), y=n), fill="steelblue")+
  labs(y="Frequência",x="Palavra")+
  theme_bw()+theme(axis.text.x = element_text(angle = 90, hjust = 1))


#núvem de palavras
library(wordcloud)

wordcloud(freq$palavra,freq$n,min.freq=50)
