library(shiny)

df <- read.csv('refugees.csv', header=TRUE, check.names=FALSE, stringsAsFactors=FALSE)


shinyUI(pageWithSidebar(
  headerPanel("Refugees by Origin"),
  sidebarPanel(
             selectInput("origin", 
                         "Origin:", 
                         c("All", 
                           unique(as.character(df$Origin)))),
             selectInput("year_from", 
                         "From Year:", 
                         c(1960, 
                           unique(as.numeric(names(df[,-(1:2)])))))
  ),
  mainPanel(
    plotOutput('newBarPlot')
  )
))