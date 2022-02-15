library(tidyverse)

#Mudando aspectos estéticos do gráfico

#Legendas
ggplot(iris)+
  geom_point(aes(x=Petal.Length, y=Petal.Width, colour=Species))


g<-ggplot(iris)+
  geom_point(aes(Petal.Length, Petal.Width, colour=Species))+
  labs(title="Comprimento por largura de pétalas", x="Comprimento", y="Largura")+ # Título e nomes dos eixos
  scale_colour_manual(name="Espécie",labels=c("Setosa","Versicolor","Virginica"),values=c("cornflowerblue","blueviolet","tomato3"))

g



ggplot(iris, aes(Petal.Length, fill=Species))+
  geom_bar()



g1<- ggplot(iris, aes(Petal.Length, fill=Species))+
  geom_bar()+
  labs(title="Frequência de cada valor de Petal.Length",x= "Valores de Petal.Length",y= "Frequência/Contagem")+ #Título e nomes dos eixos
  scale_fill_manual(name="Espécie",labels=c("Setosa","Versicolor","Virginica"),values=c("goldenrod2","steelblue","green4"))
  

g1
  
  
#Temas
g+ theme_bw()
g+ theme_classic()
g+ theme_minimal()


g1+ theme_bw()
g1+ theme_classic()
g1+ theme_minimal()




#mais temas com o pacote ggthemes 
install.packages("ggthemes")
library(ggthemes)

#wall street journal
g+theme_wsj()+
  scale_colour_wsj()

g+theme_gdocs()


#cores
# esquema de cores do the economist
g+theme_economist()+
  scale_colour_economist()

# esquema de cores para daltônicos
g+theme_calc()+
  scale_colour_colorblind() 


g+theme_excel()+
  scale_colour_discrete()

#outras extensões do ggplot 2 em http://www.ggplot2-exts.org/

####zoom
g

g+xlim(4,7)+ylim(1,3)

g+xlim(0,2)+ylim(0,0.8)

