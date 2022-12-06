library(ggplot2)
library(plotly)
library(dplyr)
library(tidyverse)

df_netflix_titles <- read_csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/netflix_titles.csv")

netflix_imdb <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/n_movies.csv")

netflix_filter_imdb <- netflix_imdb %>%
  filter(title == unique(title))




build_graph <- function(data, type){
  top_IMBD <- data %>%
    filter(str_detect(netflix_filter_imdb$genre, type)) %>%
    arrange(desc(rating)) %>%
    slice(1:10)
  
  chart_3 <- ggplot(data = top_IMBD) +
    geom_col(mapping = aes(x = title, y= rating, fill = title  ))
  
  return(chart_3)
}





server <- function(input, output) {
  output$map <- renderPlotly({ 
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
    
    count_country <- df_filter_netflix %>% 
      group_by(main_country) %>% 
      summarise(content_count = n()) %>% 
      ungroup() %>% 
      arrange(desc(content_count))
    
    map_join <- world_data %>% 
      left_join(. , count_country, by = c("region"="main_country")) %>% 
      mutate(content_count = replace_na(content_count, 0))
    
    netflix_map <- ggplot() +
      geom_polygon(data = map_join, 
                   aes(fill = content_count, 
                       x = long,
                       y = lat, 
                       group = group, 
                       text = paste0(region, "<br>",
                                     "Netflix Contents: ", content_count)),
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
    
  }) 
  
   output$imdb <- renderPlotly({ 
    return(build_graph(netflix_filter_imdb, input$var))
  })
  
}

