map_main_content <- mainPanel(
  plotlyOutput("map")
)

imdb_main_content <- mainPanel(
  plotlyOutput("imdb")
)

map_panel <- tabPanel(
  "Map",
  titlePanel("Choropleth map"),
  
  map_main_content
  
)

imdb_sidebar_content <- sidebarPanel(
  
  selectInput(
    "var",
    label = "Genre imdb rating",
    choices = list(
      "Action Content" = "Action",
      "Comedy Content" = "Comedy",
      "Drama Content" = "Drama",
      "Romance Content" = "Romance
    )
  )
)

imdb_panel <- tabPanel(
  "imdb",
  titlePanel("Netflix Top IMDB Content"),
  sidebarLayout(

    imdb_sidebar_content,
    
    imdb_main_content
  )
)
ui <- navbarPage(
  "Netlix Movies and Shows",
  map_panel,
  imdb_panel
)
