reverse_dataframe <- function(x){
  x[nrow(x):1,]
}

sentence_case <- function(x){
  x <- tolower(x)
  paste0(toupper(substr(x,1,1)), substr(x, 2, nchar(x)))
}

shiny_is_local <- function(){
  Sys.getenv('SHINY_PORT') == ""
}

safe_max <- function(x){
  if(is.null(x) || all(is.na(x))){
    0
  } else {
    max(x, na.rm = TRUE)
  }
}

is_empty <- function(x){
  is.null(x) || is.na(x) || x == ""
}

is_empty <- function(x){
  if(is.null(x))return(TRUE)
  
  if(length(x) == 1){
    out <- is.null(x) || as.character(x) == ""
    out || is.na(out)  
  } else {
    sapply(x, is_empty)
  }
  
}


floor_digits <- function(x, digits){
  
  floor(x * 10^digits) / 10^digits
  
}


round_up_down <- function(x, digits = 0, how = c("up", "down")){
  
  how <- match.arg(how)
  
  round_fun <- switch(how, up = ceiling, down = floor)
  
  round_fun(x * 10^digits) / 10^digits
}

recycle <- function(x, n){
  rep(x, ceiling(n / length(x)))[1:n]
}

#recycle(c("a","b","c"), 8)





