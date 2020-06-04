




zonsopgang_morgen <- function(lon = 4.8945, lat = 52.3667){
  
  if(!require(lubridate)){
    stop("Please install lubridate!")
  }
  if(!require(suncalc)){
    stop("Please install suncalc!")
  }
  
  suncalc::getSunlightTimes(date = lubridate::today() + 1, 
                   tz = Sys.timezone(),
                   lon = lon, lat = lat,
                   keep = c("sunrise","sunset"))
  
  
}

zonsopgang_morgen()


library(dplyr)

dplyr::group_by(mtcars, cyl) %>%
  dplyr::summarize(something = max(disp)) %>%
  dplyr::ungroup

