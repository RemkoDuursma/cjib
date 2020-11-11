
library(shiny)
library(dplyr)
library(glue)
library(DT)
library(plotly)


plotly_scatterplot <- function(xvar, yvar, data){
  
  plot_ly(x = data[[xvar]], 
          y = data[[yvar]],
          type = "scatter",
          marker = list(size = 10)) %>% 
    config(displayModeBar = FALSE) %>%
    layout(xaxis = list(title = xvar),
           yaxis = list(title = yvar))
  
}

plot_mtcars_base <- function(xvar, yvar, data, highlight = NULL){
  
  plot(data[[xvar]], 
       data[[yvar]],
       xlab = xvar, ylab = yvar,
       pch = 19, 
       cex = 1.1)
  
  if(!is.null(highlight)){
    
    data_highlight <- data[highlight,]
    
    points(data_highlight[[xvar]], 
           data_highlight[[yvar]],
           pch = 15, col = "red", cex = 1.5)
  }
  
}



ui <- fluidPage(
  
  
  tabsetPanel(
    
    tabPanel("App",
             
         tags$h4("mtcars plot app"),
         fluidRow(
           
           column(6, 
                  selectInput("sel_xvar", "Selecteer X-as", choices=names(mtcars), selected = "disp"),
                  selectInput("sel_yvar", "Selecteer Y-as", choices=names(mtcars), selected = "wt")
           ),
           column(6,
                  sliderInput("slide_wt", "Filter op gewicht", min = min(mtcars$wt), max = max(mtcars$wt),
                              value = c(min(mtcars$wt), max(mtcars$wt))
                  ) 
           )
           
         ),
         fluidRow(
           column(6, 
                  plotOutput("plot_mtcars"),
                  textOutput("txt_nrow_filtered")
           ),
           column(6, 
           
                   DT::dataTableOutput("dt_mtcars_data", width = "90%")
                        
           )
           
         )      
             
    ),
    tabPanel("Debug",
             verbatimTextOutput("debug_txt")
    )
    
  )
  
  
)



server <- function(input, output, session) {
  
  
  mtcars_filtered <- reactive({
    dplyr::filter(mtcars, 
                  wt >= input$slide_wt[1],
                  wt <= input$slide_wt[2])
  })
  
  
  output$dt_mtcars_data <- DT::renderDataTable({
    
    datatable(mtcars_filtered())
    
  })
  
  output$plot_mtcars <- renderPlot({
    
    xvar <- input$sel_xvar
    yvar <- input$sel_yvar
    
    newdata <- mtcars_filtered()
    
    plot_mtcars_base(xvar, yvar, newdata, input$dt_mtcars_data_rows_selected)
    
  })
  
  
  output$txt_nrow_filtered <- renderText({

    glue("Nog {nrow(mtcars_filtered())} beschikbaar!")
    
  })
  
  
  output$debug_txt <- renderPrint({
    reactiveValuesToList(input)
  })
  
}

shinyApp(ui, server)
