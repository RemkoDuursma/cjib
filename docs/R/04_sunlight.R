library(suncalc)
library(lubridate)

getSunlightTimes(date = today() + 1, 
                 tz = Sys.timezone(),
                 lon = 4.8945, lat = 52.3667,
                 keep = c("sunrise","sunset"))