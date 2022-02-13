#criando dados no R

#sample / amostra aleatória
sample(10)
sample(10)
sample(10)

set.seed(2) #gera um número pseudo aleatório
sample(10)
set.seed(2)
sample(10)
set.seed(2)
sample(10)


#Intervalo com 10 número entre 1 e 40
sample(1:40,10)# 10 números dentro do intervalo 1:40

#Pega a quantidade de números que está fora do parentes
sample(c(1,6,4,33,86,2,33),5) # 5 números dentro dos fornecidos

letters #alfabeto minúsculo

#Pega o número de letras informado pelo número após a vírgula
sample(letters,5) # 5 letras/elementos 

sample(1:10,10)
sample(1:10,10)
sample(1:10,10, replace = TRUE)


#Repete cada elemento dentro do parentese
rep (c("a","b"),each=10) # cada um 10x

#Repete o grupo dentro do parentese
rep (c("a","b"),times=10) #o grupo 10x

#criando dados de distribuição normal
set.seed(22)
rnorm(10)
rnorm(10,mean=3,sd=1)

#criando sequências
seq(1,10)
seq(1,10,2) #sequência de 1 a 10, de 2 em 2
seq(200,300,15)#sequência de 200 a 300, de 15 em 15

#expand.grid cria um data frame com todas as combinações possíveis de cada coluna
df1<- expand.grid(altura = seq(60, 80,5),
                    genero = c("Masc","Fem"))

df2<- expand.grid(tamanho = seq(25,40,0.5), #"sapatos"
                  cor = c("Azul","Vermelho","preto"),
                  tipo = c("esporte","social"))

View(df2)
