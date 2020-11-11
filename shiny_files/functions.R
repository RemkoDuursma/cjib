


plot_mtcars_base <- function(xvar, yvar){
  
   plot(mtcars[[xvar]], 
        mtcars[[yvar]],
        xlab = xvar, ylab = yvar,
        pch = 19, 
        cex = 1.1)
  
}



plot_mtcars_plotly <- function(xvar, yvar){
 
  plot_ly(x = mtcars[[xvar]], 
          y = mtcars[[yvar]],
          type = "scatter",
          marker = list(size = 10)) %>% 
  config(displayModeBar = FALSE) %>%
    layout(xaxis = list(title = xvar),
           yaxis = list(title = yvar))
    
}
