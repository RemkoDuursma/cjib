


# 1.
max(c(NA, NA, NA), na.rm = TRUE)

max(NULL, na.rm = T)


roxygen2

#' Safe maximum
#' @description Safe maximum for all NA or NULL
#' @param x A vector
#' @param safe_value The value for the missing result
#' @export
safe_max <- function(x, safe_value = 0) {
  if (is.null(x) ||
      all(is.na(x))) {
    safe_value
  } else {
    max(x, na.rm = TRUE)
  }
  
}


safe_max(c(NA, NA, NA))








# 2.
floor(12.1)
ceiling(12.1)



# OK maar kan beter
round_up_down <- function(x, method) {
  if (method == "down") {
    floor(x)
  } else if (method == "up") {
    ceiling(x)
  } else {
    stop("Method not supported")
  }
  
}


# Beter!
round_up_down <- function(x, method = c("up", "down")) {
  method <- match.arg(method)
  
  switch(method,
         "up" = ceiling(x),
         "down" = floor(x))
  
}



round_up_down(12.1, method = "up")








# 3.
# Function scope
library(stringr)


remove_postcode_space <- function(x) {
  pc <- str_extract(x, "[0-9]{4}[[:space:]]+[a-zA-Z]{2}")
  pc_ns <- str_replace(pc, "[[:space:]]", "")
  out <- str_replace(x, pc, pc_ns)
  out[is.na(out)] <- x[is.na(out)]
  
  return(out)
}


remove_postcode_space("Hoofdstraat 12, 5524 AJ, Geeneveen")
