netflix <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/n_movies.csv")


library(tidyverse)

install.packages("ggplot2") # once per machine
library("ggplot2")          # in each relevant script


build_graph <- function(data, type){
  top_IMBD <- data %>%
    filter(str_detect(netflix_filter_imdb$genre, type)) %>%
    arrange(desc(rating)) %>%
    slice(1:10)
  
  chart_3 <- ggplot(top_IMBD, aes(x=title, y=rating, fill=rating)) + 
    geom_bar(stat="identity") +
    geom_text(aes(label=rating), vjust=-0.3, size=3.5) +
    coord_flip() +
    labs(
      title = "Top 10 IMDB rated content on Netflix",
      x = "Content Titles",
      y = "IMDB rating"
    )
  
  return(chart_3)
}


filtered_tv_netflix <- netflix %>%
  filter(str_detect(netflix$certificate, "TV"))


rating_certificate <- ggplot(filtered_tv_netflix, aes(x = certificate, y = rating, fill = certificate)) + 
  geom_boxplot() +
  labs(title = "Boxplot distribution of netflix shows relating to certificate(TV rating) and IMDB rating(user score)",
       y = "IMDB rating")

