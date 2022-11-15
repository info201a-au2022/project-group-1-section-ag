
shows <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/netflix_titles.csv", stringsAsFactors = FALSE)

library(ggplot2)
library(tidyverse)

listed <- shows %>% 
  filter (type == "TV Show") %>% 
  filter(country == "United States") %>% 
  group_by(listed_in) %>% 
  filter(release_year > 2018) 

listed_shows <- ggplot(data= listed, aes(x= "", y= listed_in, fill= release_year)) +
  geom_bar(stat= "identity", width = 1) +
  coord_polar("y", start= 0)
