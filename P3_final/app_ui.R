map_main_content <- mainPanel(
  plotlyOutput("map")
)

map_panel <- tabPanel(
  "Map",
  titlePanel("Choropleth map"),
    
    map_main_content
  )



ui <- navbarPage(
  "Netlix Movies and Shows",
  map_panel
)

