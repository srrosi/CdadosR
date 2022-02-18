#regressão linear múltipla

#regressão linear é uma equação para se estimar a condicional (valor esperado) de 
#uma variável y, dados os valores de algumas outras variáveis x.

# y= a+ bx + b1x1 + b2x2 + b3x3...

library(car)

data(iris)
head(iris)

fit1<-lm(data=iris, Sepal.Length~Sepal.Width+Petal.Length)


#VIF - variation inflation factor / fator de inflação da variância
# ok, valores <5
vif(fit1)
summary(fit1)

fit2<-lm(data=iris, Sepal.Length~Sepal.Width+Petal.Length+Petal.Width)


#problemático, valores>10
vif(fit2) 
summary(fit2)

fit3<-lm(data=iris, Sepal.Length~Sepal.Width*Petal.Length)

# muito problemático, valores muito altos
vif(fit3)
summary(fit3)



# Outras funções interessantes
# coeficientes
coefficients(fit1) 

# Intervalos de confiança 
confint(fit1, level=0.95)

# valores previstos
fitted(fit1) 

# residuais
residuals(fit1) 

# tabela anova
anova(fit1) 

# matriz de covariância 
vcov(fit1) 


