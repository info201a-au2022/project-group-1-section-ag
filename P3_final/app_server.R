library(ggplot2)
library(dplyr)
library(tidyverse)
library(shiny)
library(plotly)

df_netflix_titles <- read_csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/netflix_titles.csv")

netflix_imdb <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/n_movies.csv")

netflix_filter_imdb <- 
  netflix_imdb[!duplicated(netflix_imdb$title), ]

df_netflix_titles <- df_netflix_titles %>%
  mutate(main_country = map(str_split(country, ", "), 1))
world_data <- map_data("world")


df_filter_netflix <- df_netflix_titles %>% 
  mutate(main_country = str_replace_all(main_country, 
                                        c("United States" = "USA",
                                          "United Kingdom" = "UK",
                                          "Hong Kong" = "China",
                                          "Soviet Union" = "Russia",
                                          "West Germany" = "Germany")))

count_TV <- df_filter_netflix %>% 
  group_by(main_country) %>% 
  filter(type == "TV Show") %>%
  summarise(TV_count = n()) %>% 
  ungroup() %>% 
  arrange(desc(TV_count))

count_Movie <- df_filter_netflix %>% 
  group_by(main_country) %>% 
  filter(type == "Movie") %>%
  summarise(Movie_count = n()) %>% 
  ungroup() %>% 
  arrange(desc(Movie_count))

count_both <- df_filter_netflix %>% 
  group_by(main_country) %>% 
  summarise(total_content_count = n()) %>% 
  ungroup() %>% 
  arrange(desc(total_content_count))

joined_count <- left_join(count_both, count_Movie, by="main_country")
joined_count <- left_join(joined_count, count_TV, by= "main_country")

joined_count <- joined_count %>%
  mutate(total_content_count = replace_na(total_content_count, 0),
         TV_count = replace_na(TV_count, 0),
         Movie_count = replace_na(Movie_count, 0))

map_join <- world_data %>%
  left_join(. , joined_count, by = c("region"="main_country")) %>%
  mutate(total_content_count = replace_na(total_content_count, 0),
         TV_count = replace_na(TV_count, 0),
         Movie_count = replace_na(Movie_count, 0))


filtered_popularity_year <- netflix_filter_imdb %>% 
  group_by(filtered_year = substr(netflix_filter_imdb$year, 2, 5)) %>% 
  filter(filtered_year >= "2015") %>%
  ungroup()


filtered_popularity_year <- filtered_popularity_year %>%
  mutate(votes = sub(",", "", votes)) %>%
  mutate(votes = sub(",", "", votes)) %>%
  mutate(votes = strtoi(votes))


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

build_popularity <- function(data2, time){
  top_IMBD <- data2 %>%
    filter(str_detect(filtered_popularity_year$filtered_year, time)) %>%
    arrange(desc(votes)) %>%
    slice(1:10)
  
  popularity_chart <- ggplot(top_IMBD, aes(x=title, y=as.numeric(votes), fill=certificate)) + 
    geom_bar(stat="identity") +
    geom_text(aes(label=votes), vjust=-0.3, size=3.5) +
    coord_flip() +
    labs(
      title = "Most popular content on Netflix by Year",
      x = "Content Titles",
      y = "Number of IMDB votes (Popularity)",
      fill = "TV rating"
    )
  
  return(popularity_chart)
}


build_map <- function(dataset, count){
  
  netflix_map <- ggplot() +
    geom_polygon(data = dataset,
                 aes(fill = dataset[,count], 
                     x = long,
                     y = lat, 
                     group = group, 
                     text = paste0(region, "<br>",
                                   "Netflix Contents: ", dataset[,count])),
                 size = 0, alpha = .9, color = "black"
    ) + 
    labs(title = "Netflix content by Country",
         caption = "Data Visualization Map of where Netflix shows and movies are distributed") +
    theme_void() +
    scale_fill_gradient(name = "Shows and Movies Count", 
                        trans = "pseudo_log",
                        breaks = c(0, 10, 50, 3000),
                        labels = c(0, 10, 50, 3000),
                        low =  "#ff99cc",
                        high = "#990000") +
    theme(panel.grid.major = element_blank(),
          axis.line = element_blank(),
          plot.title = element_text(face = "bold")) 
  
  interactive_netflix_map <- ggplotly(netflix_map, tooltip = "text") %>% 
    config(displayModeBar = F) %>% 
    layout(legend = list(x = .1, y = .9))
  
  return(interactive_netflix_map)
}



server <- function(input, output) {
  output$map <- renderPlotly({ 
    return(build_map(map_join, input$count))
  }) 
  
  output$imdb <- renderPlotly({ 
    return(build_graph(netflix_filter_imdb, input$var))
  })
  
  output$popularity <- renderPlotly({
    return(build_popularity(filtered_popularity_year, input$time))
  })
  
}
