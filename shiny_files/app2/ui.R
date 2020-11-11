fluidPage(
  
  includeCSS("www/style.css"),
  
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
    tabPanel("Box shadow",
        
             box_met_shadow(
               tags$p("fouvdfivubdfvdfbvidfbv"),
               tags$p("fouvdfivubdfvdfbvidfbv"),
               tags$p("fouvdfivubdfvdfbvidfbv"),
               tags$p("fouvdfivubdfvdfbvidfbv"),
               tags$p("fouvdfivubdfvdfbvidfbv")
               
             )
             
      ),
    tabPanel("Debug",
             verbatimTextOutput("debug_txt")
    )
    
  )
  
  
)
