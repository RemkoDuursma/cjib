
library(ggplot2)
library(dplyr)


mtcars_scatter_abline <- function(xvar, yvar, xlab = xvar, ylab = yvar, ...){
  
  plot(mtcars[[xvar]], mtcars[[yvar]], pch = 19,
       xlab = xlab, ylab = ylab, ...)
  
  abline(lm( mtcars[[yvar]] ~ mtcars[[xvar]]))
  
}

mtcars_scatter_abline("wt", "disp", ylab = "Displacement", main = "Weight vs. Displacement")




scatter_mtcars <- function(xvar, yvar, data){
  
  ggplot(data, aes(x = !!sym(xvar), y = !!sym(yvar))) +
    geom_point()
  
}

scatter_mtcars("disp", "wt", data = mtcars)





