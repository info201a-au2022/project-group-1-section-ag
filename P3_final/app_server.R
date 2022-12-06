library(ggplot2)
library(plotly)
library(dplyr)

df_netflix_titles <- read_csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/netflix_titles.csv")

server <- function(input, output) {
    output$map <- renderPlotly({ 
      
  }) 

}
