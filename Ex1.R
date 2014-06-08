columnmean <- function(y, removeNA = TRUE){
  nc <- ncol(y)
  means <- numeric(nc)  # empty of numbers dflt to 0
  for (i in 1:nc){
    means[i] <- mean(y[, i], na.rm = removeNA)
  }
  means   # returns this vector
}