
library(ggplot2)
library(dplyr)
library(tidyverse)
library(shiny)
library(plotly)

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
"),
  img("", src = "https://media4.giphy.com/media/3o7budg7unzImxj3Ik/giphy.gif?cid=ecf05e478636ha1ug1hagndtuc35rem6rgq7y841k5fovejj&rid=giphy.gif&ct=s")
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
  p("Below consists of a choropleth map of Netflix content distributed by country. This visualization allows us to see where the majority of Netflix Content comes from and which countries distribute the most film. The United States, India, and the United Kingdom all created the most Movies and Shows that are streaming on Netflix. We implemented a select function that allows you to specifically see the number of TV shows or Movies distributed by Country. There are a lot more Movies on the Netflix platform when you hover over the different countries and switch inputs. Using this visualization we can see if a country creates more TV or Movie content."),
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
  p("For chart two, we analyzed the “Top 10 IMDb rated content on Netflix”. We wanted to analyze this information because we thought that it would be interesting to compare and contrast the different types of content that were presented on Netflix and also thought that it would be interesting to see the ratings between the content. For example, looking at the visualizations for the genre of action, we can see that Avatar: The Last Airbender had the highest rating with 9.3 out of 10. We can also see that Cyberpunk: Edgerunners had a rating of 8.6 out of 10 compared to Avatar’s 9.3. By using the interactive drop down method we can see the different genres and look at their ratings and compare."),
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
  p("Lastly, this visual depicts the distribution of Netflix shows and their TV/IMDb rating scores between 2018 and 2022. By using the slider tool, you would be able to scroll through the years and see the change in rating distribution of Netflix shows overall. Based on this, we can see how interests change over time. These can correlate to current social media trends that reflect a population’s changing interests."),
  sidebarLayout(
    
    popularity_sidebar_content,
    
    
    popularity_main_content
  )
)

summary_panel <- tabPanel(
  "Summary", 
  titlePanel("Summary"), 
  p("By creating this project, we wanted to present information as well as visualizations that are able to showcase our learnings on Netflix. *We created a choropleth map that shows us where the most popular Netflix distributions take place around the world. By creating this visualization, we were able to see that the USA, India, and United Kingdom are all major countries that contribute to Netflix’s major popularity streams. We believe that these countries are able to distribute the most films because of the media marketing strategies that each country can produce. The United States ranks the highest among countries because the Hollywood cinema is the oldest film industry in the world. *We were then also curious about the Netflix ratings on Netflix. We wanted to find out the top ratings using IMDb ratings. By creating this feature and using IMDb, we are able to see what the general perspective will think. *We also wanted to learn about the IMDb ratings from the years of 2018 to 2022. We created a slider tool to look through the different years and to see the different ratings on Netflix shows."), 
)



ui <- navbarPage(
  "Netlix Movies and Shows",
  intro_panel,
  map_panel,
  imdb_panel,
  popularity_panel,
  summary_panel
)
