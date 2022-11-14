netflix <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/n_movies.csv")


library(tidyverse)

install.packages("ggplot2") # once per machine
library("ggplot2")          # in each relevant script



filtered_tv_netflix <- netflix %>%
  filter(str_detect(netflix$certificate, "TV"))


rating_certificate <- ggplot(filtered_tv_netflix, aes(x = certificate, y = rating, fill = certificate)) + 
  geom_boxplot() +
  labs(title = "Boxplot distribution of netflix shows relating to certificate(TV rating) and IMDB rating(user score)",
       y = "IMDB rating")

