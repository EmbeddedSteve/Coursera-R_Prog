pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)

  # Setup working directory for the files to be analyzed
  setwd(paste("/Users/stephen_beckwith/workSwDev/R-Language/code/", directory, sep=""))
  
  # Create a list of files 
  fileList <- list.files(pattern="csv")
  
  accData <- data.frame()
  
  for (fileIndx in id)
  {
  
    fileData <- read.csv(fileList[fileIndx], header = TRUE, sep = ",")
    
    pollutantData <- fileData[pollutant]    #string passed in
    
    accData <- rbind(accData, pollutantData)
    
  }

  meanData <- mean(accData[,1], na.rm=TRUE)
  
  result <- round(meanData, 3)
  
  print(result)

}
