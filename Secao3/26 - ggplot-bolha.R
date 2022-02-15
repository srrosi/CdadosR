#bubble chart
#gráfico de bolha

# duas variáveis numéricas(categórica ok) para os eixos X e Y
#uma variável numérica para o tamanho das bolhas
#(opcional) uma variável categórica para a cor das bolhas
#(opcional) uma variável categórica para o formato das bolhas
library(tidyverse)

?diamonds
diamonds

#deixa o tema "bw" como padrão
theme_set(theme_bw()) 


#básico
#subset, extrair uma amostra
diamonds %>% sample_n(250)%>% 
ggplot( aes(x=carat, y=price)) + #posição dos pontos
  geom_point(alpha=0.2) #transparência

#cores
diamonds %>% sample_n(250)%>% 
  ggplot( aes(x=carat, y=price, color=cut)) + # cor dos pontos
  geom_point(alpha=0.3)

#bolhas
diamonds %>% sample_n(250)%>% 
  ggplot( aes(x=carat, y=price, size=depth, color=cut)) + # size = tamanho das bolhas
  geom_point(alpha=0.3)+
  scale_size_continuous(range = c(0.01, 10)) #tamanho mínimo e máximo das bolhas

#variação - outras variáveis
diamonds %>% sample_n(150)%>% 
  ggplot( aes(x=carat, y=depth, size=price, color=cut)) +
  geom_point(alpha=0.3)+
  scale_size_continuous(range = c(0.01, 10))


#exemplo 2

iris

ggplot(iris)+
  geom_jitter(aes(x=Sepal.Length, y=Sepal.Width,
      colour=Species, size=Petal.Length, shape=Species), alpha=0.5)+
      scale_size_continuous(range = c(0.01, 10))


