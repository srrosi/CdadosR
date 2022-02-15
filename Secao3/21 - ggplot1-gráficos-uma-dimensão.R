library(tidyverse)

#formato completo de gráficos
#ggplot(data,aes(x,y,color,shape,fill,etc))+geom + outras camadas...

#gráficos de variáveis com uma dimensão
iris

#gráfico de barra
ggplot(iris, aes(Petal.Length))+
  geom_bar()


#histograma
ggplot(iris, aes(Petal.Length))+
  geom_histogram() 

ggplot(iris, aes(Petal.Length))+
  geom_histogram(binwidth=0.1)


#gráfico de densidade (estimativa de densidade de kernel)
ggplot(iris, aes(Petal.Length))+
  geom_density()

# poligono de frequência
ggplot(iris, aes(Petal.Length))+
  geom_freqpoly(binwidth= 0.1)

#gráfico de pontos
ggplot(iris, aes(Petal.Length))+
  geom_dotplot(binwidth = 0.1) 



#mais complexidade
g<- ggplot(iris)

g+ geom_histogram(aes(Petal.Length, fill=Species),
                  binwidth=0.1,
                  alpha=0.3,
                  colour="black")

g+ geom_histogram(aes(Petal.Length,colour=Species),
                  binwidth=0.1,
                  fill="black")

#alpha= transparência
#colour = contorno

g+ geom_density(aes(Petal.Length,fill=Species),
                alpha=0.3,
                colour="black")


g+ geom_density(aes(Petal.Length,..count..,fill=Species),
                alpha=0.5,
                colour="black")

g+geom_freqpoly(aes(Petal.Length,colour=Species),
                binwidth=0.1,
                show.legend = TRUE)

#combinando gráficos
g+ geom_histogram(aes(Petal.Length,fill=Species),
                  binwidth=0.1,alpha=0.3,
                  colour="black")+
  geom_density(aes(Petal.Length,0.1*..count..,fill=Species),
               alpha=0.5,
               colour="black")


g+ geom_histogram(aes(Petal.Length,fill=Species),
                  binwidth=0.1,
                  alpha=0.3)+
  geom_freqpoly(aes(Petal.Length,colour=Species),
                binwidth=0.1)


g+ geom_dotplot(aes(Petal.Length,fill=Species),
                binwidth=0.1,
                alpha=0.3)+
  geom_freqpoly(aes(Petal.Length,colour=Species),
                binwidth=0.1)+
  geom_histogram(aes(Petal.Length,fill=Species),
                 binwidth=0.1)

