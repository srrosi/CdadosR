#waffle chart
#gráfico de waffle

library(tidyverse)

mpg #dataframe com dados sobre carros

var <- mpg$class  # dados categóricos, tipos de carro 
var


## preparação dos dados
nrows <- 10 #número de blocos/linhas
df <- expand.grid(y = 1:nrows, x = 1:nrows) # estrutura do data.frame, 10x10
df


#tabulando de maneira simples
table(var) 
categ_table <- round(table(var) * ((nrows*nrows)/(length(var)))) # tabulação dos dados
categ_table # proporção dos dados

table(var) %>% sum
#>   2seater    compact    midsize    minivan     pickup subcompact        suv 
#>         2         20         18          5         14         15         26 

df$category <- factor(rep(names(categ_table), categ_table))
#colocando os nomes no data.frame

#sum(categ_table) deve ser 100 ( ou nrows^2)

## Gráfico
#simples
ggplot(df, aes(x = x, y = y, fill = category)) + 
  geom_tile(color = "black", size = 0.5) 

# complexo
ggplot(df, aes(x = x, y = y, fill = category)) + 
  geom_tile(color = "black", size = 0.5)+
  scale_x_continuous(expand = c(0, 0)) + #corta os extremos, as "sobras"
  scale_y_continuous(expand = c(0, 0), trans = 'reverse')+ #idem, inverte y
  scale_fill_brewer(palette = "Set1") +
  labs(title="Título: gráfico Waffle ", subtitle="Tipo de veículo", caption="Fonte: mpg")+
  theme(axis.title =  element_blank(), #remove títulos dos eixos
        axis.text =  element_blank(), #remove números dos eixos
        legend.title = element_blank()) #remove título da legenda
  