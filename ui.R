fontSize=10
localStyle=paste0("font-size:",format(fontSize) ,"pt;text-align: right;padding:0px;margin:0px;margin-right:5px;")

ui <- fluidPage(
  
  tags$head(
    tags$style(HTML( # labels 
      paste0(".label {font-size: ",fontSize ,"; font-weight:bold;text-align: right;margin:0px;padding:0px;}")
    )),
    tags$style(HTML( # textInput
      paste0(".form-control {font-size: ",fontSize ,"; height:24px; padding:0px 0px;margin:0px;}")
    )),
    tags$style(HTML( # selectInput
      paste0(".selectize-input {font-size: ",fontSize ,"; height:12px; width:60px; padding:0px; margin-right:-10px; margin-top:-5px;margin-bottom:-5px; min-height:10px;}"),
      paste0(".selectize-dropdown { font-size: ",fontSize ,";line-height:10px}")
    )),
    tags$style(HTML( # action button
      paste0(".col-sm-3 button {font-size:",fontSize ,";font-weight:Bold;color:white; background-color: #005886;height:20px;padding-top:0px;padding-bottom:0px;padding-left:4px;padding-right:4px;margin-bottom:4px;margin-right:12px;margin-top:4px;margin-left:0px}"),
      paste0( ".col-sm-2 button {font-size:",fontSize ,";font-weight:Bold;color:white; background-color: #005886;height:20px;padding-top:0px;padding-bottom:0px;padding-left:4px;padding-right:4px;margin-bottom:4px;margin-right:12px;margin-top:4px;margin-left:0px}"),
      paste0(".col-sm-1 button {font-size:",fontSize ,";font-weight:Bold;color:white; background-color: #005886;height:20px;padding-top:0px;padding-bottom:0px;padding-left:4px;padding-right:4px;margin-bottom:4px;margin-right:12px;margin-top:4px;margin-left:0px}")
    )),
    tags$style(HTML( # well panels
      ".well {padding:5px; margin:0px;margin-bottom:8px;margin-left:0px;margin-right:0px;} "
    )),
    tags$style(HTML( # checkbox
      ".checkbox {line-height: 10px;margin:0px;padding:0px;padding-left:4px;}"
    ))
  ),
  tags$head( # alignment of controls  
    tags$style(type="text/css",".table label{ display: table-cell; text-align: center;vertical-align: middle; }  .form-group { display: table-row;}")
  ),
  tags$head( # alignment of controls
    tags$style(".myTable {margin:0px;padding:0px;}")
  ),
  
  # App title ----
  titlePanel("Adjacency"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      style = paste("background: ",'#aaa',';width:200px',";margin-left: 0px;margin-right: -21px;margin-top: 12px;padding-right: -21px;border:solid;border-radius:0px;"),
      # Input: 
      verticalLayout(
        wellPanel(h4("Regular Lines"),
                  tags$table(width="100%",class="MyTable",
                             tags$tr(
                               tags$td(width = "30%", tags$div(style=localStyle,"length:")),
                               tags$td(width = "70%", numericInput("lineLength", NULL, min = 0, max = 1, step = 0.05, value = 0.2))
                             ),
                             tags$tr(
                               tags$td(width = "30%", tags$div(style=localStyle,"width:")),
                               tags$td(width = "70%", numericInput("lineWidth", NULL, min = 0, max = 1, step = 0.01, value = 0.01))
                             ),
                             tags$tr(
                               tags$td(width = "30%", tags$div(style=localStyle,"colour:")),
                               tags$td(width = "70%", selectInput("lineCol", NULL, list("black","white"),selected="black",selectize=FALSE))
                             )
                  )
        ),
        wellPanel(h4("Random Lines"),
                  tags$table(width="100%",
                             tags$tr(
                               tags$td(width = "30%", tags$div(style=localStyle,"on:")),
                               tags$td(width = "70%", checkboxInput("rlineOn", NULL, value = TRUE))
                             ),
                             tags$tr(
                               tags$td(width = "30%", tags$div(style=localStyle,"length:")),
                               tags$td(width = "70%", numericInput("rlineLength", NULL, min = 0, max = 1, step = 0.05, value = 0.2))
                             ),
                             tags$tr(
                               tags$td(width = "30%", tags$div(style=localStyle,"width:")),
                               tags$td(width = "70%", numericInput("rlineWidth", NULL, min = 0, max = 1, step = 0.01, value = 0.01))
                             ),
                             tags$tr(
                               tags$td(width = "30%", tags$div(style=localStyle,"colour:")),
                               tags$td(width = "70%", selectInput("rlineCol", NULL, list("black","white"),selected="black",selectize=FALSE))
                             ),
                             tags$tr(
                               tags$td(width = "30%", tags$div(style=localStyle,"offset:")),
                               tags$td(width = "70%", numericInput("rlineOffset", NULL, min = -1, max = 1, step = 0.1, value = 0))
                             )
                  )
        ),
                  wellPanel(h4("Guide Lines"),
                            tags$table(width="100%",
                                       tags$tr(
                                         tags$td(width = "30%", tags$div(style=localStyle,"on:")),
                                         tags$td(width = "70%", checkboxInput("glineOn", NULL, value = TRUE))
                                       ),
                                       tags$tr(
                                         tags$td(width = "30%", tags$div(style=localStyle,"offset:")),
                                         tags$td(width = "70%", numericInput("glineOffset", NULL, min = 0, max = 1, step = 0.05, value = 0.2))
                                       )
                            )
                  ),
        actionButton(inputId = "New", label = "New" )
      ),
      
      
      
      width=3
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: 
      htmlOutput(outputId = "linesPlot"),
      width=5
      
    )
  )
)