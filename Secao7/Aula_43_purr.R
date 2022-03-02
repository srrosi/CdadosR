# Aula 43 Funçoes PUrr

library(purrr)


# Cria um dataset com valores com base na função norm
dados <- data.frame(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

# Faz a média de todas as colunas
map(dados, mean)

# Cria um vetor numérico em doubl
map_dbl(dados, mean)

# Vefica se os valores são numéricos
map_lgl(dados, is.numeric)

# Verifica o tamanho de cada valor
map_int(dados, length)


map_chr(dados, mean)
