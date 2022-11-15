netflix <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/n_movies.csv")
View(netflix)

library(tidyverse)
install.packages("ggplot2")
library("ggplot2")

top_IMBD <-netflix %>%
  filter(str_detect(netflix$genre, "Action, Crime")) %>%
  arrange(desc(rating)) %>%
  slice(1:10)
view(top_IMBD)

ggplot(data = top_IMBD) +
  geom_col(mapping = aes(x= title, y= rating, fill = title  ))
  labs(title = "Top IMBD Rating for Movies and Shows")
