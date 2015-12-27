library(shiny)

df <- read.csv('refugees.csv', header=TRUE, check.names=FALSE, stringsAsFactors=FALSE, fileEncoding="latin1")


shinyUI(pageWithSidebar(
  headerPanel("Refugees by Origin"),
  sidebarPanel(
    p('Welcome to my Refugee-by-Origins app!'),
    p('I created this app to raise awareness for the current, global refugee crisis.'),
    p('Using this app you can select a country of origin and a time period.'),
    p('The app will show you a time distribution of the refugee count for that country during that period.'),
    p('Note: The period end is fixed at 2013, you can only choose the begin date.'),
    p('Data is from http://www.unhcr.org/'),
    
             selectInput("origin", 
                         "Origin:", 
                         c("All", 
                           unique(as.character(df$Origin))), selected=unique(as.character(df$Origin))[1]),
             sliderInput("year_from", "Year From:",
                         min = 1960, max = 2013, value = 1960)
  ),
  mainPanel(
    plotOutput('newBarPlot')
  )
))