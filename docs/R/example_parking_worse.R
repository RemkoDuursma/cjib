


if(!file.exists("data/almereparking.rds")){
  # download data uit database code
  # ...
  
  # save
  saveRDS("data/almereparking.rds")
}

parking <- readRDS("data/almereparking.rds")

park <- arrange(parking, updated) %>%
  filter(!label %in% c("P+R","P4") ) %>%
  mutate(label = as.factor(label),
         updated = as.POSIXct(updated, tz = "UTC"),
         week_time = (wday(updated) - 1) * 24*60 +
           60*(hour(updated)) + minute(updated),
         week_time_15 = floor(week_time / 15),
         Date = as.Date(updated))

