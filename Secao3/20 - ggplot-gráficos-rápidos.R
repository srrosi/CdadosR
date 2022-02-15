#ggplot
#Carrega as livrarias
library(tidyverse)
library(ggplot2)
#gráfico rápido

####Fórmula
#qplot(x,y,data,geom)
#eixos x,y, dados, tipo de gráfico

#Base de dados de teste
iris

#uma dimensão
qplot(x=Petal.Length,data=iris) 
qplot(x=Petal.Length,data=iris,geom="histogram") 


#ajeitando bins
qplot(x=Petal.Length,data=iris,binwidth=0.5) 

qplot(x=Petal.Length,data=iris,geom="bar") 

#padrão geom="bar"
qplot(data=iris, x=Species) 


#duas dimensões
#padrão geom="point"
qplot(data=iris, x=Petal.Length,y=Petal.Width)

qplot(data=iris, x=Petal.Length,y=Petal.Width, geom="line")
qplot(data=iris, x=Petal.Length,y=Petal.Width, geom="path")

# cores de acordo com Species
qplot(data=iris, x=Petal.Length,y=Petal.Width, color=Species) 

# formato de acordo com Species
qplot(data=iris, x=Petal.Length,y=Petal.Width, shape=Species) 


qplot(data=iris, x=Petal.Length,y=Petal.Width, shape=Species,color=Species) 

#Ótimo para gráficos rápidos, testar dados,etc
