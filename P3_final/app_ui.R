
intro_panel <- tabPanel(
  "Introduction",
  h2("Introduction"),
  
  p()
)


map_main_content <- mainPanel(
  plotlyOutput("map")
)

imdb_main_content <- mainPanel(
  plotlyOutput("imdb")
)

popularity_sidebar_content <- sidebarPanel(
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
  
  map_main_content
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
    
    imdb_sidebar_content,
    
    
    imdb_main_content
  )
)




ui <- navbarPage(
  "Netlix Movies and Shows",
  intro_panel,
  map_panel,
  imdb_panel,
  popularity_panel
)
