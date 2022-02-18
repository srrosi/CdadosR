###########################################################
#################################################
############## t-tests/teste T: examinar se a diferença em médias é significante ou não

library(tidyverse)
?ToothGrowth

#Carrega a base para a variável dente
dente<- ToothGrowth

#Primeiras linhas da base
head(dente)

#Mostra a estrura da base
str(dente)


#Gera um gráfico do tipo histograma
qplot(x=len,data=dente,binwidth=3)

# Shapiro-Wilk teste de normalidade 
#H0: distribuição normal

# p > 0.05 - dados são normalmente distribuídos
shapiro.test(dente$len) 


#Cria gráfico do tipo boxplot
ggplot(dente,aes(x=supp,y=len))+ 
  geom_boxplot()+geom_jitter()+
  labs(title= "crescimento dentário de porquinho da índia",x="Tipo de suplemento",y="Crescimento dentário")


# média de len
mean(dente$len) 


#média de cada grupo
group_by(dente,supp) %>% summarise(mean(len)) 



### teste para uma amostra
### teste para examinar se a média de um grupo é significativamente um determinado valor
### H0: verdadeiro valor = 18

#p<0.05 correto
t.test(dente$len,mu=18) 



# não é significativamente diferente
#maior ou menor que determinado valor

t.test(dente$len, alternative = "greater", mu = 3)


# teste T para dois grupos independentes
# testa a diferença nas médias
#H0: Não há diferença na média dos dois grupos
# separar os dados

OJ <- dente$len[dente$supp == 'OJ']
VC <- dente$len[dente$supp == 'VC']

t.test(OJ, VC,
       paired = FALSE, var.equal = FALSE, conf.level = 0.95)


# variações de tooth growth são diferentes com diferentes supp 


t.test(OJ, VC,alternative = "greater",paired = FALSE) 

#teste t para média significativamente maior
#paired=FALSE : medidas coletadas separadamente

#Se os valores são coletados aleatóriamente, separadamente e
#em condições diferentes, as amostras são independentes
#ex: dois grupos diferentes

## observações pareadas: caso você tenha coletado duas observações de cada item
#ex: antes e depois de um tratamento
t.test(OJ, VC,
       paired = TRUE, var.equal = FALSE, conf.level = 0.95) 


#gráficos
#comparação

g<- dente %>% group_by(supp) %>% 
  summarise(media = mean(len), desvio= sd(len))

ggplot(g)+
  geom_col(aes(x=supp,y=media),fill=c("orange","purple"),colour="black")+
  geom_errorbar(aes(x=supp,ymin=media-desvio,ymax=media+desvio))+
  theme_bw()+
  labs(title= "Crescimento dentário de porquinho da índia",x="Tipo de suplemento",y="Crescimento dentário")



ggplot(g)+
  geom_pointrange(aes(x=supp,ymin=media-desvio,ymax=media+desvio,y=media),colour=c("blue","red"),size=3)+
  theme_minimal()+
  labs(title= "Crescimento dentário de porquinho da índia",x="Tipo de suplemento",y="Crescimento dentário")

