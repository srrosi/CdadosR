#ajuda dentro do R

help.start() #ajuda geral do R

help("*")

help(mean)

help.search("mean")


?sd #mesmo que help
??sd #mesmo que help.search

apropos("help") #funções contendo "help"
apropos("mean")[3]

#exemplos de uso
example(mean)# exemplo de uso

example(plot)


x <- c(0:10, 50)
xm <- mean(x)
c(xm, mean(x, trim = 1))
