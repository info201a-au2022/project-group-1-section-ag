#

map_main_content <- mainPanel(
  plotlyOutput("map")
)

map_panel <- tabPanel(
  "Map",
  titlePanel("Electoral College Votes"),
  # A `sidebarLayout()` that contains...
  sidebarLayout(
    # Your `map_sidebar_content`
    map_sidebar_content,
    
    # Your `map_main_content`
    map_main_content
  )
)


ui <- navbarPage(
  "Netlix Movies and Shows",
  map_panel, 
  scatter_panel
)
