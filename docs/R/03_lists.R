
# 1. Lists
mylist <- list(a=1:10, txt=c("hello","world"), dfr=data.frame(x=c(2,3,4),y=c(5,6,7)))




# 2. Lists in de praktijk
lmfit <- lm(disp ~ wt, data = mtcars)

sumfit <- summary(lmfit)


# - Functie om de R2 uit een lm fit te halen
get_r2 <- function(object){
  
  stopifnot(class(object) == "lm")
  
  summary(object)$adj.r.squared
  
}

get_r2(lmfit)


# 3. sapply
numlis <- list(x=1000, y=c(2.1,0.1,-19), z=c(100,200,100,100))


sapply(numlis, mean)

sapply(numlis, function(x)mean(x, na.rm = TRUE))




# 5. 
# split
# lapply
# data(Orange)

orange_sp <- split(Orange, Orange$Tree)


sapply(orange_sp, function(x)range(x$circumference))


lapply(orange_sp, function(x)range(x$circumference))


lmfits <- lapply(orange_sp, function(x)lm(circumference ~ age, data = x))

sapply(lmfits, get_r2)

sapply(lmfits, coef)

lapply(lmfits, summary)


# tapply is voor vectoren
tapply(Orange$age, Orange$Tree, FUN = mean)

with(Orange, tapply(age, Tree, FUN = mean))


vapply

purrr
purrrlyr


# 6.
# Lees meerdere CSVs in 1 stap

fns <- dir("data", pattern = "[.]csv$", full.names = TRUE)
all_data <- lapply(fns, read.csv)
sapply(all_data, nrow)

