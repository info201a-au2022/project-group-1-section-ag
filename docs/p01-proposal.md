# Title of your Project: Project Proposal 

**TODO**: Edit this file. Your project proposal goes here.

For what to do, see the [`../instructions/`](../instructions/) directory, specifically: 

* [Design Brief](../instructions/project-design-brief.pdf)
* [Project Proposal Requirements](../instructions/p01-proposal-requirements.md)

# Netflix Shows Around the United States
#### Emily Ma, Ian Pascal, Alex Chiu
## Date
Autumn 2023

## Abstract
Our main focus

## Affiliation
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

## Introduction
Every day, month, or year, there are newly released Netflix shows each day for people to view. With so many new shows that are released one after another, we are curious what some top shows are around the country. By finding data from each state, we can track the most viewed shows around each state because we are interested in the top shows that vary across the country. We plan to find data on this information using the website Kaggle, https://www.kaggle.com/datasets/shivamb/netflix-shows?datasetId=434238


## Problem Domains

Netflix is a streaming service that is home to hundreds of shows and movies for people to watch. They were founded in the U.S and are available in 150 countries (Countries Where Netflix Is Available, n.d.).
Many people gain inspiration and learn from insightful shows such as ones on Netflix. Netflix is home to award winning shows that have influenced many audiences' values and insights of the world. They have also influenced many social and economical aspects. For instance, binge watching Netflix shows has become a normalized practice which influence the behaviors of audiences along with the rate of shows that are being produced (Matrix & Anya, 2014). The more people binge watch shows, the more producers want to release shows in order to keep their audience engaged. 

Direct stakeholders of Neflix involve film production crews, cooporate employees, and software engineers who put to gether the streaming platform. Then, indirect stakeholders involve, the customers who buy a Netflix subscription, film critics, and the film industry. Something that both stakeholders value include entertainment and inspiration. Both stakeholders seek to gain entertainment from easily accessible films and shows. The high prices of cable bundles can have unhappy consumers be more willing to look for cheaper alternatives like Netflix (SLA Alumni, 2018). People also seek inspiration after watching these shows because an entertaining show can teach people new things about themselves or others. 

Finally, there are many benefits to having a streaming service like Netflix. Netflix is an accessible streaming service that can provide entertainment to people at low prices. People are also able to take Netflix anywhere via mobile app since they provide offline streaming as long as you download your desired shows. They also provide shows that are exclusive to Netflix which makes the streaming service more unique compared to other services. While there are many benefits, there are also harms that exist within Netflix. Finding shows you want to watch can be difficult to find on Netflix’s platform since the recommendation algorithm mostly shows Netflix originals rather than shows a user might find interesting (SLA Alumni, 2018). Binge watching Netflix shows can also be harmful to the audience because some may lose sleep by over watching and develop habits that are not productive to their life. 


## Research Questions
* What is the most popular show in each state across the United States?
  * This is our main question that we wanted to research about and we were curious on how it is compared across the country.
* How do different shows ratings across the five regions (Northeast, Southwest, West, Southeast, and Midwest) compare to each other? Are there similarities or differences?
  * Even though we can find what each states favorite show is, we are also curious how it is comparable to each region since there is different opinions in each region.
  * We also want to see the popularity of shows in different reasons. (are india based films more popular in south asia, etc..)
* Researching about the most watched Netflix show in state, about how many hours was viewed on that show?
  * We are also curious about how many hours is spent on each show, it can tell us how much a state likes that show compared to any other place/region.

## Dataset
We found this dataset on Kaggle and it displays all TV shows and Movies metadata on Netflix. There are 12 different columns on the data set and 8807 different unique values (rows). This dataset gives us the necessary information about where the majority of movies/shows are produced. We hope to hear from indirect stakeholders and what Netflix shows they prefer. We can find the demographics of the audiences using the TV rating column that displays what audience the movie is for. We can see if there is a director for multiple movies and shows on Netflix wrangling the Director column. We plan on using more data sets to do more visualizations such as finding popularity, audience scores, and regional data on Netflix. This dataset gives us the foundation of all the current shows on the streaming service. Shivam Bandai created this dataset and he’s a senior data scientist at H20.ai. A lot of people create datasets on Kaggle and allow anyone to use them and so they usually put Kaggle on their resume.  He built this dataset in mid 2021 and used the current Netflix data of that time to make this set. Under the set he displayed some of the questions he was asking when making this set such as “Does Netflix have more focus on TV Shows than movies in recent years?”. I believe Shivam collected this data using some sort of code on python using information from Netflix. Well the creator is definitely benefiting from this data set because a lot of people have used and up voted this set on Kaggle. If your datasets get approval on Kaggle then more people can see your page and you get more recognition. The data is likely secured through Kaggle, I’m guessing they have some sort of security on their website. I would say it’s trustworthy since it has lots of positive reviews and kaggle gave it a “gold” rating which means it’s credible and usable. We found this dataset online while searching for a dataset related to Netflix tv shows and movies.

| Title              | Observations | Variables |
|--------------------|--------------|-----------|
| netflix_titles.csv | 8807         |12         |
| n_movies.csv       | 7912         |9          |

#### Bansal, Shivam. (2021). Kaggle. Netflix Movies and TV Shows. Retrevieved October 31, 2022, from https://www.kaggle.com/datasets/shivamb/netflix-shows?datasetId=434238
#### Narayan. (2022). Kaggle. Netflix popular movies dataset. Retrevieved October 31, 2022 https://www.kaggle.com/datasets/narayan63/netflix-popular-movies-dataset

## Expected Implications

When policymakers answer all of their research questions they can come up with conclusions and make analysis of what they found. Such as policymakers on social media and other applications that use a lot of data required to run these applications. These implications could be if whether we need to filter out certain content because it could be possibly deemed as "hate speech". Policymakers have to survey through data to put in place these policies.


Another implication that arises from our findings would be realizing which parts of the U.S has access to internet. Netflix widely relies on the internet and stable wifi in order to create an entertaining environment for its audience. The relationship between the amount of Netflix show streaming in one area compared to another can tell us about the demographics of the population along with what resources are available to them in order to stream shows on platforms such as Netflix. This can also push policy makers to find ways to assist populations that need access to internet to do tasks such as homework, chores, or paying bills. 

## Limitations
We will need to find datasets that display the popularity of the different Netflix shows to answer a couple of our research questions. To be able to survey and examine which countries watch what will need a dataset that has variables based on geographical location such as country and popularity in that country. Thus, will need to find a dataset that has the number of hours watched for that show. To see if Netflix is putting out quality movies on their streaming platform will need a variable that gives us the IMDB rating of that movie. On Wednesday we will get together and do research on more datasets that can help us figure out our problem domain and answer our questions.

## References
Countries where Netflix is available. (n.d.). Netflix Help Center. Retrieved October 31, 2022, from https://help.netflix.com/en/node/14164

Matrix, S., & Anya, M. (2014). The Netflix Effect: Teens, Binge Watching, and On-Demand Digital Media Trends. UTP Journals. Retrieved October 31, 2022, from https://www.utpjournals.press/doi/abs/10.3138/jeunesse.6.1.119

SLA Alumni. (2018, January 30). Netflix: The Media Killer - Digital Innovation and Transformation. HBS Digital Initiative. Retrieved October 31, 2022, from https://d3.harvard.edu/platform-digit/submission/netflix-the-media-killer/
