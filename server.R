library(shiny)


shinyServer(
  function(input, output) {
    df <- read.csv('refugees.csv', header=TRUE, check.names=FALSE, stringsAsFactors=FALSE)
      output$newBarPlot <- renderPlot({
        barplot(as.numeric(df[df[,2]==input$origin,input$year_from:2013-1957]), ylab="Refugees", names.arg=names(df[df[,2]==input$origin,input$year_from:2013-1957]), angle=90)
      })
  }
)