# Aula 44 Análise de dados de vendas de jogos de vídeo game

#video game sales
#carregar os dados
library(readr)
# https://www.kaggle.com/gregorut/videogamesales
vgsales <- read_csv("Secao8/vgsales.csv")

#jogos com mais de 100.000 vendas
#26/10/2016


# questões
#quais as empresas que mais publicam jogos
#quais são as mais lucrativas
#quais os gêneros mais populares
#qual plataforma obteve mais sucesso


#explorar os dados
library(tidyverse)
View(vgsales)
names(vgsales)
###############
#Em que ano foram lançados
qplot(data=vgsales,x=Year,fill=Genre)

qplot(data=vgsales,x=Year,fill=Platform)


############
#Quais são as maiores produtoras de jogos? (que produzem mais jogos)
qplot(data=vgsales,x=Publisher) # para se ter uma ideia da distribuição

ma_prod<- vgsales %>%
  count(Publisher,sort=TRUE) %>%
  top_n(30) # top 30 empresas

ma_prod<- vgsales %>% 
  filter(Publisher %in% ma_prod$Publisher) %>%
  group_by(Publisher) %>% 
  count(Genre,sort=TRUE) # genero dos jogos

#gráfico mais informativo
ggplot(ma_prod) + 
  geom_col(aes(x=reorder(Publisher,-n),y=n,fill=Genre),colour="black")+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  labs(x="Empresa",y="Vendas",fill="Gênero")


##################
#Produtoras mais lucrativas (mais vendas/jogos publicados)

View(ma_prod)
#vendas estão em milhões de unidades

lucrativas<- vgsales %>% 
  filter(Publisher %in% ma_prod$Publisher) %>%
  group_by(Publisher) %>% 
  summarise(vendas = mean(Global_Sales),sd= sd(Global_Sales))


lucrativas %>% 
  ggplot() + geom_col(aes(x=reorder(Publisher,-vendas),y=vendas),fill="steelblue3",colour="black")+
  geom_errorbar(aes(x=reorder(Publisher,-vendas),ymin=vendas-sd,ymax=vendas+sd))+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  labs(x="Empresa",y="Vendas")


#alternativa com boxplot
vgsales %>% 
  filter(Publisher %in% ma_prod$Publisher) %>%
  ggplot + geom_boxplot(aes(x=Publisher,y=Global_Sales))+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  labs(x="Empresa",y="Vendas")

#Japão (Nintendo e Square enix)
vgsales %>% 
  filter(Publisher %in% ma_prod$Publisher) %>%
  ggplot + geom_boxplot(aes(x=Publisher,y=JP_Sales))+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  labs(x="Empresa",y="Vendas")

#America do norte (Nintendo)
vgsales %>% filter(Publisher %in% ma_prod$Publisher) %>%
  ggplot + geom_boxplot(aes(x=Publisher,y=NA_Sales))+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  labs(x="Empresa",y="Vendas")

#União Européia
vgsales %>% 
  filter(Publisher %in% ma_prod$Publisher) %>%
  ggplot + geom_boxplot(aes(x=Publisher,y=EU_Sales))+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  labs(x="Empresa",y="Vendas")

#Outras regiões
vgsales %>% 
  filter(Publisher %in% ma_prod$Publisher) %>%
  ggplot + geom_boxplot(aes(x=Publisher,y=Other_Sales))+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  labs(x="Empresa",y="Vendas")



#################################################
#Quais os gêneros mais populares?

#mais produzidos
vgsales %>% 
  count(Genre) %>% 
  View
#Action, Sports

#mais vendidos
vgsales %>% 
  group_by(Genre) %>%
  summarise(vendas_total= sum(Global_Sales),vendas_media = mean(Global_Sales)) %>%
  View

#boxplot
vgsales %>% ggplot(aes(x=Genre,y=Global_Sales)) +geom_boxplot()+geom_jitter(alpha=0.1)

####Qual plataforma teve mais sucesso?

vgsales %>% 
  count(Platform) %>% 
  View #número de jogos

vgsales %>% 
  group_by(Platform) %>% 
  summarise(vendas=mean(Global_Sales)) %>%
  View # média de vendas

vgsales %>% group_by(Platform) %>% summarise(vendas=mean(Global_Sales),sd=sd(Global_Sales)) %>%
  ggplot + geom_pointrange(aes(x=reorder(Platform,-vendas),y=vendas,ymin=vendas-sd,ymax=vendas+sd))+
  theme_bw()


#######################################################
#top100 jogos mais vendidos
#top100
top100<- vgsales %>% 
  filter(Rank<=100)

top100 %>% 
  count(Publisher) %>% 
  View


ggplot(top100) +geom_bar(aes(x=Publisher,fill=Genre),colour="black")+
  theme_minimal()

ggplot(top100) +geom_bar(aes(x=Year,fill=Genre),colour="black")+
  theme_minimal()


ggplot(top100) +geom_bar(aes(x=Year,fill=Publisher),colour="black")+
  theme_minimal()

