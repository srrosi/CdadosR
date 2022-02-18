library(gutenbergr)

#https://www.gutenberg.org/

# textos disponíveis
View(gutenberg_metadata)

#acesso aos textos, filtro,etc
?gutenberg_works
gutenberg_works(languages = "pt") %>% View #textos em português 

gutenberg_works(distinct = TRUE,author == "Austen, Jane") %>% View # textos da Jane Austen, únicos


#Buscando por temas
library(dplyr)
gutenberg_subjects %>%
  filter(subject == "Detective and mystery stories") %>% View

gutenberg_subjects %>%
  filter(grepl("Holmes, Sherlock", subject)) %>% View


gutenberg_subjects %>% 
  filter(grepl("Handbooks, manuals, etc.",subject)) %>% View # um pouco mais complexo

#baixando livros
pride<- gutenberg_download(1342)
View(pride)
books <- gutenberg_download(c(2837,1342), meta_fields = c("title","author"))
View(books)



