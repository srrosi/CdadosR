# cerquilha/jogo-da-velha/hash utilizado para fazer comentários, o código não é lido pelo console do R
# aspas " " e '' também para comentários

"comentário aleatório"

# aspas são utilizadas também em funções

#Comandos básicos no R
1+1
2-1
3*4
6/3

2^3

5 %/%2 #divisão de números inteiros




2+1==3 #verdadeiro
2==3 #falso

2<=3
2>=3



# "<-" e "=" utilizados para criar objetos 
x<- 5
x+2

x = 4


  
# () parênteses são utilizados em funções
#função(argumento,argumento)

x<- c(1,2,3) # c é uma função para concatenar elementos
# se tudo estiver em parentesis o R 'imprime' o objeto

(y<- c(1,2,3))
y
print(y)

x #erro


# : algo como "até"
1:20

z <- 20:30

length(z)


# [] dá acesso aos elementos de um objeto

x[3]

# Operadores lógicos

z[z>25]
z[z<25]

z[z>22 & z<28] # x maior que 22 E menor que 28
z[z<23 | z>27] # x menor que 23 OU maior que 27

z[z>22 & z!=28]

# funções dentro de funções
# algo semelhante a operações aritméticas
z+ 1
(z+1)* 2

plot(z)
plot(z^10)
log(z)
plot(log(z))

