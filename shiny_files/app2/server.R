function(input, output, session) {
  
  
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
