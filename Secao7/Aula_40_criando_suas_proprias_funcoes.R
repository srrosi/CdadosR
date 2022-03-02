# Aula 40 Criando suas próprias funções


# Abre a ajuda de um componente, função ou parãmetro.
?shample

n <- sample(1:30, replace = TRUE)
m <- sample(1:30, replace = FALSE)

# Fórmula geral
# nome <- funciont (x) { aqui dentro todos os elementos }

teste <- function(x){
  x + 1 }

teste(4)

teste(0)

teste(m)

teste2 <- function(x){
  print(x+1)
  print(x+5)
}

teste2(n)

rsumo <-function(x){
  print(mean(x))
  print(sd(x))
  print(sum(x))
  print(hist(x))
  print(boxplot(x))
  
}

rsumo(m)
  
rsumo(1:20)



