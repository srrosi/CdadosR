# Aula 42 Funções da família apply


dados <- data.frame('Coluna1' = 1:10,
                    'coluna2' = c(1,2,3,4,5,6,7,8,9,10))

# apply(dados, margem, função, outros argumentos)

# soma colunas, parâmetro 2
apply(dados, 2, sum)

# Somas linhas, parêmtro 1
apply(dados, 1, sum)

# Medias das colunas
apply(dados, 2, mean)


# tapply(vector, index, function, outros argumentos)


dados2 <- data.frame('Coluna1' = 1:10,
                    'Coluna2' = c(1,2,3,4,5,6,7,8,9,10),
                    'Coluna3' =c('a','a','a','b','b','b','c','c','c', 'a'))

tapply(dados2$Coluna1, dados2$Coluna3, mean)
tapply(dados2$Coluna1, dados2$Coluna3, sum)
