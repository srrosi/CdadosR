library(tidyverse)

#gráficos de barra e coluna

#preparando dados com média e desvio padrão
graf<- iris %>% 
  group_by(Species) %>%  
  summarise(media = mean(Sepal.Length),desvio= sd(Sepal.Length)) 


View(graf)

g<- ggplot(graf)

g+geom_col(aes(x=Species,y=media))

g+geom_col(aes(x=Species,y=desvio))

#existem 4 tipos comuns de linhas: "dashed","longdash","solid" e "dotted"

g+geom_linerange(aes(x=Species, ymin=media-desvio, ymax=media+desvio),
                 linetype="dashed")

g+geom_errorbar(aes(x=Species, ymin=media-desvio, ymax=media+desvio),
                linetype="longdash")

g+geom_errorbarh(aes(y=Species, x=media, xmin=media-desvio, xmax=media+desvio))

g+geom_pointrange(aes(x=Species, y=media, ymin=media-desvio, ymax=media+desvio, colour=Species), size=1)

#combinando gráficos
g+geom_col(aes(x=Species,y=media,fill=Species))+
  geom_errorbar(aes(x=Species, ymin=media-desvio, ymax=media+desvio), linetype="longdash")


################

g1<- ggplot(iris)

g1+geom_point(aes(x=Petal.Length, y=Petal.Width))

# cor
g1+geom_point(aes(x=Petal.Length, y=Petal.Width, colour=Species)) 

#formato
g1+geom_point(aes(x=Petal.Length, y=Petal.Width, shape=Species)) 

# cor e formato
g1+geom_point(aes(x=Petal.Length, y=Petal.Width, colour=Species, shape=Species))+
  theme_bw()


#pontos com posição aleatória
g1+geom_jitter(aes(x=Petal.Length, y=Petal.Width)) 

g1+geom_line(aes(Petal.Length, Petal.Width))



#duas variáveis contínuas com pares de números/ time series/ etc
View(economics)

j<- ggplot(economics)

j+ geom_line(aes(date,unemploy))

j+ geom_area(aes(date,unemploy))
