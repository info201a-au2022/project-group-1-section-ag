netflix <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/n_movies.csv")
View(netflix)

library(dyplr)
install.packages("dyplr")

df_grp <- netflix %>% 
  group_by(certificate) %>%
  arrange(desc(rating)) %>%
    slice(1:10)
  view(top_IMBD)