
library(ggplot2)
library(dplyr)
library(tidyverse)

df_netflix_titles <- read_csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/netflix_titles.csv")

netflix_imdb <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/n_movies.csv")


intro_panel <- tabPanel(
  "Introduction",
  h2("Introduction"),
  
  p("Netflix is an American streaming service that offers a variety of movies, TV shows, anime, documentaries and much more. For this project, we wanted to focus on the distribution of popular Netflix streams and how that would look like across the World.
We are also interested in the quality of Netflix shows and if they distribute quality content to its viewers. We use two datasets which both come from kaggle and they both consist of data related to Netflix content.
 For example, we were able to create an input function of the most popular streams and their IMDb (overall rating out of 10) ratings. By creating a selectInput function, it is able to help show relevant content such as the ratings that will be displayed. Using this function we can select
 different genres and begin to visualize the top rated movies for that specific genre. 
 also decided to create an interactive map of where the majority of Netflix content comes from. By creating an interactive map, you are able to see which countries produce the most streaming content on Netflix. Looking at each state’s popularity, we are then able to see the most 
 common streams and then compare it with other different/similar states. By analyzing the streams with Netflix we are able to compare and contrast information and learn new information about the states and how they can be similar/different to each other. 
")
)


map_main_content <- mainPanel(
  plotlyOutput("map")
)

imdb_main_content <- mainPanel(
  plotlyOutput("imdb")
)

popularity_main_content <- sidebarPanel(
  plotlyOutput("popularity")
)

map_sidebar_content <- sidebarPanel(
  
  selectInput(
    "count",
    label = "Type of Content",
    choices = list(
      "TV shows and Movies" = "total_content_count",
      "Movies" = "Movie_count",
      "TV shows" = "TV_count"
    )
  )
)

map_panel <- tabPanel(
  "Map",
  titlePanel("Choropleth map"),
  sidebarLayout(
  
  map_sidebar_content,
  
  map_main_content,
  
  )
)

imdb_sidebar_content <- sidebarPanel(
  
  selectInput(
    "var",
    label = "Genre imdb rating",
    choices = list(
      "Action Content" = "Action",
      "Comedy Content" = "Comedy",
      "Drama Content" = "Drama",
      "Romance Content" = "Romance"
    )
  )
)

imdb_panel <- tabPanel(
  "IMDB",
  titlePanel("Netflix Top IMDB Content"),
  sidebarLayout(

    imdb_sidebar_content,
    
    
    imdb_main_content
  )
)

popularity_sidebar_content <- sidebarPanel(
  
  selectInput(
    "time",
    label = "Select Year",
    choices = list(
      "Year 2022" = "2022",
      "Year 2021" = "2021",
      "Year 2020" = "2020",
      "Year 2019" = "2019",
      "Year 2018" = "2018"
    )
  )
)

popularity_panel <- tabPanel(
  "Popularity",
  titlePanel("Netflix most Popular Content by the Year"),
  sidebarLayout(
    
    popularity_sidebar_content,
    
    
    popularity_main_content
  )
)




ui <- navbarPage(
  "Netlix Movies and Shows",
  intro_panel,
  map_panel,
  imdb_panel,
  popularity_panel
)
