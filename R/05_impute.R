
#-- Impute missing values

set.seed(2)
data <- sample(c(1:20, rep(NA,6)), 10)

# Use the mean
# data[is.na(data)] <- mean(data, na.rm = TRUE)

# Use some fixed value
# data[is.na(data)] <- 0

# Use the last value
# unless it is the first, keep that NA
# ii <- which(is.na(data))
# ii <- setdiff(ii, 1)
# data[ii] <- data[ii - 1]

# linear interpolation
ii <- which(is.na(data))
data_new <- approx(1:length(data), data, xout = ii)
data[ii] <- data_new$y



