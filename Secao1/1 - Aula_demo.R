library(gapminder)
library(tidyverse)


gapminder %>% View

dados <- gapminder %>% 
  group_by(country, continent) %>% 
  summarise(gdp=mean(gdpPercap),pop=mean(pop),life = mean(lifeExp))

dados %>% view

#names(gapminder)
dados %>% ggplot(aes(x=log10(gdp),y=life,colour=continent,size=pop))+ #base do gráfico
  geom_point(alpha=0.7)+ #transparência das bolhas
  scale_size_continuous(range = c(0.7, 12))+ #tamanho das bolhas
  labs(x="PIB (log)", y= "Expectativa de vida")+ # legendas
  theme_bw()+ # tema
  scale_color_brewer(palette= "Set1")#cores
