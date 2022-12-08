
library(ggplot2)
library(dplyr)
library(tidyverse)
library(shiny)
library(plotly)
library(markdown)
library(maps)

df_netflix_titles <- read_csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/netflix_titles.csv")

netflix_imdb <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/n_movies.csv")


intro_panel <- tabPanel(
  "Introduction",
  h2("Introduction"),
  p("Ian Pascal, Alex Chiu, Emily Ma"),
  
  p("Netflix is an American streaming service that offers a variety of movies, TV shows, anime, documentaries and much more. For this project, we wanted to focus on the distribution of popular Netflix streams and how that would look like across the World.
We are also interested in the quality of Netflix shows and if they distribute quality content to its viewers. We use two datasets which both come from kaggle and they both consist of data related to Netflix content.
 For example, we were able to create an input function of the most popular streams and their IMDb (overall rating out of 10) ratings. By creating a selectInput function, it is able to help show relevant content such as the ratings that will be displayed. Using this function we can select
 different genres and begin to visualize the top rated movies for that specific genre. 
 also decided to create an interactive map of where the majority of Netflix content comes from. By creating an interactive map, you are able to see which countries produce the most streaming content on Netflix. Looking at each state’s popularity, we are then able to see the most 
 common streams and then compare it with other different/similar states. By analyzing the streams with Netflix we are able to compare and contrast information and learn new information about the states and how they can be similar/different to each other. 

Which countries distributed the most Netflix content?

Which shows/movies were most popular throughout the last years?

Should I keep my netflix subscriptionship? Are the movies and shows that netflix streams considered ‘quality’?

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
  p("For chart two, we analyzed the “Top 10 IMDb rated content on Netflix”. We wanted to analyze this information because we thought that it would be interesting to compare and contrast the different types of content that were presented on Netflix and also thought that it would be interesting to see the ratings between the content. For example, looking at the visualizations for the genre of action, we can see that Avatar: The Last Airbender had the highest rating with 9.3 out of 10. We can analyze this rating and compare it to all the other action content on the list which all have close to similar ratings but not as high as Avatar. By using the interactive drop down method we can see the different genres and look at their ratings and compare."),
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
  p("By creating this project, we wanted to present information as well as visualizations that are able to showcase our learnings on Netflix."),
  p(("We created a choropleth map that shows us where the most popular Netflix distributions take place around the world. By creating this visualization, we were able to see that the USA, India, and United Kingdom are all major countries that contribute to Netflix’s major popularity streams. We believe that these countries are able to distribute the most films because of the media marketing strategies that each country can produce."),
  p(strong("The United States ranks the highest among countries because the Hollywood cinema is the oldest film industry in the world. *We were then also curious about the Netflix ratings on Netflix. We wanted to find out the top ratings using IMDb ratings. By creating this feature and using IMDb, we are able to see what the general perspective will think. We also wanted to learn about the IMDb ratings from the years of 2018 to 2022. We created a slider tool to look through the different years and to see the different ratings on Netflix shows.")

)
)
)

report_panel <-tabPanel(
 "Report",
  titlePanel("Report"),
  p("Netflix Show and Movies"),
  p("Emily Ma, Ian Pascal, Alex Chiu"),
  p("Autumn 2023"),
  h2("Abstract"),
  p("Our main question is "What are the most popular show in all of the states across the U.S?". We hope to find different correlations between the shows rating and its popularity. To address these questions we plan on using netflix csv files from the internet and performing analysis on it. We will be using different ggplot graphs and other data wrangling techniques to answer any questions we have.")
  h2("Affiliation"),
  p("INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
  h2("Introduction"),
  p("Every day, month, or year, there are newly released Netflix shows each day for people to view. With so many new shows that are released one after another, we are curious what some top shows are around the country. By finding data from each state, we can track the most viewed shows around each state because we are interested in the top shows that vary across the country. We plan to find data on this information using the website Kaggle, https://www.kaggle.com/datasets/shivamb/netflix-shows?datasetId=434238"),
  h2("Problem Domains"),
  p("Netflix is a streaming service that is home to hundreds of shows and movies for people to watch. They were founded in the U.S and are available in 150 countries (Countries Where Netflix Is Available, n.d.).
Many people gain inspiration and learn from insightful shows such as ones on Netflix. Netflix is home to award winning shows that have influenced many audiences' values and insights of the world. They have also influenced many social and economical aspects. For instance, binge watching Netflix shows has become a normalized practice which influence the behaviors of audiences along with the rate of shows that are being produced (Matrix & Anya, 2014). The more people binge watch shows, the more producers want to release shows in order to keep their audience engaged. 

Direct stakeholders of Neflix involve film production crews, cooporate employees, and software engineers who put to gether the streaming platform. Then, indirect stakeholders involve, the customers who buy a Netflix subscription, film critics, and the film industry. Something that both stakeholders value include entertainment and inspiration. Both stakeholders seek to gain entertainment from easily accessible films and shows. The high prices of cable bundles can have unhappy consumers be more willing to look for cheaper alternatives like Netflix (SLA Alumni, 2018). People also seek inspiration after watching these shows because an entertaining show can teach people new things about themselves or others. 

Finally, there are many benefits to having a streaming service like Netflix. Netflix is an accessible streaming service that can provide entertainment to people at low prices. People are also able to take Netflix anywhere via mobile app since they provide offline streaming as long as you download your desired shows. They also provide shows that are exclusive to Netflix which makes the streaming service more unique compared to other services. While there are many benefits, there are also harms that exist within Netflix. Finding shows you want to watch can be difficult to find on Netflix’s platform since the recommendation algorithm mostly shows Netflix originals rather than shows a user might find interesting (SLA Alumni, 2018). Binge watching Netflix shows can also be harmful to the audience because some may lose sleep by over watching and develop habits that are not productive to their life. 
"),
  h2("Research Questions"),
  p("* What is the most popular show in each state across the United States?
  * This is our main question that we wanted to research about and we were curious on how it is compared across the country.
* How do different shows ratings across the five regions (Northeast, Southwest, West, Southeast, and Midwest) compare to each other? Are there similarities or differences?
  * Even though we can find what each states favorite show is, we are also curious how it is comparable to each region since there is different opinions in each region.
  * We also want to see the popularity of shows in different reasons. (are india based films more popular in south asia, etc..)
* Researching about the most watched Netflix show in state, about how many hours was viewed on that show?
  * We are also curious about how many hours is spent on each show, it can tell us how much a state likes that show compared to any other place/region.
* The quality of shows and movies that Netflix is a topic we are interested in.
  * Is the quality of the shows that Netflix put out good? Based on user scores should I keep my Netflix subscription or switch to another streaming platform?
* Does Netflix distribute more shows or movies?
"),
  h2("Dataset"),
  p("We found this dataset on Kaggle and it displays all TV shows and Movies metadata on Netflix. There are 12 different columns on the data set and 8807 different unique values (rows). This dataset gives us the necessary information about where the majority of movies/shows are produced. We hope to hear from indirect stakeholders and what Netflix shows they prefer. We can find the demographics of the audiences using the TV rating column that displays what audience the movie is for. We can see if there is a director for multiple movies and shows on Netflix wrangling the Director column. We plan on using more data sets to do more visualizations such as finding popularity, audience scores, and regional data on Netflix. This dataset gives us the foundation of all the current shows on the streaming service. Shivam Bandai created this dataset and he’s a senior data scientist at H20.ai. A lot of people create datasets on Kaggle and allow anyone to use them and so they usually put Kaggle on their resume.  He built this dataset in mid 2021 and used the current Netflix data of that time to make this set. Under the set he displayed some of the questions he was asking when making this set such as “Does Netflix have more focus on TV Shows than movies in recent years?”. I believe Shivam collected this data using some sort of code on python using information from Netflix. Well the creator is definitely benefiting from this data set because a lot of people have used and up voted this set on Kaggle. If your datasets get approval on Kaggle then more people can see your page and you get more recognition. The data is likely secured through Kaggle, I’m guessing they have some sort of security on their website. I would say it’s trustworthy since it has lots of positive reviews and kaggle gave it a “gold” rating which means it’s credible and usable. We found this dataset online while searching for a dataset related to Netflix tv shows and movies.
Bansal, Shivam. (2021). Kaggle. Netflix Movies and TV Shows. Retrevieved October 31, 2022, from https://www.kaggle.com/datasets/shivamb/netflix-shows?datasetId=434238
Narayan. (2022). Kaggle. Netflix popular movies dataset. Retrevieved October 31, 2022 https://www.kaggle.com/datasets/narayan63/netflix-popular-movies-dataset
"),
  h2("Expected Implications"),
  p("When policymakers answer all of their research questions they can come up with conclusions and make analysis of what they found. Such as policymakers on social media and other applications that use a lot of data required to run these applications. These implications could be if whether we need to filter out certain content because it could be possibly deemed as "hate speech". Policymakers have to survey through data to put in place these policies.

Another implication that arises from our findings would be realizing which parts of the U.S has access to internet. Netflix widely relies on the internet and stable wifi in order to create an entertaining environment for its audience. The relationship between the amount of Netflix show streaming in one area compared to another can tell us about the demographics of the population along with what resources are available to them in order to stream shows on platforms such as Netflix. This can also push policy makers to find ways to assist populations that need access to internet to do tasks such as homework, chores, or paying bills. 
"),
  h2("Limitations"),
  p("We will need to find datasets that display the popularity of the different Netflix shows to answer a couple of our research questions. To be able to survey and examine which countries watch what will need a dataset that has variables based on geographical location such as country and popularity in that country. Thus, will need to find a dataset that has the number of hours watched for that show. To see if Netflix is putting out quality movies on their streaming platform will need a variable that gives us the IMDB rating of that movie. On Wednesday we will get together and do research on more datasets that can help us figure out our problem domain and answer our questions.
"),
  h2("Findings"),
  p("Our world map data visualization helped us solve many of our questions. Such as “Which countries distribute the most netflix content”. Using our visualization we can conclude that the countries; United States, India, and United Kingdom distributed the most content that is accessible through Netflix. The U.S has a total of 3,210 content including Movies and Shows, 2363 movies and 847 being shows. Something interesting we found was that 927/1008 of the content distributed in India were movies. It is also clear that there are a lot more movies streaming on netflix compared to shows. “Is the quality of the shows that Netflix put out good?” We can answer this question using our bar distribution graph of the top IMDB content on Netflix. Movie and show review can be pretty subjective but usually IMDB ratings are fairly accurate in determining whether a film is quality. When surveying the top rated movies throughout the chart there is a lot of quality content such as Lord of the Rings, Rick and Morty, Sherlock, and Breaking bad. All of these shows have a score of over 9 which is very high and answers our question to whether if Netflix produced quality content. This visualization also helps us to see which genre has the highest IMDB rated shows which would be “Drama Content”. Having highly rated content is important for the user since they’re paying for a Netflix subscription. “Based on user scores should I keep my Netflix subscription or switch to another streaming platform?” , is a question we considered when wrangling the data set. Since Netflix has shows like Breaking Bad and a lot of other highly rated content over a 8 IMDB score we determined that its worth keeping a subscription. Although this does not factor the average scores across all the shows and just graphs the top scores. “What is the most popular show in each state across the United States?”, is a question we semi-answered. Using the total number of votes for each show/movie we determined what was most popular throughout the years. In 2022 The Gray Man and the Adam project had the most votes. In 2021, the film Don’t look up had the most votes with 525,424 of the last 5 years. Although we could not answer the question which show was most popular in the U.S we can assume its likely one of the shows listed in the graph throughout the years."),
  h2("Discussion"),
  p(),
  h2("Conclusion"),
  p()
)



ui <- navbarPage(
  "Netlix Movies and Shows",
  intro_panel,
  map_panel,
  imdb_panel,
  popularity_panel,
  summary_panel,
  report panel
)
