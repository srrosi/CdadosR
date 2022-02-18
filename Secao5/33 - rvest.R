# web scraping / raspagem de páginas da web
library(tidyverse)
#install.packages("rvest")
library(rvest)

#lendo páginas
x<- "https://pt.wikipedia.org/wiki/Lista_de_epis%C3%B3dios_de_Os_Simpsons"
pagina<- read_html(x)

texto<- pagina %>% 
  html_nodes("p+ p , .floatright+ p") %>% #parte da página a ser extraida
  html_text()

texto[2]

#extraindo texto e links

link_texto<- pagina %>% html_nodes("p a") %>% html_text
link_texto

link<- pagina %>% html_nodes("p a") %>% html_attr("href")
link

simpsons_links<- data_frame("texto"=link_texto,"link"=link)

View(simpsons_links)

#extraindo tabelas

tabela<- pagina  %>% html_table(fill=TRUE)

class(tabela)
View(tabela[7])




###################
#extraindo várias páginas de uma vez

#letras de músicas dos beatles
y<- "https://www.vagalume.com.br/the-beatles/"


t1<- y %>% read_html() %>% 
  html_nodes(".lineColLeft") %>% 
  html_text


l1<- y %>% read_html() %>% 
  html_nodes(".nameMusic") %>% 
  html_attr("href")


beatles_link<- data_frame("texto"=t1,"link"=l1)
View(beatles_link)


## como conseguir letra e título
letra<- read_html("https://www.vagalume.com.br/the-beatles/let-it-be.html") %>%
html_nodes("#lyrics") %>% html_text
letra

titulo<- read_html("https://www.vagalume.com.br/the-beatles/let-it-be.html") %>%
html_nodes(".col1-2-1 h1") %>% html_text

titulo

#função para 
extrair_l<-function(x){
data_frame(
  "titulo"= read_html(paste("https://www.vagalume.com.br/",x,sep="")) %>%
    html_nodes(".col1-2-1 h1") %>% html_text
  ,
  "letra"=read_html(paste("https://www.vagalume.com.br/",x,sep="")) %>%
    html_nodes("#lyrics") %>% html_text
            )  
}

beatles_letras<- map_df(beatles_link$link[1:15],extrair_l) 



beatles_letras_completo<- beatles_letras
