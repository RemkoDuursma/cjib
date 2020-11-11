

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




box_met_shadow <- function(...){
  
  tags$div(class = "box_shadow", ...)
  
}



