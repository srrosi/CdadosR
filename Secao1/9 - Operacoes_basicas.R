#operações aritméticas
#é possível utilizar o R como uma calculadora
#é possível criar objetos no R

y<- 5

y+2

y*4

20-y

y^3 # exponencial

#Funções
############ função(argumento1,argumento2,etc)
log10(100) #logaritmo
sqrt(4) #raiz quadrada "square root"
cos(60) #cosseno 


#operações com vetores
#Vetor - Sequência de elementos do mesmo tipo
#uma dimensão

x<- c(1,3,5,6,8) # utilizando <- para definir um objeto

m = 2:20 # utilizando = para definir um objeto

#operações aritméticas e funções com vetores

x+5

m - 1

mean(x) # média

######################
dados <- iris


#é possível realizar operações e aplicar funções com colunas de data frames
dados$Sepal.Length
dados$Sepal.Length+ 30

mean(dados$Sepal.Length) # média
sd(dados$Sepal.Length) # desvio padrão
median(x) # mediana
min(dados$Sepal.Length)#valor mínimo
max(dados$Sepal.Length)# valor máximo
sum(dados$Sepal.Length) #soma 
length(dados$Sepal.Length)#tamanho/número de elementos



