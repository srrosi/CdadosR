library(gutenbergr)
library(tidyverse)
library(tidytext)


#Cria número pseudo aleatório
set.seed(230)

#Criando 10 amostra de números aleatórios
numeros <- sample(1:40737, 10)


english <- gutenberg_works(languages = 'en')
id <- english$gutenberg_id[numeros]

livros <- gutenberg_download(id, meta_fields = 'title')


#Frequencias e grams

freq <- livros %>%
  unnest_tokens(palavras, text) %>%
  count(palavras, sort = TRUE)

#Remve os Nas
freq <- na.omit(freq)


freq3 <- livros %>%
  unnest_tokens(palavras, text, token='ngrams', n=3) %>%
  count(palavras, sort = TRUE)


#Remve os Nas
freq3 <- na.omit(freq3)

freq4 <- livros %>%
  unnest_tokens(palavras, text, token = 'ngrams', n=4) %>%
  count(palavras, sort = TRUE)

#Remve os Nas
freq4 <- na.omit(freq4)


freqs = freq %>%
  filter(!palavras %in% stop_words$word)


freq4 %>% filter(n>10) %>% view

freq3 %>% filter(n>30) %>% view

freqs %>% filter(n>100) %>% View

freq_ <-  freq[1:50, ]
freqs_ <- freqs[1:50, ]
freq4 <- freq4[1:20, ]
freq3 <- freq3[1:30, ]

ggplot(freq_)+
  geom_col(aes(x=reorder(palavras, -n), y=n), fill = 'tomato3', colour='black')+
  labs(y = 'Frequencia', x='Palavras')+
  theme_bw()+theme(axis.text.x = element_text(angle = 90, hjust = 1))


ggplot(freqs_)+
  geom_col(aes(x=reorder(palavras, -n), y=n), fill = 'tomato3', colour = 'black')+
  labs(y='Frequencia', x = 'Palavras')+
  theme_bw()+theme(axis.text.x = element_text(angle = 90, hjust = 1))
