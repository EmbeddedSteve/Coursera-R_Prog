complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  # Setup working directory for the files to be analyzed
  setwd(paste("/Users/stephen_beckwith/workSwDev/R-Language/code/", directory, sep=""))
  
  # Create a list of files 
  fileList <- list.files(pattern="csv")
  
  addUp <- rep(0, length(id))
  indx <- 1
  
  for (fileIndx in id)
  {
    
    fileData <- read.csv(fileList[fileIndx], header = TRUE, sep = ",")
    
    addUp[indx] <- sum(complete.cases(fileData))
    
    indx <- indx + 1
    
  }

  return(data.frame(id = id, nobs = addUp))
  
}
