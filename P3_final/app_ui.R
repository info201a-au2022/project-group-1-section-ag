#

map_main_content <- mainPanel(
  plotlyOutput("map")
)

map_panel <- tabPanel(
  "Map",
  titlePanel("Choropleth map"),
    
    # Your `map_main_content`
    map_main_content
  )
)


ui <- navbarPage(
  "Netlix Movies and Shows",
  map_panel, 
  scatter_panel
)
