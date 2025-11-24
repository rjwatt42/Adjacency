
source("Lines.R")
source('basicPlot.R')

server <- function(input, output) {
  
  lineLength<-rlineLength<-0.2
  lineWidth<-rlineWidth<-0.015
  lineCol<-rlineCol<-'#000'
  
  observeEvent({c(input$New,input$lineLength,input$lineWidth,input$lineCol,
                  input$glineOn,input$glineOffset,
                  input$rlineOn,input$rlineLength,input$rlineWidth,input$rlineCol,input$rlineOffset)}, {
    lineLength<-max(0.015,input$lineLength)
    lineWidth<-max(0.015,input$lineWidth)
    rlineLength<-max(0.015,input$rlineLength)
    rlineWidth<-max(0.015,input$rlineWidth)
    g<-makeLines(lineLength=lineLength,lineWidth=lineWidth,lineCol=input$lineCol,
                 guideLines=input$glineOn,guideOffset=input$glineOffset,
                 rLines=input$rlineOn,
                 rlineLength=rlineLength,rlineWidth=rlineWidth,rlineCol=input$rlineCol,
                 rlineMargin=0.07+rlineWidth+lineWidth,rlineOffset=input$rlineOffset)
    output$linesPlot <- renderPlot(g)
  })
  
}