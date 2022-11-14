netflix <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/n_movies.csv")


library(tidyverse)

install.packages("ggplot2") # once per machine
library("ggplot2")          # in each relevant script


leo_shows <- netflix %>% 
  filter(str_detect(netflix$stars, "Leonardo DiCaprio"))


ggplot(data = leo_shows) +
  geom_col(mapping = aes(x = title, y = rating))
