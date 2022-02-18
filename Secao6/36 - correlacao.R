#correlação
#medida de relação de duas variáveis

#Conjunto de datases
data()


#Seleciona um dataset específico
data(Orange)

#Abre o dataset para visualização
View(Orange)



#checar dados com gráfico de pontos. Comparação entre as colunas idade e circunferência
plot(Orange$age,Orange$circumference)

#correlação Pearson
cor(Orange$age,Orange$circumference) # padrão


#teste estatístico
cor.test(Orange$age,Orange$circumference) 

#Outros tipos de correlação
cor(Orange$age,Orange$circumference, method="pearson") 
cor.test(Orange$age,Orange$circumference, method="kendall") 
cor.test(Orange$age,Orange$circumference, method="spearman") 

#######################################
#multiplas variáveis 
#matriz de correlação

data(mtcars)
View(mtcars)

#Verificar a correlação entre os atributos da base
cor(mtcars)

m<- cor(mtcars)
View(m)

#Carrega a biblioteca
library(corrplot)

?corrplot

corrplot(m) # padrão com círculos
corrplot(m, method="color") #cores
corrplot(m, method="ellipse") #elípses
corrplot(m, method="shade") # tons
corrplot(m, method="number") #números

#posição
corrplot(m,type="upper")
corrplot(m,type="lower",method = "number")

#números

#matriz e gráficos mais complexos

install.packages("Hmisc")
library(Hmisc)


#coeficiente de correlação, n e valor p
m<- rcorr(as.matrix(mtcars)) 
m

m$r # matriz de coeficiente de correlação
m$P # matriz de valor p
m$n

#plot
corrplot(m$r,p.mat=m$P,sig.level= 0.005)

corrplot(m$r,p.mat=m$P,sig.level=0.001,method="number",type="upper")



#alternativa para matriz
install.packages(("PerformanceAnalytics"))
library(PerformanceAnalytics)

# filtrando apenas algumas colunas
md<- mtcars[,c(1,3,4,5,6,7)] 

chart.Correlation(md, histogram = TRUE)


# A distribuição de cada grupo está na diagonal
# metade inferior: gráficos de pontos com linha de aproximação
# metade superiorOn the top of the diagonal : the value of the correlation plus the significance level as stars
# cada nível de significância está associado a um simbolo => valor p(0, 0.001, 0.01, 0.05, 0.1, 1) <=> símbolo(“***“,”**“,”*”, “.”, " “)