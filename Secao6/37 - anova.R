#A nova one way /unilateral
#Extensão do teste t de mostras independentes
library(tidyverse)

#carrega o dataset
dente <- ToothGrowth

#Transforma a coluna 'dose' em um factor
dente$dose <- factor(dente$dose)


#Plota um gráfico do tipo histograma
qplot(data = dente, x = len, bins = 10)
qplot(data = dente, x = len, fill = dose, binwidth = 3)


#One way
a1 <- aov(data = dente, len~dose)
summary(a1)

#Teste feito para ver se as diferenças são significativas
TukeyHSD(a1)

#Teste t pareados
pairwise.t.test(dente$len, dente$dose)


ggplot(dente)+
  geom_boxplot(aes(dose, len, fill = supp))+
  geom_jitter(aes(dose, len, group = supp))+
  theme_bw()


#Diferença entre os grupos
a2 <- aov(data = dente, len~dose+supp)
summary(a2)


#Diferença e interação
a3 <- aov(data = dente, len~dose*supp)
summary(a3)


#Somente interação
a4 <- aov(data = dente, len~dose:supp)
summary(a4)


library(car)
a5 <- aov(data = dente, len~dose*supp)
Anova(a5, type ="III")
