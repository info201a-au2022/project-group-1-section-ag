summary_info<-read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/netflix_titles.csv", stringsAsFactors = FALSE)
summary_info2 <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/n_movies.csv")
merge_sum <- merge(summary_info, summary_info2, by= "title", all= TRUE)

library(tidyverse)

movies_2018 <- summary_info %>% 
  filter (type == "TV Show") %>% 
  filter(country == "United States") %>% 
  filter(release_year > 2018) %>% 
  summarise(title, release_year)

top_ratings <- merge_sum %>% 
  group_by(title) %>% 
  group_by(rating.y) %>% 
  summarise(title,rating.y)
