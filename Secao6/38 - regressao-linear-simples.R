#regressão linear simples
library(tidyverse)

#regressão linear é uma equação para se estimar a condicional (valor esperado) de 
#uma variável y, dados os valores de algumas outras variáveis x.

# y= a+bx

View(Orange)
qplot(data=Orange, x=age,y=circumference)
cor.test(Orange$age, Orange$circumference)

rl<- lm(data=Orange, circumference~age)

plot(rl) #plots diagnósticos

# resultado da regressão linear em si
summary(rl)

#rejeição da hipótese nula (variáveis não são relacionadas)
#valor p <0.005
#R-square explica o quanto o modelo explica da variação
#intercepção e inclinação


#gráfico
ggplot(Orange,aes(x=age,y=circumference))+ 
  geom_point(colour="steelblue",size=4)+
  geom_smooth(method="lm",colour="black")+
  labs(title="Regressão linear de Orange")+
  theme_minimal()  


# Outras funções interessantes
# coeficientes do modelo
coefficients(rl) 

# intervalo de confiança
confint(rl, level=0.95) 

# valores previstos
fitted(rl)

# residuais
residuals(rl) 

# tabela ANOVA
anova(rl) 

