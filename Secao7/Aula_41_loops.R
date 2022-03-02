# Aula 41 Loops e nó de decisão: for, while, if, else

print('Feliz 2010')
print('Feliz 2011')

for (ano in 2000:2022){
  print(paste('Feliz ', ano))
}

for (n in 1:20){
  print(n * 2)
}

sapply(1:20, function(x){x**2})


for (ano in 2000:2022){
  if(ano < 2010){
    print('Década de 2000')
  }
  
  print(paste('Feliz ', ano))
}

