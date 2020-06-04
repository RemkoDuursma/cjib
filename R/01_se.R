
# 1.
# Standard error for the mean

mydata <- c(0.1, 1.9, 2,9.3, 3.1, 5)




se_mean <- function(x){
  
  stopifnot(all(is.numeric(x)))
  
  sd(x) / sqrt(length(x))
  
}

se_mean(x = mydata)



f <- factor(letters[1:5])
se_mean(f)



# 2.
# SD en SE


se_and_sd <- function(x){
  
  se_out <- se_mean(x)
  sd_out <- sd(x)
  
return(list(se = se_out, sd = sd_out))
}

se_and_sd(mydata)



# 3. 
# Print the time


tijd <- function(){
  
  cat(
    paste("Bij de volgende toon is het", Sys.time())
  )
  
}

# function call
tijd()

# function definition
tijd


