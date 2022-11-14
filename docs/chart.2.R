netflix <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/n_movies.csv")


library(tidyverse)

install.packages("ggplot2") # once per machine
library("ggplot2")          # in each relevant script


leo_shows <- netflix %>% 
  filter(str_detect(netflix$stars, "Leonardo DiCaprio"))


mean_ratings <- mean(netflix$rating, na.rm = TRUE)

leo_ratings <- mean(leo_shows$rating, na.rm = TRUE)

leo_plot <- ggplot(data = leo_shows) +
  geom_col(mapping = aes(x = title, y = rating, fill = title)) + 
  labs(title = "Distribution of tv shows ratings involved with actor Leonardo Dicaprio",
       subtitle = "Mean rating of Leonardo Dicaprio movies: 7.62",
       caption = "Movies on netflix not including Dicaprio have an average rating of 6.76")




