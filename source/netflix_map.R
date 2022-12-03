

library(plotly)
library(tidyverse)
library(dplyr)
df_netflix_titles <- read_csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/netflix_titles.csv")

df_netflix_titles <- df_netflix_titles %>%
  mutate(main_country = map(str_split(country, ", "), 1), 
         main_cast = map(str_split(cast, ", "), 1), 
         genre = map(str_split(listed_in, ", "), 1)) %>% 
  unnest(cols = c(main_country, main_cast, genre)) %>% 
  mutate(type = as.factor(type)
  ) 
head(df_netflix_titles)


mapdata <- map_data("world")

#changing country labels in netflix dataframe
netflix_for_map <- df_netflix_titles %>% 
  mutate(main_country = str_replace_all(main_country, 
                                        c("United States" = "USA",
                                          "United Kingdom" = "UK",
                                          "Hong Kong" = "China",
                                          "Soviet Union" = "Russia",
                                          "West Germany" = "Germany")))

#summarize content counts by country
count_country <- netflix_for_map %>% 
  group_by(main_country) %>% 
  summarise(content_count = n()) %>% 
  ungroup() %>% 
  arrange(desc(content_count))

#join map data with the dataframe
map_join <- mapdata %>% 
  left_join(. , count_country, by = c("region"="main_country")) %>% 
  mutate(content_count = replace_na(content_count, 0))

# creating chroloplete map
temp <- ggplot() +
  geom_polygon(data = map_join, 
               aes(fill = content_count, x = long, y = lat, 
                   group = group, 
                   text = paste0(region, "<br>",
                                 "Netflix Contents: ", content_count)),
               size = 0, alpha = .9, color = "black"
  ) + 
  labs(title = "Distribution of Netflix Contents by Country") +
  theme_void() +
  scale_fill_gradient(name = "Content Count", 
                      trans = "pseudo_log",
                      breaks = c(0, 7, 56, 403, 3000),
                      labels = c(0, 7, 56, 403, 3000),
                      low =  "bisque2",
                      high = "#b20710") +
  theme(panel.grid.major = element_blank(),
        axis.line = element_blank(),
        plot.title = element_text(face = "bold")) 


ggplotly(temp, tooltip = "text") %>% 
  config(displayModeBar = F) %>% 
  layout(legend = list(x = .1, y = .9))
