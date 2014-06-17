corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  # Setup working directory for the files to be analyzed
  setwd(paste("/Users/stephen_beckwith/workSwDev/R-Language/code/", directory, sep=""))
  
  # Create a list of files 
  fileList <- list.files(pattern="csv")

  allData <- complete(directory, 1:332)
  
  subData <- subset(allData, nobs > threshold)
  
  fileData <- data.frame()
  
  outData <- numeric(0)
  
  for (i in seq_len(nrow(subData)) )
  {
    fileData <- na.omit(read.csv(paste(sprintf("%03d", subData[i,1]), ".csv", sep="")))
    
    corData <- round( (cor(fileData$sulfate, fileData$nitrate)), digits=4 )
    outData <- c(outData, corData)
  }
  
  return(outData)
   
}