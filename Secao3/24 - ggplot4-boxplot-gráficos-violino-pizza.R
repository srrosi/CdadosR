library(tidyverse)

View(mpg)
?mpg


###boxplot e gráfico de violino
g<- ggplot(mpg)


g+geom_boxplot(aes(class, hwy))


# tipo de carro x milhas por galão
g+geom_boxplot(aes(class, hwy))+
  geom_jitter(aes(class, hwy)) 


g+geom_violin(aes(class, hwy))+
  geom_jitter(aes(class, hwy))


#mudando coordenadas cartesianas
g+geom_boxplot(aes(class, hwy))+
  geom_jitter(aes(class, hwy)) +
  coord_cartesian(xlim = c(0, 10)) # tipo de carro x milhas por galão


g+geom_violin(aes(class, hwy))+
  geom_jitter(aes(class, hwy))+
  coord_cartesian(xlim = c(0, 12), ylim=c(-10,60))+
  theme_minimal()



#coordenadas
g+geom_boxplot(aes(class, hwy))+
  coord_flip()# gira o gráfico


# gira o gráfico
g+geom_violin(aes(class,hwy))+
  geom_jitter(aes(class,hwy))+coord_flip()


#gráfico de pizza
#gráfico de pizza no ggplot é uma variação do gráfico de barras/colunas

df <- data_frame(
  grupo = c("Homem", "Mulher", "Criança"),
  valor = c(25, 25, 50)
)
df

ggplot(df)+
  geom_col(aes(x=1, y=valor, fill=grupo))


#theta indica qual eixo vai compor o angulo do círculo
ggplot(df)+
  geom_col(aes(x=1, y=valor, fill=grupo))+
  coord_polar(theta="y") 


# gráfico de "alvo"
ggplot(df)+
  geom_col(aes(x=1, y=valor, fill=grupo))+
  coord_polar(theta="x") 



#Facets
#facet_grid(linha~coluna)


#tração f- dianteira, r traseira, 4
g+geom_boxplot(aes(class, hwy))+
  facet_grid(~drv)


g+geom_boxplot(aes(class, hwy))+
  facet_grid(drv~.)


g+geom_boxplot(aes(class, hwy))+
  facet_grid(year~.)


g+geom_boxplot(aes(class,hwy))+
  facet_grid(year~drv)



g+geom_boxplot(aes(class,hwy))+
  facet_grid(drv~year)



