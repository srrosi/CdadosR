library(tidyverse)
library(tidyr) # não necessário se o tidyverse já foi carregado
iris_1<- as.tibble(iris)


# %>% "pipe" ou "tubo"
#passa o objeto que vem antes do pipe como primeiro argumento da função que vem depois

setosa<- iris_1 %>% filter(Species == "setosa")

#mesma coisa que:
setosa<- filter(iris_1, Species == "setosa")

#mais fácil de ler
#mais simples para manipular dados

setosa<- iris_1 %>% 
  filter(Species == "setosa") %>% 
  select(3:4) %>% 
  mutate(linha = row_number())


View(setosa)

setosa<-filter(iris_1,Species == "setosa")  
setosa<-select(setosa,3:4) 
setosa<- mutate(setosa,linha = row_number())



############################
#gather

#junta valores de diferentes colunas e reorganiza
#gather( dataframe, variavel, valor, colunas)

# não salvei o objeto
gather(setosa, variavel,numero, - linha) %>% View 


iris_1 %>% select(3:5) %>% gather(variavel,numero,- Species) %>% View # não salvei o objeto

#spread
#separa uma variável em colunas
setosa1<- gather(setosa, variavel,numero, -linha)  # salvando o objeto

spread(setosa1, variavel,numero) %>% View

#gather e spread são funções opostas

#separate

#separa conteúdo das linhas 
setosa1 %>% 
  separate(variavel,c("petala","medida")) %>% 
  View # utiliza pontuação

setosa1 %>% 
  separate(variavel,c("petala","medida"),sep="Len") %>% 
  View # separação manual



#unite
#oposto de separate, une conteudos
#une as colunas "linha" e "Petal.Width"
iris_1 %>% 
  unite("Rosivaldo",4,5,sep= "_***_") %>% 
  View 
