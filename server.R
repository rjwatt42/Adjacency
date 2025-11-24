
source("Lines.R")
source('basicPlot.R')
library('ggplot2')

server <- function(input, output) {
  
  # lineLength<-rlineLength<-0.2
  # lineWidth<-rlineWidth<-0.015
  # lineCol<-rlineCol<-'#000'
  # 
  observeEvent({c(input$New,input$lineLength,input$lineWidth,input$lineCol,
                  input$glineOn,input$glineOffset,input$glineCol,
                  input$rlineOn,input$rlineLength,input$rlineWidth,input$rlineCol,input$rlineOffset)}, {
    lineLength<-max(0.015,input$lineLength)
    lineWidth<-max(0.005,input$lineWidth)
    rlineLength<-max(0.015,input$rlineLength)
    rlineWidth<-max(0.005,input$rlineWidth)
    g<-makeLines(useHTML=TRUE,
                 lineLength=lineLength,lineWidth=lineWidth,lineCol=input$lineCol,
                 guideLines=input$glineOn,guideOffset=input$glineOffset,guideCol=input$glineCol,
                 rLines=input$rlineOn,
                 rlineLength=rlineLength,rlineWidth=rlineWidth,rlineCol=input$rlineCol,
                 rlineMargin=0.07+rlineWidth+lineWidth,rlineOffset=input$rlineOffset,
                 forceUpdate=input$New)
    output$linesPlot <- renderUI(HTML(g))
  })
  
}